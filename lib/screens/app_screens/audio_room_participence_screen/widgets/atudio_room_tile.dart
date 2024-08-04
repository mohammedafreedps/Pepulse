import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:flutter/material.dart';

Widget audioRoomTiles(bool isAudiance, bool isLocked, {String? name}) {
  final AudioRoomController audioRoomController =
      Get.find<AudioRoomController>();
  return isLocked
      ? Column(
          children: [
            CircleAvatar(
              radius: Insets.i30,
              backgroundColor: appCtrl.appTheme.primary,
              child:  Center(
                child: Icon(
                  Icons.lock,
                  color: appCtrl.appTheme.white,
                ),
              ),
            ),
            Text(
              'Locked',
              style:
                  AppCss.manropeRegular13.textColor(appCtrl.appTheme.darkText),
            )
          ],
        )
      : Column(
          children: [
            InkWell(
                onLongPress: () {
                  if (audioRoomController.isHaveAccessToAddHost.value) {
                    Get.dialog(AlertDialog(
                      content: const Text('Make Host'),
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
            Text(name!,style: AppCss.manropeRegular13.textColor(appCtrl.appTheme.darkText),)
          ],
        );
}
