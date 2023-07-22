import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tf_question.g.dart';

@JsonSerializable()
class TFQuestion {
  TFQuestion({
    required this.id,
    required this.questionNumber,
    required this.question,
    required this.answer,
    required this.startTimeSecond,
    required this.startTimeMinute,
    required this.endTimeSecond,
    required this.endTimeMinute,
  });

  final String id;
  final String questionNumber;
  final String question;
  final String answer;
  final String startTimeSecond;
  final String startTimeMinute;
  final String endTimeSecond;
  final String endTimeMinute;

  TFQuestion copyWith({
    final String? id,
    final String? questionNumber,
    final String? question,
    final String? answer,
    final String? startTimeSecond,
    final String? startTimeMinute,
    final String? endTimeSecond,
    final String? endTimeMinute,
  }) {
    return TFQuestion(
      id: id ?? this.id,
      questionNumber: questionNumber ?? this.questionNumber,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      startTimeSecond: startTimeSecond ?? this.startTimeSecond,
      startTimeMinute: startTimeMinute ?? this.startTimeMinute,
      endTimeSecond: endTimeSecond ?? this.endTimeSecond,
      endTimeMinute: endTimeMinute ?? this.endTimeMinute,
    );
  }

  factory TFQuestion.fromJson(Map<String, dynamic> json) =>
      _$TFQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$TFQuestionToJson(this);

  // need this to match Firebase json object to this model
  factory TFQuestion.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return TFQuestion(
      id: data['id'],
      questionNumber: data['questionNumber'],
      question: data['question'],
      answer: data['answer'],
      startTimeSecond: data['startTimeSecond'],
      startTimeMinute: data['startTimeMinute'],
      endTimeSecond: data['endTimeSecond'],
      endTimeMinute: data['endTimeMinute'],
    );
  }

  factory TFQuestion.questionFromSnapshot(Map<String, dynamic> document) {
    final data = document;

    return TFQuestion(
      id: data['id'],
      questionNumber: data['questionNumber'],
      question: data['question'],
      answer: data['answer'],
      startTimeSecond: data['startTimeSecond'],
      startTimeMinute: data['startTimeMinute'],
      endTimeSecond: data['endTimeSecond'],
      endTimeMinute: data['endTimeMinute'],
    );
  }

  Map<String, Object?> questionToJason() => {
        'id': id,
        'questionNumber': questionNumber,
        'question': question,
        'answer': answer,
        'startTimeSecond': startTimeSecond,
        'startTimeMinute': startTimeMinute,
        'endTimeSecond': endTimeSecond,
        'endTimeMinute': endTimeMinute,
      };

  /// Converts the [Map] that comes from Firestore into this model.
  /// Firestore works with [Map]s by default.
  factory TFQuestion.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return TFQuestion(
      id: data?['id'],
      questionNumber: data?['questionNumber'],
      question: data?['question'],
      answer: data?['answer'],
      startTimeSecond: data?['startTimeSecond'],
      startTimeMinute: data?['startTimeMinute'],
      endTimeSecond: data?['endTimeSecond'],
      endTimeMinute: data?['endTimeMinute'],
    );
  }

  /// Converts this model into a [Map].
  /// Firestore works with [Map]s by default.
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'questionNumber': questionNumber,
      'question': question,
      'answer': answer,
      'startTimeSecond': startTimeSecond,
      'startTimeMinute': startTimeMinute,
      'endTimeSecond': endTimeSecond,
      'endTimeMinute': endTimeMinute,
    };
  }

  Map<String, dynamic> updatedUserData() {
    return {
      'id': id,
      'questionNumber': questionNumber,
      'question': question,
      'answer': answer,
      'startTimeSecond': startTimeSecond,
      'startTimeMinute': startTimeMinute,
      'endTimeSecond': endTimeSecond,
      'endTimeMinute': endTimeMinute,
    };
  }

  TFQuestion testFromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return TFQuestion(
      id: data?['id'],
      questionNumber: data?['questionNumber'],
      question: data?['question'],
      answer: data?['answer'],
      startTimeSecond: data?['startTimeSecond'],
      startTimeMinute: data?['startTimeMinute'],
      endTimeSecond: data?['endTimeSecond'],
      endTimeMinute: data?['endTimeMinute'],
    );
  }

  Map<String, dynamic> testToFirestore(TFQuestion user, SetOptions? options) {
    return {
      'id': id,
      'questionNumber': questionNumber,
      'question': question,
      'answer': answer,
      'startTimeSecond': startTimeSecond,
      'startTimeMinute': startTimeMinute,
      'endTimeSecond': endTimeSecond,
      'endTimeMinute': endTimeMinute,
    };
  }
}
