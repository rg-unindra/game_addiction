import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_addiction/core/models/answer.dart';
import 'package:game_addiction/core/models/classification.dart';
import 'package:game_addiction/core/models/question.dart';
import 'package:game_addiction/core/provider/answer_provider.dart';
import 'package:game_addiction/core/provider/user_provider.dart';
import 'package:game_addiction/core/utils/extensions/extensions.dart';

class ResultsPage extends ConsumerStatefulWidget {
  const ResultsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResultsPageConsumerState();
}

class _ResultsPageConsumerState extends ConsumerState<ResultsPage> {
  int _touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            sliver: SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 70, 20, 30).r(context),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Hasil dari Test Kecanduan Game ${user.name}",
                  style: TextStyle(
                    fontSize: context.responsiveDoubleSP(20),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20).r(context),
            sliver: SliverToBoxAdapter(
              child: SizedBox.square(
                dimension: context.responsiveDoubleR(100),
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            _touchedIndex = -1;
                            return;
                          }
                          _touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 30).r(context),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = ClassificationType.values[index];

                  return Padding(
                    padding: const EdgeInsets.only(top: 4).r(context),
                    child: Row(
                      children: [
                        SizedBox.square(
                          dimension: context.responsiveDoubleR(6),
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: item.toColor),
                          ),
                        ),
                        SizedBox(width: context.responsiveDoubleW(10)),
                        Text(
                          item.toText,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: ClassificationType.values.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    final questionsLength = questions.length;
    final answers = ref.watch(answerProvider);
    List<PieChartSectionData> temp = [];
    int i = 0;
    answers.tableData.forEach((key, value) {
      final isTouched = i == _touchedIndex;
      final fontSize = isTouched ? 25.0 : 14.0;
      final radius = isTouched ? 60.0 : 50.0;
      final percentage = value.length / questionsLength * 100;

      if (value.isNotEmpty) {
        final chart = PieChartSectionData(
          color: key.toColor,
          value: value.length.toDouble(),
          title: '$percentage%',
          radius: context.responsiveDoubleR(radius),
          titleStyle: TextStyle(
            fontSize: context.responsiveDoubleSP(fontSize),
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        );

        temp.add(chart);
      }
      i++;
    });

    return temp;
  }
}
