import 'package:chatzy/config.dart';
import 'package:chatzy/screens/app_screens/voice_chat_room_profile_screen/voice_chat_room_profile_screen.dart';

PreferredSizeWidget voiceRoomAppbar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text('Room  Explore'),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.speaker_phone)),
      IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
      IconButton(onPressed: () {
        Get.to(VoiceChatRoomProfileScreen());
      }, icon: Icon(Icons.person))
    ],
  );
}
