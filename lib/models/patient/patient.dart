class Patient {
  int id;
  String phone1;

  Patient(this.id, this.phone1);

  factory Patient.fromJson(dynamic json) {
    return Patient(
      json['id'] as int,
      json['phone1'].toString(),
    );
  }
}
