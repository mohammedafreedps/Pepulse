import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:chatzy/controllers/bottom_controllers/voice_chat_room_controller.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/audio_room_participence_screen.dart';
import 'package:flutter/services.dart';

Widget hostCallFloatingButton({required VoiceChatRoomController controller,required AudioRoomController controller2}) {
  return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      backgroundColor: appCtrl.appTheme.primary,
      onPressed: () {
        controller2.populateParticipence();
        controller2.initializeAgora(isBroadcaster: true);
        controller.becomeHoster(isHoster: true);
        controller.playJoinAudio();
        HapticFeedback.mediumImpact();
        Get.to(AudioRoomParticipenceScreen());
      },
      child: SvgPicture.asset(
        width: Sizes.s35,
        eSvgAssets.plus,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ));
}
