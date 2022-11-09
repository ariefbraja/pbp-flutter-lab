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

