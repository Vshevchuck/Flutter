import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app3/widgets/statistic_widget.dart';
import 'package:flutter_app3/widgets/functional_widget.dart';
import 'package:flutter_app3/widgets/menu_widget.dart';

class UserProfile extends StatelessWidget {
  List<ElementOfStatistics> elements = [
    ElementOfStatistics(846, "Collect"),
    ElementOfStatistics(51, "Attention"),
    ElementOfStatistics(267, "Track"),
    ElementOfStatistics(39, "Coupons")
  ];
  List<ElementOfFunctional> elementsFunc = [
    ElementOfFunctional(Icons.account_balance_wallet, "Wallet"),
    ElementOfFunctional(Icons.airport_shuttle_rounded, "Delivery"),
    ElementOfFunctional(Icons.add_to_home_screen, "Message"),
    ElementOfFunctional(Icons.wallet_giftcard, "Service")
  ];
  List<ElementOfMenu> elementsMenu = [
    ElementOfMenu("Address","ensure you having adress",
        Icons.add_location,Colors.deepPurpleAccent),
    ElementOfMenu("Privacy","system premision change",
        Icons.vpn_key_rounded,Colors.purpleAccent),
    ElementOfMenu("General","basic functional setting",
    Icons.apps_sharp,Colors.orangeAccent),
    ElementOfMenu("Notifications","take over the new in time",
    Icons.warning,Colors.lightBlueAccent)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Center',
              style: GoogleFonts.lato(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                      offset: Offset(2, 5), // Shado
                    ),
                  ],
                ),
                //maximum allowable width
                //width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        _UserPhotoWidget(),
                        //padding: const EdgeInsets.all(8.0),
                        _UserInfoWidget(),
                        _UserSecurityWidget(),
                      ],
                    ),
                    InfoStatisticWidget(StatisticColoumn: elements),
                  ],
                ),
              ),
            ),
            FunctionalWidget(FunctionalRow:elementsFunc),
            MenuWidget(menuWidgetColumn:elementsMenu),
          ],
        ),
      ),
    );
  }
}

class _UserSecurityWidget extends StatelessWidget {
  const _UserSecurityWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //add_rounded
        padding: EdgeInsets.only(bottom: 25, left: 10),
        child: Icon(Icons.privacy_tip, color: Colors.white, size: 20));
  }
}

class _UserInfoWidget extends StatelessWidget {
  const _UserInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Vladislav Shevchuck',
            style: GoogleFonts.lato(
                fontSize: 19, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        Text(
          'mobile app developer',
          style: GoogleFonts.lato(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white54),
        )
      ],
    );
  }
}



class _UserPhotoWidget extends StatelessWidget {
  const _UserPhotoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2.5, color: Colors.white),
        ),
        width: 65,
        height: 65,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image(
            image: AssetImage(
                'assets/image/bb9f8b136eb644c92a08fa3f7637c03bYp9UjK_800.jpg'),
          ),
        ),
      ),
    );
  }
}
