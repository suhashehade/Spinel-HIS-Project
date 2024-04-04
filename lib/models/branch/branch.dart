class Branch {
  int id;
  String label;

  Branch(
    this.id,
    this.label,
  );

  factory Branch.fromJson(dynamic json) {
    return Branch(
      json['value'] as int,
      json['label'].toString(),
    );
  }
}
