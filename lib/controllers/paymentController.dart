import 'package:chatzy/config.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:upi_india/upi_india.dart';
import 'package:pay/pay.dart';

class PaymentController extends GetxController {
  UpiResponse? tansactionResponse;
  RxString paymentStatus = ''.obs;
  List<UpiApp>? apps;
  final UpiIndia _upiIndia = UpiIndia();

  final paymentItem = <PaymentItem> [];

  // papymentItem(anounnt: label: status)

  @override
  void onInit() {
    paymentItem.add(PaymentItem(amount: '0.0',label: 'Purchase',));
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      apps = value;
    });
    super.onInit();
  }

  Future<UpiResponse>? initiateTransaction(int appIndex, double amount) async {
    if (apps != null) {
      return _upiIndia.startTransaction(
          app: apps![appIndex],
          receiverUpiId: '_',
          receiverName: "receiverName",
          transactionRefId: "Payment for Dimonds",
          amount: amount);
    }
    return Future.value(null);
  }
  
  void makePayment(int appIndex,double amount)async{
    tansactionResponse = await initiateTransaction(appIndex, amount);
    if(tansactionResponse !=  null){
      paymentStatus.value = tansactionResponse!.status ?? '';
    }
  }
}