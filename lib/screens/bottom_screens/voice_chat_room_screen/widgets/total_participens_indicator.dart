import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/bottom_controllers/voice_chat_room_controller.dart';

Widget totalParticipensIndicator(){
  return GetX<VoiceChatRoomController>(
    builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(10)),
        child: Center(child: Row(
          children: [
            const Icon(Icons.person,color: Colors.white,),
            Text(controller.activeParticipence.length.toString() ,style: TextStyle(color: Colors.white),),
          ],
        )),
      );
    }
  );
}