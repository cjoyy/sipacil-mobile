# sipacil
### Nama  : Calvin Joy Tarigan
### NPM   : 2306244974
### Kelas : PBP C
<!-- ### Link  :  -->
---


# Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements

<details>
<summary>Click for more detail</summary>
<br>

1. **Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?**

   - **Kegunaan `const`**: `const` digunakan untuk mendefinisikan widget atau objek yang bersifat konstan (tidak akan berubah) selama runtime aplikasi. Ini menciptakan objek yang dibuat sekali saja dalam memori, tanpa dibuat ulang setiap kali widget dirender.
  
   - **Keuntungan Menggunakan `const`**: Menghemat penggunaan memori dan meningkatkan performa aplikasi karena objek yang didefinisikan sebagai `const` hanya dibuat sekali dan disimpan sebagai referensi yang sama dalam memori.

   - **Kapan Menggunakan `const`**: Gunakan `const` saat membuat widget atau objek yang tidak akan berubah selama aplikasi berjalan. Misalnya, teks statis atau ikon yang tidak berubah.

   - **Kapan Tidak Menggunakan `const`**: Jangan gunakan `const` untuk widget atau objek yang nilainya mungkin berubah karena interaksi pengguna atau perubahan state. Misalnya, input form yang menerima masukan pengguna tidak seharusnya dideklarasikan sebagai `const`.

2. **Jelaskan dan bandingkan penggunaan `Column` dan `Row` pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!**

   - **Column**: Widget yang menyusun anak-anaknya secara vertikal (atas-bawah). Umumnya digunakan saat ingin menampilkan widget dalam satu kolom, misalnya daftar teks, gambar, atau tombol vertikal.

**Contoh Implementasi Column**:
```dart
Column(
   mainAxisAlignment: MainAxisAlignment.center,
   children: [
   Text('Hello'),
   Text('World'),
   Icon(Icons.star),
   ],
);
```
   - **Row**: Widget yang menyusun anak-anaknya secara horizontal (kiri-kanan). Digunakan ketika ingin menampilkan widget berdampingan dalam satu baris, misalnya ikon dan teks dalam satu garis.

  **Contoh Implementasi Row**:
  ```dart
Row(
   mainAxisAlignment: MainAxisAlignment.spaceAround,
   children: [
   Icon(Icons.home),
   Text('Home'),
   Icon(Icons.settings),
   ],
);
  ```

3. **Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!**

   - **Elemen Input yang Digunakan**: Di halaman form, elemen input yang digunakan adalah `TextFormField` untuk memasukkan teks seperti nama produk, deskripsi, dan harga, serta `ElevatedButton` untuk menyimpan data.
  
   - **Elemen Input Lain yang Tidak Digunakan**: Ada beberapa elemen input lain di Flutter, seperti:
  **DropdownButton** (digunakan untuk memilih satu opsi dari beberapa pilihan yang tersedia), **Checkbox** (digunakan untuk menampilkan pilihan yang dapat dicentang), **Slider** (digunakan untuk memilih nilai dalam rentang tertentu).
  
  Elemen-elemen ini dapat berguna dalam aplikasi yang membutuhkan lebih banyak variasi input.

4. **Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?**

   - **Cara Mengatur Tema**: Tema diatur di dalam `MaterialApp` menggunakan `ThemeData`, yang mendefinisikan warna, font, dan gaya secara global untuk aplikasi. Dengan menggunakan tema, kita dapat memastikan tampilan aplikasi konsisten pada setiap widget.
  
  **Contoh**:
  ```dart
MaterialApp(
   theme: ThemeData(
   primaryColor: Colors.blue,
   colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green),
   textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
   ),
);
  ```
**Implementasi pada Aplikasi**: Pada aplikasi ini, tema telah diimplementasikan dengan menentukan warna primer untuk AppBar, tombol, dan elemen lainnya, sehingga seluruh tampilan aplikasi menjadi seragam.

5. **Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?**

   - **Navigasi di Flutter**: Navigasi diatur dengan `Navigator` yang memiliki metode seperti `push` dan `pop` untuk berpindah antar halaman.
  - **`Navigator.push`** digunakan untuk membuka halaman baru, sering kali dengan `MaterialPageRoute` yang menerima widget target sebagai parameter.
  - **`Navigator.pop`** digunakan untuk kembali ke halaman sebelumnya.

  **Contoh Navigasi**:
  ```dart
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NewPage()),
  );
  ```
