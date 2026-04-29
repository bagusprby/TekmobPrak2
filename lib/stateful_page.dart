import 'package:flutter/material.dart';

class DonasiStateful extends StatefulWidget {
  const DonasiStateful({super.key});

  @override
  State<DonasiStateful> createState() => _DonasiStatefulState();
}

class _DonasiStatefulState extends State<DonasiStateful> {
  // Variabel state untuk menyimpan jumlah item
  int _jumlahPakaian = 0;

  // Fungsi untuk menambah jumlah
  void _tambahItem() {
    setState(() {
      _jumlahPakaian++;
    });
  }

  // Fungsi untuk mengurangi jumlah (tidak boleh di bawah 0)
  void _kurangiItem() {
    setState(() {
      if (_jumlahPakaian > 0) {
        _jumlahPakaian--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Donasi'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Berapa banyak pakaian\nyang ingin didonasikan?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: _kurangiItem,
                    icon: const Icon(Icons.remove_circle_outline),
                    color: Colors.red,
                    iconSize: 40,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    '$_jumlahPakaian',
                    style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: _tambahItem,
                    icon: const Icon(Icons.add_circle_outline),
                    color: Colors.green,
                    iconSize: 40,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _jumlahPakaian > 0 
                ? () {
                    // Contoh aksi ketika tombol ditekan
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Terima kasih telah mendonasikan $_jumlahPakaian pakaian!')),
                    );
                  }
                : null, // Tombol nonaktif jika jumlah 0
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Konfirmasi Donasi',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}