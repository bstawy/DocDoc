import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/dependency_injection.dart';
import '../../pages/appointment/ui/appointment_screen.dart';
import '../../pages/chat/ui/inbox_screen.dart';
import '../../pages/home/logic/home_cubit.dart';
import '../../pages/home/ui/home_screen.dart';
import '../../pages/profile/ui/profile_screen.dart';
import '../../pages/search/ui/search_screen.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(const LayoutState.initial());

  List<Widget> pages = [
    BlocProvider<HomeCubit>(
      create: (context) => getIt<HomeCubit>(),
      child: const HomeScreen(),
    ),
    const InboxScreen(),
    const SearchScreen(),
    const AppointmentScreen(),
    const ProfileScreen(),
  ];
  int currentPageIndex = 0;

  void changeLayoutState(int newIndex) {
    currentPageIndex = newIndex;
    emit(LayoutState.success(currentPageIndex));
  }
}
