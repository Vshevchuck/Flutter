import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Налаштування'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        color: Colors.green,
        //maximum allowable width
        width: double.infinity,
        child: Column(
          //column in center
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _UserInfo(),
            SizedBox(height: 15),
            _MenuWidget(),
          ],
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
        color: Colors.grey,
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
        color: Colors.grey,
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

class _MenuWidget extends StatelessWidget {
  const _MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white54,
      width: double.infinity,
      //padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      //width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.favorite_outline),
                SizedBox(width: 15),
                Expanded(
                    child: Text("Обране",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )
                    )
                ),
                Icon(Icons.chevron_right_sharp)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.call),
                SizedBox(width: 15),
                Expanded(
                    child: Text("Дзвінки",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )
                    )
                ),
                Icon(Icons.chevron_right_sharp)
              ],
            ),
          ),
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
      child: Placeholder(),
    );
  }
}
