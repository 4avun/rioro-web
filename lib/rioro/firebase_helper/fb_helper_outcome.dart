import 'package:cloud_firestore/cloud_firestore.dart';

class OutcomeFirebaseHelper {
  OutcomeFirebaseHelper();

  static final CollectionReference<Map<String, dynamic>> _col =
      FirebaseFirestore.instance.collection('outcome_dev1');
  Stream<QuerySnapshot<Map<String, dynamic>>> get stream => _col.snapshots();

  DocumentReference<Map<String, dynamic>> _doc(String path) => _col.doc(path);

  void _write(String path, Map<String, dynamic> data) {
    _doc(path).set(data, SetOptions(merge: true));
  }

  void post(String path, Map<String, dynamic> data) => _write(path, data);

  void delete(String path, Map<String, dynamic> data) {
    data['deleted'] = true;
    _write(path, data);
  }

  void change(String path, Map<String, dynamic> data) {
    data['changed'] = true;
    _write(path, data);
  }
}
