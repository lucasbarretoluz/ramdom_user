import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ramdom_user/domain/entities/user_entity.dart';

import '../pages/home/home_page_controller.dart';
import 'user_card_widget.dart';

class AllUsersWidget extends ConsumerStatefulWidget {
  const AllUsersWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<AllUsersWidget> createState() => _AllUsersWidgetState();
}

class _AllUsersWidgetState extends ConsumerState<AllUsersWidget> {
  final PagingController<int, UserEntity> _pagingController =
      PagingController<int, UserEntity>(firstPageKey: 0);

  int pageLimit = 10;
  late String showGender;

  @override
  void initState() {
    showGender = ref.read(userGender.notifier).state;
    init();
    super.initState();
  }

  Future<void> init() async {
    if (mounted) {
      List<UserEntity> cachedUsers = ref.read(usersListProvider.notifier).state;

      if (cachedUsers.isNotEmpty) _pagingController.itemList = cachedUsers;

      _pagingController.addPageRequestListener((pageKey) async {
        await _fetchPage(pageKey);
      });
    }
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final List<UserEntity> newUsers =
          await ref.read(homePageControllerProvider).getUsers();
      bool isLastPage = newUsers.length < pageLimit;

      if (isLastPage) {
        _pagingController.appendLastPage(newUsers);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newUsers, nextPageKey);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  ref.read(userGender.notifier).state = "female";
                  showGender = ref.read(userGender.notifier).state;
                  _pagingController.notifyListeners();
                },
                child: const Text("Female")),
            ElevatedButton(
                onPressed: () {
                  ref.read(userGender.notifier).state = "both";
                  showGender = ref.read(userGender.notifier).state;
                  _pagingController.notifyListeners();
                },
                child: const Text("Both")),
            ElevatedButton(
                onPressed: () {
                  ref.read(userGender.notifier).state = "male";
                  showGender = ref.read(userGender.notifier).state;
                  _pagingController.notifyListeners();
                },
                child: const Text("Male"))
          ],
        ),
        Expanded(
          child: PagedListView<int, UserEntity>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<UserEntity>(
              itemBuilder: (context, user, index) => UserCard(
                userGender: showGender,
                user: user,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
