import 'package:counter_7/models/data.dart';
import 'package:counter_7/pages/budget_data.dart';
import 'package:counter_7/widgets/drawer.dart';
import 'package:flutter/material.dart';

class BudgetForm extends StatefulWidget {
  const BudgetForm({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<BudgetForm> createState() => _BudgetFormState();
}

class _BudgetFormState extends State<BudgetForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now(); // Date saat ada pengeluaran / pemasukan
  List<String> listJenisBudgeting = [
    'Pengeluaran',
    'Pemasukan'
  ]; // List item di dropdown
  String _data = ""; // Contains data (nama barang/jasa/gaji)
  int _nominal = 0; // Contains cost
  String? _jenisBudgeting; // Can be null

  // Helper function to validate numeric inputs
  bool _isNumeric(String? a) {
    return int.tryParse(a!) != null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const DrawerBar(),
        body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    // Input nama data
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Masukkan Data",
                          labelText: "Judul",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onChanged: (String? value) {
                          // Updata variabel _data
                          setState(() {
                            _data = value!;
                          });
                        },
                        // Validasi input
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Data tidak boleh kosong!';
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    // Input nominal dari data yang dimasukkan
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Masukkan Nominal",
                          labelText: "Nominal",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onChanged: (String? value) {
                          // Update variabel _nominal
                          setState(() {
                            // Handle input tidak numerik
                            if (_isNumeric(value)) {
                              _nominal = int.parse(value!);
                            }
                          });
                        },
                        // Validasi input
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nominal tidak boleh kosong!';
                          } else if (!_isNumeric(value)) {
                            return 'Nominal harus diisi dengan angka!';
                          }
                          return null;
                        }),
                  ),
                  Padding( // Date Picker
                    padding: const EdgeInsets.all(5),
                    child: ListTile(
                      leading: const Icon(Icons.calendar_month_outlined),
                      title: Text("${date.day}/${date.month}/${date.year}"),
                      onTap: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(2020), // Batas bawah tahun
                          lastDate: DateTime(2025), // Batas atas tahun
                        );

                        // Jika user memilih suatu date (tidak cancel)
                        if (newDate != null) {
                          setState(() {
                            date = newDate;
                          });
                        }
                      },
                    ),
                  ),
                  Container(
                    // Memilih jenis budgeting, apakah pengeluaran atau pemasukan.
                    padding: const EdgeInsets.all(5),
                    width: 129,
                    child: DropdownButtonFormField(
                      hint: const Text("Pilih Jenis"),
                      value: _jenisBudgeting,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: listJenisBudgeting.map((String items) { // Iterasi setiap item di list dropdown
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          if (newValue != null) {
                            _jenisBudgeting = newValue;
                          }
                        });
                      },
                      validator: (String? newValue) {
                        if (newValue == null) {
                          // Jika tidak memilih opsi pada dropdown
                          return "Pilih salah satu!";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: TextButton( // Tombol Simpan
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Create Data object
                        Data newData = Data(
                            namaData: _data,
                            nominal: _nominal,
                            jenisBudgeting: _jenisBudgeting,
                            date: "${date.day}/${date.month}/${date.year}"
                        );
                        BudgetData.listData
                            .add(newData); // Add object to listData

                        // Show snackbar (if user successfully save their input)
                        const snackBar = SnackBar(
                          content: Text("Berhasil input data!"),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}


