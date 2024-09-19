void main() {
  for (int index = 10; index < 27; index++) {
    if (index == 21) {
      break; // Menghentikan loop jika index sama dengan 21
    } else if (index > 15 && index < 25) {
      continue; // Melanjutkan iterasi berikutnya jika index lebih dari 15 dan kurang dari 25
    }
    print(index); // Mencetak index jika tidak memenuhi kondisi di atas
  }
}
