import 'package:equatable/equatable.dart';

final class RouteItem extends Equatable {
  final String name;
  final String path;

  const RouteItem({required this.name, required this.path});

  @override
  List<Object?> get props => [name, path];
}
