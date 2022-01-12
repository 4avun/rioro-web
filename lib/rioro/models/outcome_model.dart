import 'package:cloud_firestore/cloud_firestore.dart';

class OutcomeModel {
  const OutcomeModel(
      {required this.cost,
      required this.date,
      required this.description,
      required this.id,
      required this.type});

  factory OutcomeModel.fromMap(Map<String, dynamic> data) => OutcomeModel(
      cost: data['cost'],
      date: data['date'].toDate(),
      description: data['description'],
      id: data['id'],
      type: data['type']);

  final String type, description, id;
  final int cost;
  final DateTime date;
}

Stream<Map<String, List<OutcomeModel>>> listOfOutcomeModels(
    Stream<QuerySnapshot<Map<String, dynamic>>> data) async* {
  List<OutcomeModel> temp = [];
  await for (var chank in data) {}
}
