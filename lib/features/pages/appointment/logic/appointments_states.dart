import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/appointment_model.dart';

part 'appointments_states.freezed.dart';

@freezed
class AppointmentsStates with _$AppointmentsStates {
  const factory AppointmentsStates.initial() = _Initial;
  const factory AppointmentsStates.loading() = Loading;
  const factory AppointmentsStates.success(List<AppointmentModel> data) =
      Success;
  const factory AppointmentsStates.failure({required String error}) = Failure;
}
