import 'package:flutter/material.dart';
import 'about_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Menyimpan indeks dari halaman yang aktif

  // Inisialisasi daftar halaman untuk navigasi
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      _buildProductCatalog(), // Halaman Home menampilkan katalog produk
      const AboutPage(), // Halaman About menampilkan informasi tentang aplikasi
      ProfilePage(
        username: widget.username,
        email: 'user@example.com',
        phoneNumber: '123-456-7890', // Data profil pengguna
      ),
    ];
  }

  // Fungsi untuk mengubah halaman berdasarkan tab yang ditekan
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Fungsi untuk menampilkan dialog konfirmasi logout
  void _logout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Menutup dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Menutup dialog
              Navigator.of(context).pop(); // Contoh: Kembali ke halaman login
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membangun halaman katalog produk
  Widget _buildProductCatalog() {
    final List<Map<String, String>> products = [
      {
        "name": "Healthy Package",
        "image": "assets/product1.jpeg",
        "price": "\Rp 400K",
      },
      {
        "name": "Protein Package",
        "image": "assets/product2.jpeg",
        "price": "\Rp 500K",
      },
      {
        "name": "Slimming Package",
        "image": "assets/product3.jpeg",
        "price": "\Rp 400K",
      },
      {
        "name": "GERD Package",
        "image": "assets/product4.jpeg",
        "price": "\Rp 435K",
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome, ${widget.username}!', // Menyapa pengguna
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF16423C),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Product Catalog', // Judul bagian katalog produk
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF16423C),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.65, // Mengatur tampilan grid
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  color: const Color(0xFFE9EFEC),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.asset(
                          products[index]
                              ['image']!, // Menampilkan gambar produk
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        products[index]['name']!, // Menampilkan nama produk
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF16423C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        products[index]['price']!, // Menampilkan harga produk
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6A9C89),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Healthy Food App', // Judul aplikasi
          style: TextStyle(color: Color(0xFF16423C)),
        ),
        backgroundColor: const Color(0xFFE9EFEC), // Warna latar AppBar
        automaticallyImplyLeading: false, // Menonaktifkan tombol kembali
        actions: [
          IconButton(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFE9EFEC), // Latar belakang ikon
              ),
              padding: const EdgeInsets.all(8.0), // Jarak sekitar ikon
              child: Icon(
                Icons.logout,
                color: const Color(0xFF16423C), // Warna ikon logout
              ),
            ),
            onPressed: _logout, // Memanggil fungsi logout
            tooltip: 'Logout', // Tooltip untuk logout
          ),
        ],
      ),
      body: _pages[_currentIndex], // Menampilkan halaman berdasarkan indeks
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped, // Pindah halaman saat tab ditekan
        selectedItemColor: const Color(0xFF6A9C89),
        unselectedItemColor: const Color(0xFF16423C),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk halaman home
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info), // Ikon untuk halaman about
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ikon untuk halaman profil
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
