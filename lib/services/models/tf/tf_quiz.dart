import 'package:av_spanish_admin/services/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tf_quiz.g.dart';

@JsonSerializable()
class TFQuiz {
  TFQuiz({
    required this.title,
    required this.url,
    required this.id,
    required this.questions,
    required this.numberOfQuestions,
  });

  final String id;
  final String title;
  final String url;
  final List<TFQuestion> questions;
  final int numberOfQuestions;

  factory TFQuiz.fromJson(Map<String, dynamic> json) => _$TFQuizFromJson(json);
  Map<String, dynamic> toJson() => _$TFQuizToJson(this);

  // need this to map Firebase json object to this model
  factory TFQuiz.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return TFQuiz(
      id: data['id'],
      title: data['title'],
      url: data['url'],
      questions: data['questions'],
      numberOfQuestions: data['numberOfQuestions'],
    );
  }

  /// Converts the [Map] that comes from Firestore into this model.
  /// Firestore works with [Map]s by default.
  factory TFQuiz.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return TFQuiz(
      id: data?['id'],
      title: data?['title'],
      url: data?['url'],
      questions: data?['questions'],
      numberOfQuestions: data?['numberOfQuestions'],
    );
  }

  /// Converts this model into a [Map].
  /// Firestore works with [Map]s by default.
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'questions': questions,
      'numberOfQuestions': numberOfQuestions,
    };
  }

  /// Returns a [TFQuiz] when using the [withConverter] utility from Firestore.
  factory TFQuiz.fromQueryDocumentSnapshotUsingModel(
    QueryDocumentSnapshot<TFQuiz> snapshot,
  ) {
    final data = snapshot.data();

    return TFQuiz(
      title: data.title,
      url: data.url,
      id: data.id,
      questions: data.questions,
      numberOfQuestions: data.numberOfQuestions,
    );
  }

  TFQuiz copyWith({
    String? id,
    String? title,
    String? url,
    int? numberOfQuestions,
  }) {
    return TFQuiz(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      questions: questions,
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
    );
  }
}
