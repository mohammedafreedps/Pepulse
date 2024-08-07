import 'dart:async';

import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:chatzy/controllers/app_pages_controllers/room_detail_controller.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/audio_room_appbar.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/participence_builder.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/show_room_detail_enter_sheet.dart';
import 'package:flutter/cupertino.dart';

class AudioRoomParticipenceScreen extends StatefulWidget {
  const AudioRoomParticipenceScreen({super.key});

  @override
  State<AudioRoomParticipenceScreen> createState() =>
      _AudioRoomParticipenceScreenState();
}

class _AudioRoomParticipenceScreenState
    extends State<AudioRoomParticipenceScreen> {

   @override
  void initState() {
    final RoomDetailController roomDetailController = Get.put(RoomDetailController());
    roomDetailController.getChannelName();
    Timer(Duration(seconds: 1), (){
      _callBottom();
    });
    super.initState();
  }
  void _callBottom(){
    showRoomDetailEnterSheet(context);
  }
  @override
  Widget build(BuildContext context) {
    final AudioRoomController audioRoomController =
        Get.put(AudioRoomController());
    return PopScope(
      canPop: false,
      child: Scaffold(
          appBar: audioRoomAppbar(audioRoomController),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: Insets.i10),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        'Hosts',
                        style: AppCss.manropeRegular13
                            .textColor(appCtrl.appTheme.darkText),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: participenceBuilder(true, context)),
              Padding(
                padding: const EdgeInsets.only(left: Insets.i10),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        'Audience',
                        style: AppCss.manropeRegular13
                            .textColor(appCtrl.appTheme.darkText),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: participenceBuilder(false, context)),
              GetX<AudioRoomController>(builder: (controller) {
                return controller.isHost.value
                    ? IconButton(
                        onPressed: () {
                          audioRoomController.muteAudio();
                        },
                        icon: Icon(
                            controller.muted.value ? Icons.mic_off : Icons.mic),
                      )
                    : Container();
              }),
            ],
          )),
    );
  }
}
