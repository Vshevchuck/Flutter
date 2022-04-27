import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app3/widgets/statistic_widget.dart';
import 'package:flutter_app3/widgets/functional_widget.dart';
import 'package:flutter_app3/widgets/menu_widget.dart';

final scafoldTextStyle = GoogleFonts.lato(
    fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black);

final nameTextStyle = GoogleFonts.lato(
    fontSize: 19, fontWeight: FontWeight.w600, color: Colors.white);

final specialityTextStyle = GoogleFonts.lato(
    fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white54);

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
    ElementOfMenu("Address", "ensure you having adress", Icons.add_location,
        Colors.deepPurpleAccent),
    ElementOfMenu("Privacy", "system premision change", Icons.vpn_key_rounded,
        Colors.purpleAccent),
    ElementOfMenu("General", "basic functional setting", Icons.apps_sharp,
        Colors.orangeAccent),
    ElementOfMenu("Notifications", "take over the new in time", Icons.warning,
        Colors.lightBlueAccent)
  ];

  UserProfile({Key? key}) : super(key: key);

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
              style: scafoldTextStyle,
            ),
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _BlueContainerWithUserInfoWidget(elements: elements),
            FunctionalWidget(functionalRow: elementsFunc),
            MenuWidget(menuWidgetColumn: elementsMenu),
          ],
        ),
      ),
    );
  }
}

class _BlueContainerWithUserInfoWidget extends StatelessWidget {
  const _BlueContainerWithUserInfoWidget({
    Key? key,
    required this.elements,
  }) : super(key: key);

  final List<ElementOfStatistics> elements;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8,
              offset: Offset(2, 5), // Shado
            ),
          ],
        ),
        child: _UserPartWidget(elements: elements),
      ),
    );
  }
}

class _UserPartWidget extends StatelessWidget {
  const _UserPartWidget({
    Key? key,
    required this.elements,
  }) : super(key: key);

  final List<ElementOfStatistics> elements;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: FittedBox(
            child: Row(
              children: const [
                _UserPhotoWidget(),
                _UserInfoWidget(),
                _UserSecurityWidget(),
              ],
            ),
          ),
        ),
        InfoStatisticWidget(statisticColoumn: elements),
      ],
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
        padding: const EdgeInsets.only(bottom: 25, left: 7),
          child: const Icon(Icons.privacy_tip, color: Colors.white, size: 18));

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
            style: nameTextStyle,
          ),
        ),
        Text(
          'mobile app developer',
          style: specialityTextStyle,
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
          child: const Image(
            image: AssetImage(
                'assets/image/bb9f8b136eb644c92a08fa3f7637c03bYp9UjK_800.jpg'),
          ),
        ),
      ),
    );
  }
}
