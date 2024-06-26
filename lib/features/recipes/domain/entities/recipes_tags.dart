import 'package:equatable/equatable.dart';

class RecipesTagsResponseEntity extends Equatable {
  final List<dynamic>? tags;

  const RecipesTagsResponseEntity({this.tags});

  @override
  List<Object?> get props => [tags];
}
