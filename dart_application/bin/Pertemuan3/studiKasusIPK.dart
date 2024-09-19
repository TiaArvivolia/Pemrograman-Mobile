import 'dart:io';

void main() {
  print('==============================================');
  print('Program Menghitung IPK Mahasiswa');
  print('==============================================\n');

  // Input jumlah semester
  int jumlahSemester = getSemesterCount();

  // Menyimpan data transkrip
  List<Map<String, dynamic>> transkrip = [];
  double totalSKS = 0;
  double totalNilai = 0;

  for (int semester = 1; semester <= jumlahSemester; semester++) {
    stdout.write('\nMasukkan jumlah mata kuliah semester $semester: ');
    int jumlahMatkul = getMatkulCount();

    double sksSemester = 0;
    double nilaiSemester = 0;
    List<Map<String, dynamic>> mataKuliah = [];

    // Input setiap mata kuliah
    for (int i = 1; i <= jumlahMatkul; i++) {
      stdout.write('Masukkan nama matkul ke $i: ');
      String namaMatkul = stdin.readLineSync()!;
      
      stdout.write('Masukkan jumlah sks matkul: ');
      int sks = getValidInt();

      stdout.write('Masukkan nilai matkul (A/B/C/D/E): ');
      String nilaiHuruf = getValidNilai();

      double nilaiAngka = convertNilaiHuruf(nilaiHuruf);

      sksSemester += sks;
      nilaiSemester += nilaiAngka * sks;

      // Simpan data mata kuliah
      mataKuliah.add({
        'nama': namaMatkul,
        'sks': sks,
        'nilai': nilaiHuruf,
      });
    }

    // Hitung NR semester
    double nrSemester = nilaiSemester / sksSemester;
    transkrip.add({
      'semester': semester,
      'mataKuliah': mataKuliah,
      'sks': sksSemester,
      'nr': nrSemester,
    });

    totalSKS += sksSemester;
    totalNilai += nilaiSemester;
  }

  // Hitung IPK
  double ipk = totalNilai / totalSKS;

  // Tampilkan transkrip
  print('\n==============================================');
  print('Transkrip Nilai');
  print('==============================================\n');

  for (var dataSemester in transkrip) {
    print('Hasil Semester ${dataSemester['semester']}:');
    print('Mata Kuliah\tSKS\tNilai');

    for (var matkul in dataSemester['mataKuliah']) {
      print(
          '${matkul['nama']}\t${matkul['sks']}\t${matkul['nilai']}');
    }

    print('\nSKS  : ${dataSemester['sks']}');
    print('NR\t: ${dataSemester['nr'].toStringAsFixed(2)}\n');
  }

  print('Total SKS : $totalSKS');
  print('IPK\t: ${ipk.toStringAsFixed(2)}');
  print('==============================================');
}

// Fungsi untuk meminta input jumlah semester
int getSemesterCount() {
  int? semester;
  while (semester == null || semester < 2 || semester > 14) {
    stdout.write('Masukkan jumlah semester (min: 2, max: 14): ');
    semester = int.tryParse(stdin.readLineSync()!);
    if (semester == null || semester < 2 || semester > 14) {
      print('Jumlah semester harus antara 2 hingga 14.');
    }
  }
  return semester;
}

// Fungsi untuk meminta input jumlah mata kuliah
int getMatkulCount() {
  int? matkul;
  while (matkul == null || matkul < 2) {
    matkul = int.tryParse(stdin.readLineSync()!);
    if (matkul == null || matkul < 2) {
      print('Jumlah mata kuliah minimal adalah 2.');
    }
  }
  return matkul;
}

// Fungsi untuk meminta input integer valid
int getValidInt() {
  int? value;
  while (value == null) {
    value = int.tryParse(stdin.readLineSync()!);
    if (value == null) {
      print('Masukkan nilai integer yang valid.');
    }
  }
  return value;
}

// Fungsi untuk meminta input nilai huruf yang valid
String getValidNilai() {
  String? nilaiHuruf;
  while (nilaiHuruf == null || !isValidNilai(nilaiHuruf)) {
    nilaiHuruf = stdin.readLineSync();
    if (!isValidNilai(nilaiHuruf!)) {
      print('Nilai huruf harus A, B, C, D, atau E.');
    }
  }
  return nilaiHuruf;
}

// Fungsi untuk mengonversi nilai huruf ke angka
double convertNilaiHuruf(String nilaiHuruf) {
  switch (nilaiHuruf) {
    case 'A':
      return 4.0;
    case 'B':
      return 3.0;
    case 'C':
      return 2.0;
    case 'D':
      return 1.0;
    case 'E':
      return 0.0;
    default:
      return 0.0;
  }
}

// Fungsi untuk validasi nilai huruf
bool isValidNilai(String nilaiHuruf) {
  return ['A', 'B', 'C', 'D', 'E'].contains(nilaiHuruf.toUpperCase());
}
