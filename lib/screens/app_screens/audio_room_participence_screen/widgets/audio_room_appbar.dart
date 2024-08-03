import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';

PreferredSizeWidget audioRoomAppbar(AudioRoomController audioRoomController){
  return AppBar(
    automaticallyImplyLeading: false,
          actions: [
            ElevatedButton(onPressed: (){
                audioRoomController.leaveRoom();
                Get.back();
              }, child: Text('Leave')),
          ],
        );
}