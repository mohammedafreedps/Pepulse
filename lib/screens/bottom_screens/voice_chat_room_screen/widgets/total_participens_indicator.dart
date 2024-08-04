import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/bottom_controllers/voice_chat_room_controller.dart';

Widget totalParticipensIndicator(){
  return GetX<VoiceChatRoomController>(
    builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(color: appCtrl.appTheme.bg,borderRadius:  BorderRadius.circular(10)),
        child: Center(child: Row(
          children: [
            Icon(Icons.person,color: appCtrl.appTheme.white,),
            Text(controller.activeParticipence.length.toString() ,style: TextStyle(color: appCtrl.appTheme.white),),
          ],
        )),
      );
    }
  );
}