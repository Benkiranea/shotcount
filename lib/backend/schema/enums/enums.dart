import 'package:collection/collection.dart';

enum TestimonialSelection {
  Google,
  Yelp,
  Trustpilot,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (TestimonialSelection):
      return TestimonialSelection.values.deserialize(value) as T?;
    default:
      return null;
  }
}
