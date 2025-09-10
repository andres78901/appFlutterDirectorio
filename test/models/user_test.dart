import 'package:flutter_test/flutter_test.dart';
import 'package:user_form_app/models/user.dart';

void main() {
  group('User Model', () {
    test('User creation', () {
      final address = Address(
        country: 'Colombia',
        department: 'Antioquia',
        municipality: 'Medellín',
        physicalAddress: 'Calle 123 #45-67',
      );
      final user = User(
        firstName: 'Juan',
        lastName: 'Pérez',
        birthDate: DateTime(2000, 1, 1),
        addresses: [address],
      );
      expect(user.firstName, 'Juan');
      expect(user.lastName, 'Pérez');
      expect(user.birthDate, DateTime(2000, 1, 1));
      expect(user.addresses.length, 1);
      expect(user.addresses.first.country, 'Colombia');
    });
  });
}
