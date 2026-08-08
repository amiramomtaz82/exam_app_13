sealed class AuthIntent {
  const AuthIntent();
}

class SigninIntent extends AuthIntent {
  final String email;
  final String password;

  const SigninIntent({
    required this.email,
    required this.password,
  });
}

class SignupIntent extends AuthIntent {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  const SignupIntent({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });
}
