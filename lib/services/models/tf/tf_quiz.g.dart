// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tf_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TFQuiz _$TFQuizFromJson(Map<String, dynamic> json) => TFQuiz(
      title: json['title'] as String,
      url: json['url'] as String,
      id: json['id'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => TFQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfQuestions: json['numberOfQuestions'] as int,
    );

Map<String, dynamic> _$TFQuizToJson(TFQuiz instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'questions': instance.questions,
      'numberOfQuestions': instance.numberOfQuestions,
    };
