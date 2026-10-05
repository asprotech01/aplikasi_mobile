// =============================================
// HW 2 - Bank Sampah
// Nama : Sofyan Sofyan
// NIM  : 1124160171
// =============================================

// ---------- ABSTRACTION ----------

enum KategoriSampah { plastik, kertas, logam }

class Nasabah {
  final String id;
  final String nama;
  double saldo;

  Nasabah({required this.id, required this.nama, this.saldo = 0});
}

class Transaksi {
  final KategoriSampah kategori;
  final double berat;
  final double hargaPerKg;
  final double nilai;

  Transaksi({
    required this.kategori,
    required this.berat,
    required this.hargaPerKg,
    required this.nilai,
  });
}

// ---------- DATA ----------

final List<Nasabah> nasabahList = [
  Nasabah(id: 'N001', nama: 'Sofyan', saldo: 0),
  Nasabah(id: 'N002', nama: 'Budi', saldo: 15000),
];

final List<Transaksi> transaksiList = [];

// Harga setiap kategori sampah
final Map<KategoriSampah, double> hargaSampah = {
  KategoriSampah.plastik: 5000,
  KategoriSampah.kertas: 3000,
  KategoriSampah.logam: 8000,
};

// ---------- DECOMPOSITION ----------

// BR-01
// Menentukan harga berdasarkan kategori sampah.
//
// Ternary digunakan untuk memilih nilai berdasarkan
// kategori yang diberikan.
double getHargaPerKg(KategoriSampah kategori) =>
    kategori == KategoriSampah.plastik
    ? 5000
    : kategori == KategoriSampah.kertas
    ? 3000
    : 8000;

// Mencari nasabah berdasarkan ID.
Nasabah? findNasabah(String id) {
  for (final nasabah in nasabahList) {
    if (nasabah.id == id) {
      return nasabah;
    }
  }

  return null;
}

// BR-02
// Menghitung nilai setoran.
double hitungNilaiSetoran({
  required double berat,
  required double hargaPerKg,
}) => berat * hargaPerKg;

// Memproses setoran sampah.
String setorSampah({
  required Nasabah nasabah,
  required KategoriSampah kategori,
  required double berat,
}) {
  // BR-01
  final hargaPerKg = getHargaPerKg(kategori);

  // BR-02
  final nilaiSetoran = hitungNilaiSetoran(berat: berat, hargaPerKg: hargaPerKg);

  nasabah.saldo += nilaiSetoran;

  transaksiList.add(
    Transaksi(
      kategori: kategori,
      berat: berat,
      hargaPerKg: hargaPerKg,
      nilai: nilaiSetoran,
    ),
  );

  return 'Setoran ${statusTransaksi(true)} : Rp${nilaiSetoran.toStringAsFixed(0)}';
}

// BR-03
bool isPenarikanMinimumValid(double nominal) => nominal >= 10000;

// BR-04
bool isSaldoCukup({required double saldo, required double nominal}) =>
    nominal <= saldo;

// Memproses penarikan saldo.
String tarikSaldo({required Nasabah nasabah, required double nominal}) {
  // BR-03
  if (!isPenarikanMinimumValid(nominal)) {
    return 'Penarikan ${statusTransaksi(false)} : minimal penarikan adalah Rp10.000';
  }

  // BR-04
  if (!isSaldoCukup(saldo: nasabah.saldo, nominal: nominal)) {
    return 'Penarikan ${statusTransaksi(false)} : saldo tidak mencukupi';
  }

  nasabah.saldo -= nominal;

  return 'Penarikan ${statusTransaksi(true)} : Rp${nominal.toStringAsFixed(0)}';
}

// Menampilkan status saldo menggunakan ternary.
String statusSaldo(double saldo) =>
    saldo > 0 ? 'Saldo tersedia' : 'Saldo kosong';

// Format sederhana untuk kategori.
String namaKategori(KategoriSampah kategori) =>
    kategori == KategoriSampah.plastik
    ? 'Plastik'
    : kategori == KategoriSampah.kertas
    ? 'Kertas'
    : 'Logam';

// Format status transaksi dengan ternary.
String statusTransaksi(bool berhasil) => berhasil ? 'Berhasil' : 'Gagal';

// ---------- ALGORITHM ----------

// Proses utama untuk mencari nasabah.
String prosesSetoran({
  required String nasabahId,
  required KategoriSampah kategori,
  required double berat,
}) {
  final nasabah = findNasabah(nasabahId);

  return nasabah == null
      ? 'Setoran ${statusTransaksi(false)} : nasabah tidak ditemukan'
      : setorSampah(nasabah: nasabah, kategori: kategori, berat: berat);
}

// ---------- TEST SCENARIO ----------

void main() {
  final Sofyan = findNasabah('N001')!;

  print('======================================');
  print('       SISTEM BANK SAMPAH');
  print('======================================');

  // Skenario 1 - Setor plastik
  // BR-01 dan BR-02
  // Expected:
  // 2 kg × Rp5.000 = Rp10.000
  // Saldo Sofyan = Rp10.000
  print('\nSkenario 1: Setor ${namaKategori(KategoriSampah.plastik)} 2 kg');
  print(
    prosesSetoran(
      nasabahId: 'N001',
      kategori: KategoriSampah.plastik,
      berat: 2,
    ),
  );
  print('Saldo: Rp${Sofyan.saldo.toStringAsFixed(0)}');
  print('Status: ${statusSaldo(Sofyan.saldo)}');

  // Skenario 2 - Setor logam
  // BR-01 dan BR-02
  // Expected:
  // 1.5 kg × Rp8.000 = Rp12.000
  // Saldo Sofyan = Rp22.000
  print('\nSkenario 2: Setor ${namaKategori(KategoriSampah.logam)} 1.5 kg');
  print(
    prosesSetoran(
      nasabahId: 'N001',
      kategori: KategoriSampah.logam,
      berat: 1.5,
    ),
  );
  print('Saldo: Rp${Sofyan.saldo.toStringAsFixed(0)}');
  print('Status: ${statusSaldo(Sofyan.saldo)}');

  // Skenario 3 - Penarikan di bawah minimum
  // BR-03
  // Expected:
  // Gagal karena Rp5.000 < Rp10.000
  print('\nSkenario 3: Tarik Rp5.000');
  print(tarikSaldo(nasabah: Sofyan, nominal: 5000));
  print('Saldo: Rp${Sofyan.saldo.toStringAsFixed(0)}');
  print('Status: ${statusSaldo(Sofyan.saldo)}');

  // Skenario 4 - Penarikan berhasil
  // BR-03 dan BR-04
  // Expected:
  // Rp22.000 - Rp10.000 = Rp12.000
  print('\nSkenario 4: Tarik Rp10.000');
  print(tarikSaldo(nasabah: Sofyan, nominal: 10000));
  print('Saldo: Rp${Sofyan.saldo.toStringAsFixed(0)}');
  print('Status: ${statusSaldo(Sofyan.saldo)}');

  // Skenario 5 - Penarikan melebihi saldo
  // BR-04
  // Expected:
  // Gagal karena Rp20.000 > Rp12.000
  print('\nSkenario 5: Tarik Rp20.000');
  print(tarikSaldo(nasabah: Sofyan, nominal: 20000));
  print('Saldo: Rp${Sofyan.saldo.toStringAsFixed(0)}');
  print('Status: ${statusSaldo(Sofyan.saldo)}');
}
