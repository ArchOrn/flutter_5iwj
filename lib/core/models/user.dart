class User {
  final String firstName;
  final String lastName;
  final String address;

  User({
    required this.firstName,
    required this.lastName,
    required this.address,
  });

  String get fullName => '$firstName $lastName';

  factory User.fromJson(Map<String, dynamic> json) {
    final split = (json['name'] as String?)?.split(' ');
    return User(
      firstName: split?.first ?? '',
      lastName: split?.last ?? '',
      address: '${json['address']['street']}'
          ' ${json['address']['suite']}'
          ' ${json['address']['zipcode']}'
          ' ${json['address']['city']}',
    );
  }
}
