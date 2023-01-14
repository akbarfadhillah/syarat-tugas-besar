import 'package:appsi/ui/page/user/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/image/collection_controller.dart';
import '../../../controller/user_controller.dart';
import '../widget/app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context, title: 'Profile'),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<UserController>(builder: (context, user, child) {
        return Visibility(
            visible: user.isLogin,
            replacement: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(children: [
                    SizedBox(
                        width: 120,
                        height: 120,
                        child: CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            backgroundImage:
                                AssetImage('assets/images/1.jpg'))),
                  ]),
                  const Text(
                    'Anda Belum Login !!',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      user.login();
                    },
                    child: Text('Login'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                  )
                ],
              ),
            ),
            child: ProfileWidget());
      }),
    );
  }
}
