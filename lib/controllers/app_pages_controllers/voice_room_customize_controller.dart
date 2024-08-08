import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

class VoiceRoomCustomizeController extends GetxController {
  RxBool showLinkEnterSection = false.obs;
  RxBool showYtVideoScreen = false.obs;
  RxBool isPlaying = false.obs;
  RxString videoLink = ''.obs;
  bool funCalled = false;
  User? _currentUser = FirebaseAuth.instance.currentUser;
  StreamSubscription<DatabaseEvent>? _listenerSubscription;
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref('Rooms');

  final TextEditingController videoLinkController = TextEditingController();

  YoutubePlayerController? ytController;

  @override
  void onInit() {
    Timer(Duration(seconds: 1), () {
      listenToPlayerSetup();
    });
    super.onInit();
  }

  void listenToPlayerSetup() {
    print('Listening function called -=-=-=-');
    if (_currentUser != null) {
      _listenerSubscription = _databaseReference
          .child(_currentUser!.phoneNumber.toString())
          .child('YtVideoPlayer')
          .onValue
          .listen((event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>;
        isPlaying.value = data['isPlaying'];
        showYtVideoScreen.value = data['showVideo'];
        videoLink.value = data['videoLinke'];
        if (videoLink.value.isNotEmpty) {
          if (!funCalled) {
            initializeYoutubeVideoController();
          }
          funCalled = true;
        }
        if (ytController != null) {
          if (isPlaying.value && showYtVideoScreen.value) {
            ytController!.play();
          } else if (!isPlaying.value && showYtVideoScreen.value) {
            ytController!.pause();
          }
        }
      });
    }
  }

  void setVideoUrl() {
    if (videoLinkController.text.isNotEmpty) {
      _databaseReference
        .child(_currentUser!.phoneNumber.toString())
        .child('YtVideoPlayer')
        .update({
          'videoLinke': videoLinkController.text,
          'showVideo': !showYtVideoScreen.value,
        });
    }
    videoLinkController.clear();
  }

  void initializeYoutubeVideoController() {
    final videoId = YoutubePlayer.convertUrlToId(videoLink.value.trim());
    if (videoId != null) {
      ytController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          hideControls: true,
          controlsVisibleAtStart: true,
        ),
      );
    }
  }

  void playPauseVideo() {
    if (_currentUser != null) {
      _databaseReference
        .child(_currentUser!.phoneNumber.toString())
        .child('YtVideoPlayer')
        .update({'isPlaying': !isPlaying.value});
    }
  }

  void closeYtVideo() {
    if (_currentUser != null) {
      _databaseReference
        .child(_currentUser!.phoneNumber.toString())
        .child('YtVideoPlayer')
        .update({
          'isPlaying': false,
          'showVideo': false,
          'videoLinke': '',
        });
    }
    ytController?.dispose();
    ytController = null; 
    funCalled = false;
  }

  @override
  void onClose() {
    disposeYtController();
    super.onClose();
  }

  void disposeYtController() {
    funCalled = false;
    ytController?.dispose();
    ytController = null; 
    _listenerSubscription?.cancel();
  }

  void toggleShowLinkEnterSection() {
    showLinkEnterSection.value = !showLinkEnterSection.value;
  }
}
