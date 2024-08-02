import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/bottom_controllers/voice_chat_room_controller.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AudioRoomController extends GetxController {
  final VoiceChatRoomController voiceChatRoomController =
      Get.find<VoiceChatRoomController>();
  String _appId = '72c65e66c01443debda4413af7feabea';
  String _token =
      '007eJxTYJD4x7vsR7viyrmvO5c9LRGJe1J9ac2L9P79LH6dLQIztM8pMJgbJZuZppqZJRsYmpgYp6QmpSSamBgaJ6aZp6UmJqUmXlm/Jq0hkJGhTKiAlZEBAkF8doaS1OKSzLx0BgYAVjAjAw==';
  RxBool muted = false.obs;
  late RtcEngine engine;
  @override
  void onInit() {
    print('agora initialization');
    super.onInit();
    // initializeAgora(isBroadcaster : true);
  }

  @override
  void onClose() {
    super.onClose();
    print('distrouing fucntion');
    voiceChatRoomController.becomeHoster(isHoster: false);
    engine.leaveChannel();
    engine.release();
  }

  void initializeAgora({required isBroadcaster}) async {
    print('agora init called-----');
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      await Permission.microphone.request();
    }
    if (status.isGranted) {
      print('permission grandet' + status.isGranted.toString());
      engine = createAgoraRtcEngine();
      await engine.initialize(RtcEngineContext(appId: _appId,channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,));
      await engine.enableAudio();
      if(isBroadcaster){
        print('Iam A braoadcaster');
        await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
      }else{
        print("I am audiance");
        await engine.setClientRole(role: ClientRoleType.clientRoleAudience);
      }
      await engine.enableLocalAudio(true);
      engine.registerEventHandler(
        RtcEngineEventHandler(
          onJoinChannelSuccess: (connection, elapsed)async{
            print('voiceall connected successfully');
            await engine.setEnableSpeakerphone(true);
          },
          onUserJoined: (connection, remoteUid,elapsed){
            print('user Joined agora');
          },
          onError: (err, msg) {
            print(msg +'error from agora');
          },
        )
      );
      await engine.enableAudioVolumeIndication(
        interval: 1000,
        smooth: 3,
        reportVad: true,
      );
      User? user = FirebaseAuth.instance.currentUser;
      await engine.joinChannel(
          token: _token,
          channelId: 'testing',
          uid: int.parse(user!.phoneNumber!) ,
          options: ChannelMediaOptions(autoSubscribeAudio: true));
    }
  }

  void updateisHoster() async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('users').doc();
    await documentReference.update({'isHostor': true});
  }

  void muteAudio() {
    muted.value = !muted.value;
    engine.muteLocalAudioStream(muted.value);
  }
}
