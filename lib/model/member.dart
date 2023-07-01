class Member {
  String? id;
  String noMember;
  String namaMember;
  String alamat;
  String email;
  String noTelp;

  Member(
      {this.id,
      required this.noMember,
      required this.namaMember,
      required this.alamat,
      required this.email,
      required this.noTelp});

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        noMember: json["no_member"],
        namaMember: json["nama_member"],
        alamat: json["alamat"],
        email: json["email"],
        noTelp: json["no_telp"],
      );

  Map<String, dynamic> toJson() => {
        "no_member": noMember,
        "nama_member": namaMember,
        "alamat": alamat,
        "email": email,
        "no_telp": noTelp
      };
}
