/// A function that interleaves an iterable of words and an iterable of spaces.
List<T> interleaveArrays<T>(Iterable<T> a, Iterable<T> b) {
  var arr = <T>[];
  var observed = a.toList();
  var other = b.toList();
  var temp = <T>[];

  while (observed.isNotEmpty) {
    arr.add(observed.removeAt(0));
    temp = observed;
    observed = other;
    other = temp;
  }

  if (other.isNotEmpty) {
    arr += other;
  }
  return arr;
}
