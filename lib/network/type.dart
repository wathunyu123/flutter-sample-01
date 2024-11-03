enum ContentType {
  json,
}

extension ContentTypeExtension on ContentType {
  String toTextCT() {
    switch (this) {
      case ContentType.json:
        return 'application/json';
    }
  }
}
