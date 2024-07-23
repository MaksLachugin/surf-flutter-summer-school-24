import 'dart:convert';

class CarouselState {
  int max;
  int current;
  CarouselState({
    required this.max,
    required this.current,
  });

  CarouselState copyWith({
    int? max,
    int? current,
  }) {
    return CarouselState(
      max: max ?? this.max,
      current: current ?? this.current,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'max': max,
      'current': current,
    };
  }

  factory CarouselState.fromMap(Map<String, dynamic> map) {
    return CarouselState(
      max: map['max']?.toInt() ?? 0,
      current: map['current']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarouselState.fromJson(String source) =>
      CarouselState.fromMap(json.decode(source));

  @override
  String toString() => 'CarouselState(max: $max, current: $current)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CarouselState &&
        other.max == max &&
        other.current == current;
  }

  @override
  int get hashCode => max.hashCode ^ current.hashCode;
}
