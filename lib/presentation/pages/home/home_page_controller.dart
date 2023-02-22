import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramdom_user/domain/entities/user_entity.dart';
import 'package:ramdom_user/domain/entities/user_response_entity.dart';
import 'package:ramdom_user/domain/usecases/get_users.dart' as get_users;

import '../../injector.dart';

final loaderStateProvider = StateProvider<bool>((ref) => false);

final usersListProvider = StateProvider<List<UserEntity>>((ref) => []);

final homePageControllerProvider =
    Provider.autoDispose<HomeScreenController>((ref) => HomeScreenController(
          ref,
          getUsersUsecase: Injector.getUsersUsecase,
        ));

class HomeScreenController {
  late ProviderRef ref;
  late get_users.GetUsers getUsersUsecase;

  static final HomeScreenController _singleton =
      HomeScreenController._internal();

  factory HomeScreenController(
    ProviderRef reference, {
    required get_users.GetUsers getUsersUsecase,
  }) {
    _singleton.ref = reference;
    _singleton.getUsersUsecase = getUsersUsecase;
    return _singleton;
  }

  HomeScreenController._internal();

  UserResponseEntity? responseEntity;

  reset() {
    responseEntity = null;
    ref.read(usersListProvider.notifier).state = [];
  }

  Future<List<UserEntity>> getUsers() async {
    ref.read(loaderStateProvider.notifier).state = true;

    List<UserEntity> usersList = [];
    try {
      responseEntity = await getUsersUsecase.execute();

      if (responseEntity!.users.isNotEmpty) usersList = responseEntity!.users;

      List<UserEntity> oldList = [
        ...ref.read(usersListProvider.notifier).state
      ];

      ref.read(usersListProvider.notifier).state = oldList..addAll(usersList);
      ref.read(loaderStateProvider.notifier).state = false;

      return usersList;
    } catch (e) {
      ref.read(loaderStateProvider.notifier).state = false;
      rethrow;
    }
  }
}
