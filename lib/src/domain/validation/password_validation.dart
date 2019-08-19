import 'package:kdayoff/src/domain/validation/validation.dart';

class PasswordValidation implements Validation {
  @override
  ValidationResult validate(String text) {
    ValidationResult validationResult;
    if (text.isEmpty) {
      validationResult = ValidationResult(false, "Password is required");
    } else if (text.length > 4) {
      validationResult = ValidationResult(true, null);
    } else {
      validationResult =
          ValidationResult(false, "Password should be more then 4 symbols");
    }
    return validationResult;
  }
}
