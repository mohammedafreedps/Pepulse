import 'package:chatzy/config.dart';
import 'package:chatzy/screens/app_screens/recharge_screen/recharge_screen.dart';

class MyDiamondsScreen extends StatelessWidget {
  const MyDiamondsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Diamonds',style: AppCss.manropeBold18,),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.history))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Insets.i10),
        child: Column(
          children: [
            totalDiamondsAndCartButton(),
            SizedBox(
              height: 20,
            ),
            service(),
            SizedBox(
              height: 20,
            ),
            game()
          ],
        ),
      ),
    );
  }
}

Widget totalDiamondsAndCartButton() {
  return Container(
    padding: EdgeInsets.all(Insets.i10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r10),
        border: Border.all(color: appCtrl.appTheme.borderColor)),
    child: Column(
      children: [
        Text(
          '0',
          style: AppCss.manropeExtraBold20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.diamond), Text('Total Diamonds',style: AppCss.manrope.copyWith(color: appCtrl.appTheme.greyText),)],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Icon(Icons.diamond),
                Text('0'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.diamond),
                Text('0'),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: (){
                    Get.to(RechargeScreen());
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(AppRadius.r10)),
                      padding: EdgeInsets.all(Insets.i5),
                      child: Icon(
                        Icons.shopping_cart,
                        color: appCtrl.appTheme.white,
                        size: 10,
                      )),
                )
              ],
            )
          ],
        )
      ],
    ),
  );
}

Widget service() {
  return Container(
    padding: EdgeInsets.all(Insets.i10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r10),
        border: Border.all(color: appCtrl.appTheme.borderColor)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Service',style: AppCss.manropeBold15.copyWith(color: appCtrl.appTheme.greyText),),
        SizedBox(height: 20,),
        Container(
            padding: EdgeInsets.all(Insets.i10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.r10),
                border: Border.all(color: appCtrl.appTheme.borderColor)),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.abc),
                        Text('Premium',style: AppCss.manropeBold15,),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(Icons.abc),
                        Text('Free Diamonds',style: AppCss.manropeBold15,),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(Icons.abc),
                        Text('SVIP',style: AppCss.manropeBold15,),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.abc),
                        Text('Noble',style: AppCss.manropeBold15,),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(Icons.abc),
                        Text('Family',style: AppCss.manropeBold15,),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(Icons.abc),
                        Text('Store',style: AppCss.manropeBold15,),
                      ],
                    )
                  ],
                )
              ],
            ))
      ],
    ),
  );
}

Widget game() {
  return Container(
    padding: EdgeInsets.all(Insets.i10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r10),
        border: Border.all(color: appCtrl.appTheme.borderColor)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Game',style: AppCss.manropeBold15.copyWith(color: appCtrl.appTheme.greyText),),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.all(Insets.i10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r10),
              border: Border.all(color: appCtrl.appTheme.borderColor)),
          child: Row(
            children: [Icon(Icons.confirmation_num), Text('Desert',style: AppCss.manropeBold15,)],
          ),
        ),
      ],
    ),
  );
}
