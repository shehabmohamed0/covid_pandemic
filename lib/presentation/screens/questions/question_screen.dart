import 'package:covid_pandemic/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final List<bool> _chronicDiseases = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  final List<bool> _possibleSymptoms = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  final List<bool> _precautionsToBeFollowed = [false, false, false];
  final List<bool> _activitiesYouDo = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              title: const Text('Do you have any of these chronic diseases'),
              children: [
                buildListTile(
                    index: 0,
                    title: 'Kidney disease',
                    question: _chronicDiseases),
                buildListTile(
                    index: 1,
                    title: 'Chronic lung.',
                    question: _chronicDiseases),
                buildListTile(
                    index: 2, title: 'Diabetes.', question: _chronicDiseases),
                buildListTile(
                    index: 3,
                    title: 'Cancer for pregnant women.',
                    question: _chronicDiseases),
                buildListTile(
                    index: 4,
                    title: 'Hypertension.',
                    question: _chronicDiseases),
                buildListTile(
                    index: 5, title: 'The heart.', question: _chronicDiseases),
              ],
            ),
            ExpansionTile(
              title: const Text('Do you have any of the following symptoms?'),
              children: [
                buildListTile(
                    index: 0,
                    title: 'Loss of sense of smell.',
                    question: _possibleSymptoms),
                buildListTile(
                    index: 1, title: 'Bone pain.', question: _possibleSymptoms),
                buildListTile(
                    index: 2,
                    title: 'Increase in temperature.',
                    question: _possibleSymptoms),
                buildListTile(
                    index: 3, title: 'Diarrhea.', question: _possibleSymptoms),
                buildListTile(
                    index: 4,
                    title: 'Shortness of breath.',
                    question: _possibleSymptoms),
                buildListTile(
                    index: 5, title: 'Headache.', question: _possibleSymptoms),
                buildListTile(
                    index: 6,
                    title: 'Sore throat.',
                    question: _possibleSymptoms),
              ],
            ),
            ExpansionTile(
              title: const Text('Precautions to be followed'),
              children: [
                buildListTile(
                    index: 0,
                    title:
                        'Wash your hands well and use sanitizers such as alcohol etc..',
                    question: _precautionsToBeFollowed),
                buildListTile(
                    index: 1,
                    title: 'Wearing a mask in public places and gloves.',
                    question: _precautionsToBeFollowed),
                buildListTile(
                    index: 2,
                    title: 'Avoid crowded places..',
                    question: _precautionsToBeFollowed),
              ],
            ),
            ExpansionTile(
              title: const Text('Activities you do'),
              children: [
                buildListTile(
                    index: 0,
                    title: 'Work or study',
                    question: _activitiesYouDo),
                buildListTile(
                    index: 1,
                    title: 'The shopping.',
                    question: _activitiesYouDo),
                buildListTile(
                    index: 3,
                    title: 'Public Transport.',
                    question: _activitiesYouDo),
                buildListTile(
                    index: 4,
                    title: 'Religious places, funerals or weddings.',
                    question: _activitiesYouDo),
                buildListTile(
                    index: 5, title: 'Cinemas.', question: _activitiesYouDo),
                buildListTile(
                    index: 6,
                    title: 'Visiting relatives.',
                    question: _activitiesYouDo),
                buildListTile(
                    index: 7,
                    title: 'Strolling on the beach.',
                    question: _activitiesYouDo),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(
      {required int index,
      required String title,
      required List<bool> question}) {
    return ListTile(
      dense: true,
      leading: Checkbox(
          value: question[index],
          onChanged: (val) {
            setState(() {
              question[index] = val!;
            });
          }),
      title: Text(title),
    );
  }
}
