/// Normalizes API responses by wrapping single objects as a list.
List<T> ensureList<T>(dynamic data, T Function(dynamic) parser) {
  if (data is List) {
    return data.map(parser).toList();
  } else if (data != null) {
    return [parser(data)];
  } else {
    return [];
  }
}
