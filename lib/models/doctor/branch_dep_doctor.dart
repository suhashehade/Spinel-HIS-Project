class Doctor {
  int id;
  String label;

  Doctor(
    this.id,
    this.label,
  );

  factory Doctor.fromJson(dynamic json) {
    return Doctor(
      json['value'] as int,
      json['label'].toString(),
    );
  }
}
