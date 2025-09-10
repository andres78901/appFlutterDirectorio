class User {
  String firstName;
  String lastName;
  DateTime birthDate;
  List<Address> addresses;

  User({
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.addresses,
  });
}

class Address {
  String country;
  String department;
  String municipality;
  String physicalAddress;

  Address({
    required this.country,
    required this.department,
    required this.municipality,
    required this.physicalAddress,
  });
}
