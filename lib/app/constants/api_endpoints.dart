class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeOut = Duration(seconds: 1000);
  static const Duration receiveTimeOut = Duration(seconds: 1000);
  // for android
  static const String baseUrl = "http://10.0.2.2:3000/api/v1/";
  // for iphone
  // static const String baseUrl = "http://localhost:3000/api/v1/";

  // ======== Auth ===============
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String uploadImage = "auth/uploadImage/";
  static const String getUser = "auth/";
  static const String updateUser = "auth/update/";

  static const String createFood = "foods";
  static const String deleteFood = "foods/";
  static const String getAllFood = "foods";
  static const String updateFood = "foods/";

  static const String createExercise = "exercises";
  static const String deleteExercise = "exercises/";
  static const String getAllExercise = "exercises";
  static const String updateExercise = "exercises/";

  static const String createProgress = "progess/update";
  // static const String deleteProgress = "progess/";
  static const String getAllProgress = "progress/";
  // static const String updateProgress = "progess/";
}
