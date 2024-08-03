import 'package:chatzy/config.dart';

class CallerDetailModel {
  final String id;
  final String name;
  final bool isHostor;
  final String channelId;
  final String phoneNumber;

  CallerDetailModel(
      {required this.id,
      required this.name,
      required this.isHostor,
      required this.channelId,
      required this.phoneNumber});

  Map<String, dynamic> toMap(){
    return{
      'id' : id,
      'name' : name,
      'isHostor' : isHostor,
      'channelId' : channelId,
      'phoneNumber' : phoneNumber
    };
  }

  factory CallerDetailModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return CallerDetailModel(
        id: doc.id,
        name: doc['name'],
        isHostor: doc['isHoster'],
        channelId: doc['channelId'],
        phoneNumber: doc['phone']);
  }
}
