import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/appointments_repo.dart';
import 'appointments_states.dart';

class AppointmentsCubit extends Cubit<AppointmentsStates> {
  final AppointmentsRepo _appointmentsRepo;

  AppointmentsCubit(this._appointmentsRepo)
      : super(const AppointmentsStates.initial());

  void getAppointments() async {
    emit(const AppointmentsStates.loading());

    final response = await _appointmentsRepo.getAppointments();

    response.when(
      success: (response) {
        emit(AppointmentsStates.success(response));
      },
      failure: (error) {
        emit(
          AppointmentsStates.failure(error: error.apiErrorModel.message ?? ""),
        );
      },
    );
  }
}
