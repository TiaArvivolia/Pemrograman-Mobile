import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Membuat kolom bagian kiri pada judul
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Paralayang',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    // Deklarasi buttonSection tepat di bawah titleSection
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // Langkah 1: Buat widget textSection
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Paralayang Batu Malang adalah destinasi wisata populer yang menawarkan pengalaman terbang bebas sambil menikmati keindahan alam dari ketinggian. Terletak di Gunung Banyak, Batu, tempat ini dikenal dengan pemandangan spektakuler pegunungan, kota Batu, serta perbukitan yang hijau. Wisatawan dapat menikmati sensasi terbang dengan instruktur berpengalaman, sehingga aman untuk pemula sekalipun. Selain paralayang, area ini juga menawarkan spot foto menarik, terutama saat matahari terbenam, menjadikannya destinasi favorit bagi pecinta alam dan petualangan.',
        softWrap: true, // Teks akan dibungkus otomatis jika terlalu panjang
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layout Demo'),
        ),
        body: ListView(
          // Mengubah dari Column ke ListView agar bisa di-scroll jika konten terlalu banyak
          children: [
            Image.asset(
              'images/paralayang.jpeg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection, // Bagian judul
            buttonSection, // Bagian tombol
            textSection, // Bagian teks
            const Center(
              child: Text('Tia Arvivolia 2241760031'),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi _buildButtonColumn untuk membuat kolom dengan icon dan teks
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8), // Margin hanya di bagian atas
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
