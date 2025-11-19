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

== TUGAS 9 ==

1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic>tanpa model (terkait validasi tipe, null-safety, maintainability)?

Ketika bekerja dengan data JSON di Flutter, membuat model Dart sangat penting karena model berperan sebagai struktur data yang jelas, terprediksi, dan aman. Dengan model, setiap field memiliki tipe data yang tegas sehingga proses validasi tipe dan pengecekan null dapat dilakukan secara otomatis oleh compiler. Hal ini mencegah banyak error saat runtime, misalnya ketika server mengembalikan tipe yang tidak sesuai atau data tertentu tidak ada. Sebaliknya, jika kita langsung memetakan JSON ke Map<String, dynamic> tanpa model, kita kehilangan perlindungan tipe dan null-safety. Setiap akses nilai harus dicek dan diparsing manual, sehingga risiko error seperti "type 'String' is not a subtype of…" menjadi jauh lebih besar. Selain itu, penggunaan model membuat kode lebih mudah dirawat dan dikembangkan; perubahan struktur API cukup diperbarui di satu tempat, dan bagian lain dari aplikasi tetap konsisten. Tanpa model, struktur data bisa tersebar di banyak bagian kode, membuat maintainability rendah dan debugging lebih sulit karena tidak ada kontrak data yang eksplisit.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

Package http dan CookieRequest sama-sama dipakai untuk melakukan komunikasi dengan server, tetapi keduanya memiliki fungsi dan peran yang berbeda dalam konteks tugas aplikasi Flutter berbasis Django.
Package http berfungsi sebagai klien HTTP dasar. Ia memungkinkan aplikasi melakukan request sederhana seperti GET atau POST tanpa menyimpan status apa pun. Setiap kali kita mengirim request melalui http, kita harus menyertakan header, body, dan konfigurasi lain secara manual. Pendekatan ini cocok untuk endpoint yang tidak membutuhkan autentikasi berkelanjutan, misalnya mengambil data publik atau mengakses API yang tidak membutuhkan sesi login. Dengan kata lain, http bekerja secara stateless dan tidak memiliki kemampuan untuk menyimpan informasi cookie pengguna.
Berbeda dengan itu, CookieRequest dirancang khusus untuk menangani request yang membutuhkan session management. Dalam tugas ini, Django menggunakan session-based authentication, sehingga proses login, logout, dan akses ke endpoint yang memerlukan identitas pengguna membutuhkan cookie session. CookieRequest otomatis menyimpan dan mengirimkan cookie tersebut pada setiap request berikutnya, sehingga pengguna tetap dianggap “login” oleh server tanpa harus memasukkan kredensial terus-menerus. CookieRequest juga menyediakan fungsi-fungsi yang lebih terstandardisasi seperti login, logout, dan pengiriman POST dengan cookie yang tetap konsisten.


3. Jelaskan mengapa instanceCookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Instance CookieRequest perlu dibagikan ke seluruh komponen aplikasi Flutter karena objek ini menyimpan stateautentikasi pengguna—terutama cookie session yang diberikan oleh server setelah login. Cookie tersebut harus dikirim ulang setiap kali aplikasi melakukan request ke endpoint yang membutuhkan identitas pengguna. Jika setiap widget atau halaman membuat instance CookieRequest baru, cookie tidak akan terbawa, sehingga server akan menganggap pengguna belum login dan request ke endpoint yang terlindungi akan gagal.

Dengan membagikan satu instance yang sama ke seluruh aplikasi (misalnya melalui Provider), seluruh halaman dan service dapat mengakses sesi yang konsisten. Ini memastikan bahwa autentikasi tetap berkelanjutan, status login tidak hilang saat berpindah halaman, dan semua request memakai cookie yang sama. Selain menjaga konsistensi, pendekatan ini juga membuat struktur aplikasi lebih rapi dan mudah dirawat, karena manajemen sesi terpusat pada satu objek terkontrol, bukan tersebar di berbagai widget yang membuat instance sendiri-sendiri.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Agar Flutter dapat berkomunikasi dengan Django, beberapa konfigurasi konektivitas penting harus disiapkan di kedua sisi. Pada Django, kita perlu menambahkan alamat 10.0.2.2 ke dalam ALLOWED_HOSTS karena emulator Android mengakses server lokal melalui alamat tersebut, bukan localhost. Selain itu, Django harus mengaktifkan CORS agar request lintas origin dari aplikasi Flutter tidak diblokir, serta mengatur kebijakan cookie dan SameSite supaya cookie sesi dapat dikirim dan dibaca dengan benar untuk kebutuhan autentikasi. Di sisi Flutter, terutama untuk Android, kita harus menambahkan izin akses internet pada AndroidManifest.xml agar aplikasi dapat mengirim request HTTP. Kombinasi pengaturan ini memastikan bahwa Flutter dapat menjangkau server Django, mengirim dan menerima data tanpa diblokir oleh aturan keamanan, serta mempertahankan sesi login secara konsisten selama aplikasi berjalan.

