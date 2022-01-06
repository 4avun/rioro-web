import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rioro_dev/rioro/firebase_helper/fb_helper_outcome.dart';

class HomeTemp extends StatefulWidget {
  const HomeTemp({Key? key}) : super(key: key);

  @override
  State<HomeTemp> createState() => _HomeTempState();
}

class _HomeTempState extends State<HomeTemp> {
  OutcomeFirebaseHelper helper = OutcomeFirebaseHelper();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            helper.post(Random().nextInt(100).toString(), {'dev': 'dev'}),
        child: Text('add'),
      ),
      body: StreamBuilder(
          stream: helper.stream,
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data!.docs.length);
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => Text(
                  snapshot.data!.docs[index].id,
                ),
              );
            }
            return Container();
          }),
    );
  }
}
