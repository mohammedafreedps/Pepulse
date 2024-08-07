import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:chatzy/controllers/app_pages_controllers/room_detail_controller.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/atudio_room_tile.dart';

Widget participenceBuilder(bool isHost,BuildContext context) {
  return isHost ?  GetX<RoomDetailController>(
    builder: (controller) {
      print(controller.lockedSeates.length.toString() + 'look out');
      return Padding(
        padding: const EdgeInsets.only(top: Insets.i10),
        child: GridView.builder(
          itemCount: ( controller.lockedSeates.length),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5,childAspectRatio: 0.7),
            itemBuilder: (context, index){
                return  audioRoomTiles( index,name: 'hai',false,controller.lockedSeates[index],(index + 1) .toString(),context);
            }),
      );
    }
  ) : GetX<AudioRoomController>(
    builder: (controller) {
      return GridView.builder(
        itemCount: controller.audianceAsParticipence.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, index){
            return  audioRoomTiles( index,name: controller.audianceAsParticipence[index].name,true,false,index.toString(),context);
          });
    }
  );
}
