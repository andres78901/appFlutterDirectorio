import '../models/user.dart';
class UserService {
  static String? validateUser(User user) {
    if (user.firstName.isEmpty) return 'El nombre es requerido';
    if (user.lastName.isEmpty) return 'El apellido es requerido';
    if (user.birthDate.isAfter(DateTime.now())) return 'La fecha de nacimiento no puede ser futura';
    return null;
  }

  static String? validateAddress(Address address) {
    if (address.country.isEmpty) return 'El país es requerido';
    if (address.department.isEmpty) return 'El departamento es requerido';
    if (address.municipality.isEmpty) return 'El municipio es requerido';
    if (address.physicalAddress.isEmpty) return 'La dirección física es requerida';
    return null;
  }
}
