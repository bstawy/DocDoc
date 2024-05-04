import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/dependency_injection.dart';
import '../../pages/appointment/ui/appointment_screen.dart';
import '../../pages/home/logic/home_cubit.dart';
import '../../pages/home/ui/home_screen.dart';
import '../../pages/inbox/ui/inbox_screen.dart';
import '../../pages/profile/ui/profile_screen.dart';
import '../../pages/search/ui/search_screen.dart';
import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(const LayoutStates.initial());

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

  void changePage(int newIndex) {
    currentPageIndex = newIndex;
    emit(LayoutStates.success(currentPageIndex));
  }
}
