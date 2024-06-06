import 'package:equatable/equatable.dart';

final class RouteItem extends Equatable {
  /// Unique id to represent the index in bottom navigation bar
  final int? id;
  final String name;
  final String path;

  const RouteItem({this.id, required this.name, required this.path});

  @override
  List<Object?> get props => [name, path];
}
