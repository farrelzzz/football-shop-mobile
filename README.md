# Football Shop Mobile ⚽️
Tugas Individu PBP Ganjil 25/26  
Muhammad Farrel Rajendra - 2406495653 - PBP D

## Tugas Individu 7
### Apa Itu Widget Tree Pada Flutter?  
Pada Flutter, Widget Tree merupakan representasi logis dari semua widget antarmuka pengguna (UI) yang ada di aplikasi. Widget Tree akan dikomputasi selama fase layout (pemgukuran dan info struktural) dan akan digunakan selama fase rendering (menggambar frame ke layar) dan hit testing (interaksi sentuhan).
Dalam Widget Tree, setiap node nya adalah widget dan setiap edge (garis penghubung) menggambarkan hubungan Parent-Child.

### Bagaimana Hubungan Parent-Child Bekerja Antar Widget
Setiap widget Child harus didefinisikan di dalam Widget Parent. Selain itu, Widget Parent akan mengelola widget anak yang didefinisakn di dalammya, seperti:  
* Komposisi dan Struktur  
Contohnya, widget Column (Parent) menggunakan properti children untuk menampun widget lain seperti Text, Icon, dll.

* Layout  
  * Parent menentukan batasan (Contraints) untuk widget anaknya.  
  * Child menentukan size untuk dirinya sendiri.  
  * Parent menentukan posisi widget anak.  

* Inheritance  
InheritedWidget memungkinkan Parent menyediakan data yang dapat diakses oleh child. Child juga bisa melakukan callbacks (fungsi yang diberikan Induk kepada Anak) yang dipicu oleh interaksi pengguna pada Child  

* Lifecycle  
Misal ketika Parent di-rebuild, Parent bisa memilih apakah Child perlu di-rebuild juga atau tidak.

### Widget yang Digunakan Dalam Proyek Ini

### Fungsi Dari Widget MaterialApp dan Kenapa itu Sering Digunakan Sebagai Widget Root  
Widget MaterailApp merupakan widget bawaan flutter yang bisa menjadi wrapper untuk Widget Material lainnya. Lalu, MaterialApp sering digunakan sebagai widget root karena lewat MaterialApp, kita bisa mengakses komponen dan widget lain yang disediakan oleh flutter SDK, seperti Text, DropdownButton, AppBar, Scaffold, LictView, StatetlessWidget, StatefulWidget, IconButton, dan lain-lain. Sehingga, aplikasi yang kita buat bisa menjadi lebih menarik.

### Perbedaan StatelessWidget dan StatefulWidget Serta Kapan Harus Memilih yang Mana
### Apa Itu BuildContext dan Kenapa Itu Penting di Flutter Serta Bagaimana Penggunaannya di Metode Build
### Apa Itu Hot Reload di Flutter dan Bagaimana Bedanya Dengan Hot Restart
