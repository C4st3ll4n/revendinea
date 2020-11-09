import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:revendinea/src/model/Category.dart';
import 'package:revendinea/src/repository/interface/ICategoryRepository.dart';
import 'package:revendinea/src/shared/parse_errors.dart';

class CategoryRepository implements ICategoryRepository {
  @override
  Future<List<Category>> getList() async {
    final QueryBuilder queryBuilder = QueryBuilder(
      ParseObject(
        kCategoryTable,
      ),
    );

    final response = await queryBuilder.query();

    if (response.success) {
      return response.results.map((obj) => Category.fromParse(obj)).toList();
    } else {
      return [];
    }
    //throw ParseErrors.getDescription(response.error.code);
    throw Exception(ParseErrors.getDescription(response.error.code));
  }
}
