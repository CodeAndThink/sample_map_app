class Highlight {
  int start;
  int end;

  Highlight({required this.start, required this.end});

  factory Highlight.fromJson(Map<String, dynamic> json) {
    return Highlight(
      start: json['start'],
      end: json['end'],
    );
  }

  Map<String, dynamic> toJson() => {
        'start': start,
        'end': end,
      };
}
