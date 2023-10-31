class TextFieldValidation {
  TextFieldValidation._();

  static String? validation(
      {String? value,
      String? message,
      bool isCardValidator = false,
      bool isCardCvvValidator = false,
      bool isCardDateValidator = false,
      bool isEmailValidator = false,
      bool isPasswordValidator = false,
      bool isPhoneNumberValidator = false,
      bool isChangePasswordValidator = false,
        bool isPinCodeValidator = false,
      }) {
    if (value!.isEmpty) {
      return "$message is required!";
    }
    if (isPhoneNumberValidator == true) {
      if (value.isEmpty) {
        return "$message is required!";
      }else if(value.length!=10){
        return  "invalid Mobile Number!";
      }
    }

    if (isEmailValidator == true) {
      if (value.isEmpty) {
        return "$message is required!";
      } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
        return 'Enter Valid $message';
      }
    } else if (isPasswordValidator == true) {
      if (value.isEmpty) {
        return "$message is required!";
      } else if (!RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$").hasMatch(value)) {
        if (value.length < 6) {
          return 'Password must have at least 6 characters';
        } else if (!value.contains(RegExp(r'[A-Za-z]'))) {
          return 'Password must have at least one alphabet characters';
        } else if (!value.contains(RegExp(r'[0-9]'))) {
          return 'Password must have at least one number characters';
        }
      }
    }

    if (isCardValidator == true) {
      if (value.isEmpty) {
        return "$message is required!";
      } else if (value.length < 16) {
        return "Card number must be 16 character";
      }
    }

    if (isCardDateValidator == true) {
      if (value.isEmpty) {
        return "Date is required";
      }
      final DateTime now = DateTime.now();
      final List<String> date = value.split(RegExp(r'/'));
      final int month = int.parse(date.first);
      final int year = int.parse('20${date.last}');
      final int lastDayOfMonth = month < 12 ? DateTime(year, month + 1, 0).day : DateTime(year + 1, 1, 0).day;
      final DateTime cardDate = DateTime(year, month, lastDayOfMonth, 23, 59, 59, 999);

      if (cardDate.isBefore(now) || month > 12 || month == 0) {
        return "Date is wrong";
      }
    }

    if (isCardCvvValidator == true) {
      if (value.isEmpty) {
        return "$message is required!";
      } else if (value.length < 3) {
        return "Card number must be 3 character";
      }
    }

    if(isPinCodeValidator == true){
      if(value.isEmpty){
        return "$message is required!";
      }else if(value.length <6){
        return "Pincode number must be 6 Character";
      }
    }

    return null;
  }
}
