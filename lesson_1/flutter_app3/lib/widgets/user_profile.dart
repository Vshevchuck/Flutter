import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.favorite, "Обране"),
    MenuRowData(Icons.call, "Дзвінки"),
    MenuRowData(Icons.computer, "Прилади"),
    MenuRowData(Icons.folder, "Папка з чатами")
  ];
  List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notifications, "Cповіщення"),
    MenuRowData(Icons.privacy_tip, "Конфидентсалність"),
    MenuRowData(Icons.date_range, "Данні та память"),
    MenuRowData(Icons.brush, "Оформлення"),
    MenuRowData(Icons.language, "Мова")
  ];

  UserProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Налаштування'),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blueGrey,
          //maximum allowable width
          width: double.infinity,

          child: Column(
            //column in center
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _UserInfo(),
              SizedBox(height: 25),
              _MenuWidget(menuRow: firstMenuRow),
              SizedBox(height: 25),
              _MenuWidget(menuRow: secondMenuRow),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserNickNameWiget extends StatelessWidget {
  const _UserNickNameWiget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'vlad_shepa',
      style: TextStyle(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _UserPhoneWiget extends StatelessWidget {
  const _UserPhoneWiget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '+380688110424',
      style: TextStyle(
        color: Colors.white70,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _UserNameWiget extends StatelessWidget {
  const _UserNameWiget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Шевчук Владислав',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white38,
      width: double.infinity,
      child: Column(
        children: const [
          SizedBox(height: 20),
          _AvatarWiget(),
          /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Шевчук Владислав'),
              ),*/
          SizedBox(height: 20),
          _UserNameWiget(),
          SizedBox(height: 10),
          _UserPhoneWiget(),
          SizedBox(height: 10),
          _UserNickNameWiget(),
        ],
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;

  MenuRowData(this.icon, this.text);
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;

  const _MenuWidget({Key? key, required this.menuRow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white54,
      width: double.infinity,
      //padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      //width: double.infinity,
      child: Column(
        children: menuRow.map((data) => _MenuWigetsRows(data: data)).toList(),
      ),
    );
  }
}

class _MenuWigetsRows extends StatelessWidget {
  final MenuRowData data;

  const _MenuWigetsRows({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(data.icon),
          SizedBox(width: 15),
          Expanded(
              child: Text(data.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ))),
          Icon(Icons.chevron_right_sharp)
        ],
      ),
    );
  }
}

class _AvatarWiget extends StatelessWidget {
  const _AvatarWiget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image(
          image: AssetImage(
              'assets/image/bb9f8b136eb644c92a08fa3f7637c03bYp9UjK_800.jpg'),
        ),
      ),
    );
  }
}
