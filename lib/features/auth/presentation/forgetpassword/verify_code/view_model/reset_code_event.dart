sealed class ResetCodeEvents {}

class ResetCodeEvent extends ResetCodeEvents {
  final String code;

  ResetCodeEvent(this.code);
}



class ClearWrongCodeEvent extends ResetCodeEvents {}
class ShowWrongCodeEvent extends ResetCodeEvents {}

