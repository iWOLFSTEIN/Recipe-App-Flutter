import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';

import 'api_tests/recipes_api.dart';

@GenerateMocks([Dio])
void main() {
  RecipesApis.startTesting();
}
