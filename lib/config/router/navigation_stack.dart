import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/config/router/app_router.dart';

class NavigationStack {
  final List<int> _ids = [];
  int previous = -1;
  int next = -1;
  bool isPopAction = false;

  void add({required int previous, required int next}) {
    _ids.add(previous);
    this.previous = previous;
    this.next = next;
  }

  void removeLast() {
    final removed = _ids.removeLast();
    previous = next;
    next = removed;
  }

  bool get isEmpty => _ids.isEmpty;

  Future<int?> push(BuildContext context,
      {required String destinationPath,
      required int currentId,
      required int destinationId}) async {
    isPopAction = false;
    add(previous: currentId, next: destinationId);
    final int? poppedIndex = await context.push(destinationPath);
    if (AppRouter.navigationStack.isEmpty || poppedIndex == null) {
      return null;
    }
    return next;
  }

  void pop(BuildContext context, {required int? currentId}) {
    isPopAction = true;
    removeLast();
    context.pop(currentId);
  }
}
