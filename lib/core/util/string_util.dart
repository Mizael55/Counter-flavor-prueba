extension StringExtension on String {
  String enumName() {
    List<String> paths = this.split(".");
    return paths[paths.length - 1];
  }

  String formatPhoneNumber() {
    if (this.isNullOrEmpty) return this;

    if (this.length > 2 && this.length <= 7) {
      return '${this.substring(0, 3)}-${this.substring(3)}';
    } else if (this.length > 7 && this.length <= 10) {
      return '${this.substring(0, 3)}-${this.substring(3, 6)}-${this.substring(6)}';
    } else {
      return this;
    }
  }

  String get capitalize {
    if (this == null) {
      throw ArgumentError("string: $this");
    }

    if (this.isEmpty) {
      return this;
    }

    return this[0].toUpperCase() + this.substring(1);
  }

  bool get isNullOrEmpty => this == null || this.isEmpty;

  bool get isNotNullOrNotEmpty => !this.isNullOrEmpty;

  DateTime toDate() => DateTime.parse(this);
}
