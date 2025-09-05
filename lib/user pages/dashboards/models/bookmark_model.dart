import 'package:flutter/material.dart';

class BookmarkModel {
  final String title;
  final String content;
  final List<Color> gradient;
  final String? additionalText;
  final String? imageUrl;
  final DateTime createdAt;

  const BookmarkModel({
    required this.title,
    required this.content,
    required this.gradient,
    this.additionalText,
    this.imageUrl,
    required this.createdAt,
  });

  factory BookmarkModel.fromJson(Map<String, dynamic> json) {
    return BookmarkModel(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      gradient: (json['gradient'] as List<dynamic>)
          .map((color) => Color(color))
          .toList(),
      additionalText: json['additionalText'],
      imageUrl: json['imageUrl'],
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'gradient': gradient.map((color) => color.value).toList(),
      'additionalText': additionalText,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  BookmarkModel copyWith({
    String? title,
    String? content,
    List<Color>? gradient,
    String? additionalText,
    String? imageUrl,
    DateTime? createdAt,
  }) {
    return BookmarkModel(
      title: title ?? this.title,
      content: content ?? this.content,
      gradient: gradient ?? this.gradient,
      additionalText: additionalText ?? this.additionalText,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BookmarkModel &&
        other.title == title &&
        other.content == content &&
        other.additionalText == additionalText;
  }

  @override
  int get hashCode {
    return title.hashCode ^ content.hashCode ^ additionalText.hashCode;
  }

  @override
  String toString() {
    return 'BookmarkModel(title: $title, content: $content, additionalText: $additionalText)';
  }
} 