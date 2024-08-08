import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:chatzy/controllers/bottom_controllers/voice_chat_room_controller.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/audio_room_participence_scre.dart';
import 'package:chatzy/screens/bottom_screens/voice_chat_room_screen/widgets/host_call_floating_button.dart';
import 'package:chatzy/screens/bottom_screens/voice_chat_room_screen/widgets/list_seperator.dart';
import 'package:chatzy/screens/bottom_screens/voice_chat_room_screen/widgets/recomented_room.dart';
import 'package:chatzy/screens/bottom_screens/voice_chat_room_screen/widgets/rooms.dart';
import 'package:chatzy/screens/bottom_screens/voice_chat_room_screen/widgets/top_bar.dart';
import 'package:chatzy/screens/bottom_screens/voice_chat_room_screen/widgets/voice_chat_tile.dart';
import 'package:chatzy/screens/bottom_screens/voice_chat_room_screen/widgets/voice_room_appbar.dart';
import 'package:flutter/cupertino.dart';

class VoiceChatRoomScreen extends StatelessWidget {

  const VoiceChatRoomScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final VoiceChatRoomController voiceChatRoomController =
        Get.put(VoiceChatRoomController());
    final AudioRoomController audioRoomController =
        Get.put(AudioRoomController());
    return Scaffold(
      appBar: voiceRoomAppbar(),
        backgroundColor: appCtrl.isTheme
            ? appCtrl.appTheme.screenBG
            : appCtrl.appTheme.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: Insets.i20,),
              rooms(),
              SizedBox(height: Insets.i50,),
              Expanded(child: recomentedRoom()),
             
            ],
          ),
        ),
        floatingActionButton:
            hostCallFloatingButton(controller: voiceChatRoomController,controller2: audioRoomController));
  }
}
