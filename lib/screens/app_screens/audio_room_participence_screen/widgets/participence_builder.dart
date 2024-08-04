import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/atudio_room_tile.dart';

Widget participenceBuilder(bool isHost,BuildContext context) {
  return isHost ?  GetX<AudioRoomController>(
    builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(top: Insets.i10),
        child: GridView.builder(
          itemCount: (10 - controller.hostAsParticipence.length),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index){
              if(index < controller.hostAsParticipence.length){
                return  audioRoomTiles(name: controller.hostAsParticipence[index].name,false,false);
              }
              else{
                return audioRoomTiles(false,true);
              }
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
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index){
              return  audioRoomTiles(name: controller.audianceAsParticipence[index].name,true,false);
            }),
      );
    }
  );
}
