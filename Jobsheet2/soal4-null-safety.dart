void main() {
  int? a = null; // Variabel yang diizinkan null
  int b = 10; // Variabel yang tidak diizinkan null
  // b = null; // Ini akan menyebabkan error: A value of type 'Null' can't be assigned to a variable of type 'int'.

  print(a); // Output: null
  print(b); // Output: 10
}
