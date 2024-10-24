import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menampilkan halaman dengan struktur dasar Scaffold
      body: Container(
        // Menambahkan background gradien untuk tampilan menarik
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE9EFEC),
              Color(0xFFC4DAD2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // Menempatkan elemen di tengah halaman
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'About Healthy Food App',
                // Menampilkan judul dengan gaya teks yang mencolok
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF16423C),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'This app offers healthy food recommendations and valuable tips for maintaining a balanced diet. Discover nutritious recipes and meal suggestions tailored to your lifestyle.',
                // Menampilkan deskripsi aplikasi
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF16423C),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                // Tombol untuk memulai atau menambahkan aksi yang relevan
                onPressed: () {
                  // Tambahkan aksi di sini jika diperlukan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A9C89),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  'Get Started',
                  // Teks pada tombol
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
