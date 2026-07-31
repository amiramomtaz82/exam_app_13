sealed class ResetCodeEvents {}

class ResetCodeEvent extends ResetCodeEvents {
  final String code;

  ResetCodeEvent(this.code);
}

