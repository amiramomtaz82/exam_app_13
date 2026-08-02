

sealed class ForgetPasswordEvents {}

class ForgetPasswordEvent extends ForgetPasswordEvents {
  final String email;

  ForgetPasswordEvent(this.email);
}

class ResendCodeEvent extends ForgetPasswordEvents {
  final String email;

  ResendCodeEvent(this.email);
}