1) Menambahkan 10.0.2.2 pada ALLOWED_HOSTS Django
Pada Android emulator, alamat localhost tidak menunjuk ke komputer host, tetapi ke mesin virtual Android itu sendiri. Django yang berjalan di laptop hanya bisa diakses dari emulator melalui alamat khusus 10.0.2.2, yaitu "jembatan" dari emulator ke host.
Jika 10.0.2.2 tidak ditambahkan ke ALLOWED_HOSTS, Django akan menolak request karena dianggap berasal dari host yang tidak diizinkan (security feature Django). Akibatnya, Flutter akan mendapat error seperti “DisallowedHost” atau response 400/403 dan tidak bisa mengakses API sama sekali.

2) Mengaktifkan CORS (Cross-Origin Resource Sharing)
Flutter (terutama saat build web atau request dari environment berbeda) akan dianggap sebagai origin berbeda oleh Django. Karena itu, Django perlu mengizinkan origin tersebut melalui pengaturan CORS, misalnya dengan:
* Mengaktifkan django-cors-headers
* Menambahkan Flutter origin ke CORS_ALLOWED_ORIGINS atau mengizinkan semua untuk development
CORS diperlukan agar browser atau WebView tidak memblokir request karena dianggap lintas domain yang tidak aman.
Jika CORS tidak dikonfigurasi:
* Flutter Web akan gagal mem-fetch API
* Request bisa diblokir di level browser, bahkan sebelum mencapai server
* Error seperti “CORS policy: No ‘Access-Control-Allow-Origin’ header” akan muncul

3) Pengaturan SameSite & Cookie
Karena tugas ini menggunakan session-based authentication Django, cookie menjadi sangat penting. Supaya cookie bisa dikirim dari Flutter ke Django, Django harus mengizinkan:
* SESSION_COOKIE_SAMESITE = "None"
* SESSION_COOKIE_SECURE = True (cookie lintas situs harus secure)
* Mengizinkan cookie dikirim melalui request cross-origin
Jika pengaturan ini salah:
* Cookie tidak akan ikut terkirim saat Flutter melakukan request
* Login terlihat sukses, tetapi request berikutnya dianggap “tidak login”
* Endpoint yang memerlukan autentikasi akan memunculkan 401/403
Artinya, seluruh fitur yang membutuhkan identitas pengguna akan rusak.

4) Menambahkan izin internet pada Android (AndroidManifest.xml)
Flutter di Android perlu izin eksplisit untuk mengakses internet:

<uses-permission android:name="android.permission.INTERNET" />
Tanpa izin ini, aplikasi Android tidak dapat melakukan HTTP request sama sekali, meskipun secara kode terlihat benar.
Jika izin internet tidak ditambahkan:
* Request selalu gagal
* Tidak ada koneksi ke server meski Django berjalan dengan benar
* Error seperti SocketException: Failed host lookup muncul


5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Pertama, pengguna memasukkan data melalui form di Flutter, misalnya teks, angka, atau pilihan tertentu. Data yang diinput ini kemudian dikumpulkan dalam bentuk objek Dart atau Map<String, dynamic>, lalu dikirim ke server Django menggunakan request HTTP—biasanya melalui POST. Jika autentikasi diperlukan, objek CookieRequest akan otomatis menyertakan cookie sesi sehingga server mengetahui identitas pengguna.
Setelah request diterima, Django memproses data tersebut melalui view yang sesuai. Backend dapat melakukan validasi, menyimpan data ke database, menghitung sesuatu, atau mengembalikan hasil tertentu. Django kemudian mengemas hasilnya dalam bentuk JSON sebagai response untuk dikirim kembali ke aplikasi Flutter.

