class Endpoints {
  Endpoints._();

  static const String baseUrl = 'https://exam.elevateegy.com/';
  static const String loginEndPoint = "api/v1/auth/signin";
  static const String signUpEndPoint = 'api/v1/auth/signup';
  static const String signInEndPoint = 'api/v1/auth/signin';
  static const String forgetPasswordEndPoint ="api/v1/auth/forgotPassword";

      static const String resetCodeEndPoint ="api/v1/auth/verifyResetCode";
      static const String resetPasswordEndPoint ="api/v1/auth/resetPassword";

  static const String getAllSubjectEndPoint="api/v1/subjects";

  static const String getAllQuestionByExam="api/v1/questions";

}