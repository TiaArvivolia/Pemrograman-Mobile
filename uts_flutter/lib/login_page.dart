import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk menangani input username
  final TextEditingController _usernameController = TextEditingController();
  
  // Controller untuk menangani input password
  final TextEditingController _passwordController = TextEditingController();
  
  // Pesan error yang akan ditampilkan jika login gagal
  String _errorMessage = '';

  // Fungsi untuk menangani logika login
  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Jika username dan password benar, pindah ke HomePage
    if (username == 'Tia' && password == 'tia123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(username: username)),
      );
    } else {
      // Jika salah, tampilkan pesan error
      setState(() {
        _errorMessage = 'Invalid username or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor:
            const Color(0xFF6A9C89), // Menggunakan warna sedang dari palet
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE9EFEC), // Warna paling terang
              Color(0xFFC4DAD2), // Warna cerah
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          // Pusatkan konten
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4, // Memberikan bayangan
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Sudut melengkung
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0), // Padding di dalam Card
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Mengatur ukuran kolom
                  children: [
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF16423C), // Warna gelap
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    // Form input untuk username
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: const TextStyle(
                            color: Color(0xFF6A9C89)), // Warna sedang
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0xFF6A9C89)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0xFF16423C)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Form input untuk password
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                            color: Color(0xFF6A9C89)), // Warna sedang
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0xFF6A9C89)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0xFF16423C)),
                        ),
                      ),
                      obscureText: true, // Password tersembunyi
                    ),
                    const SizedBox(height: 10),
                    // Tombol Login
                    ElevatedButton(
                      onPressed: _login, // Panggil fungsi login saat ditekan
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(
                            0xFF16423C), // Warna latar belakang tombol
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Sudut melengkung
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 10),
                    // Menampilkan pesan error jika login gagal
                    Text(
                      _errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 10),
                    // Teks tambahan
                    const Text(
                      'Don\'t have an account? Sign up',
                      style: TextStyle(
                        color: Color(0xFF6A9C89),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
