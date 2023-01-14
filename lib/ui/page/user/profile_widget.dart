import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/image/collection_controller.dart';
import '../../../controller/user_controller.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(30),
      width: MediaQuery.of(context).size.width,
      child: Consumer<UserController>(builder: (context, user, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              SizedBox(
                  width: 120,
                  height: 120,
                  child: CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: AssetImage('assets/images/1.jpg'))),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: FloatingActionButton.small(
                      backgroundColor: Colors.teal,
                      heroTag: const Key('home'),
                      onPressed: () {},
                      child: const Icon(Icons.edit, color: Colors.white)))
            ]),
            const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Mochammad Akbar F',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            Text(
              'Human',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.grey.shade500),
            ),
            const SizedBox(
              height: 30,
            ),
            listTile('My Membership', Icons.star_border_outlined),
            const Divider(),
            Consumer<CollectionController>(
              builder: (context, value, child) {
                return listTile('My Collection (${value.myCollection.length})',
                    Icons.bookmark_outline);
              },
            ),
            const Divider(),
            Consumer<CollectionController>(
              builder: (context, value, child) {
                return listTile('Likes (${value.myLikes.length})', Icons.mood);
              },
            ),
            const Divider(),
            InkWell(
                onTap: () => user.logout(),
                child: listTile('Logout', Icons.logout, color: Colors.red)),
          ],
        );
      }),
    );
  }

  ListTile listTile(
    String title,
    IconData icon, {
    Color color = Colors.black,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 14,
      ),
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
