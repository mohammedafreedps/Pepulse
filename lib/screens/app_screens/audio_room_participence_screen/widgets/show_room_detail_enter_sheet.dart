import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:chatzy/controllers/app_pages_controllers/room_detail_controller.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/show_add_description_sheet.dart';

Future showRoomDetailEnterSheet(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: Sizes.s400,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(Insets.i10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  addProfile(),
                  roomName(),
                  roomDescription(context),
                  roomDetialApplyButton()
                ],
              ),
            ),
          ),
        );
      });
}

Widget addProfile() {
  return Container(
    width: Sizes.s70,
    height: Sizes.s70,
    decoration: BoxDecoration(
        color: appCtrl.appTheme.black,
        borderRadius: BorderRadius.circular(Insets.i10)),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: Sizes.s30,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Icon(Icons.camera), Text('Edit')],
            ),
          ),
        )
      ],
    ),
  );
}

Widget roomName() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Room Name',
        style: AppCss.manropeBold16,
      ),
      SizedBox(
        height: Sizes.s10,
      ),
      Container(
        decoration: BoxDecoration(
            color: appCtrl.appTheme.divider,
            borderRadius: BorderRadius.circular(AppRadius.r10)),
        child: GetX<RoomDetailController>(builder: (controller) {
          return TextField(
            controller: controller.roomNameController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(Insets.i10),
              hintText: controller.channelName.value,
              border: InputBorder.none,
            ),
          );
        }),
      )
    ],
  );
}

Widget roomDescription(BuildContext context) {
  RoomDetailController _roomDetailController = Get.find();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Room description',
            style: AppCss.manropeBold16,
          ),
          SizedBox(
            height: Sizes.s10,
          ),
          SizedBox(
              width: Sizes.s300,
              child: Text(
                _roomDetailController.descriptionController.text.isEmpty
                    ? 'Describe your room to get more followeres'
                    : _roomDetailController.descriptionController.text,
                overflow: TextOverflow.ellipsis,
              )),
        ],
      ),
      IconButton(
          onPressed: () {
            Get.to(showAddDescriptionSheet(context));
          },
          icon: Icon(Icons.edit))
    ],
  );
}

Widget roomDetialApplyButton() {
  final RoomDetailController _roomDetailController =
      Get.find<RoomDetailController>();
  return InkWell(
    onTap: () {
      _roomDetailController.setRoomDetail();
      Get.back();
    },
    child: Container(
      width: double.infinity,
      height: Sizes.s60,
      decoration: BoxDecoration(
          color: appCtrl.appTheme.primaryLightBorder,
          borderRadius: BorderRadius.circular(AppRadius.r10)),
      child: Center(
        child: Icon(Icons.check),
      ),
    ),
  );
}
