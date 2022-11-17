import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertanyaan"),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
          children: List.generate(_questions.length, (index) {
            final item = _questions[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ...List.generate(item.classifications.length, (i) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          Flexible(
                            child: Text(item.classifications[i].value),
                          ),
                        ],
                      ),
                    );
                  })
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class Qestion extends Equatable {
  final String title;
  final List<Classification> classifications;

  const Qestion({
    required this.title,
    required this.classifications,
  });

  @override
  List<Object?> get props => [title, classifications];
}

const _questions = <Qestion>[
  Qestion(
    title: "Lama waktu bermain game?",
    classifications: [
      Classification(
        value: "<1 jam",
        type: ClassificationType.none,
      ),
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
  Qestion(
    title: "Harga HP?",
    classifications: [
      Classification(
        value: "<1 juta",
        type: ClassificationType.none,
      ),
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
];

enum ClassificationType {
  none,
  mild,
  moderate,
  serious,
}

class Classification extends Equatable {
  final String value;
  final ClassificationType type;

  const Classification({
    required this.value,
    required this.type,
  });

  @override
  List<Object?> get props => [value, type];
}