</details>

---

# Tugas 7: Elemen Dasar Flutter

<details>
<summary>Click for more detail</summary>
<br>

1. **Apa yang dimaksud dengan Stateless Widget dan Stateful Widget? Jelaskan perbedaannya.**  
   - **Stateless Widget**: Widget yang statis dan tidak berubah selama aplikasi berjalan. Tidak memiliki state yang dapat diperbarui. Contoh: `Text`, `Icon`.
   - **Stateful Widget**: Widget yang dinamis dan dapat berubah berdasarkan interaksi atau event. Memiliki state yang bisa di-update dengan `setState`. Contoh: `Checkbox`, `TextField`.

2. **Widget apa saja yang digunakan dalam proyek ini? Jelaskan fungsinya.**  
   - **MaterialApp**: Root untuk aplikasi berbasis Material Design, menyediakan tema global dan navigasi.
   - **Scaffold**: Memberi struktur halaman dengan AppBar, body, dll.
   - **AppBar**: Bagian atas halaman yang menampilkan judul aplikasi.
   - **Padding**: Menambahkan jarak di sekitar widget, digunakan untuk tata letak yang lebih baik.
   - **Column**: Menyusun widget dalam susunan vertikal.
   - **Row**: Menyusun widget dalam susunan horizontal.
   - **GridView**: Menampilkan widget dalam bentuk grid, berguna untuk tata letak item dalam beberapa kolom.
   - **Card**: Menampilkan informasi dengan tampilan kotak dengan shadow.
   - **Text**: Menampilkan teks dalam berbagai gaya.
   - **Icon**: Menampilkan ikon untuk representasi grafis.
   - **Material**: Menentukan latar widget dan properti Material lainnya.
   - **InkWell**: Menambahkan efek animasi saat widget ditekan dan mendukung aksi `onTap`.
   - **SnackBar**: Menampilkan pesan sementara di bagian bawah layar saat item ditekan.

3. **Apa fungsi dari `setState()`? Variabel apa saja yang terdampak dengan fungsi tersebut?**  
   - **setState()** digunakan untuk memperbarui UI saat state widget berubah. Variabel yang terdampak adalah variabel-variabel dalam kelas `State` yang mempengaruhi tampilan dan di-update saat `setState` dipanggil.

4. **Jelaskan perbedaan antara `const` dengan `final`.**  
   - **const**: Digunakan untuk membuat nilai yang konstan pada waktu kompilasi dan tidak bisa diubah.
   - **final**: Digunakan untuk membuat variabel yang nilainya diinisialisasi sekali saat runtime dan tidak bisa diubah setelahnya.

5. **Bagaimana cara mengimplementasikan checklist-checklist di atas?**  

   a. **Inisialisasi Proyek Flutter Baru**  
   Buka terminal, lalu jalankan:
   ```bash
   flutter create sipacil
   ```

   b. **Buat Struktur Dasar Program**  
   Di dalam `main.dart`, buat `MyApp` sebagai root aplikasi dengan `MaterialApp` dan halaman utama `MyHomePage`.

   c. **Desain Halaman Utama (`MyHomePage`)**  
   - Tambahkan tiga tombol dalam `Column` di `Scaffold`:
     - `Lihat Daftar Produk`: menggunakan ikon `shopping_cart` dan warna biru.
     - `Tambah Produk`: menggunakan ikon `add` dan warna hijau.
     - `Logout`: menggunakan ikon `logout` dan warna merah.

   d. **Implementasi Warna dan Teks pada Tombol**  
   - Gunakan `Material` atau `ElevatedButton` dengan properti `style` untuk menyesuaikan warna setiap tombol.
   - Atur tampilan ikon dan teks menggunakan `Icon` dan `Text`.

   e. **Tambah SnackBar pada Aksi Tombol**  
   - Tambahkan aksi `onTap` pada setiap tombol untuk memunculkan `SnackBar` sesuai teks masing-masing.
   - Contoh implementasi:
     ```dart
     onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
     ```

   f. **Run Program**  
   Jalankan aplikasi dengan:
   ```bash
   flutter run
   ```

</details>

---