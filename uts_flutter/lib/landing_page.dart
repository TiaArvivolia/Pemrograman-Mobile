import 'package:flutter/material.dart';
import 'login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Membuat UI untuk halaman landing
    return Scaffold(
      // Mengatur latar belakang halaman dengan gradien warna yang menarik
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            // Mengatur perpaduan warna dari yang gelap hingga terang
            colors: [
              Color(0xFF16423C), // Warna gelap
              Color(0xFF6A9C89), // Warna sedang
              Color(0xFFC4DAD2), // Warna cerah
              Color(0xFFE9EFEC), // Warna paling terang
            ],
            begin: Alignment.topLeft, // Gradien dimulai dari sudut kiri atas
            end: Alignment.bottomRight, // Gradien berakhir di sudut kanan bawah
          ),
        ),
        // Memusatkan konten di tengah halaman
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20), // Menambahkan jarak sisi horizontal
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Mengatur posisi konten di tengah secara vertikal
              children: [
                // Menampilkan logo aplikasi dengan border yang lembut
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        15), // Membuat sudut gambar melengkung
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                            0.2), // Menambahkan bayangan dengan transparansi
                        blurRadius: 10, // Mengatur tingkat kabur bayangan
                        offset: const Offset(0, 5), // Posisi bayangan ke bawah
                      ),
                    ],
                  ),
                  // Mengatur gambar agar terpotong sesuai border
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        15), // Menyesuaikan sudut gambar dengan container
                    child: Image.asset(
                      'assets/healthy_food_logo.jpg', // Path gambar logo aplikasi
                      height: 150,
                      fit: BoxFit
                          .cover, // Menyesuaikan ukuran gambar secara proporsional
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Teks utama halaman dengan font yang lebih besar dan efek bayangan
                Text(
                  'Healthy Food for a Healthy Life',
                  style: TextStyle(
                    fontSize: 26, // Ukuran font besar
                    fontWeight: FontWeight.bold, // Mengatur teks menjadi tebal
                    color: Colors.white, // Warna teks putih
                    shadows: [
                      Shadow(
                        blurRadius: 8.0, // Efek bayangan teks
                        color: Colors.black
                            .withOpacity(0.5), // Transparansi bayangan
                        offset: const Offset(2.0, 2.0), // Arah bayangan
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center, // Teks di tengah halaman
                ),
                const SizedBox(height: 50),
                // Tombol untuk memulai aplikasi dengan transisi ke halaman login
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                        const Color(0xFF16423C), // Warna teks tombol
                    backgroundColor: Colors.white, // Warna latar tombol
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15), // Mengatur ukuran tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30), // Membuat tombol dengan sudut melengkung
                    ),
                    elevation: 5, // Menambahkan efek bayangan di tombol
                  ),
                  // Aksi ketika tombol diklik, navigasi ke halaman login
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginPage()), // Menuju halaman login
                    );
                  },
                  child: const Text(
                    'Get Started', // Label tombol
                    style: TextStyle(fontSize: 18), // Ukuran font label
                  ),
                ),
                const SizedBox(height: 20),
                // Teks tambahan yang memberi motivasi kepada pengguna
                const Text(
                  'Join us in discovering healthy recipes and tips!', // Pesan ajakan
                  style: TextStyle(
                    fontSize: 16, // Ukuran font teks tambahan
                    color: Colors.white70, // Warna teks putih transparan
                  ),
                  textAlign: TextAlign.center, // Teks ditempatkan di tengah
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
