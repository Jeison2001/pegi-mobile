class PropuestaIndex {
  final int index;

  PropuestaIndex({
    required this.index,
  });
  factory PropuestaIndex.desdeDoc(Map<String, dynamic> data) {
    return PropuestaIndex(
      index: data['index'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "index": index,
      };
}
