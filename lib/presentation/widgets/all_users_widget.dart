import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ramdom_user/domain/entities/user_entity.dart';

import '../pages/home/home_page_controller.dart';

class AllUsersWidget extends ConsumerStatefulWidget {
  const AllUsersWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<AllUsersWidget> createState() => _AllUsersWidgetState();
}

class _AllUsersWidgetState extends ConsumerState<AllUsersWidget> {
  PagingController<int, UserEntity> _pagingController =
      PagingController<int, UserEntity>(firstPageKey: 0);

  int pageLimit = 10;

  @override
  void initState() {
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

  Widget build(BuildContext context) {
    return PagedGridView<int, UserEntity>(
      pagingController: _pagingController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
        crossAxisCount: 3,
        mainAxisExtent: 186,
      ),
      builderDelegate: PagedChildBuilderDelegate<UserEntity>(
        newPageProgressIndicatorBuilder: (context) =>
            const Center(child: Text("Carregando...")),
        firstPageProgressIndicatorBuilder: (context) =>
            const Center(child: Text("Carregando...")),
        itemBuilder: (context, user, index) => Text(user.email),
      ),
    );
  }
}