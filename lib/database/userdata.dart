class User {
  String id;
  final String namaLengkap;
  final String email;
  final String username;
  final String password;
  final String nomorKartu;
  final String pin;
  final double saldo;

  User({
    this.id = '',
    required this.namaLengkap,
    required this.email,
    required this.username,
    required this.password,
    required this.nomorKartu,
    required this.pin,
    required this.saldo,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'NamaLengkap': namaLengkap,
    'Email': email,
    'Username': username,
    'Password': password,
    'NoKartu': nomorKartu,
    'PIN' : pin,
    'Saldo': saldo,
  };
}