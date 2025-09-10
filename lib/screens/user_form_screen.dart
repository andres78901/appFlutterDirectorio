import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';
import '../providers/user_provider.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({Key? key}) : super(key: key);

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final FocusNode _addAddressFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addAddressFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _addAddressFocusNode.dispose();
    super.dispose();
  }
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  DateTime? _birthDate;
  List<Address> _addresses = [];

  void _clearForm() {
    _firstNameController.clear();
    _lastNameController.clear();
    setState(() {
      _birthDate = null;
      _addresses = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Usuario')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) => value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Apellido'),
                validator: (value) => value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text(_birthDate == null
                    ? 'Selecciona fecha de nacimiento'
                    : 'Fecha de nacimiento: ${_birthDate!.day}/${_birthDate!.month}/${_birthDate!.year}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      _birthDate = picked;
                    });
                  }
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      focusNode: _addAddressFocusNode,
                      onPressed: () {
                        if (_formKey.currentState!.validate() && _birthDate != null) {
                          final user = User(
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            birthDate: _birthDate!,
                            addresses: _addresses,
                          );
                          final error = UserService.validateUser(user);
                          if (error != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(error)),
                            );
                            return;
                          }
                          Provider.of<UserProvider>(context, listen: false).setUser(user);
                          Navigator.pushNamed(context, '/addresses');
                        }
                      },
                      child: const Text('Agregar dirección'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _clearForm,
                      child: const Text('Limpiar formulario'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
