import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/presentation/bottom_bar/cubit/bottom_bar_cubit.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({Key? key}) : super(key: key);

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomBarCubit, BottomBarState>(
      listener: (context, state) {
        if (state is BottomBarInitial &&
            _controller.page != state.currentIndex) {
          _controller.animateToPage(state.currentIndex,
              duration: const Duration(milliseconds: 250),
              curve: Curves.linear);
        }
      },
      builder: (context, state) {
        if (state is BottomBarInitial) {
          return Scaffold(
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              children: context.read<BottomBarCubit>().listPage,
            ),
            bottomNavigationBar: state.isHidden
                ? null
                : BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.home_outlined),
                        activeIcon: const Icon(Icons.home),
                        label: MultiLanguage.of(context).home,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.cloud_upload_outlined),
                        activeIcon: const Icon(Icons.cloud_upload),
                        label: MultiLanguage.of(context).upload,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.library_books_outlined),
                        activeIcon: const Icon(Icons.library_books),
                        label: MultiLanguage.of(context).library,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.person_outline),
                        activeIcon: const Icon(Icons.person),
                        label: MultiLanguage.of(context).profile,
                      ),
                    ],
                    currentIndex: state.currentIndex,
                    selectedItemColor: mCPrimary,
                    unselectedItemColor: Colors.grey,
                    onTap: (i) => context.read<BottomBarCubit>().changePage(i),
                  ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
