import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipes_app/features/recipes/data/models/recipes.dart';
import 'package:recipes_app/features/recipes/data/models/recipes_tags.dart';

import 'mock_apis_response.dart';
import 'unit_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  RecipesApis.startTesting();
}

class RecipesApis {
  static void startTesting() {
    _testMockRecipesApi();
    _testMockRecipesTagApi();
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

  static void _testMockRecipesTagApi() =>
      group('Recipes tags apis test with mockito', () {
        late MockDio mockDio;

        setUp(() {
          mockDio = MockDio();
        });

        test('Testing get recipes tags api', () async {
          // Mock server
          when(mockDio.get(any)).thenAnswer((_) async =>
              Response<List<dynamic>>(
                  data: recipesTags,
                  statusCode: 200,
                  requestOptions: RequestOptions(path: '/recipes/tags')));

          // Mock client
          final response = await mockDio.get('/recipes/tags');

          // Testing
          expect(RecipesTagsResponse.fromJson(response.data as List<dynamic>),
              RecipesTagsResponse.fromJson(recipesTags));
          verify(mockDio.get('/recipes/tags')).called(1);
        });
      });
}
