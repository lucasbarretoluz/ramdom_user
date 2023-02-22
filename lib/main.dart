import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramdom_user/presentation/pages/home/home_page.dart';

import 'presentation/pages/user_detail/user_page_detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'request Users api',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/userDetail') {
          final Map<String, dynamic> value =
              settings.arguments as Map<String, dynamic>; 
          return MaterialPageRoute(
            builder: (_) => UserPageDetail(
              user: value['userDetail'],
            ),
          );
        }
        return null;
      },
      routes: {
        '/home': (context) => const HomePage(),
      },
    );
  }
}
