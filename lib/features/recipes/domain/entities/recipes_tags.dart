import 'package:equatable/equatable.dart';

class RecipesTagsResponseEntity extends Equatable {
  final List<String>? tags;

  const RecipesTagsResponseEntity({this.tags});

  @override
  List<Object?> get props => [tags];
}
