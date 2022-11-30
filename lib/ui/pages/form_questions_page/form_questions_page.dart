import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_addiction/core/models/answer.dart';
import 'package:game_addiction/core/models/classification.dart';
import 'package:game_addiction/core/models/question.dart';
import 'package:game_addiction/core/provider/answer_provider.dart';
import 'package:game_addiction/core/utils/constans.dart';
import 'package:game_addiction/core/utils/extensions/extensions.dart';
import 'package:game_addiction/ui/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

import 'widgets/step_progress.dart';

class FormQuestionPage extends StatefulWidget {
  const FormQuestionPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormQuestionPageState();
}

class _FormQuestionPageState extends State<FormQuestionPage> {
  late final PageController _controller;
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertanyaan"),
        leading: const DefaultBackButton(),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(size.width, 16),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, index) => StepProgress(
              currentStep: _currentStep,
              step: questions.length,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Opacity(
              opacity: .2,
              child: Image.asset(
                'assets/images/bg_splash.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          PageView.builder(
            controller: _controller,
            itemCount: questions.length,
            onPageChanged: (index) {
              setState(() {
                _currentStep = index;
              });
            },
            itemBuilder: (context, index) {
              final question = questions[index];
              return DefaultTextStyle(
                style: theme.textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
                child: SizedBox.expand(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final answer = ref.watch(answerProvider);
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ).r(context),
                            child: Text(
                              "${index + 1}. ${question.title}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: context.responsiveDoubleSP(24),
                              ),
                            ),
                          ),
                          SizedBox(height: context.responsiveDoubleH(20)),
                          ...List.generate(
                            question.classifications.length,
                            (i) {
                              final classification =
                                  question.classifications[i];
                              final answerIndex =
                                  answer.indexOfAnswer(question);
                              final hasAnswer = answerIndex != -1;
                              final isSelected = hasAnswer &&
                                  answer[answerIndex].answerClassification ==
                                      classification;

                              return DefaultFadeTransition(
                                delayDuration: Duration(
                                  milliseconds: (i * 100),
                                ),
                                child: ClassficationCard(
                                  classification: classification,
                                  isSelected: isSelected,
                                  margin: const EdgeInsets.fromLTRB(
                                    20,
                                    0,
                                    20,
                                    10,
                                  ).r(context),
                                  onTap: () {
                                    final answer = Answer(
                                      question: question,
                                      answerClassification: classification,
                                    );

                                    ref
                                        .read(answerProvider.notifier)
                                        .add(answer, question);

                                    if (index == questions.length - 1) {
                                      context.goNamed(Constans.success);
                                    } else {
                                      _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 600),
                                        curve: Curves.fastOutSlowIn,
                                      );
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
    // return Scaffold(
    //   body: ListView(
    //     padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
    //     children: List.generate(questions.length, (index) {
    //       final item = questions[index];
    //       return Padding(
    //         padding: const EdgeInsets.only(bottom: 10),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.only(left: 20),
    //               child: Text(
    //                 item.title,
    //                 style: const TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 16,
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(height: 10),
    //             ...List.generate(item.classifications.length, (i) {
    //               final itemAnswer = item.classifications[i];
    //               final answerIndex = _answer.indexOfAnswer(item);
    //               final hasAnswer = answerIndex != -1;
    //               final isSelected = hasAnswer &&
    //                   _answer[answerIndex].answerClassification == itemAnswer;

    //               return GestureDetector(
    //                 onTap: () {
    //                   if (hasAnswer) {
    //                     _answer.removeAt(answerIndex);
    //                     _answer.insert(
    //                       answerIndex,
    //                       Answer(
    //                         question: item,
    //                         answerClassification: itemAnswer,
    //                       ),
    //                     );
    //                   } else {
    //                     _answer.add(
    //                       Answer(
    //                         question: item,
    //                         answerClassification: itemAnswer,
    //                       ),
    //                     );
    //                   }
    //                   setState(() {});
    //                 },
    //                 child: Padding(
    //                   padding: const EdgeInsets.fromLTRB(20, 0, 20, 6),
    //                   child: Row(
    //                     children: [
    //                       SizedBox.square(
    //                         dimension: 20,
    //                         child: DecoratedBox(
    //                           decoration: BoxDecoration(
    //                             shape: BoxShape.circle,
    //                             color: isSelected ? Colors.blue : null,
    //                             border: isSelected
    //                                 ? null
    //                                 : Border.all(
    //                                     color: Colors.grey,
    //                                   ),
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(width: 10),
    //                       Flexible(
    //                         child: Text(
    //                           itemAnswer.value,
    //                           style: TextStyle(
    //                             color: isSelected ? Colors.blue : Colors.black,
    //                             fontWeight: isSelected
    //                                 ? FontWeight.bold
    //                                 : FontWeight.normal,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               );
    //             })
    //           ],
    //         ),
    //       );
    //     }),
    //   ),
    // );
  }
}

class ClassficationCard extends StatelessWidget {
  final Classification classification;
  final bool isSelected;
  final VoidCallback onTap;
  final EdgeInsets? margin;

  const ClassficationCard({
    super.key,
    required this.classification,
    required this.isSelected,
    required this.onTap,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: DefaultButton(
        text: classification.value,
        width: double.maxFinite,
        strokeColor: isSelected ? const Color(0xFFA586FF) : null,
        backgroundColor: isSelected ? const Color(0xFF8237D3) : null,
        onTap: onTap,
      ),
    );
  }
}
