import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:chatzy/controllers/app_pages_controllers/room_detail_controller.dart';
import 'package:chatzy/controllers/bottom_controllers/voice_chat_room_controller.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget audioRoomAppbar(AudioRoomController audioRoomController){
  VoiceChatRoomController voiceChatRoomController = Get.find<VoiceChatRoomController>();
  return AppBar(
    leading: CircleAvatar(backgroundColor: appCtrl.appTheme.black,),
    title: GetX<RoomDetailController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(controller.channelName.value,style: AppCss.manropeRegular18,),
            Text('Member : 1',style: AppCss.manropeLight12,),
          ],
        );
      }
    ),
    automaticallyImplyLeading: false,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
            IconButton(onPressed: (){}, icon: Icon(Icons.share)),
            IconButton(onPressed: (){
              audioRoomController.clearRoom();
                voiceChatRoomController.playLeaveAudio();
                // audioRoomController.leaveRoom();
                HapticFeedback.heavyImpact();
                Get.back();
              }, icon: Icon(Icons.close)),
          ],
        );
}