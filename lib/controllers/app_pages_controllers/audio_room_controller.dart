import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/room_detail_controller.dart';
import 'package:chatzy/controllers/bottom_controllers/voice_chat_room_controller.dart';
import 'package:chatzy/models/caller_detail_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AudioRoomController extends GetxController {
  final VoiceChatRoomController voiceChatRoomController =
      Get.find<VoiceChatRoomController>();
  String _appId = '72c65e66c01443debda4413af7feabea';
  String _token =
      '007eJxTYJANU94vefRJIv+t/vktc+2XVt9TbHsvduSGLfcznfr9f+4rMJgbJZuZppqZJRsYmpgYp6QmpSSamBgaJ6aZp6UmJqUmLjPZlNYQyMigIrWImZEBAkF8doaS1OKSzLx0BgYA+koh4A==';

  RxBool muted = false.obs;
  RxBool isHost = false.obs;
  late RtcEngine engine;
  RxList<CallerDetailModel> hostAsParticipence = <CallerDetailModel>[].obs;
  RxList<CallerDetailModel> audianceAsParticipence = <CallerDetailModel>[].obs;
  RxList<CallerDetailModel> allParticipence = <CallerDetailModel>[].obs;
  RxBool isHaveAccessToAddHost = false.obs;

  Timer? _timerForChatRoom;

  //reference for accessing realtime database
  DatabaseReference realTimeDatabaseReference = FirebaseDatabase.instance.ref().child('Rooms');

  //current user info
  final User? _currentUser = FirebaseAuth.instance.currentUser;

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
    isHaveAccessToAddHost.value = false;
  }

  void initializeAgora({required isBroadcaster}) async {
    if(_timerForChatRoom == null){
      _timerForChatRoom = Timer.periodic(Duration(seconds: 2), (timer){
        populateParticipence();
      });
    }
    User? _currentUser = FirebaseAuth.instance.currentUser; 
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
        isHaveAccessToAddHost.value = true;
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
          addToParticipence(true);
          populateParticipence();
          await engine.setEnableSpeakerphone(true);
        },
        onUserJoined: (connection, remoteUid, elapsed) {
          populateParticipence();
          voiceChatRoomController.playJoinAudio();
        },
        onLeaveChannel: (connection, status) {
          voiceChatRoomController.playLeaveAudio();
          populateParticipence();
          addToParticipence(false);
        },
        onError: (err, msg) {
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
    final QuerySnapshot querySnapshot2 =
        await FirebaseFirestore.instance.collection('users').where('channelId', isEqualTo: 'testing').get();
    allParticipence.value = querySnapshot2.docs
        .map((doc) => CallerDetailModel.fromDocumentSnapshot(doc))
        .toList();
    hostAsParticipence.value = allParticipence.where((model)=> model.isHostor == true && model.channelId == 'testing').toList();
    audianceAsParticipence.value = allParticipence.where((model)=> model.isHostor == false && model.channelId == 'testing').toList();
  }

  void makeToHost(int index){
    
  }
  void createRoom() async {
  print('enr functin =-=--=-');
  if (_currentUser != null) {
    print('running functin =-=--=-');
    try {
      realTimeDatabaseReference.child(_currentUser!.phoneNumber.toString()).set({
        'profile' : '',
        'channelId': 'testing',
        'roomName' : 'testing ${_currentUser!.phoneNumber.toString()}',
        'description' : '',
        'isSeatLocked' : [false,false,false,false,false,false,false,false,false,false,],
        'seatedAt' : 0,
        'audience' : []
      });
      print('created succuss =-=-==-=-=-=-=');
    } catch (error) {
      print('Error adding data: $error');
    }
  }
}
  void clearRoom(){
    RoomDetailController _roomDetailController = Get.find();
    if(_currentUser != null){
      _roomDetailController.descriptionController.clear();
      _roomDetailController.roomNameController.clear();
      realTimeDatabaseReference.child(_currentUser!.phoneNumber.toString()).remove();
    }
  }
}
