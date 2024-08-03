import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:chatzy/controllers/bottom_controllers/voice_chat_room_controller.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/audio_room_participence_screen.dart';
import 'package:chatzy/screens/bottom_screens/voice_chat_room_screen/widgets/host_call_floating_button.dart';
import 'package:chatzy/screens/bottom_screens/voice_chat_room_screen/widgets/list_seperator.dart';
import 'package:chatzy/screens/bottom_screens/voice_chat_room_screen/widgets/refresh_active_room_button.dart';
import 'package:chatzy/screens/bottom_screens/voice_chat_room_screen/widgets/voice_chat_tile.dart';
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
        backgroundColor: appCtrl.isTheme
            ? appCtrl.appTheme.screenBG
            : appCtrl.appTheme.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              refreshActiveRoomButton(controller: voiceChatRoomController),
              GetX<VoiceChatRoomController>(builder: (controller) {
                return Expanded(
                    child: ListView.builder(
                        itemCount: controller.callerDetailModel.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                audioRoomController.populateParticipence();
                                audioRoomController.initializeAgora(
                                    isBroadcaster: false);
                                    Get.to(AudioRoomParticipenceScreen());
                              },
                              child: voiceChatTile(
                                  hostName: controller
                                      .callerDetailModel[index].name));
                        }));
              }),
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return listSeperator();
                    },
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return voiceChatTile();
                    }),
              ),
            ],
          ),
        ),
        floatingActionButton:
            hostCallFloatingButton(controller: voiceChatRoomController,controller2: audioRoomController));
  }
}
