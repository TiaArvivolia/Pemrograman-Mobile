import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  // Properti untuk menyimpan informasi profil pengguna
  final String username;
  final String email;
  final String phoneNumber;

  const ProfilePage({
    super.key,
    required this.username,
    required this.email,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Dekorasi halaman dengan gradasi warna untuk latar belakang
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE9EFEC),
              Color(0xFFC4DAD2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          // Padding untuk memberi ruang di sekitar konten
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Card(
                // Kartu untuk menampilkan informasi profil, dengan efek bayangan (elevation)
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Avatar lingkaran untuk gambar profil, dengan ikon pengguna sebagai pengganti
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: const Color(0xFF6A9C89),
                        child: const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Menampilkan nama pengguna dengan ukuran teks yang besar dan tebal
                      Text(
                        username,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF16423C),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Menampilkan email pengguna
                      Text(
                        email,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF16423C),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Menampilkan nomor telepon pengguna
                      Text(
                        phoneNumber,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF16423C),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Tombol untuk mengedit profil (belum ada logika pada onPressed)
                      ElevatedButton(
                        onPressed: () {
                          // Logika untuk mengedit profil bisa ditempatkan di sini
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6A9C89),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: const Text(
                          'Edit Profile',
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
            ),
          ),
        ),
      ),
    );
  }
}
