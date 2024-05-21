import 'package:docdoc/features/pages/appointment/ui/widgets/finished_appointment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/theme/colors/colors_manager.dart';
import '../../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../../core/config/theme/texts/text_styles.dart';
import '../../../layout/logic/layout_cubit.dart';
import '../../widgets/custom_app_bar_widget.dart';
import '../data/models/appointment_model.dart';
import '../logic/appointments_cubit.dart';
import '../logic/appointments_states.dart';
import 'widgets/upcoming_appointment_widget.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        context.read<LayoutCubit>().changePage(0);
      },
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const CustomAppBar(
              title: "My Appointments",
              actionIcon: Icon(Icons.search),
            ),
            Gap(24.h),
            TabBar(
              labelStyle: TextStyles.font14DarkBlueMedium.copyWith(
                color: ColorsManager.mainBlue,
                fontWeight: FontWeightHelper.bold,
              ),
              unselectedLabelColor: ColorsManager.lightGrey,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              dividerHeight: 3,
              dividerColor: ColorsManager.lighterGrey,
              tabs: const [
                Tab(text: "Upcoming"),
                Tab(text: "Completed"),
                Tab(text: "Cancelled"),
              ],
            ),
            BlocBuilder<AppointmentsCubit, AppointmentsStates>(
              bloc: context.read<AppointmentsCubit>()..getAppointments(),
              builder: (context, state) {
                return state.whenOrNull(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      success: (appointmentsData) => Expanded(
                        child: TabBarView(
                          children: [
                            _buildUpcomingAppointments(appointmentsData),
                            _buildCompletedAppointments(appointmentsData),
                            _buildCancelledAppointments(appointmentsData),
                          ],
                        ),
                      ),
                    ) ??
                    const SizedBox(
                      child: Text("Error"),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingAppointments(List<AppointmentModel> appointments) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        return UpcomingAppointmentWidget(
          appointment: appointments[index],
        );
      },
    );
  }

  Widget _buildCompletedAppointments(List<AppointmentModel> appointments) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        return FinishedAppointmentWidget(
          appointment: appointments[index],
          isDone: true,
        );
      },
    );
  }

  Widget _buildCancelledAppointments(List<AppointmentModel> appointments) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        return FinishedAppointmentWidget(
          appointment: appointments[index],
        );
      },
    );
  }
}
