import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';

class CurrentData {
  static List<String> _judul = [];
  static List<String> _nominal = [];
  static List<String> _budget = [];

  static String placeholderJudul = '';
  static String placeholderNominal = '';
  static String placeholderBudget = 'Pemasukan';
  static List<String> jenisBudget = ['Pemasukan', 'Pengeluaran'];

  static void addJudul(String t) {
    _judul.add(t);
  }

  static void addNominal(String a) {
    _nominal.add(a);
  }

  static void addData(String b) {
    _budget.add(b);
  }

  static List<String> getJudul() {
    return _judul;
  }

  static List<String> getNominal() {
    return _nominal;
  }

  static List<String> getBudget() {
    return _budget;
  }

  static int getLength() {
    return _judul.length;
  }
}

class AddBudgetPage extends StatefulWidget {
    const AddBudgetPage({super.key});

    @override
    State<AddBudgetPage> createState() => _AddBudgetPageState();
}

class _AddBudgetPageState extends State<AddBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tanggal = TextEditingController();

  CurrentData data = CurrentData();

  @override
  void initState() {
    tanggal.text = "";
    super.initState();
  }

  @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Form Budget'),
            ),
            // Menambahkan Drawer
            drawer: const DrawerClass(),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: "Judul",
                                  ),
                                  onChanged: (String? value) {
                                      setState(() {
                                          CurrentData.placeholderJudul = value!;
                                      });
                                  },
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return 'Judul tidak boleh kosong!';
                                      }
                                      return null;
                                    },
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: "Nominal",
                                  ),
                                  onChanged: (String? value) {
                                      setState(() {
                                          CurrentData.placeholderNominal = value!;
                                      });
                                  },
                                  // Validator untuk memvalidasi form
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return 'Nominal tidak boleh kosong!';
                                      }
                                      return null;
                                    },
                            ),
                          ),
                          ListTile(
                          leading: const Icon(Icons.class_),
                          title: const Text(
                              'Pilih Jenis',
                          ),
                          trailing: DropdownButton(
                              value: CurrentData.placeholderBudget,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: CurrentData.jenisBudget.map((String items) {
                              return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                              );
                              }).toList(),
                              onChanged: (String? newValue) {
                              setState(() {
                                  CurrentData.placeholderBudget = newValue!;
                              });
                              },
                          ),
                          ),
                          TextButton(
                          child: const Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                                CurrentData.addJudul(CurrentData.placeholderJudul);
                                CurrentData.addNominal(CurrentData.placeholderNominal);
                                CurrentData.addData(CurrentData.placeholderBudget);
                                 showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 15,
                                    child: ListView(
                                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        const Center(child: Text('Informasi Data')),
                                        const SizedBox(height: 20),
                                        const Text(
                                          'Data Sudah Ditambahkan',
                                          textAlign: TextAlign.center,
                                          ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Kembali'),
                                        ), 
                                      ],
                                    ),
                                  );
                                },
                              );
                                }
                              }
                            ),
                        ],
                  ),
                ),
                ),
            ),
        );
    }
}