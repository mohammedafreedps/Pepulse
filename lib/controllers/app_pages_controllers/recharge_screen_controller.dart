import 'package:chatzy/config.dart';

class RechargeScreenController extends GetxController{
  RxBool showGoogleWallet = false.obs; 
  RxBool showCard = false.obs; 
  RxBool showFriendPay = false.obs; 

  void toggleGoogleWallet(){
    showGoogleWallet.value = !showGoogleWallet.value;
  }

  void toggleCard(){
    showCard.value = !showCard.value;
  }

  void toggleFriendPay(){
    showFriendPay.value = !showFriendPay.value;
  }
}