import 'package:chatzy/config.dart';

Widget addTopicButton(){
  return Container(
    width: double.infinity,
    height: Sizes.s25,
    decoration: BoxDecoration(
      color: appCtrl.appTheme.white,
      border: Border.all(color: appCtrl.appTheme.greyText),
      borderRadius: BorderRadius.circular(AppRadius.r20)
    ),
    child: Center(
      child: Text('+ Add Topic',style: AppCss.manropeLight14.copyWith(color: appCtrl.appTheme.greyText),),
    ),
  );
}