class ApiErrorModel {
  final String? message;

  const ApiErrorModel({
    this.message,
  });

  factory ApiErrorModel.fromMap(Map<String, dynamic> map) {
    return ApiErrorModel(
      message: map['details'],
    );
  }
  
  factory ApiErrorModel.fromString(String source) => ApiErrorModel(message: source);
}