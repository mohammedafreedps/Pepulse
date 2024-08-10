import 'package:chatzy/config.dart';
import 'package:chatzy/controllers/paymentController.dart';
import 'package:flutter/services.dart';
import 'package:pay/pay.dart';

Future paymentBottomSheet(BuildContext context) async {
  String gpayJson = await rootBundle.loadString('assets/gpay.json');
  PaymentController paymentController = Get.find();
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: GooglePayButton(
              paymentConfiguration:
                  PaymentConfiguration.fromJsonString(gpayJson),
              paymentItems: paymentController.paymentItem,
              onPaymentResult: (data) {
                print(data);
              },
            ),
          ),
        );
      });
}
