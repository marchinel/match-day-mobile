# matchday_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

== TUGAS 7 ==

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Dalam Flutter, widget tree adalah struktur hierarki yang menggambarkan bagaimana seluruh elemen antarmuka tersusun dari widget-widget yang saling bertingkat, di mana setiap widget bisa memiliki satu atau beberapa widget lain di dalamnya. Hubungan parent–child (induk–anak) terjadi ketika sebuah widget (parent) membungkus widget lain (child) untuk mengatur tampilan, posisi, atau perilakunya. Parent menentukan bagaimana child ditampilkan (misalnya melalui layout seperti Column atau Center), sedangkan child menentukan isi yang ditampilkan (misalnya Text atau Image). Struktur pohon ini menjadi dasar cara Flutter membangun, mewariskan data, dan memperbarui tampilan aplikasi secara efisien.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

1. Text: berfungsi untuk menampilkan tulisan atau teks di dalam aplikasi Flutter.
2. Row: digunakan untuk menata beberapa widget secara horizontal, yaitu dari kiri ke kanan.
3. MaterialApp: merupakan widget utama yang biasa ditempatkan sebagai root aplikasi, berfungsi membangun aplikasi dengan gaya Material Design dari Google.
4. Center: berperan untuk memusatkan (menempatkan di tengah) widget child di dalam parent-nya.
5. Scaffold: menyediakan kerangka dasar tampilan halaman, seperti AppBar, Drawer, Body, dan FloatingActionButton.
6. SnackBar: menampilkan notifikasi singkat di bagian bawah layar, biasanya untuk memberi umpan balik setelah tindakan pengguna.
7. GridView.count: berguna untuk menampilkan kumpulan widget dalam tata letak grid atau tabel dengan jumlah kolom tertentu.
8. Padding: menambahkan ruang kosong di sekitar child, berguna untuk memberi jarak antar elemen agar tampilan tidak terlalu rapat.
9. AppBar: bagian atas dari tampilan halaman (top bar) yang biasanya berisi judul aplikasi atau tombol navigasi.
10. SizedBox: widget sederhana yang digunakan untuk membuat jarak antar elemen atau memberi ukuran tertentu pada ruang kosong.
11. Column: digunakan untuk menyusun beberapa widget secara vertikal, dari atas ke bawah.
12. InfoCard (custom widget): widget yang meng-extend StatelessWidget untuk menampilkan kartu berisi judul dan informasi utama.
13. ⁠ItemCard (custom widget): widget buatan sendiri yang menampilkan satu item menu lengkap dengan ikon, nama, serta warna latar.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Widget MaterialApp berfungsi sebagai pembungkus utama (root widget) dalam aplikasi Flutter yang menggunakan desain Material Design, yaitu gaya antarmuka yang dikembangkan oleh Google. Widget ini menyediakan berbagai fitur penting seperti pengaturan tema (theme), navigasi (routes dan navigator), title aplikasi, serta localization. Dengan MaterialApp, developer tidak perlu mengatur semua aspek UI dasar secara manual karena widget ini sudah menyiapkan struktur dan perilaku standar aplikasi berbasis Material Design, seperti efek transisi antarhalaman, tampilan AppBar, FloatingActionButton, hingga sistem warna dan font bawaan.

MaterialApp sering digunakan sebagai widget root karena berperan sebagai fondasi dari seluruh widget lain di dalam aplikasi. Semua komponen UI yang memerlukan konteks Material Design (seperti Scaffold, AppBar, SnackBar, dan FloatingActionButton) hanya dapat berfungsi jika berada di bawah MaterialApp. Dengan kata lain, MaterialApp menciptakan lingkungan atau konteks yang memungkinkan widget-widget tersebut bekerja sesuai prinsip desain Material, sehingga hampir semua aplikasi Flutter modern menempatkannya sebagai lapisan terluar dari widget tree.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

Perbedaan utama antara StatelessWidget dan StatefulWidget terletak pada ada atau tidaknya perubahan keadaan (state) yang dapat memengaruhi tampilan widget. StatelessWidget digunakan untuk widget yang tidak berubah selama aplikasi berjalan, artinya tampilannya hanya bergantung pada data awal dan tidak perlu diperbarui, seperti teks statis, ikon, atau tombol yang tidak menampilkan perubahan dinamis. 

Sebaliknya, StatefulWidget digunakan untuk widget yang dapat berubah seiring waktu, misalnya ketika pengguna berinteraksi, data diperbarui, atau ada animasi, contohnya adalah form input, counter, atau halaman yang menampilkan data dari API.

Kita memilih StatelessWidget saat UI cukup statis dan tidak memerlukan penyimpanan atau pembaruan nilai, karena lebih ringan dan efisien. Sedangkan StatefulWidget dipilih ketika kita butuh menyimpan dan mengubah data internal (melalui objek State) agar tampilan bisa diperbarui secara otomatis setiap kali terjadi perubahan.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext adalah objek yang merepresentasikan posisi sebuah widget di dalam widget tree dan berfungsi sebagai penghubung antara widget dengan lingkungan sekitarnya di Flutter. Melalui BuildContext, sebuah widget dapat mengakses informasi dari parent-nya, seperti tema aplikasi (Theme.of(context)), ukuran layar (MediaQuery.of(context)), atau melakukan navigasi antarhalaman (Navigator.of(context)).

