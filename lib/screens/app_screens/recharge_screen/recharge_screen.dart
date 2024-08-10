import 'package:chatzy/common/theme/app_css.dart';
import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/app_pages_controllers/recharge_screen_controller.dart';
import 'package:chatzy/screens/app_screens/audio_room_participence_screen/widgets/show_bottom_recharge_sheet.dart';
import 'package:flutter/material.dart';

class RechargeScreen extends StatelessWidget {
  const RechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Recharge',style: AppCss.manropeBold20,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.i10),
          child: Column(
            children: [
              currentDimonds(),
              SizedBox(height: 20),
              coupons(),
              SizedBox(height: 20),
              currentLocation(),
              Divider(color: appCtrl.appTheme.borderColor),
              GetX<RechargeScreenController>(
                builder: (controller) {
                  return googleWallet(context, controller.showGoogleWallet.value);
                }
              ),
              GetX<RechargeScreenController>(
                builder: (controller) {
                  return creditDebitCard(context, controller.showCard.value);
                }
              ),
              GetX<RechargeScreenController>(
                builder: (controller) {
                  return friendsPay(context, controller.showFriendPay.value);
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget currentDimonds() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppRadius.r10),
    ),
    padding: EdgeInsets.only(top: 25),
    height: 150,
    width: double.infinity,
    child: Center(
      child: Column(
        children: [
          Text('Current Diamonds',style: AppCss.manrope.copyWith(color: appCtrl.appTheme.greyText),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.diamond),
              SizedBox(width: 10),
              Text(
                '0',
                style: AppCss.manropeBold50,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget coupons() {
  return Container(
    padding: EdgeInsets.all(Insets.i10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppRadius.r10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.airplane_ticket_outlined,color: Colors.amber,),
            SizedBox(width: 20),
            Text('Coupons',style: AppCss.manrope,),
          ],
        ),
        Row(
          children: [
            Text('0 available',style: AppCss.manrope.copyWith(color: appCtrl.appTheme.greyText),),
            Icon(Icons.keyboard_arrow_right_rounded),
          ],
        ),
      ],
    ),
  );
}

Widget currentLocation() {
  return Container(
    padding: EdgeInsets.all(Insets.i10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppRadius.r10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Current Location',style: AppCss.manrope.copyWith(color: appCtrl.appTheme.greyText),),
        Row(
          children: [
            Icon(Icons.location_on_outlined,color: appCtrl.appTheme.secondary),
            Text('Recommended',style: AppCss.manrope.copyWith(color: appCtrl.appTheme.secondary),),
            Icon(Icons.keyboard_arrow_right_rounded,color: appCtrl.appTheme.secondary,),
          ],
        ),
      ],
    ),
  );
}

Widget googleWallet(BuildContext context, bool show) {
  RechargeScreenController _rechargeController = Get.find();
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r10),
    ),
    padding: EdgeInsets.all(Insets.i10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Google Wallet',style: AppCss.manrope,),
            IconButton(
              onPressed: () {
                _rechargeController.toggleGoogleWallet();
              },
              icon: show ? Icon(Icons.keyboard_arrow_up_rounded) :Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ],
        ),
        show ? SizedBox(
          height: 350,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: dimondsWallet.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return rechargeTile(context,
                dimondsWallet[index].toString(),
                price: price[index].toString(),
              );
            },
          ),
        ) : Container(),
      ],
    ),
  );
}

Widget creditDebitCard(BuildContext context, bool show) {
  RechargeScreenController _rechargeController = Get.find();
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r10),
    ),
    padding: EdgeInsets.all(Insets.i10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Credit/Debit Card',style: AppCss.manrope,),
            IconButton(
              onPressed: () {
                _rechargeController.toggleCard();
              },
             icon: show ? Icon(Icons.keyboard_arrow_up_rounded) :Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ],
        ),
        show ? SizedBox(
          height: 240,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: dimondsCard.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return rechargeTile(context,
                dimondsCard[index].toString(),
                price: dimondsPrice[index].toString(),
              );
            },
          ),
        ) : Container() ,
      ],
    ),
  );
}

Widget friendsPay(BuildContext context, bool show) {
  RechargeScreenController _rechargeController = Get.find();
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r10),
    ),
    padding: EdgeInsets.all(Insets.i10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Friends Pay',style: AppCss.manrope,),
            IconButton(
              onPressed: () {
                _rechargeController.toggleFriendPay();
              },
              icon: show ? Icon(Icons.keyboard_arrow_up_rounded) :Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ],
        ),
        show ? SizedBox(
          height: 350,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: dimondsFriendsPay.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return rechargeTile(context ,dimondsWallet[index].toString(),
                  isFriendPay: true);
            },
          ),
        ): Container(),
      ],
    ),
  );
}

List<int> dimondsCard = [42,210,420,2100,4200,8400];
List<double> dimondsPrice = [1.3,5,9.5,45.5,90,180];