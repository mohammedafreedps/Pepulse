import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/room_detail_controller.dart';

Widget showAddDescriptionSheet(BuildContext context) {
  RoomDetailController _roomDetailController = Get.find<RoomDetailController>();
  return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 229, 229),
      appBar: AppBar(
        title: Text('Room Description'),
        leading: _leading(),
        actions: [setDescriptionButton()],
      ),
      body: Container(
        padding: EdgeInsets.all(Insets.i10),
          color: appCtrl.appTheme.white,
          child: SizedBox(
            height: Sizes.s250,
            child: TextField(
              expands: true,
              minLines: null,
              maxLength: 400,
              maxLines: null,
              controller: _roomDetailController.descriptionController,
              decoration: InputDecoration(
                  hintText: 'Describe your room to get more followers',
                  contentPadding: EdgeInsets.all(Insets.i10),
                  border: InputBorder.none),
            ),
          )));
}

Widget setDescriptionButton() {
  RoomDetailController _roomDetailController = Get.find<RoomDetailController>();
  return ElevatedButton.icon(
      onPressed: () {
        _roomDetailController.setRoomDescription();
        Get.back();
      },
      label: Icon(Icons.check));
}

Widget _leading() {
  return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(Icons.close));
}
