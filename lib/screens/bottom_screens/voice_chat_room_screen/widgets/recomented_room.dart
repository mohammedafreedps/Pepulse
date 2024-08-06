import 'package:chatzy/config.dart';

Widget recomentedRoom() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Recommented Rooms', style: AppCss.manropeBold20),
      SizedBox(
        height: Insets.i15,
      ),
      SizedBox(
        height: Insets.i40,
        child: ListView.builder(
            itemCount: _recommentedRoomList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _recommentedRoomList[index];
            }),
      ),
      SizedBox(
        height: Insets.i15,
      ),
      Expanded(
        child: ListView(
          children: [
            _recommentedRoomTile(_name[0],_description[0],_parCount[0]),
            _recommentedRoomTile(_name[1],_description[1],_parCount[1]),
            _recommentedRoomTile(_name[2],_description[2],_parCount[2]),
          ],
        ),
      )
    ],
  );
}

List<Widget> _recommentedRoomList = [
  _categoryTile('Trending'),
  _categoryTile('New'),
  _categoryTile('Old'),
  _categoryTile('Upcomming'),
  _categoryTile('Cars'),
  _categoryTile('Photography'),
  _categoryTile('3d'),
  _categoryTile('Social'),
];

Widget _categoryTile(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: Insets.i5),
    child: Container(
      padding: EdgeInsets.all(Insets.i10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(0, 0),
            )
          ],
          color: appCtrl.appTheme.white,
          borderRadius: BorderRadius.circular(Insets.i20)),
      child: Center(
        child: Text(text),
      ),
    ),
  );
}

List<String> _name = ['Alice', 'Bob', 'Charlie'];
List<String> _description = [
  'Simplicity is the ultimate sophistication',
  'Cherish the little things',
  'Life is about making an impact, not making an income'
];
List<int> _parCount = [223, 142, 554];

Widget _recommentedRoomTile(String name, String description, int count) {
  return Padding(
    padding: const EdgeInsets.only(bottom: Sizes.s10),
    child: Container(
      padding: EdgeInsets.all(Insets.i10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(0, 0),
            )
          ],
          color: appCtrl.appTheme.white,
          borderRadius: BorderRadius.circular(Insets.i20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [_avatharCircular(isBig: false),SizedBox(width: Insets.i10,), Text(name,style: AppCss.manropeBold18,)]),
              _categoryTile(count.toString())
            ],
          ),
          SizedBox(height: Sizes.s15,),
          SizedBox(width: Sizes.s200,child: Text(description,style: AppCss.manropeRegular18,),),
          SizedBox(height: Sizes.s15,),
          Row(
            children: [
              _avatharCircular(),
              SizedBox(width: Sizes.s15,),
              _avatharCircular(),
            ],
          )
        ],
      ),
    ),
  );
}

Widget _avatharCircular({bool isBig = true}) {
  return CircleAvatar(
    radius: isBig ? AppRadius.r30 : AppRadius.r20,
    backgroundColor: appCtrl.appTheme.sameBlack,
  );
}
