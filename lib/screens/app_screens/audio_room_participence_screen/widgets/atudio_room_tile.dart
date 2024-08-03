import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';

Widget audioRoomTiles(String name, bool isAudiance) {
  final AudioRoomController audioRoomController =
      Get.find<AudioRoomController>();
  return Column(
    children: [
      InkWell(
          onLongPress: () {
            if (audioRoomController.isHaveAccessToAddHost.value) {
              Get.dialog(AlertDialog(
                content: Text('Make Host'),
                actions: [
                  TextButton(onPressed: () {}, child: const Text('Yes'))
                ],
              ));
            }
          },
          child: const CircleAvatar(
            radius: Insets.i30,
            backgroundColor: Colors.black,
          )),
      Text(name)
    ],
  );
}