Saat Flutter menerima response JSON tersebut, aplikasi akan memetakannya menjadi model Dart sehingga tipe data lebih aman dan dapat digunakan di UI. Setelah data berhasil diparsing, widget Flutter menampilkan informasi tersebut kepada pengguna—misalnya daftar item, detail entri baru, atau status keberhasilan operasi. Dengan begitu, seluruh proses input → request → pemrosesan → response → tampilan berlangsung secara terstruktur dan dapat dipertahankan konsistensinya.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Mekanisme autentikasi pada tugas Flutter–Django berlangsung melalui beberapa tahap yang saling terhubung, dimulai dari input pengguna hingga Django memprosesnya dan Flutter menampilkan menu sesuai status login. Ketika pengguna melakukan register, Flutter mengambil data seperti username, email, dan password dari form, lalu mengirimkannya ke endpoint Django menggunakan POST. Django memvalidasi data, membuat akun baru, lalu mengirimkan respons JSON berisi status berhasil atau gagal. Selanjutnya, saat pengguna melakukan login, Flutter kembali mengirimkan username dan password melalui CookieRequest. Django mengecek kredensial menggunakan sistem autentikasinya; jika benar, Django membuat session baru dan mengirimkan cookie session kepada Flutter. Cookie ini disimpan otomatis oleh CookieRequest sehingga setiap request berikutnya akan membawa identitas pengguna tanpa harus login ulang. Setelah login berhasil, Flutter dapat memanggil endpoint yang dilindungi, seperti fetch item atau data profil, dan server akan mengenali pengguna berdasarkan cookie tersebut. Status login ini menentukan apakah Flutter menampilkan halaman menu utama atau tetap di halaman login. Terakhir, ketika pengguna melakukan logout, Flutter memanggil endpoint logout Django. Django menghapus session, mengembalikan respons sukses, dan CookieRequest menghapus cookie yang tersimpan. Setelah itu Flutter mengarahkan pengguna kembali ke halaman login. Dengan mekanisme ini, alur autentikasi menjadi konsisten: input di Flutter → validasi Django → pembentukan/penyelesaian session → Flutter mengubah tampilan berdasarkan status autentikasi.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

Backend (Django)
Langkah pertama adalah membuat aplikasi Django baru dengan nama authentication, kemudian menambahkannya ke dalam daftar installed apps di file settings.py. Untuk memungkinkan aplikasi Flutter mengirim request ke server, perlu menginstal library corsheaders, menambahkan konfigurasi CORS tambahan, serta memasukkan middleware CORS ke dalam settings. Selain itu, alamat 10.0.2.2 juga harus dimasukkan ke dalam allowed hosts agar emulator Android dapat terhubung.
Aplikasi authentication kemudian dilengkapi dengan API untuk menangani proses login, register, dan logout, yang juga harus dihubungkan melalui routing di urls.py. Untuk mengatasi masalah CORS pada saat memuat gambar, dibuat sebuah endpoint bernama proxy_image di main/views.py. Demi menangani pengiriman data dari Flutter, dibuat pula endpoint create_product_flutter, serta endpoint tambahan untuk memfilter produk berdasarkan pengguna yang sedang login.

Frontend (Flutter)
Pada sisi Flutter, pertama-tama perlu menginstal library provider dan paket pbp_django_auth. Root widget kemudian dimodifikasi agar dapat menyediakan instance CookieRequest ke seluruh widget turunan menggunakan Provider (di dalam main.dart). Selanjutnya, dibuat halaman login.dart dan register.dart yang akan mengakses endpoint Django untuk proses autentikasi.

Model data baru dibuat di folder lib/models menggunakan quicktype, dengan memasukkan JSON hasil dari API Django. Aplikasi juga memerlukan package http dan izin akses internet yang harus ditambahkan pada file AndroidManifest.xml.
Untuk menampilkan data produk, dibuat widget baru bernama product_entry_card.dart di folder lib/widgets, yang menampilkan pratinjau produk termasuk gambar melalui endpoint proxy_image. Di sisi layar, dibuat halaman product_entry_list.dart yang memuat daftar produk dalam bentuk kartu. Pengambilan data disesuaikan dengan pengguna: endpoint /json untuk semua produk, dan /my-product-json untuk produk milik pengguna. Halaman ini kemudian ditambahkan ke left drawer. Tombol pada halaman utama juga diperbarui menggunakan if–else agar dapat mengarahkan pengguna ke daftar produk yang sesuai.

Selain itu, dibuat layar baru product_detail.dart untuk menampilkan detail lengkap setiap produk. Widget product_entry_card.dart juga ditambahkan event handler supaya ketika ditekan, aplikasi akan membuka halaman detail berdasarkan ID produk tersebut.
Terakhir, product_form.dart dihubungkan dengan CookieRequest melalui context.watch(). Bagian onPress kemudian diperbarui agar data dari form dienkode menjadi JSON sebelum dikirimkan ke server Django menggunakan endpoint yang telah disiapkan.


