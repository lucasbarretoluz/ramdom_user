import 'package:flutter/material.dart';

import '../../../domain/entities/user_entity.dart';

class UserPageDetail extends StatefulWidget {
  final UserEntity? user;
  const UserPageDetail({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _UserPageDetailState createState() => _UserPageDetailState();
}

class _UserPageDetailState extends State<UserPageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("DEV"),
        ),
      ),
    );
  }
}
