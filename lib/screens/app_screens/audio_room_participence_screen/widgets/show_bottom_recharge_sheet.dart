import 'package:chatzy/config.dart';

Future showBottomRechargeSheet(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  excludeHeaderSemantics: true,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(48.0 + 1.0),
                    child: Column(
                      children: [
                        Divider(
                          color: appCtrl.appTheme.divider,
                        ),
                        TabBar(
                            dividerColor: Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0),
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: [
                              Tab(
                                child: Column(
                                  children: [
                                    // Image.asset('assets/images/googleWallet.png'),
                                    Text('Google Wallet')],
                                ),
                              ),
                              Tab(
                                child: Column(
                                  children: [Text('Friends Pay')],
                                ),
                              )
                            ]),
                      ],
                    ),
                  ),
                  title: Text('Recharge'),
                ),
                body: Padding(
                  padding: const EdgeInsets.only(
                      top: Insets.i15, left: Insets.i15, right: Insets.i15),
                  child: TabBarView(children: [
                    googleWalletPage(),
                    friendsPayPage()
                  ]),
                ),
              )),
        );
      });
}

Widget googleWalletPage() {
  return GridView.builder(
    physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dimondsWallet.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemBuilder: (context, index) {
        return rechargeTile(dimondsWallet[index].toString(),price:  price[index].toString());
      });
}

Widget friendsPayPage() {
  return GridView.builder(
    physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dimondsFriendsPay.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemBuilder: (context, index) {
        return rechargeTile(dimondsWallet[index].toString(),isFriendPay: true);
      });
}

Widget rechargeTile(String dimonds,{bool isFriendPay = false, String price = '',}) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: appCtrl.appTheme.divider),
        borderRadius: BorderRadius.circular(AppRadius.r10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: Sizes.s10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.diamond), Text(dimonds)],
        ),
        isFriendPay ? Container() : Text('INR $price'),
        Container(
          decoration: BoxDecoration(
              color: appCtrl.appTheme.primary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppRadius.r10),bottomRight: Radius.circular(AppRadius.r10))),
          width: double.infinity,
          height: Sizes.s40,
          child: Center(
            child: Text(
              'Recharge',
              style:
                  AppCss.manropeBold14.copyWith(color: appCtrl.appTheme.white),
            ),
          ),
        )
      ],
    ),
  );
}


List<int> dimondsWallet = [10,42,84,210,420,840,2100,4200,8400];

List<int> dimondsFriendsPay = [42,210,420,2100,8400];

List<double> price = [33.00,130.00,260.00,650.00,1300.00,2600.00,6500.00,13000.00,18900.00];