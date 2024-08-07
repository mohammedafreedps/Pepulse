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
  RxString remainingTextCount = '400'.obs;

  void getChannelName() async {
    try {
      final snapShot = await _databaseReference
          .child(_currentUser!.phoneNumber.toString())
          .get();
      if (snapShot.exists) {
        print(snapShot.value.toString() + '=-=-=-=---=-==-=-=-=-');
        final data = snapShot.value as Map<dynamic, dynamic>;
        channelName.value = data['roomName'];
        print(channelName.value + '=-=-=-=--=-=--=-');
        roomNameController.text = channelName.value;
      }
    } catch (e) {}
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
  void setRoomDescription(){
    try {
      if(descriptionController.text.isNotEmpty){
        _databaseReference.child(_currentUser!.phoneNumber.toString()).update({
          'description' :descriptionController.text
        });
      }
    } catch (e) {
      
    }
  }

  //Description page section start
  void updateWordCount(){
    int _maxWord = 400;
    if(descriptionController.text.isNotEmpty){
      int _words = descriptionController.text.length;
      int _remining = _maxWord - _words;
      remainingTextCount.value = _remining.toString();
    }else{
      remainingTextCount.value = _maxWord.toString();
    }
    //Descriiption page section end
  }
}
