library flutter_package_test;

class APICons {
  static String baseURL = "https://api.androidhive.info/volley/";
  static String PERSON_ARRAY = "person_array.json";
  static String STRING_RESPONSE = "string_response.html";

  ///  params.put("name", "Androidhive");
  ///                 params.put("email", "abc@androidhive.info");
  ///                 params.put("password", "password123");
}

class APIParams {
  static String NAME = "name";
  static String EMAIL = "email";
  static String PASSWORD = "password";
}

class KeyPreference {
  static String loginUser = "login_user";
}

class ErrorCode {
  static const int jsonError = -2;
  static const int networkError = -1;
  static const int success = 0;
  static const int tokenexpired = 3;
  static const int incorrectPassword = 16;
  static const int hasBannedWord = 68;
  static const int twitterLinkErr = 69;
  static const int facebookLinkErr = 70;
  static const int siteLinkErr = 71;
  static const int maintain = 500;
  static const int fullPushNotiList = 229;
  static const int emailNotFound = 6;
  static const int inCorrectPassword = 16;
  static const int invalidPassword = 17;
}
