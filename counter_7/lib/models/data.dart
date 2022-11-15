// Objek Data yang atributnya didapat dari input user
class Data {
  late String namaData;
  late int nominal;
  late String? jenisBudgeting;
  late String date;

  Data(
      {required this.namaData,
      required this.nominal,
      required this.jenisBudgeting,
      required this.date});
}