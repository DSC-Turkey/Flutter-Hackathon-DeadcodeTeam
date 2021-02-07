class APIEndpoints {
  static const String _BASE_URL =
      "https://deadcode-hackathon-default-rtdb.firebaseio.com";

  static const String _BASE_KEY = "0JjzW52KHN3hJNYmFv3qNJ1zVFID8AEWS1ZiUfre";

  static const String USERS_API = _BASE_URL + "/users.json?auth=" + _BASE_KEY;
}
