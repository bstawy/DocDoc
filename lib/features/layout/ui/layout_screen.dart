import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/layout_cubit.dart';
import '../logic/layout_state.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/floating_action_button.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      bloc: context.read<LayoutCubit>(),
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        debugPrint(state.toString());
        debugPrint(context.read<LayoutCubit>().currentPageIndex.toString());

        return Scaffold(
          body: state.whenOrNull(
            initial: () {
              return context.read<LayoutCubit>().pages[0];
            },
            success: (page) {
              return page;
            },
          ),
          floatingActionButton: const FloatingActionButtonWidget(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          extendBody: true,
          bottomNavigationBar: const BottomNavBarWidget(),
        );
      },
    );
  }
}
