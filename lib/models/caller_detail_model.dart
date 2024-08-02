import 'package:chatzy/config.dart';

class CallerDetailModel {
  final String id;
  final String name;
  final bool isHostor;
  final String channelId;
  final List? participence;
  final String phoneNumber;

  CallerDetailModel(
      {required this.id,
      required this.name,
      required this.isHostor,
      required this.channelId,
      this.participence,
      required this.phoneNumber});

  factory CallerDetailModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return CallerDetailModel(
        id: doc.id,
        name: doc['name'],
        isHostor: doc['isHoster'],
        channelId: doc['channelId'],
        participence: doc['participence'],
        phoneNumber: doc['phone']);
  }
}
