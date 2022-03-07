class Company {
  final String company;
  final List information;
  final String logo;
  final String partner;

  Company({
    required this.company,
    required this.information,
    required this.logo,
    required this.partner,
  });

  factory Company.fromRTDB(Map<dynamic, dynamic> data) {
    return Company(
      company: data['company'],
      information: data['information'],
      logo: data['logo'],
      partner: data['partner'],
    );
  }
}
