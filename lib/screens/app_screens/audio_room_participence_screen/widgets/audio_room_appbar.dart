import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:chatzy/controllers/app_pages_controllers/room_detail_controller.dart';
import 'package:chatzy/controllers/app_pages_controllers/voice_room_customize_controller.dart';
import 'package:chatzy/controllers/bottom_controllers/voice_chat_room_controller.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/voice_room_customize.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget audioRoomAppbar(AudioRoomController audioRoomController) {
  VoiceChatRoomController voiceChatRoomController =
      Get.find<VoiceChatRoomController>();
  VoiceRoomCustomizeController voiceRoomCustomizeController =
      Get.find<VoiceRoomCustomizeController>();
  return AppBar(
    leading: CircleAvatar(
      backgroundColor: appCtrl.appTheme.black,
    ),
    title: GetX<RoomDetailController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.channelName.value,
            style: AppCss.manropeBold18,
          ),
          Text(
            'Member : 1',
            style: AppCss.manropeLight12,
          ),
        ],
      );
    }),
    automaticallyImplyLeading: false,
    actions: [
      IconButton(onPressed: () {
        Get.to(VoiceRoomCustomize());
      }, icon: Icon(Icons.more_horiz)),
      IconButton(onPressed: () {}, icon: Icon(Icons.share)),
      IconButton(
          onPressed: () {
            audioRoomController.clearRoom();
            voiceChatRoomController.playLeaveAudio();
            voiceRoomCustomizeController.disposeYtController();
            // audioRoomController.leaveRoom();
            HapticFeedback.heavyImpact();
            Get.back();
          },
          icon: Icon(Icons.close)),
    ],
  );
}
