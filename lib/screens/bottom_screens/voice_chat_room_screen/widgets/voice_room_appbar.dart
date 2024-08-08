import 'package:chatzy/config.dart';

PreferredSizeWidget voiceRoomAppbar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text('Room  Explore'),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.speaker_phone)),
      IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
      IconButton(onPressed: () {}, icon: Icon(Icons.person))
    ],
  );
}
