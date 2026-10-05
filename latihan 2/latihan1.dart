String tentukanGrade(double nilai) {
  if (nilai >= 85) {
    return 'A';
  } else if (nilai >= 70) {
    return 'B';
  } else if (nilai >= 60) {
    return 'C';
  } else {
    return 'D';
  }
}

void main() {
  print(tentukanGrade(90)); // Output: A
  print(tentukanGrade(75)); // Output: B
  print(tentukanGrade(35)); // Output: D
  cetakJadwalHari('sabtu'); // Output: Kuliah Pengganti
}

void cetakJadwalHari(String hari) {
  switch (hari) {
    case 'sabtu':
      print("Kuliah Pengganti");
    case 'minggu':
      print("Libur");
    default:
      print("Hari tidak valid");
  }
}

void cetakKeteranganGrade(String grade) {
  String keterangan;

  switch (grade) {
    case 'A':
      keterangan = "Sangat Baik";
    case 'B':
      keterangan = "Baik";
    case 'C':
      keterangan = "Cukup";
    case 'D':
      keterangan = "Kurang";
    default:
      keterangan = "Grade tidak valid";
  }

  print(keterangan);

  String keteranganGrade = switch (grade) {
    'A' => 'Sangat Baik',
    'B' => 'Baik',
    'C' => 'Cukup',
    'D' => 'Kurang',
    _ => 'Grade tidak valid',
  };
  print(keteranganGrade);
}
