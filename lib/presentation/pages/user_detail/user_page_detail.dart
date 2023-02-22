import 'package:flutter/material.dart';

import '../../../domain/entities/user_entity.dart';

class UserPageDetail extends StatefulWidget {
  final UserEntity user;
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
      appBar: AppBar(
        title: const Text("Details Person"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(widget.user.imageUrl.large),
              ),
              _layoutInfo("Name",
                  "${widget.user.name.first} ${widget.user.name.last}"),
              _layoutInfo("Gender", widget.user.gender),
              _layoutInfo(
                "Location",
                "${widget.user.location.street.name}, ${widget.user.location.street.number}. ${widget.user.location.city}, ${widget.user.location.state}, ${widget.user.location.coutry} ",
              ),
              _layoutInfo("E-mail", widget.user.email),
              _layoutInfo("Nationality", widget.user.nat),
              _layoutInfo("Phone", widget.user.phone),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _layoutInfo(String option, String value) {
    return ListTile(
      minVerticalPadding: 1,
      title: Text(option),
      subtitle: Text(value),
    );
  }
}
