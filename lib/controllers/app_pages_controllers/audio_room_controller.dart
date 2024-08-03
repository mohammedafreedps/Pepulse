import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/bottom_controllers/voice_chat_room_controller.dart';
import 'package:chatzy/models/caller_detail_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AudioRoomController extends GetxController {
  final VoiceChatRoomController voiceChatRoomController =
      Get.find<VoiceChatRoomController>();
  String _appId = '72c65e66c01443debda4413af7feabea';
  String _token =
      '007eJxTYIjU5KvTOBMT/jU4QXOR0b1skxNKugpfGEUsxa5UZFetYVRgMDdKNjNNNTNLNjA0MTFOSU1KSTQxMTROTDNPS01MSk1k2rg2rSGQkYFV9A0jIwMEgvjsDCWpxSWZeekMDACXGR10';

  RxBool muted = false.obs;
  RxBool isHost = false.obs;
  late RtcEngine engine;
  RxList<CallerDetailModel> hostAsParticipence = <CallerDetailModel>[].obs;
  RxList<CallerDetailModel> audianceAsParticipence = <CallerDetailModel>[].obs;
  RxList<CallerDetailModel> allParticipence = <CallerDetailModel>[].obs;

  Timer? _timerForChatRoom;

  void endTimerForChatRoom(){
    if(_timerForChatRoom != null){
      _timerForChatRoom!.cancel();
      _timerForChatRoom = null;
    }
  }

  void leaveRoom() {
    voiceChatRoomController.becomeHoster(isHoster: false);
    engine.leaveChannel();
    engine.release();
    endTimerForChatRoom();
  }

  void initializeAgora({required isBroadcaster}) async {
    print(_timerForChatRoom == null.toString() +'sdfasdfsdaf==-=');
    if(_timerForChatRoom == null){
      _timerForChatRoom = Timer.periodic(Duration(seconds: 2), (timer){
        print('timer working -=-==-=-=-=');
        populateParticipence();
      });
    }
    User? _currentUser = FirebaseAuth.instance.currentUser; 
    print('agora init called-----');
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      await Permission.microphone.request();
    }
    if (status.isGranted) {
      engine = createAgoraRtcEngine();
      await engine.initialize(RtcEngineContext(
        appId: _appId,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      ));
      await engine.enableAudio();
      if (isBroadcaster) {
        await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
        isHost.value = true;
      } else {
        isHost.value = false;
        await engine.setClientRole(role: ClientRoleType.clientRoleAudience);
        final QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').where('phone',isEqualTo: _currentUser!.phoneNumber).limit(1).get();
        if(querySnapshot.docs.isNotEmpty){
          final DocumentSnapshot doc = querySnapshot.docs.first;
          await doc.reference.update({'channelId' : 'testing'});
        }
        
      }
      await engine.enableLocalAudio(true);
      engine.registerEventHandler(RtcEngineEventHandler(
        onJoinChannelSuccess: (connection, elapsed) async {
          print('voiceall connected successfully');
          addToParticipence(true);
          populateParticipence();
          await engine.setEnableSpeakerphone(true);
        },
        onUserJoined: (connection, remoteUid, elapsed) {
          print('new user joined');
          populateParticipence();
        },
        onLeaveChannel: (connection, status) {
          print('user left the caht');
          populateParticipence();
          addToParticipence(false);
        },
        onError: (err, msg) {
          print(msg + 'error from agora');
        },
      ));
      await engine.enableAudioVolumeIndication(
        interval: 1000,
        smooth: 3,
        reportVad: true,
      );
      User? user = FirebaseAuth.instance.currentUser;
      await engine.joinChannel(
          token: _token,
          channelId: 'testing',
          uid: int.parse(user!.phoneNumber!),
          options: ChannelMediaOptions(autoSubscribeAudio: true));
    }
  }

  void addToParticipence(bool isToadd) async {
    try {
      final CollectionReference collectionref =
          FirebaseFirestore.instance.collection('participence');
      User? _user = FirebaseAuth.instance.currentUser;
      if (_user != null) {
        if (isToadd) {
          await collectionref
              .doc(_user.phoneNumber)
              .set({'phoneNumber': _user.phoneNumber,'channelId' : 'testing'});
        } else {
          final DocumentReference documentRef = FirebaseFirestore.instance
              .collection('participence')
              .doc(_user.phoneNumber);
          documentRef.delete();
        }
      }
    } catch (e) {}
  }

  void muteAudio() {
    muted.value = !muted.value;
    engine.muteLocalAudioStream(muted.value);
  }

  void populateParticipence() async {
    User? _user = FirebaseAuth.instance.currentUser;
    // final QuerySnapshot querySnapshot1 =
    //     await FirebaseFirestore.instance.collection('participence').get();
    final QuerySnapshot querySnapshot2 =
        await FirebaseFirestore.instance.collection('users').where('channelId', isEqualTo: 'testing').get();
    allParticipence.value = querySnapshot2.docs
        .map((doc) => CallerDetailModel.fromDocumentSnapshot(doc))
        .toList();
    hostAsParticipence.value = allParticipence.where((model)=> model.isHostor == true && model.channelId == 'testing').toList();
    audianceAsParticipence.value = allParticipence.where((model)=> model.isHostor == false && model.channelId == 'testing').toList();
    print(allParticipence.toString() +'sdfasdf-0-00-0-0');
  }
}
