import 'package:chatzy/config.dart';
import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/common_controllers/notification_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class RoomDetailController extends GetxController {
  User? _currentUser = FirebaseAuth.instance.currentUser;
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref('Rooms');
  TextEditingController roomNameController = TextEditingController();
  RxString channelName = ''.obs;

  TextEditingController descriptionController = TextEditingController();

  RxList<bool> lockedSeates = <bool>[].obs;
  RxList<String> audienceNumber = <String>[].obs;
  RxInt hostSeatedAt = 0.obs;
  List<bool> holdLockBool = [];

  void getChannelName() async {
    try {
      final snapShot = await _databaseReference
          .child(_currentUser!.phoneNumber.toString())
          .get();
      if (snapShot.exists) {
        final data = snapShot.value as Map<dynamic, dynamic>;
        channelName.value = data['roomName'];
        roomNameController.text = channelName.value;
      }
    }on FirebaseAuthException catch (e) {
    }
  }

  void setRoomDetail() {
    try {
      if (roomNameController.text.isNotEmpty) {
        _databaseReference
            .child(_currentUser!.phoneNumber.toString())
            .update({'roomName': roomNameController.text});
      }
    } catch (e) {}
  }

  void setRoomDescription() {
    try {
      if (descriptionController.text.isNotEmpty) {
        _databaseReference
            .child(_currentUser!.phoneNumber.toString())
            .update({'description': descriptionController.text});
      }
    } catch (e) {}
  }

  void getSeatLocked() {
  if (_currentUser != null) {
    _databaseReference
        .child(_currentUser!.phoneNumber.toString())
        .onValue
        .listen((event) {
          try {
            final data = event.snapshot.value as Map<dynamic, dynamic>;
            hostSeatedAt.value = data['seatedAt'] as int;
            if(data['audience'] != null){
              audienceNumber.value = List<String>.from(data['audience']);
            } 
            if (data['isSeatLocked'] != null) {
                lockedSeates.value = List<bool>.from(data['isSeatLocked']);
            } else {
            }
          } catch (error) {
          }
        });
  }
}

  void lockSeatAt(int index, bool value){
    final ref = _databaseReference.child(_currentUser!.phoneNumber.toString()).child('isSeatLocked/$index');
    ref.set(value);
  }
  void hostsSeatedAt(int seatedIndex){
    final ref = _databaseReference.child(_currentUser!.phoneNumber.toString()).child('seatedAt');
    ref.set(seatedIndex);
  }
  // void addHostToAudiance()async{
  //   final DatabaseReference listRef = _databaseReference.child(_currentUser!.phoneNumber.toString()).child('audience');
  //   listRef.once().then((snapShot){
  //     if(snapShot.snapshot.exists){
  //       final existingArray = snapShot.snapshot.value as List<dynamic>;
  //       existingArray.add(_currentUser!.phoneNumber.toString());
  //       listRef.set(existingArray);
  //     }else{
  //       listRef.set([_currentUser!.phoneNumber.toString()]);
  //     }
  //   });
  // }

}
