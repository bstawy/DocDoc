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
    final LayoutCubit layoutCubit = context.read<LayoutCubit>();
    return BlocBuilder<LayoutCubit, LayoutState>(
      bloc: context.read<LayoutCubit>(),
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: state.whenOrNull(
              initial: () {
                return layoutCubit.pages[0];
              },
              success: (index) {
                return layoutCubit.pages[index];
              },
            ),
            floatingActionButton: const FloatingActionButtonWidget(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            bottomNavigationBar: const BottomNavBarWidget(),
          ),
        );
      },
    );
  }
}
