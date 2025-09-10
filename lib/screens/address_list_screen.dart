import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';

class AddressListScreen extends StatefulWidget {
  const AddressListScreen({Key? key}) : super(key: key);

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  List<Address> _addresses = [];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _municipalityController = TextEditingController();
  final TextEditingController _physicalAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    _addresses = user?.addresses ?? [];
    return Scaffold(
      appBar: AppBar(title: const Text('Direcciones')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _countryController,
                    decoration: const InputDecoration(labelText: 'País'),
                    validator: (value) => value == null || value.isEmpty ? 'Campo requerido' : null,
                  ),
                  TextFormField(
                    controller: _departmentController,
                    decoration: const InputDecoration(labelText: 'Departamento'),
                    validator: (value) => value == null || value.isEmpty ? 'Campo requerido' : null,
                  ),
                  TextFormField(
                    controller: _municipalityController,
                    decoration: const InputDecoration(labelText: 'Municipio'),
                    validator: (value) => value == null || value.isEmpty ? 'Campo requerido' : null,
                  ),
                  TextFormField(
                    controller: _physicalAddressController,
                    decoration: const InputDecoration(labelText: 'Dirección física'),
                    validator: (value) => value == null || value.isEmpty ? 'Campo requerido' : null,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          final newAddress = Address(
                            country: _countryController.text,
                            department: _departmentController.text,
                            municipality: _municipalityController.text,
                            physicalAddress: _physicalAddressController.text,
                          );
                          _addresses.add(newAddress);
                          if (user != null) {
                            userProvider.setUser(
                              User(
                                firstName: user.firstName,
                                lastName: user.lastName,
                                birthDate: user.birthDate,
                                addresses: List<Address>.from(_addresses),
                              ),
                            );
                          }
                          _countryController.clear();
                          _departmentController.clear();
                          _municipalityController.clear();
                          _physicalAddressController.clear();
                        });
                      }
                    },
                    child: const Text('Agregar dirección'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: _addresses.length,
                itemBuilder: (context, index) {
                  final address = _addresses[index];
                  return Card(
                    child: ListTile(
                      title: Text(address.physicalAddress),
                      subtitle: Text(
                        '${address.country}, ${address.department}, ${address.municipality}',
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _addresses.isNotEmpty
                  ? () {
                      Navigator.pushNamed(context, '/user-detail');
                    }
                  : null,
              child: const Text('Ver datos de usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
