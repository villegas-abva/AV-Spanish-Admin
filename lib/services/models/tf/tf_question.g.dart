// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tf_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TFQuestion _$TFQuestionFromJson(Map<String, dynamic> json) => TFQuestion(
      id: json['id'] as String,
      questionNumber: json['questionNumber'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
      startTimeSecond: json['startTimeSecond'] as String,
      startTimeMinute: json['startTimeMinute'] as String,
      endTimeSecond: json['endTimeSecond'] as String,
      endTimeMinute: json['endTimeMinute'] as String,
    );

Map<String, dynamic> _$TFQuestionToJson(TFQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionNumber': instance.questionNumber,
      'question': instance.question,
      'answer': instance.answer,
      'startTimeSecond': instance.startTimeSecond,
      'startTimeMinute': instance.startTimeMinute,
      'endTimeSecond': instance.endTimeSecond,
      'endTimeMinute': instance.endTimeMinute,
    };
