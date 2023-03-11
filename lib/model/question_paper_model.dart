class QuestionPaperModel {
  String id;
  String title;
  String? imageUrl;
  String description;
  int timeSeconds;
  List<Questions>? questions;

  QuestionPaperModel(
      {required this.id,
      required this.title,
      this.imageUrl,
      required this.description,
      required this.timeSeconds,
      this.questions});

  QuestionPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        imageUrl = json['image_url'] as String,
        description = json['Description'] as String,
        timeSeconds = json['time_seconds'],
        questions = (json['questions'] as List)
            .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();

  // if (json['questions'] != null) {
  //   questions = new List<Questions>();
  //   json['questions'].forEach((v) {
  //     questions.add(new Questions.fromJson(v));
  //   });
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image_url'] = this.imageUrl;
    data['Description'] = this.description;
    data['time_seconds'] = this.timeSeconds;
    // if (this.questions != null) {
    //   data['questions'] = this.questions.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Questions {
  String id;
  String question;
  List<Answers> answers;
  String? correctAnswer;

  Questions(
      {required this.id,
      required this.question,
      required this.answers,
      this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers = (json['answers'] as List)
            .map((dynamic e) => Answers.fromJson(e as Map<String, dynamic>))
            .toList(),
        // if (json['answers'] != null) {
        //   answers = new List<Answers>();
        //   json['answers'].forEach((v) {
        //     answers.add(new Answers.fromJson(v));
        //   });
        // }
        correctAnswer = json['correct_answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    if (this.answers != null) {
      data['answers'] = this.answers.map((v) => v.toJson()).toList();
    }
    data['correct_answer'] = this.correctAnswer;
    return data;
  }
}

class Answers {
  String? identifier;
  String? answer;

  /* create constructor */
  Answers({this.identifier, this.answer});

  /* assign the value of JSON to variable */
  Answers.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'],
        answer = json['Answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['Answer'] = this.answer;
    return data;
  }
}

// class Answer {
//   String? identifier;
//   String? answer;
//
//   /* create constructor */
//   Answer({this.identifier, this.answer});
//
//   /* assign the value of JSON to variable */
//   Answer.fromJSON(Map<String, dynamic> json)
//       : identifier = json['identifier'] as String?,
//         answer = json['Answer'] as String?;
// }
