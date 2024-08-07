import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:chatzy/controllers/app_pages_controllers/room_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget audioRoomTiles(int index, bool isAudiance, bool isLocked, String label,
    BuildContext context,
    {String? name}) {
  final AudioRoomController audioRoomController =
      Get.find<AudioRoomController>();
  final RoomDetailController roomDetailController =
      Get.find<RoomDetailController>();

  if (isLocked) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text('Take Mic'),
          value: 'takeMic',
        ),
        PopupMenuItem(
          child: Text('Invite Speaker'),
          value: 'inviteSpeaker',
        ),
        PopupMenuItem(
          child: Text('Lock Mic'),
          value: 'lockMic',
        ),
      ],
      onSelected: (newValue) {
        if (newValue == 'lockMic') {
          roomDetailController.lockSeatAt(
              index, !roomDetailController.lockedSeates[index]);
        }
        if(newValue == 'takeMic'){
          if(roomDetailController.hostSeatedAt.value == index){
            
          };
          roomDetailController.hostsSeatedAt(index);
        }
        print(newValue);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: Insets.i30,
            backgroundColor: appCtrl.appTheme.primary,
            child: Center(
              child: Icon(
                Icons.lock,
                color: appCtrl.appTheme.white,
              ),
            ),
          ),
          SizedBox(
            height: Sizes.s10,
          ),
          Text(
            label,
            style: AppCss.manropeRegular13.textColor(appCtrl.appTheme.darkText),
          )
        ],
      ),
    );
  }
  if (roomDetailController.hostSeatedAt.value == index &&
      roomDetailController.lockedSeates[index] != true) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text('Take Mic'),
          value: 'takeMic',
        ),
        PopupMenuItem(
          child: Text('Invite Speaker'),
          value: 'inviteSpeaker',
        ),
        PopupMenuItem(
          child: Text('Lock Mic'),
          value: 'lockMic',
        ),
      ],
      onSelected: (newValue) {
        if (newValue == 'lockMic') {
          roomDetailController.lockSeatAt(
              index, !roomDetailController.lockedSeates[index]);
        }
        if(newValue == 'takeMic'){
          roomDetailController.hostsSeatedAt(index);
        }
        print(newValue);
      },
      child: Column(
        children: [
          const CircleAvatar(
            radius: Insets.i30,
            backgroundColor: Colors.black,
          ),
          Text(
            name!,
            style: AppCss.manropeRegular13.textColor(appCtrl.appTheme.darkText),
          )
        ],
      ),
    );
  } else {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text('Take Mic'),
          value: 'takeMic',
        ),
        PopupMenuItem(
          child: Text('Invite Speaker'),
          value: 'inviteSpeaker',
        ),
        PopupMenuItem(
          child: Text('Lock Mic'),
          value: 'lockMic',
        ),
      ],
      onSelected: (newValue) {
        if (newValue == 'lockMic') {
          roomDetailController.lockSeatAt(
              index, !roomDetailController.lockedSeates[index]);
        }
        if(newValue == 'takeMic'){
          roomDetailController.hostsSeatedAt(index);
        }
        print(newValue);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: Insets.i30,
            backgroundColor: appCtrl.appTheme.primary,
            child: Center(
              child: Icon(
                Icons.open_in_browser,
                color: appCtrl.appTheme.white,
              ),
            ),
          ),
          SizedBox(
            height: Sizes.s10,
          ),
          Text(
            label,
            style: AppCss.manropeRegular13.textColor(appCtrl.appTheme.darkText),
          )
        ],
      ),
    );
  }
}
