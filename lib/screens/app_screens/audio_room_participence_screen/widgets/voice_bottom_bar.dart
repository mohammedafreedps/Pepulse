import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/audio_room_controller.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/show_bottom_recharge_sheet.dart';

Widget voiceBottomBar(BuildContext context) {
  return Container(
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GetX<AudioRoomController>(builder: (controller) {
              return controller.isHost.value
                  ? IconButton(
                      onPressed: () {
                        controller.muteAudio();
                      },
                      icon: Icon(
                          controller.muted.value ? Icons.mic_off : Icons.mic),
                    )
                  : Container();
            }),
            const SizedBox(
              width: Insets.i10,
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.tag_faces_outlined)),
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.calendar_month)),
            const SizedBox(
              width: Insets.i10,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.api_rounded)),
            const SizedBox(
              width: Insets.i10,
            ),
            IconButton(
                onPressed: () {
                  showBottomRechargeSheet(context);
                },
                icon: const Icon(Icons.card_giftcard_rounded)),
          ],
        )
      ],
    ),
  );
}
