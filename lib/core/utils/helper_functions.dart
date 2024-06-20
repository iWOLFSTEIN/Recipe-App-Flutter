String typeOf(dynamic variable) {
  if (variable is int) {
    return 'int';
  } else if (variable is double) {
    return 'double';
  } else if (variable is String) {
    return 'String';
  } else if (variable is bool) {
    return 'bool';
  } else if (variable is List) {
    return 'List';
  } else if (variable is Map) {
    return 'Map';
  } else if (variable is Set) {
    return 'Set';
  } else if (variable is DateTime) {
    return 'DateTime';
  } else if (variable is Duration) {
    return 'Duration';
  } else if (variable is Function) {
    return 'Function';
  } else if (variable == null) {
    return 'null';
  } else {
    return 'Unknown';
  }
}
