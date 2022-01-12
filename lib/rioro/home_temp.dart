import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rioro_dev/rioro/blocs/outcome_bloc.dart';
import 'package:rioro_dev/rioro/blocs/widgets/outcome_v1.dart';
import 'package:rioro_dev/rioro/firebase_helper/fb_helper_outcome.dart';
import 'package:rioro_dev/rioro/models/outcome_model.dart';

class HomeTemp extends StatefulWidget {
  const HomeTemp({Key? key}) : super(key: key);

  @override
  State<HomeTemp> createState() => _HomeTempState();
}

class _HomeTempState extends State<HomeTemp> {
  OutcomeFirebaseHelper helper = OutcomeFirebaseHelper();

  @override
  void initState() {
    bloc.setData(helper.stream);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => helper.post('third', {
            Random().nextInt(100).toString(): {
              'id': 'id',
              'type': 'ball',
              'description': 'anya',
              'cost': 34,
              'date': DateTime.now(),
            }
          }),
          child: Text('add'),
        ),
        body: smth);
  }
}

var smth = StreamBuilder(
    stream: bloc.stream,
    builder:
        (context, AsyncSnapshot<Map<String, List<OutcomeModel>>> snapshot) {
      if (snapshot.hasData) {
        Map<String, List<OutcomeModel>> data = snapshot.data!;
        var temp = data.values.toList();
        return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var temp2 =
                  temp[index].map((e) => Text(e.date.toString())).toList();
              print(temp2.length);
              return Column(
                children: temp2,
              );
            });
      }
      return Text('no data');
    });
