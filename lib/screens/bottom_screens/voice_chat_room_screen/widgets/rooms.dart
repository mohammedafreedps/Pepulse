import 'package:chatzy/config.dart';

Widget rooms() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('My Room', style: AppCss.manropeBold20),
      SizedBox(height: Insets.i30,),
      SizedBox(
        height: Sizes.s100,
        child: ListView.builder(
          itemCount: roomLists.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return roomLists[index];
          },
        ),
      )
    ],
  );
}

List<Widget> roomLists = [
  roomListTile(true),
  roomListTile(true),
  roomListTile(true),
  roomListTile(true),
  roomListTile(true),
  roomListTile(true),
  roomListTile(true),
  roomListTile(true),
  roomListTile(true),
  roomListTile(true),
  ];

Widget roomListTile(bool isDummy) {
  if (isDummy) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.i10),
      child: Container(
        width: Sizes.s100,
        decoration: BoxDecoration(
            color: appCtrl.appTheme.black,
            borderRadius: BorderRadius.circular(Insets.i10)),
      ),
    );
  } else {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.i10),
      child: Container(
        width: Sizes.s100,
        decoration: BoxDecoration(
            color: appCtrl.appTheme.black,
            borderRadius: BorderRadius.circular(Insets.i10)),
            child: Center(child: Icon(Icons.add,color: appCtrl.appTheme.white,),),
      ),
    );
  }
}
