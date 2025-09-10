import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../providers/user_provider.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detalle de Usuario')),
        body: const Center(child: Text('No hay datos de usuario.')),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de Usuario')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Nombre: ${user.firstName}'),
            Text('Apellido: ${user.lastName}'),
            Text('Fecha de nacimiento: ${user.birthDate.day}/${user.birthDate.month}/${user.birthDate.year}'),
            const SizedBox(height: 24),
            const Text('Direcciones:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...user.addresses.map((address) => Card(
              child: ListTile(
                title: Text(address.physicalAddress),
                subtitle: Text(
                  '${address.country}, ${address.department}, ${address.municipality}',
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
