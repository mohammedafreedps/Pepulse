import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/voice_room_customize_controller.dart';
import 'package:flutter/material.dart';

class VoiceRoomCustomize extends StatelessWidget {
  const VoiceRoomCustomize({super.key});

  @override
  Widget build(BuildContext context) {
    VoiceRoomCustomizeController voiceRoomCustomizeController =
        Get.put(VoiceRoomCustomizeController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'VoiceRoom Customize',
          style: AppCss.manropeBold18,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.keyboard_arrow_up_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Insets.i10),
        child: GetX<VoiceRoomCustomizeController>(builder: (controller) {
          return SizedBox(
            height: controller.showLinkEnterSection.value
                ? MediaQuery.of(context).size.height / 2 + 170
                : MediaQuery.of(context).size.height / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Room Mode',
                  style: AppCss.manropeBold14,
                ),
                SizedBox(
                  height: Sizes.s20,
                ),
                Flexible(
                  child: ListView.builder(
                      itemCount: roomModeList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return cusTile(lable: roomModeList[index]);
                      }),
                ),
                Text(
                  'Room Game',
                  style: AppCss.manropeBold14,
                ),
                SizedBox(
                  height: Sizes.s20,
                ),
                Flexible(
                  child: ListView.builder(
                      itemCount: 1,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return cusTile(lable: 'Roulette');
                      }),
                ),
                Text(
                  'Room Setting',
                  style: AppCss.manropeBold14,
                ),
                SizedBox(
                  height: Sizes.s20,
                ),
                Flexible(
                  child: ListView.builder(
                      itemCount: roomSettings.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return InkWell(
                            onTap: () {
                              voiceRoomCustomizeController
                                  .toggleShowLinkEnterSection();
                            },
                            child: cusTile(lable: roomSettings[index],imagepath: 'assets/images/dbg3.png',icon: roomSettingIcon[index]),
                          );
                        }
                        return cusTile(lable: roomSettings[index],icon: roomSettingIcon[index]);
                      }),
                ),
                GetX<VoiceRoomCustomizeController>(builder: (controller) {
                  if (controller.showLinkEnterSection.value) {
                    return Container(
                      child: Column(
                        children: [
                          TextField(
                            controller: voiceRoomCustomizeController
                                .videoLinkController,
                            decoration: InputDecoration(
                              hintText: 'Enter Youtube Link'
                            ),
                          ),
                          SizedBox(
                            height: Sizes.s20,
                          ),
                          ElevatedButton.icon(
                              onPressed: () {
                                voiceRoomCustomizeController.setVideoUrl();
                                Get.back();
                              },
                              label: Icon(Icons.check)),
                              SizedBox(
                            height: Sizes.s20,),
                          voiceRoomCustomizeController.showYtVideoScreen.value ? ElevatedButton(onPressed: (){
                            voiceRoomCustomizeController.closeYtVideo();
                            Get.back();
                          }, child: Text('Close Yt Video')) : SizedBox()
                        ],
                      ),
                    );
                  }
                  return SizedBox();
                }),
              ],
            ),
          );
        }),
      ),
    );
  }
}

Widget cusTile({String lable = 'Data',String imagepath = 'assets/images/dbg3.png',IconData? icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: Insets.i10),
    child: Column(
      children: [
        CircleAvatar(
          backgroundImage: icon !=null ? null: AssetImage(imagepath),
          radius: AppRadius.r30,
          child: Center(
            child: icon !=null ? Icon(icon): SizedBox(),
          ),
        ),
        SizedBox(
          height: Sizes.s5,
        ),
        Text(
          lable,
          style: AppCss.manrope,
        )
      ],
    ),
  );
}

List<String> roomModeList = [
  'Ludo',
  'Jelly Boom',
  'Domino',
  'King Game',
  'Theme',
  'Other'
];
List<String> roomSettings = [
  'YT video',
  'Decor',
  'Announcement',
  'Swich Mode',
  'Lock Mik',
];
List<IconData> roomSettingIcon = [
  Icons.video_camera_back_rounded,
  Icons.shopping_cart,
  Icons.announcement,
  Icons.panorama_photosphere,
  Icons.lock
];