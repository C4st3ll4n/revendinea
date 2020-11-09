import 'package:parse_server_sdk/parse_server_sdk.dart';

const kCategoryTable = "Categories";
const kCategoryId = "objectId";
const kCategoryDescription = "description";

class Category {
  final String id;
  final String description;

  Category(this.id, this.description);

  Category.fromParse(ParseObject parseObject)
      : id = parseObject.objectId,
        description = parseObject.get(kCategoryDescription);

  @override
  String toString() {
    return 'Category{id: $id, description: $description}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          description == other.description;

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}
