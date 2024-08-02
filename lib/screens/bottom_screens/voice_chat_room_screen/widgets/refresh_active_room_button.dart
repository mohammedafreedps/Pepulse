import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/bottom_controllers/voice_chat_room_controller.dart';

Widget refreshActiveRoomButton({required VoiceChatRoomController controller}){
  return IconButton(onPressed: (){
    controller.fetchAllCallersDetail();
  }, icon: Icon(Icons.refresh,));
}