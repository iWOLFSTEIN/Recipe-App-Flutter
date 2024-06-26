import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipes_app/features/recipes/data/models/recipes.dart';

import 'mock_apis_response.dart';
import 'unit_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  RecipesApis.startTesting();
}

class RecipesApis {
  static void startTesting() {
    _testMockRecipesApi();
  }

  static void _testMockRecipesApi() =>
      group('Recipes apis test with mockito', () {
        late MockDio mockDio;

        setUp(() {
          mockDio = MockDio();
        });

        test('Testing get recipes api', () async {
          // Mock server
          when(mockDio.get(any)).thenAnswer((_) async => Response(
              data: recipes,
              statusCode: 200,
              requestOptions: RequestOptions(path: '/recipes')));

          // Mock client
          final response = await mockDio.get('/recipes');

          // Testing
          expect(
              RecipesResponse.fromJson(response.data as Map<String, dynamic>),
              RecipesResponse.fromJson(recipes));
          verify(mockDio.get('/recipes')).called(1);
        });
      });
}
