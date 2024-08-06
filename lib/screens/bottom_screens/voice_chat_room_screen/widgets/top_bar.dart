import 'package:chatzy/config.dart';

Widget topBar() {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Text('Room',
        style: AppCss.manropeRegular13.textColor(appCtrl.appTheme.darkText).size(Sizes.s25),),
    Text('Explore',
        style: AppCss.manropeRegular13.textColor(appCtrl.appTheme.darkText).size(Sizes.s25),),
    SizedBox(),
    Icon(Icons.speaker_phone_rounded,),
    Icon(Icons.notification_add),
    Icon(Icons.people),
  ]);
}
