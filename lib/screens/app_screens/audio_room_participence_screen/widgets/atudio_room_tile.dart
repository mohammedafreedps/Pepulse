import 'package:chatzy/config.dart';

Widget audioRoomTiles(String name){
  return Column(
    children: [
      CircleAvatar(backgroundColor: Colors.black,),
      Text(name)
    ],
  );
}