BuildContext sangat penting karena setiap kali Flutter membangun ulang tampilan, ia memerlukan konteks untuk mengetahui di mana widget itu berada dalam hierarki dan sumber daya apa yang bisa diakses. Dalam metode build(BuildContext context), parameter context ini digunakan untuk membangun tampilan widget berdasarkan lokasi dan data yang relevan, misalnya:

Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Contoh Context')),
    body: Center(
      child: Text(
        'Lebar layar: ${MediaQuery.of(context).size.width}',
      ),
    ),
  );
}

Pada contoh tersebut, context memungkinkan widget Text mengetahui ukuran layar dari parent-nya. Dengan demikian, BuildContext adalah kunci agar widget dapat berinteraksi secara dinamis dengan struktur dan data dalam aplikasi Flutter.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot reload di Flutter adalah fitur yang memungkinkan developer melihat perubahan kode secara instan tanpa kehilangan state aplikasi yang sedang berjalan. Saat hot reload dijalankan, Flutter hanya memuat ulang kode yang diubah dan memperbarui tampilan UI di layar, sementara data, variabel state, dan posisi navigasi tetap dipertahankan. Fitur ini sangat berguna untuk mempercepat proses pengembangan, misalnya ketika mengubah warna, teks, atau tata letak widget tanpa harus memulai ulang aplikasi dari awal.

Sebaliknya, hot restart akan memuat ulang seluruh aplikasi dari awal. Semua state atau data yang tersimpan sementara akan dihapus, dan aplikasi kembali ke kondisi awal seperti saat baru dijalankan. Perbedaan utamanya adalah hot reload mempertahankan state, sedangkan hot restart mengatur ulang seluruh state. Hot reload cocok digunakan saat melakukan perubahan kecil pada tampilan atau logika UI, sementara hot restart digunakan ketika perubahan yang dilakukan memengaruhi struktur dasar aplikasi atau inisialisasi awal yang tidak bisa diperbarui secara langsung.

== TUGAS 8 ==

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu? Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() digunakan untuk memindahkan pengguna ke halaman baru dengan tetap menyimpan halaman sebelumnya dalam stack. Artinya, ketika pengguna berada di halaman baru, mereka masih dapat kembali ke halaman sebelumnya dengan menekan tombol back. Sementara itu, Navigator.pushReplacement() menggantikan halaman saat ini dengan halaman baru dan menghapus halaman sebelumnya dari stack, sehingga pengguna tidak bisa kembali lagi ke halaman lama.

Dalam aplikasi Football Shop, Navigator.push() cocok digunakan saat pengguna berpindah dari daftar produk ke detail produk, karena kamu ingin mereka bisa kembali melihat daftar barang. Sedangkan Navigator.pushReplacement() lebih tepat digunakan setelah proses seperti login atau checkout, di mana setelah transaksi selesai atau pengguna sudah masuk, kamu tidak ingin mereka kembali ke halaman login atau halaman keranjang yang lama, sehingga pengalaman navigasinya lebih bersih dan logis.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Untuk menjaga tampilan yang konsisten di setiap halaman, saya menggunakan Scaffold sebagai kerangka dasar. Di dalamnya, saya menempatkan AppBar dengan gaya dan warna yang sama agar tampilan aplikasi tetap seragam. Kemudian, saya menambahkan Drawer sebagai menu navigasi yang muncul di semua halaman, sehingga pengguna dapat berpindah antar halaman dengan mudah. Bagian yang berbeda hanya terdapat pada body, sesuai dengan konten yang ingin ditampilkan. Dengan struktur ini, setiap halaman tetap terasa konsisten, mudah digunakan, dan rapi secara keseluruhan.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widgetseperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Menggunakan widget seperti Padding, SingleChildScrollView, dan ListView membantu membuat tampilan form lebih rapi, nyaman digunakan, dan tetap responsif di berbagai ukuran layar. Padding memberikan jarak yang cukup antar elemen agar tidak terlihat menumpuk dan lebih mudah dibaca. SingleChildScrollView berguna saat form memiliki banyak elemen, sehingga pengguna tetap bisa menggulir tampilan tanpa ada bagian yang terpotong, terutama pada layar kecil. Sedangkan ListView memudahkan penataan elemen secara vertikal dan otomatis mendukung scrolling, sehingga form dapat ditampilkan dengan lebih dinamis tanpa perlu mengatur tinggi secara manual.

Contohnya pada aplikasi Football Shop, saat menampilkan form tambah produk, saya menggunakan Padding untuk memberi jarak antara field nama produk, harga, dan deskripsi. Lalu, seluruh form dibungkus dengan SingleChildScrollView atau ListView agar halaman tetap bisa digulir ketika keyboard muncul, sehingga pengguna tidak merasa kesulitan mengisi form. Dengan cara ini, tampilan form menjadi lebih rapi, nyaman, dan mudah diakses.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Supaya tampilan aplikasi Match Day punya identitas yang kuat dan konsisten dengan brand-nya, saya menyesuaikan warna tema aplikasi dengan warna khas toko, yaitu hijau. Warna hijau ini dipilih karena memberikan kesan segar, energik, dan identik dengan dunia olahraga.

Saya memakai warna hijau dengan kode Color(0xFF1E8449) sebagai warna utama (primary color) di ColorScheme, agar semua elemen penting seperti AppBar, DrawerHeader, dan tombol “Save” punya nuansa yang sama. Dengan begitu, warna di seluruh halaman aplikasi jadi selaras, tidak random, dan langsung bisa dikenali sebagai bagian dari brand Match Day. Tujuannya, biar pengguna ngerasa pengalaman yang lebih menyatu dan profesional saat memakai aplikasinya.

