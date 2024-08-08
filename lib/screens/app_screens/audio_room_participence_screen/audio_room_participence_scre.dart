import 'dart:async';

import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:chatzy/controllers/app_pages_controllers/room_detail_controller.dart';
import 'package:chatzy/controllers/app_pages_controllers/voice_room_customize_controller.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/add_topic_button.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/audio_room_appbar.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/participence_builder.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/show_room_detail_enter_sheet.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/voice_bottom_bar.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/voice_room_customize.dart';
import 'package:flutter/cupertino.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
    final RoomDetailController roomDetailController =
        Get.put(RoomDetailController());
    roomDetailController.getChannelName();
    roomDetailController.getSeatLocked();
    Timer(Duration(seconds: 1), () {
      _callBottom();
    });
    super.initState();
  }

  void _callBottom() {
    showRoomDetailEnterSheet(context);
  }

  @override
  Widget build(BuildContext context) {
    final AudioRoomController audioRoomController =
        Get.put(AudioRoomController());
    final VoiceRoomCustomizeController voiceRoomCustomizeController =
        Get.put(VoiceRoomCustomizeController());
    return PopScope(
      canPop: false,
      child: Scaffold(
          appBar: audioRoomAppbar(audioRoomController),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(Insets.i10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    addTopicButton(),
                    SizedBox(
                      height: Sizes.s30,
                    ),
                    Expanded(child: participenceBuilder(true, context)),
                    Divider(
                      color: appCtrl.appTheme.divider,
                    ),
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
                    GetX<VoiceRoomCustomizeController>(builder: (controller) {
                      if (controller.showYtVideoScreen.value && voiceRoomCustomizeController.ytController!= null) {
                        return Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppRadius.r10),
                              child: YoutubePlayer(
                                controller:
                                    voiceRoomCustomizeController.ytController!,
                                showVideoProgressIndicator: true,
                                onReady: (){
                                  print('redey to play video-==-=-=-=-=-=-=-==-');
                                },
                              ),
                            ),
                            SizedBox(height: Insets.i10,),
                            ElevatedButton(
                                onPressed: () {
                                  voiceRoomCustomizeController.playPauseVideo();
                                },
                                child: controller.isPlaying.value ? Text('Pause') : Text('Play'))
                          ],
                        );
                      } else {
                        return Expanded(
                            flex: 2,
                            child: participenceBuilder(false, context));
                      }
                    }),
                    GetX<AudioRoomController>(builder: (controller) {
                      return controller.isHost.value
                          ? IconButton(
                              onPressed: () {
                                audioRoomController.muteAudio();
                              },
                              icon: Icon(controller.muted.value
                                  ? Icons.mic_off
                                  : Icons.mic),
                            )
                          : Container();
                    }),
                    voiceBottomBar(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
