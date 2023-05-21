class Rotation {
  const Rotation({
    this.rotate = false,
    this.angle = 0.0,
  });
  
  final bool rotate;
  final double angle;

  Rotation copyWith({
    bool? rotate,
    double? angle,
  }) {
    return Rotation(
      rotate: rotate ?? this.rotate,
      angle: angle ?? this.angle,
    );
  }

  @override
  String toString() {
    return "Rotation (angle: $angle, rotate: $rotate)";
  }
}