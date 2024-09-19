void main() {
  // Ganti dengan nama lengkap dan NIM Anda
  String namaLengkap = "Tia Arvivolia";
  String nim = "2241760031";

  // Fungsi untuk memeriksa apakah sebuah bilangan adalah bilangan prima
  bool isPrime(int number) {
    if (number <= 1) return false;
    if (number <= 3) return true;
    if (number % 2 == 0 || number % 3 == 0) return false;
    for (int i = 5; i * i <= number; i += 6) {
      if (number % i == 0 || number % (i + 2) == 0) return false;
    }
    return true;
  }

  // Menampilkan bilangan prima dari 0 sampai 201
  for (int i = 0; i <= 201; i++) {
    if (isPrime(i)) {
      print("Bilangan prima ditemukan: $i");
      print("Nama Lengkap: $namaLengkap");
      print("NIM: $nim");
      print(""); // Baris kosong untuk pemisah
    }
  }
}



