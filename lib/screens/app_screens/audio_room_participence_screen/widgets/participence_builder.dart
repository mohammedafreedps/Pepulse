import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/atudio_room_tile.dart';

Widget participenceBuilder(bool isHost,BuildContext context) {
  return isHost ?  GetX<AudioRoomController>(
    builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(top: Insets.i10),
        child: GridView.builder(
          itemCount: controller.hostAsParticipence.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index){
              return  audioRoomTiles(controller.hostAsParticipence[index].name,false);
            }),
      );
    }
  ) : GetX<AudioRoomController>(
    builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(top: Insets.i10),
        child: GridView.builder(
          itemCount: controller.audianceAsParticipence.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index){
              return  audioRoomTiles(controller.audianceAsParticipence[index].name,true);
            }),
      );
    }
  );
}
