import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rioro_dev/rioro/models/outcome_model.dart';
import 'package:rxdart/rxdart.dart';

class OutcomeBloc {
  Map<String, List<OutcomeModel>> _value = {'id': []};
  BehaviorSubject<Map<String, List<OutcomeModel>>> _controller =
      BehaviorSubject();

  void setData(Stream<QuerySnapshot<Map<String, dynamic>>> stream) async {
    print('setData has strated');
    Map<String, List<OutcomeModel>> temp = {};
    await stream.last.then((value) => value.docs.forEach((e) {
          print(e.id);
          temp.addAll({
            e.id: e.data().values.map((f) => OutcomeModel.fromMap(f)).toList()
          });
        }));
    _value = temp;
    print('hasData has finihsed');
    print(_value.entries.toList());
    _controller.sink.add(_value);
  }

  Stream<List<List<OutcomeModel>>> change(
      Stream<QuerySnapshot<Map<String, dynamic>>> stream) {
    return stream.map((query) => query.docs
        .map((doc) => doc
            .data()
            .entries
            .map((e) => OutcomeModel.fromMap(e.value))
            .toList())
        .toList());
  }

  List<OutcomeModel> createList(Iterable<dynamic> data) =>
      data.map((e) => createModel(e)).toList();

  OutcomeModel createModel(Map<String, dynamic> data) =>
      OutcomeModel.fromMap(data);

  Stream<Map<String, List<OutcomeModel>>> get stream => _controller.stream;
}

OutcomeBloc bloc = OutcomeBloc();
