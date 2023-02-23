import 'package:flutter/material.dart';
import 'package:ramdom_user/domain/entities/user_entity.dart';

class UserCard extends StatelessWidget {
  final String userGender;
  final UserEntity user;

  const UserCard({
    super.key,
    required this.userGender,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    bool showUser = false;

    if (userGender == 'both') {
      showUser = true;
    } else if (user.gender == userGender) {
      showUser = true;
    } else if (user.gender == userGender) {
      showUser = true;
    }

    return showUser == true
        ? GestureDetector(
           onTap: () => Navigator.of(context)
                    .pushNamed('/userDetail', arguments: {'userDetail': user}),
          child: ListTile(
              leading: CircleAvatar(child: Image.network(user.imageUrl.medium)),
              title: Text('${user.name.first} ${user.name.last}'),
              subtitle: Text(user.email),
              trailing: IconButton(
                  onPressed: (() {
                    Navigator.of(context).pushNamed('/userDetail',
                        arguments: {'userDetail': user});
                  }),
                  icon: const Icon(Icons.arrow_circle_right)),
            ),
        )
        : Container();
  }
}
