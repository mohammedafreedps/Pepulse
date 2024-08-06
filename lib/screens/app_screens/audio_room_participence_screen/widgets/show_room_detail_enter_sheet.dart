import 'package:chatzy/config.dart';

Future showRoomDetailEnterSheet(BuildContext context){
  return showModalBottomSheet(context: context, builder: (context){
    return Container(
      height: Sizes.s400,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(Insets.i10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            addProfile(),
            roomName(),
            roomDescription(),
            roomDetialApplyButton()
          ],
        ),
      ),
    );
  });
}

Widget addProfile(){
  return Container(
    width: Sizes.s70,
    height: Sizes.s70,
    decoration: BoxDecoration(
      color: appCtrl.appTheme.black,
      borderRadius: BorderRadius.circular(Insets.i10)
    ),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: Sizes.s30,
            decoration: BoxDecoration( color: Colors.white.withOpacity(0.5),),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Icon(Icons.camera),Text('Edit')],
            ),
          ),
        )
      ],
    ),
  );
}

Widget roomName(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Room Name',style: AppCss.manropeBold16,),
      SizedBox(height: Sizes.s10,),
      Container(
        decoration: BoxDecoration(color: appCtrl.appTheme.divider,borderRadius: BorderRadius.circular(AppRadius.r10)),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      )
    ],
  );
}

Widget roomDescription(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Room description',style: AppCss.manropeBold16,),
          SizedBox(height: Sizes.s10,),
          Text('Describe your room to get more followeres'),
        ],
      ),
      IconButton(onPressed: (){}, icon: Icon(Icons.edit))
    ],
  );
}

Widget roomDetialApplyButton(){
  return Container(
    width: double.infinity,
    height: Sizes.s60,
    decoration: BoxDecoration(
      color: appCtrl.appTheme.primaryLightBorder,
      borderRadius: BorderRadius.circular(AppRadius.r10)
    ),
    child: Center(
      child: Icon(Icons.check),
    ),
  );
}