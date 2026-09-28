```dart

void main() {

  //Explicit Typing

  print("Daftar Printer");

  String printerName = 'Epson L1120';
  int stok = 20;
  double harga = 2550000;



  print (printerName);
  print (stok);
  print (harga);

  // nilai ini tidak bisa diubah jika udah di definisikan

  //sound null safety

  //non nullable
 int jumlah = 1;

 //String Jumlah = null;
  print (jumlah);

  // jika berisi nilai null maka akan ditolak oleh kompiler karena nilai ini tidak boleh null

 // nullable
 String? warnaPrinter ;
  warnaPrinter = "Hitam";
  print (warnaPrinter);

  //warnaPrinter = null;
 // String temporary = warnaPrinter?? "Tidak Memilih Warna";
  //print (temporary);


  //Null-Aware

 //String pilihWarna = warnaPrinter ?? "Belum Memilih Warna";
 //print (pilihWarna);

 //print(warnaPrinter!.toUpperCase());

  //Final explisit

 final String idproduct = 'PRT-00525';

 print(idproduct);

  //const explisit

  const String tipePrinter = "Inkjet Printer";

  print (tipePrinter);

  // late

  late String orderDate = 'REC-${DateTime.now().millisecondsSinceEpoch}';

  print (orderDate);


  //===Tipe Data===

  // String

  String namaProduk = 'Epson L1120';

  String tipeProduk = 'Printer Inkjet';

  print('Nama Produk : $namaProduk, Tipe Produk : $tipeProduk');

  // Integer

  int hargaProduk = 250000;
  int jumlahProduk = 2;

    print (hargaProduk*jumlahProduk);

  // Double

  double diskon = 0.25;

  print (hargaProduk*diskon);

  //Num

  num total = 5000000;
  num promo = 0.50;

  print (total*promo);

  //bool
  bool pilihproduk = true;
  bool isijumlah = false;

  bool ordervalid = pilihproduk && isijumlah;

  print(ordervalid);

  //List

  List printer = ['L1110', 'L1120', 'L1330'];

  print (printer[1]);
  print (printer[2]);

  printer.add("L3310");

  print (printer[3]);

  //Set
  List idproduk = ['PRT-1500', 'PRT-1501', 'PRT-1502'];

  print (idproduk);


  //Map
  Map <String, dynamic> detailPrinter = {
    'idproduk': 'PRT-1500', 'namaProduk' : 'Printer Epson L-1220',
    'tipe' : 'inkjet', 'harga' : 2500000};

  print("ID Printer : " + detailPrinter['idproduk']);
  print("Nama Printer : " + detailPrinter['namaProduk']);
  print("tipe Printer : " + detailPrinter['tipe']);
  print("Harga : " + detailPrinter['harga']);

  //Object

  Object
    detailprinter = 'Printer Epson L-1220';
    detailprinter = 'inkjet';
    detailprinter = '2500000';
    detailprinter = true;

    if (detailprinter is String)
    {print(detailprinter.toUpperCase());}


  //Dynamic

  dynamic
        detailprinter2 = 'Printer Epson L-1220';
    detailprinter2 = 'inkjet';
    detailprinter2 = '2500000';
    detailprinter2 = true;

    print(detailprinter2.toUpperCase());


  //Angka tidak memiliki fungsi toUpperCase(), sehingga terjadi runtime error.

}

```
