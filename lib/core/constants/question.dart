class Question {
  final String text;
  final int percent;

  const Question({required this.text, required this.percent});
}

class Questions {
  static const chronicDiseases = [
    Question(text: 'Kidney disease.', percent: 7),
    Question(text: 'Chronic lung.', percent: 7),
    Question(text: 'Diabetes.', percent: 5),
    Question(text: 'Cancer for pregnant women.', percent: 8),
    Question(text: 'Hypertension', percent: 8),
    Question(text: 'The heart', percent: 7),
  ];
  static const possibleSymptoms = [
    Question(text: 'Loss of sense of smell.', percent: 3),
    Question(text: 'Loss of sense of taste.', percent: 3),
    Question(text: 'Bone pain.', percent: 2),
    Question(text: 'Increase in temperature.', percent: 3),
    Question(text: 'Diarrhea.', percent: 2),
    Question(text: 'Shortness of breath.', percent: 3),
    Question(text: 'Headache.', percent: 1),
    Question(text: 'Sore throat.', percent: 2),
  ];
  static const precautionsToBeFollowed = [
    Question(
        text: 'Wash your hands well and use sanitizers such as alcohol etc..',
        percent: 4),
    Question(text: 'Wearing a mask in public places and gloves.', percent: 6),
    Question(text: '-	Avoid crowded places.', percent: 6),
  ];

  static const activitiesYouDo = [
    Question(text: 'Work or study.', percent: 4),
    Question(text: 'The shopping.', percent: 3),
    Question(text: 'Public Transport.', percent: 4),
    Question(text: 'Religious places, funerals or weddings.', percent: 4),
    Question(text: 'Cinemas', percent: 4),
    Question(text: 'Visiting relatives.', percent: 3),
    Question(text: 'Strolling on the beach.', percent: 1),
  ];
}
