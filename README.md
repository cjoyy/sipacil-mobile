# sipacil
### Nama  : Calvin Joy Tarigan
### NPM   : 2306244974
### Kelas : PBP C
<!-- ### Link  :  -->
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