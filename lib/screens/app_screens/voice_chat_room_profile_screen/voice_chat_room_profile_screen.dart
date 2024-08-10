import 'package:chatzy/config.dart';
import 'package:chatzy/screens/app_screens/my_diamonds_screen/my_diamonds_screen.dart';
import 'package:flutter/material.dart';

class VoiceChatRoomProfileScreen extends StatelessWidget {
  VoiceChatRoomProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            profilePicAndAppBar(),
            userNameAndFollowerCount(),
            taskCenter(context),
            fiveOptions(context),
            family(context),
            rank(context),
            myEvent(context)
          ],
        ),
      ),
    );
  }
}

Widget profilePicAndAppBar() {
  return Stack(
    children: [
      Positioned(
          top: -649,
          bottom: 0,
          left: -60,
          child: Container(
            width: 250,
            decoration: BoxDecoration(
                color: appCtrl.appTheme.primary.withAlpha(10),
                shape: BoxShape.circle),
          )),
      Positioned(
          top: -649,
          bottom: 0,
          left: -10,
          child: Container(
            width: 150,
            decoration: BoxDecoration(
                color: appCtrl.appTheme.primary.withAlpha(30),
                shape: BoxShape.circle),
          )),
      Positioned(
          top: -649,
          bottom: 0,
          left: 18,
          child: Container(
            width: 95,
            decoration: BoxDecoration(
                color: appCtrl.appTheme.primary.withAlpha(40),
                shape: BoxShape.circle),
          )),
      Positioned(
          top: -650,
          bottom: 0,
          left: 25,
          child: Container(
            width: 80,
            decoration: BoxDecoration(
                color: appCtrl.appTheme.primary.withAlpha(100),
                shape: BoxShape.circle),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/dbg6.png'),
            ),
          )),
      Align(
        child: AppBar(
          backgroundColor: Colors.transparent,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        ),
      )
    ],
  );
}

Widget userNameAndFollowerCount() {
  return Positioned(
    top: 60,
    left: 130,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Afreed',
          style: AppCss.manropeBold20,
        ),
        SizedBox(
          height: Sizes.s10,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: Insets.i10),
          decoration: BoxDecoration(
              color: appCtrl.appTheme.white,
              borderRadius: BorderRadius.circular(Insets.i30)),
          child: Row(
            children: [
              Icon(
                Icons.star_border,
                size: 15,
                color: appCtrl.appTheme.primary,
              ),
              SizedBox(
                width: 3,
              ),
              Text('0 Follower'),
            ],
          ),
        )
      ],
    ),
  );
}

Widget taskCenter(BuildContext context) {
  final LinearGradient gradient = LinearGradient(
    colors: [appCtrl.appTheme.primary, appCtrl.appTheme.secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  return Positioned(
    top: 140,
    child: Padding(
      padding: const EdgeInsets.all(Insets.i10),
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: Sizes.s80,
        decoration: BoxDecoration(
            color: appCtrl.appTheme.white,
            borderRadius: BorderRadius.circular(AppRadius.r10)),
        child: Padding(
          padding: const EdgeInsets.all(Insets.i10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.event_available_sharp,
                        size: Sizes.s30,
                        color: appCtrl.appTheme.secondary,
                      ),
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) => gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                        child: Text(
                          'Task Center',
                          style: AppCss.manropeBold20,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 34,
                      ),
                      Text('Complete tasks to get great rewards!',style: AppCss.manropeMedium13.copyWith(color: appCtrl.appTheme.greyText)),
                    ],
                  )
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded,color: appCtrl.appTheme.greyText,)
            ],
          ),
        ),
      ),
    ),
  );
}

