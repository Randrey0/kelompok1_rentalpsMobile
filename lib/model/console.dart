class Console {
  String? id;
  String namaConsole;
  String hargaSewa;
  String stok;

  Console(
      {this.id,
      required this.namaConsole,
      required this.hargaSewa,
      required this.stok});

  factory Console.fromJson(Map<String, dynamic> json) => Console(
      id: json["id"],
      namaConsole: json["nama_console"],
      hargaSewa: json["harga_sewa"],
      stok: json["stok"]);

  Map<String, dynamic> toJson() =>
      {"nama_console": namaConsole, "harga_sewa": hargaSewa, "stok": stok};
}
