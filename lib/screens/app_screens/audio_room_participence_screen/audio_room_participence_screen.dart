import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/audio_room_appbar.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/participence_builder.dart';
import 'package:flutter/cupertino.dart';

class AudioRoomParticipenceScreen extends StatelessWidget {
  const AudioRoomParticipenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AudioRoomController audioRoomController = Get.put(AudioRoomController());
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: audioRoomAppbar(audioRoomController),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('Host',style: AppCss.manropeRegular13
                      .textColor(appCtrl.appTheme.darkText),), 
            ),
            Expanded(child: participenceBuilder(true)),
            Center(
              child: Text('Audience',style: AppCss.manropeRegular13
                      .textColor(appCtrl.appTheme.darkText),),
            ),
            Expanded(child: participenceBuilder(false)),
            GetX<AudioRoomController>(
              builder: (controller) {
                return controller.isHost.value ?  IconButton(
                  onPressed: () {
                    audioRoomController.muteAudio();
                  },
                  icon: Icon(controller.muted.value ? Icons.mic_off : Icons.mic),
                ) : Container() ;
              }
            ),
            // Add other UI elements as needed
          ],
        )),
    );
  }
}