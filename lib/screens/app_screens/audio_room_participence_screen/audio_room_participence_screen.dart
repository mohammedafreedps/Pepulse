import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:flutter/cupertino.dart';

class AudioRoomParticipenceScreen extends StatelessWidget {
  const AudioRoomParticipenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AudioRoomController myController = Get.put(AudioRoomController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<AudioRoomController>(
              builder: (controller) {
                return IconButton(
                  onPressed: () {
                    myController.muteAudio();
                  },
                  icon: Icon(controller.muted.value ? Icons.mic_off : Icons.mic),
                );
              }
            ),
            // Add other UI elements as needed
          ],
        ),
    ));
  }
}