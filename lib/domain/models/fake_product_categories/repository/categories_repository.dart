import 'package:dartz/dartz.dart';

import '../categories.dart';

abstract class CategoriesRepository {
  Future<Either<String, Categories>> getCategories();
}