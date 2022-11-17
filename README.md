# counter_7

TUGAS 7 PBP

# Stateless Widget dan Stateful Widget
Stateless : Widget yang statusnya tidak dapat diubah setelah dibuat, contohnya seperti Icon, IconButton, dan Text
Stateful : bersifat dynamic dan dapat berubah setelah dibuat. Stateful widgets bisa berubah saat user men-trigger sebuah event. Contohnya seperti Checkbox, Radio, Slider, InkWell, Form, dan TextField

# Widget yang digunakan
- Basic Widgets
    - Appbar : menyediakan tampilan seperti daftar menu dan judul aplikasi. Bisa juga tombol-tombol action contohnya tombol pencarian dan notifikasi
    - Row and Column : membuat user dapat mengatur children secara horizontal atau vertikal sesuai kebutuhan
- Text Widgets : digunakan untuk menampilkan text seperti "Ganjil" dan "Genap"
- Interactivity Widgets
    - Floating Action Button : this widget floats on top of other widgets on the screen.

# setState()
Fungsi : Notify the framework that the internal state of this object has changed
Biasanya setState() berdampak pada statefulWidgets. setState() dapat memberitahu flutter untuk rebuild sebuah halaman saat sesuatu didefinisikan di dalam setState() changes

# Const dan Final 
Const : Digunakan untuk deklarasi variabel immutable yang nilainya bersifat konstan
Final : Final diinialisasi pada saat pertama kali digunakan dan hanya di set sekali

# Implementasi Checklist
1. Membuat app flutter baru dengan nama counter_7 dengan menjalankan kode:
 ```
 flutter create counter_7 
 ```
 
2. Membuat fungsi untuk mengetahui nilai counter apakah ganjil atau genap
 ```  
    String _numIdentifier() {
      if (_counter % 2 == 1) {
      return "GANJIL";
      }
      else {
      return "GENAP";
      }
    }
```
3. Membuat visibility widget yang dalamnya berisi FloatingActionButton
```
Visibility(
    visible: _counter <= 0 ? false : true,
    child: (
      FloatingActionButton(
        onPressed: _decrementCounter,
        child: const Icon(Icons.remove),
      )
    )
```
4. Mengubah text widgets and style-nya
```
Text(
    _numIdentifier(),
    style: TextStyle(color: _numIdentifier() == "GENAP" ? Colors.red : Colors.cyan),
  ),
```

# ================== TUGAS 8 ====================

# Navigator.push dan Navigator.pushReplacement
Navigator.push : adds a Route to the stack of routes managed by the Navigator
Navigator.pushReplacement = mengganti rute navigator yang paling erat membungkus konteks yang diberikan dengan mendorong rute yang diberikan dan kemudian membuang rute sebelumnya setelah rute baru selesai dianimasikan

# Widget yang digunakan
- Basic Widgets
    - Appbar : menyediakan tampilan seperti daftar menu dan judul aplikasi. Bisa juga tombol-tombol action contohnya tombol pencarian dan notifikasi
    - Row and Column : membuat user dapat mengatur children secara horizontal atau vertikal sesuai kebutuhan
    - Icons : menambahkan tampilan icon
- Text Widgets : digunakan untuk menampilkan text seperti "Ganjil" dan "Genap"
- Interactivity Widgets
    - Floating Action Button : this widget floats on top of other widgets on the screen.
    
# Jenis-jenis events
- onPressed 
- onClicked
- onChanged
- onSaved

# Cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter
Navigator bekerja seperti stack, jika kita move atau navigate ke suatu page, maka di push ke top of the stack dan melakukan framework animation

# Implementasi Checklist
Membuat 3 file terpisah yaitu data.dart, form.dart, dan drawer.dart \
Berikut adalah isi drawer.dart
```dart
import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/data.dart';


class DrawerClass extends StatefulWidget {
  const DrawerClass({Key? key}) : super(key: key);

  @override
  _DrawerClassState createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Untuk yang menu counter_7
          ListTile(
            title: const Text("counter_7"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          // Menu Tambah Budget
          ListTile(
            title: const Text("Tambah Budget"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AddBudgetPage()),
              );
            },
          ),
          // Menu Data Budget
          ListTile(
            title: const Text("Data Budget"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BudgetDataPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
```

Berikut adalah isi form.dart
```dart
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
```

Berikut adalah isi data.dart
```dart
import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/form.dart';

class BudgetDataPage extends StatefulWidget {
  const BudgetDataPage({super.key});

  @override
  State<BudgetDataPage> createState() => _BudgetDataPageState();
}

class _BudgetDataPageState extends State<BudgetDataPage> {
  int indexLength = CurrentData.getLength();
  List<String> judul = CurrentData.getJudul();
  List<String> nominal = CurrentData.getNominal();
  List<String> budget = CurrentData.getBudget();
  
  @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Data Budget'),
            ),
            drawer: const DrawerClass(),
            body: Form(
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
                        const Center(child: Text('Data Budget')),
                        for (int i = 0; i < indexLength; i++) 
                        ListView(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          shrinkWrap: true,
                          children: [
                            const SizedBox(height: 20),
                            // Memunculkan informasi yang didapat dari form
                            Text( 
                              judul[i],
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              nominal[i],
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              budget[i],
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ]
                  ),
                ),
              ),
            ),
        );
    }
}
```
Pada main.dart yang sudah dibuat pada tugas 7 pekan lalu, ditambah juga widget Drawer
```dart
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: const DrawerClass(),
      body: Center(
```


