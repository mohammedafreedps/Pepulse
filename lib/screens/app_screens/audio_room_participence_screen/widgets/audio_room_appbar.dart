import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:chatzy/controllers/bottom_controllers/voice_chat_room_controller.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget audioRoomAppbar(AudioRoomController audioRoomController){
  VoiceChatRoomController voiceChatRoomController = Get.find<VoiceChatRoomController>();
  return AppBar(
    automaticallyImplyLeading: false,
          actions: [
            ElevatedButton(onPressed: (){
                voiceChatRoomController.playLeaveAudio();
                audioRoomController.leaveRoom();
                HapticFeedback.heavyImpact();
                Get.back();
              }, child: Text('Leave')),
          ],
        );
}