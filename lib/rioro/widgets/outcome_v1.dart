import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rioro_dev/rioro/models/outcome_model.dart';

class OutcomeV1 extends StatelessWidget {
  const OutcomeV1({Key? key, required this.stream}) : super(key: key);
  final Stream<QuerySnapshot<Map<String, dynamic>>> stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
                snapshot.data!.docs;
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  List<OutcomeModel> getList = data[index]
                      .data()
                      .values
                      .map((e) => OutcomeModel.fromMap(e))
                      .toList();
                  List<Widget> listOfWidgets =
                      getList.map((e) => Text(e.date.toString())).toList();
                  return Column(
                    children: listOfWidgets,
                  );
                });
          }
          return Text('no data');
        });
  }
}