Widget fiveOptions(BuildContext context) {
  return Positioned(
      top: MediaQuery.of(context).size.height * 0.26,
      child: Padding(
        padding: const EdgeInsets.all(Insets.i10),
        child: Container(
          padding: EdgeInsets.all(Insets.i10),
          width: MediaQuery.of(context).size.width - 20,
          height: 300,
          decoration: BoxDecoration(
              color: appCtrl.appTheme.white,
              borderRadius: BorderRadius.circular(AppRadius.r10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.to(MyDiamondsScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.diamond),
                        SizedBox(
                          width: Sizes.s10,
                        ),
                        Text(
                          'My Diamonds',
                          style: AppCss.manropeRegular18,
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded,color: appCtrl.appTheme.greyText,)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.stream_sharp),
                      SizedBox(
                        width: Sizes.s10,
                      ),
                      Text(
                        'Achievement',
                        style: AppCss.manropeRegular18,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Apprentice',style: AppCss.manropeMedium13.copyWith(color: appCtrl.appTheme.greyText),),
                      Icon(Icons.arrow_forward_ios_rounded,color: appCtrl.appTheme.greyText,)
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.indeterminate_check_box_outlined),
                      SizedBox(
                        width: Sizes.s10,
                      ),
                      Text(
                        'SVIP',
                        style: AppCss.manropeRegular18,
                      ),
                    ],
                  ),
                 Icon(Icons.arrow_forward_ios_rounded,color: appCtrl.appTheme.greyText,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.tag_faces_sharp),
                      SizedBox(
                        width: Sizes.s10,
                      ),
                      Text(
                        'Noble',
                        style: AppCss.manropeRegular18,
                      ),
                    ],
                  ),
                 Icon(Icons.arrow_forward_ios_rounded,color: appCtrl.appTheme.greyText,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.dataset_rounded),
                      SizedBox(
                        width: Sizes.s10,
                      ),
                      Text(
                        'Privilege Decoration',
                        style: AppCss.manropeRegular18,
                      ),
                    ],
                  ),
                 Icon(Icons.arrow_forward_ios_rounded,color: appCtrl.appTheme.greyText,)
                ],
              ),
            ],
          ),
        ),
      ));
}

Widget family(BuildContext context) {
  return Positioned(
    top: MediaQuery.of(context).size.height * 0.614,
    child: Padding(
      padding: const EdgeInsets.all(Insets.i10),
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: Sizes.s60,
        decoration: BoxDecoration(
            color: appCtrl.appTheme.white,
            borderRadius: BorderRadius.circular(AppRadius.r10)),
        child: Padding(
          padding: const EdgeInsets.all(Insets.i10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.stars_outlined),
                  SizedBox(
                    width: Sizes.s10,
                  ),
                  Text(
                    'Family',
                    style: AppCss.manropeRegular18,
                  )
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded,color: appCtrl.appTheme.greyText,)
            ],
          ),
        ),
      ),
    ),
  );
}

Widget rank(BuildContext context) {
  return Positioned(
    top: MediaQuery.of(context).size.height * 0.689,
    child: Padding(
      padding: const EdgeInsets.all(Insets.i10),
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: Sizes.s60,
        decoration: BoxDecoration(
            color: appCtrl.appTheme.white,
            borderRadius: BorderRadius.circular(AppRadius.r10)),
        child: Padding(
          padding: const EdgeInsets.all(Insets.i10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.bar_chart_outlined),
                  SizedBox(
                    width: Sizes.s10,
                  ),
                  Text(
                    'Rank',
                    style: AppCss.manropeRegular18,
                  )
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded,color: appCtrl.appTheme.greyText,)
            ],
          ),
        ),
      ),
    ),
  );
}

Widget myEvent(BuildContext context) {
  return Positioned(
    top: MediaQuery.of(context).size.height * 0.764,
    child: Padding(
      padding: const EdgeInsets.all(Insets.i10),
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: Sizes.s60,
        decoration: BoxDecoration(
            color: appCtrl.appTheme.white,
            borderRadius: BorderRadius.circular(AppRadius.r10)),
        child: Padding(
          padding: const EdgeInsets.all(Insets.i10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.event),
                  SizedBox(
                    width: Sizes.s10,
                  ),
                  Text(
                    'My Event',
                    style: AppCss.manropeRegular18,
                  )
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded,color: appCtrl.appTheme.greyText,)
            ],
          ),
        ),
      ),
    ),
  );
}
