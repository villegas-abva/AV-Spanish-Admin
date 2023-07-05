import 'package:av_spanish_admin/services/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizRepository {
  /// The True-False quiz collection reference.
  final CollectionReference _tfQuizRef =
      FirebaseFirestore.instance.collection('true false');
  final _dbCollection = FirebaseFirestore.instance.collection;

  CollectionReference get tfQuizRef => _tfQuizRef;

  // ***************** True False Quiz functions *****************

  /// Adds a true / false quiz into the true / false quiz collection.
  Future<void> addTrueFalseQuiz(TFQuiz quiz) async {
    // step 1: Add quiz main fields
    _tfQuizRef
        .doc(quiz.title)
        .withConverter<TFQuiz>(
          fromFirestore: (snapshot, _) => TFQuiz.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        )
        .set(
          TFQuiz(
            title: quiz.title,
            url: quiz.url,
            id: quiz.id,
            questions: [],
            numberOfQuestions: quiz.questions.length,
          ),
        );

    // step 2: Add quiz questions
    for (var question in quiz.questions) {
      _tfQuizRef
          .doc(quiz.title)
          .collection('questions')
          .doc('question ${question.questionNumber}')
          .withConverter<TFQuestion>(
            fromFirestore: (snapshot, _) =>
                TFQuestion.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          )
          .set(TFQuestion(
            id: question.id,
            questionNumber: question.questionNumber,
            question: question.question,
            answer: question.answer,
            startTimeSecond: question.startTimeSecond,
            startTimeMinute: question.startTimeMinute,
            endTimeSecond: question.endTimeSecond,
            endTimeMinute: question.endTimeMinute,
          ));
    }
  }

  /// Gets a List of True False quizzes, just once (no real time).
  Future<List<TFQuiz>> getTFQuizzes() async {
    final modelRef = FirebaseFirestore.instance
        .collection('true false')
        .withConverter<TFQuiz>(
          fromFirestore: (snapshot, _) => TFQuiz.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
    final q = await modelRef.get();
    final questions = q.docs
        .map((doc) => TFQuiz.fromQueryDocumentSnapshotUsingModel(doc))
        .toList();

    // final quizzes = modelRef.get().then((_) => mode)

    // final snapshot = await _dbCollection('true false').get();
    // final quizzes = snapshot.docs.map((e) => TFQuiz.fromSnapshot(e)).toList();
    // for (var quiz in quizzes) {}

    // final quizzes = snapshot.docs.map((e) => );
    // final snapshot = await _dbCollection('true false')
    // .withConverter(
    // fromFirestore: TFQuiz.fromFirestore,
    // toFirestore: (TFQuiz tfQuiz, options) => tfQuiz.toFirestore())
    // .get();
    // final quizzes = snapshot.docs;
    // final quizzes = snapshot.docs.map((e) => TFQuiz.fromFirestore(e));
    // snapshot.docs.map((doc) => var).toList();

    return questions;
    // final quizBase = _dbCollection('true false').get();
    // final
    // final quizBase = _dbCollection('true false').withConverter(
    // fromFirestore: TFQuiz.fromFirestore,
    // toFirestore: (TFQuiz tfQuiz, options) => tfQuiz.toFirestore(),
    // );

    // final quizzes = quizBase.get().;
    // final snapshot = await quizBase.get();
    // final quizzes = snapshot.docs.map((doc) => TFQuiz.fromFirestore).toList();

    // snapshot.docs.map((doc) => TFQuiz.fromFirestore(doc,)).toList();

    // final snapshot = await _dbCollection('true false').get();
    // final quizzes =   snapshot.docs.map((doc) => TFQuiz.fromFirestore(doc)).toList();
    // final quizzes =
    // snapshot.docs.map((doc) => TFQuiz.fromJson(doc)).toList();

    // return quizzes;
  }

  /// Gets a List of True False questions from a quiz, just once (no real time).
  Future<List<TFQuestion>> getTFQuestionsFromQuiz(String docId) async {
    final snapshot = await _dbCollection('true false')
        .doc(docId)
        .collection('questions')
        .get();

    final questions =
        snapshot.docs.map((doc) => TFQuestion.fromSnapshot(doc)).toList();
    return questions;
  }

  /// Gets a [Stream ] of the True False quizzes, which are updated in real time.
  Stream<List<TFQuiz>> tfQuizzesStream() {
    return _dbCollection('true false').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => TFQuiz.fromJson(doc.data())).toList());
  }

  Future updateTFQuestion({
    required String quizId,
    required TFQuestion question,
  }) async {
    await _dbCollection('true false')
        .doc(quizId)
        .collection('questions')
        .doc(question.id)
        .withConverter(
            fromFirestore: TFQuestion.fromFirestore,
            toFirestore: (TFQuestion tfQuestion, options) =>
                tfQuestion.toFirestore())
        .update(question.toFirestore());
  }

  Future deleteTFQuestion({
    required String quizId,
    required TFQuestion question,
  }) async {
    await _dbCollection('true false')
        .doc(quizId)
        .collection('questions')
        .doc(question.id)
        .withConverter(
            fromFirestore: TFQuestion.fromFirestore,
            toFirestore: (TFQuestion tfQuestion, options) =>
                tfQuestion.toFirestore())
        .delete();
  }

  // ***************** MOCK TF Quiz functions *****************
  // /// Gets a [Stream ] of the True False quizzes, which are updated in real time.
  // Stream<List<TFQuizTest>> tfTestQuizzesStream() {
  //   return _dbCollection('true false test').snapshots().map((snapshot) =>
  //       snapshot.docs.map((doc) => TFQuizTest.fromJson(doc.data())).toList());
  // }

  // /// Gets a List of Test True False questions from a quiz, just once (no real time).
  // Future<List<TFQuestionTest>> getTFQuestionsTestFromQuiz(String docId) async {
  //   final snapshot = await _dbCollection('true false test')
  //       .doc(docId)
  //       .collection('questions')
  //       .get();

  //   final quizzes =
  //       snapshot.docs.map((doc) => TFQuestionTest.fromSnapshot(doc)).toList();

  //   return quizzes;
  // }
}
