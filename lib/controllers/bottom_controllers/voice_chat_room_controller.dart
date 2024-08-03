import 'package:audioplayers/audioplayers.dart';
import 'package:chatzy/config.dart';
import 'package:chatzy/models/caller_detail_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class VoiceChatRoomController extends GetxController {
  RxList<CallerDetailModel> callerDetailModel = <CallerDetailModel>[].obs;
  RxList<CallerDetailModel> allCallerDetailModel = <CallerDetailModel>[].obs;
  RxList<CallerDetailModel> activeParticipence = <CallerDetailModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllCallersDetail();
  }

  void playJoinAudio()async{
    final player = AudioPlayer();
    await player.play(AssetSource('mp3/join.mp3'));
  }

  void playLeaveAudio()async{
    final player = AudioPlayer();
    await player.play(AssetSource('mp3/leave.mp3'));
  }

  void fetchAllCallersDetail() async {
    try {
      final QuerySnapshot querySnapshot1 =
          await FirebaseFirestore.instance.collection('users').get();
      List<CallerDetailModel> _modelHolder = [];
      List<CallerDetailModel> _holder = [];

      for (var doc in querySnapshot1.docs) {
        final data = doc.data() as Map<String, dynamic>;
        if (!data.containsKey('isHoster')) {
          await doc.reference.update({'isHoster': false});
          data['isHoster'] = false;
        }
        if (!data.containsKey('channelId')) {
          await doc.reference.update({'channelId': ''});
        }
        if (!data.containsKey('participence')) {
          await doc.reference.update({'participence': []});
        }
      }
      final QuerySnapshot querySnapshot2 =
          await FirebaseFirestore.instance.collection('users').get();
      _modelHolder = querySnapshot2.docs
          .map((doc) => CallerDetailModel.fromDocumentSnapshot(doc))
          .toList();
      allCallerDetailModel.assignAll(_modelHolder);
      activeParticipence.value = allCallerDetailModel.where((model) => model.channelId == 'testing').toList();
      _holder = _modelHolder.where((model) => model.isHostor == true).toList();
      callerDetailModel.assignAll(_holder);
    } catch (e) {
    }
  }

  void becomeHoster({required bool isHoster}) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      List<CallerDetailModel> holdData = allCallerDetailModel
          .where((model) => model.phoneNumber == currentUser.phoneNumber)
          .toList();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(holdData[0].id)
          .update({'isHoster': isHoster, 'channelId': isHoster? 'testing': ''});
    }
    fetchAllCallersDetail();
  }
}
