import 'package:flutter/material.dart';
import 'landing_page.dart';

void main() {
  runApp(
      HealthyFoodApp()); // Fungsi utama yang menjalankan aplikasi 'Healthy Food App'
}

class HealthyFoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fungsi build untuk membuat tampilan aplikasi dengan MaterialApp sebagai root
    return MaterialApp(
      title: 'Healthy Food App', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.green, // Tema aplikasi dengan warna utama hijau
      ),
      home:
          LandingPage(), // Halaman utama yang ditampilkan adalah 'LandingPage'
    );
  }
}
