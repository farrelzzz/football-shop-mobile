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
* Bawaan Flutter
  * **`Widget`**: abstract class yang diwarisi semua objek yang ditampilkan.
  * **`StatelessWidget`**: membuat widget yang tetap (tidak berubah karena suatu aksi), hanya bergantung pada konfigurasi awal saat ia dibuat.
  * **`MaterialApp`**: wrapper untuk semua Widget yang digunakan dan menyediakan fitur Material Dasar, seperti routing, tema, dan struktur aplikasi. 
  * **`Scaffold`**: menyediakan struktur visual dasar untuk layar, mendefinisikan bagian-bagian umum seperti AppBar (header), body (isi aplikasi), dan Drawer (navigasi di samping).
  * **`Container`**: mengatur dekorasi (warna latar, batas, border radius, bayangan, dll) dan layout (padding, margin, batasan ukuran, dll) untuk widget anaknya.
  * **`Column`**: mengatur daftar widget anak-anaknya secara vertikal, perlu properti children (daftar widget).
  * **`Center`**: memastikan widget anaknya berada di tenagh-tengah ruang yang disediakan untuknya.
  * **`Padding`**: memberi jarak kosong di sekitar widget anaknya, jarak tersebut diatur dengan onjek EdgeInsets.
  * **`SizedBox`**: memberi ruang kosong dengan ukuran tertentu untuk widget anaknya.
  * **`GridView`**: mengatur letak widget anak-anaknya dalam layout dua dimensi.
  * **`AppBar`**: widget yang ada di atas Scaffold, biasanya menampilkan judul halaman dan navbar.
  * **`Text`**: menampilkan teks yang tampilannya bisa diatur lewat properti style yang mengambil objek TextStyle.
  * **`Icon`**: menampilkan ikon yang diambil dari set ikon yang ada (misal dari Material Icons) menggunakan objek IconData.
  * **`Card`**: membuat sebuah Material Design (card) yang sudutnya sedikit bundar, punya elevasi (bayangan ringan), punya efek "mengambang", dan bertugas mengelompokkan konten-konten tertentu.
  * **`InkWell`**: membuat widget anaknya dapat diklik dan memiliki efek ripple (gelombang) khas Material Design saat diesntuh, sehingga widget anaknya jadi lebih interaktif. 
* Hasil Kustom
  * **`MyHomePage`**: menampilkan halaman utama di app
  * **`ItemHomePage`**: menyimpan atribut-atribut dari card dan button yang akan ditampilkan di MyHomePage
  * **`InfoCard`**: membuat card yang akan ditampilkan di MyHomePage
  * **`ItemCard`**: menampilkan button yang dibuat untuk MyHomePage 

### Fungsi Dari Widget MaterialApp dan Kenapa itu Sering Digunakan Sebagai Widget Root  
Widget MaterailApp merupakan widget bawaan flutter yang bisa menjadi wrapper untuk semua Widget yang digunakan dan menyediakan fitur Material Design dasar, seperti routing (navigasi antar halaman), tema, dan struktur aplikasi. Lalu, MaterialApp sering digunakan sebagai widget root karena lewat MaterialApp, kita bisa mengakses komponen dan widget lain yang disediakan oleh flutter SDK, seperti Text, DropdownButton, AppBar, Scaffold, LictView, StatetlessWidget, StatefulWidget, IconButton, dan lain-lain. Sehingga, aplikasi yang kita buat bisa menjadi lebih menarik.

### Perbedaan StatelessWidget dan StatefulWidget Serta Kapan Harus Memilih yang Mana  
| Perbedaan	 | StatelessWidget	 | StatefulWidget |
| :--- | :--- | :--- |
| Perubahan | Tidak punya variabel internal yang dapat mengubah dirinya (tidak bisa berubah secara mandiri). Perubahan hanya bisa dilakukan jika widget parent-nya di-rebuild dan memberikan data konfigurasi yang berbeda | Bisa berubah secara mandiri melalui `setState()`, bisa berubah juga kalau parent-nya berubah |
| Properti | Semua properti harus `final` (immuteable) | Kelas Widget-nya `final`, tapi kelas `State`-nya punya variabel yang bisa berubah  |
| Lifecycle | Hanya punya satu metode `build()` | Punya beberapa metod lifecycle, seperti `initState()`, `didChangeDependencies()`, `dispose()` untuk mengelola state selama lifetime-nya dia |
| Fungsi | Cocok untuk widget yang tidak berubah-ubah (statis) seperti teks dan ikon | Cocok untuk widget yang interaktif, berubah-ubah, atau perlu diperbarui, seperti form dan checkbox|

### Apa Itu BuildContext dan Kenapa Itu Penting di Flutter Serta Bagaimana Penggunaannya di Metode Build  
BuildContext adalah handle atau referensi ke lokasi widget tertentu dalam widget tree Flutter. BuildContext memungkinkan widget mengakses sumber daya, data, dan layanan yang diwariskan atau berada di atasnya dalam widget tree. Berikut hal-hal yang membuat BuildContext penting:
* BuildContext memungkinkan widget mengakses data yang diwariskan dari widget induk yang jauh, seperti mengakses ThemeData (warna, gaya teks, dll) atau MediaQueryData (ukuran layar, orientasi, dll).
* BuildContext diperlukan untuk menemukan dan berinteraksi dengan widget tingkat tinggi, seperti Navigator untuk berpindah halaman atau ScaffoldMessenger untuk menampilkan Snackbar.
* Karena setiap widget memiliki BuildContext, maka BuildContext ini tetap melekat pada lokasi widget di widget tree, meskipun widget itu diganti dengan widget baru yang tipe-nya sama.
Contoh penggunaan BuildContext di method build() ada di aplikasi ini di bagian menu.dart dan main.dat. Di dalam widget MyHomePage (menu.dart), terlihat kita bisa mengambil warna tema aplikasi untuk dipakai sebagai warna latar belakang AppBar, meskipun warna tema aplikasinya ditentukan di file main.dart. Itu terjadi karena parent dari MyHomePage ada di main.dart dan parent tersebut menggunakan build() dengan BuildContext sebagai argumen pertamanya  

### Apa Itu Hot Reload di Flutter dan Bagaimana Bedanya Dengan Hot Restart
* Hot Reload: memuat perubahan kode ke VM, membuat widget tree baru, tapi tetap memertahankan state aplikasi (tidak menjalankan ulang main() atau initState()). Bisa dilakukan dengan menekan Ctrl + F5
* Hot Restart: memuat perubahan kode ke VM dan me-restart aplikasi Flutter, sehingga state aplikasi hilang. Bisa dilakukan dengan menekan Ctrl + Shift + F5
