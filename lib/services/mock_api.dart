class MockApiService {
  static Future<void> submitAnswers({
    required String name,
    required String favoriteColor,
    required int programmingLanguagesKnown,
    required String frameworkWorkedWith,
  }) async {
    // Simulating API call
    await Future.delayed(const Duration(seconds: 2));

    // Simulating success response
    print('API Response: Success');
  }
}
