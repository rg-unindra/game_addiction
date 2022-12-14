import 'package:equatable/equatable.dart';

import 'classification.dart';

class Question extends Equatable {
  final String title;
  final List<Classification> classifications;

  const Question({
    required this.title,
    required this.classifications,
  });

  @override
  List<Object?> get props => [title, classifications];
}

const questions = <Question>[
  Question(
    title: "Lama waktu bermain game/hari?",
    classifications: [
      Classification(
        value: "<2 jam",
        type: ClassificationType.mild,
      ),
      Classification(
        value: "<6 jam",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: ">6 jam",
        type: ClassificationType.serious,
      ),
    ],
  ),
  Question(
    title: "Seberapa sering melewati batas waktu (3 Jam/hari) bermain game?",
    classifications: [
      Classification(
        value: "Jarang",
        type: ClassificationType.mild,
      ),
      Classification(
        value: "Biasa",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: "Sering",
        type: ClassificationType.serious,
      ),
    ],
  ),
  Question(
    title: "Harga HP?",
    classifications: [
      Classification(
        value: "<2 juta",
        type: ClassificationType.mild,
      ),
      Classification(
        value: "<6 juta",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: ">6 juta",
        type: ClassificationType.serious,
      ),
    ],
  ),
  Question(
    title: "Tingkat keseringan Berkata Kasar?",
    classifications: [
      Classification(
        value: "<2 jam",
        type: ClassificationType.mild,
      ),
      Classification(
        value: "<6 jam",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: ">6 jam",
        type: ClassificationType.serious,
      ),
    ],
  ),
  Question(
    title: "Jumlah game yang di install?",
    classifications: [
      Classification(
        value: ">1",
        type: ClassificationType.mild,
      ),
      Classification(
        value: ">3",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: ">10",
        type: ClassificationType.serious,
      ),
    ],
  ),
  Question(
    title: "Mudah terpancing emosi?",
    classifications: [
      Classification(
        value: "Jarang",
        type: ClassificationType.mild,
      ),
      Classification(
        value: "Biasa",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: "Sering",
        type: ClassificationType.serious,
      ),
    ],
  ),
  Question(
    title: "Pengeluaran uang dalam game/bulan?",
    classifications: [
      Classification(
        value: "> Rp100.000",
        type: ClassificationType.mild,
      ),
      Classification(
        value: "< Rp500.000",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: "> Rp500.000",
        type: ClassificationType.serious,
      ),
    ],
  ),
  Question(
    title: "Sering Menolak Perintah Orang Tua?",
    classifications: [
      Classification(
        value: "Jarang",
        type: ClassificationType.mild,
      ),
      Classification(
        value: "Biasa",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: "Sering",
        type: ClassificationType.serious,
      ),
    ],
  ),
  Question(
    title: "Kuota yang dihabiskan perbulan?",
    classifications: [
      Classification(
        value: "> 60 GB",
        type: ClassificationType.mild,
      ),
      Classification(
        value: "< 100 Gb",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: "> 100 GB",
        type: ClassificationType.serious,
      ),
    ],
  ),
  Question(
    title: "Sering Menunda Mengerjakan Tugas?",
    classifications: [
      Classification(
        value: "Jarang",
        type: ClassificationType.mild,
      ),
      Classification(
        value: "Biasa",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: "Sering",
        type: ClassificationType.serious,
      ),
    ],
  ),
  Question(
    title: "Seberapa sering membantu orang tua ?",
    classifications: [
      Classification(
        value: "Jarang",
        type: ClassificationType.mild,
      ),
      Classification(
        value: "biasa",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: "sering",
        type: ClassificationType.serious,
      ),
    ],
  ),
  Question(
    title: "Jam tidur harian?",
    classifications: [
      Classification(
        value: "6 Jam",
        type: ClassificationType.mild,
      ),
      Classification(
        value: "4 Jam",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: "2 Jam",
        type: ClassificationType.serious,
      ),
    ],
  ),
  Question(
    title: "Tingkat Sosialisasi?",
    classifications: [
      Classification(
        value: "Jarang",
        type: ClassificationType.mild,
      ),
      Classification(
        value: "biasa",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: "sering",
        type: ClassificationType.serious,
      ),
    ],
  ),
  Question(
    title: "Tingkat kefokusan berkurang",
    classifications: [
      Classification(
        value: "Jarang",
        type: ClassificationType.mild,
      ),
      Classification(
        value: "biasa",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: "sering",
        type: ClassificationType.serious,
      ),
    ],
  ),
  Question(
    title: "Reaksi ketika menemukan game baru",
    classifications: [
      Classification(
        value: "Biasa",
        type: ClassificationType.mild,
      ),
      Classification(
        value: "Senang",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: "Sangat senang",
        type: ClassificationType.serious,
      ),
    ],
  ),
  Question(
    title: "Tingkat kepuasan saat menang bermain game?",
    classifications: [
      Classification(
        value: "Biasa",
        type: ClassificationType.mild,
      ),
      Classification(
        value: "Senang",
        type: ClassificationType.moderate,
      ),
      Classification(
        value: "Sangat senang",
        type: ClassificationType.serious,
      ),
    ],
  ),
];
