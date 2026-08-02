sealed class ResetPasswordEvents{


}

class ResetPasswordEvent extends ResetPasswordEvents{

  String email;
  String newPassword;
  ResetPasswordEvent(this.email,this.newPassword);
}