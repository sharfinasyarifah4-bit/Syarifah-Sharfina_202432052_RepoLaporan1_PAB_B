
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// Model data destinasi wisata
class Destinasi {
  final String nama;
  final String lokasi;
  final String deskripsi;
  final double rating;
  final int jumlahPulau;
  final bool populer;

  const Destinasi({
    required this.nama,
    required this.lokasi,
    required this.deskripsi,
    required this.rating,
    required this.jumlahPulau,
    required this.populer,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087E8B),
        ),
        scaffoldBackgroundColor: const Color(0xFFF2F8FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF087E8B),
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
        useMaterial3: true,
      ),
      home: const LayarUtama(),
    );
  }
}

class LayarUtama extends StatelessWidget {
  const LayarUtama({super.key});

  static const List<Destinasi> daftarDestinasi = [
    Destinasi(
      nama: 'Raja Ampat',
      lokasi: 'Papua Barat Daya',
      deskripsi:
          'Surga bahari dengan air jernih, '
          'terumbu karang, dan gugusan pulau yang indah.',
      rating: 4.9,
      jumlahPulau: 1800,
      populer: true,
    ),
    Destinasi(
      nama: 'Danau Toba',
      lokasi: 'Sumatera Utara',
      deskripsi:
          'Danau vulkanik yang luas dengan '
          'pemandangan alam dan budaya Batak.',
      rating: 4.8,
      jumlahPulau: 1,
      populer: true,
    ),
    Destinasi(
      nama: 'Kawah Ijen',
      lokasi: 'Jawa Timur',
      deskripsi:
          'Destinasi pendakian dengan kawah '
          'berwarna toska dan fenomena api biru.',
      rating: 4.7,
      jumlahPulau: 0,
      populer: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jelajah Indonesia',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.explore_outlined, size: 28),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF087E8B),
                          Color(0xFF20A4A9),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.travel_explore,
                          color: Colors.white,
                          size: 38,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Temukan Keindahan Nusantara',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Jelajahi destinasi pilihan '
                          'dan temukan pengalaman baru.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Destinasi Pilihan',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF173B4D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${daftarDestinasi.length} tempat untuk dijelajahi',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 12),
                  ...daftarDestinasi.map(
                    (destinasi) => Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: KartuDestinasi(
                        destinasi: destinasi,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom widget kartu destinasi
class KartuDestinasi extends StatelessWidget {
  final Destinasi destinasi;

  const KartuDestinasi({
    super.key,
    required this.destinasi,
  });

  IconData get ikonDestinasi {
    switch (destinasi.nama) {
      case 'Raja Ampat':
        return Icons.water;
      case 'Danau Toba':
        return Icons.waves;
      default:
        return Icons.landscape;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: destinasi.populer
                  ? const Color(0xFF20A4A9)
                  : Colors.blueGrey.shade200,
              width: 5,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(       
                    color: const Color(0xFFE0F4F3),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    ikonDestinasi,
                    color: const Color(0xFF087E8B),
                    size: 32,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destinasi.nama,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF173B4D),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: Color(0xFF087E8B),
                          ),
                          const SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              destinasi.lokasi,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 18,
                ),
                const SizedBox(width: 3),
                Text(
                  destinasi.rating.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              destinasi.deskripsi,
              style: TextStyle(
                color: Colors.blueGrey.shade700,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _LabelInfo(
                  ikon: Icons.explore_outlined,
                  teks: destinasi.populer
                      ? 'Populer'
                      : 'Pilihan wisata',
                ),
                if (destinasi.jumlahPulau > 0)
                  _LabelInfo(
                    ikon: Icons.landscape_outlined,
                    teks: '${destinasi.jumlahPulau} pulau',
                  ),
              ],
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF087E8B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Kamu memilih ${destinasi.nama}!',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Pilih Destinasi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget label informasi
class _LabelInfo extends StatelessWidget {
  final IconData ikon;
  final String teks;

  const _LabelInfo({
    required this.ikon,
    required this.teks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F5F4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            ikon,
            size: 15,
            color: const Color(0xFF087E8B),
          ),
          const SizedBox(width: 5),
          Text(
            teks,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF087E8B),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
