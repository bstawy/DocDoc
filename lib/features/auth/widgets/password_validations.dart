import 'package:flutter/material.dart';

import '../../../core/config/theme/colors/light_color_scheme.dart';
import '../../../core/config/theme/texts/font_weight_helper.dart';
import '../../../core/config/theme/texts/text_styles.dart';
import '../../../core/helpers/extensions/extensions.dart';

class PasswordValidations extends StatelessWidget {
  final bool isPasswordEmpty;
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.isPasswordEmpty,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpace(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: isPasswordEmpty
                ? ColorsManager.lightGrey
                : hasValidated
                    ? Colors.green
                    : ColorsManager.red,
          ),
          child: Icon(
            Icons.check,
            color: hasValidated ? Colors.white : Colors.transparent,
            size: 8,
          ),
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font12DarkBlueMedium.copyWith(
            fontWeight: FontWeightHelper.regular,
          ),
        )
      ],
    );
  }
}
