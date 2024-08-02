import 'package:chatzy/config.dart';
import 'package:chatzy/screens/bottom_screens/voice_chat_room_screen/widgets/total_participens_indicator.dart';
import 'package:chatzy/screens/bottom_screens/voice_chat_room_screen/widgets/voice_host_profile_pic.dart';

Widget voiceChatTile({String hostName = 'Name'}){
  return Padding(
    padding: const EdgeInsets.all(10),
    child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              voiceHostProfilePic(),
              Text(hostName),
              totalParticipensIndicator()
            ],
          )
        ],
      ),
    ),
  );
}



