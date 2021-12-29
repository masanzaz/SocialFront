import 'package:dating/src/features/gender/domain/models/gender_model.dart';

abstract class GenderRepository {
  Future<List<GenderModel>> getAllGenders();
}