import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/all_users_widget.dart';

class HomePage extends ConsumerStatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: const AllUsersWidget(),
    );
  }
}