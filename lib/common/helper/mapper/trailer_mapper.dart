import 'package:movie_app/core/entity/trailer_entity.dart';
import 'package:movie_app/core/model/trailer_mdel.dart';

class TrailerMapper {
  static TrailerEntity toEntity(TrailerModel trailerModel) {
    return TrailerEntity(
        id: trailerModel.id,
        name: trailerModel.name,
        key: trailerModel.key,
        site: trailerModel.site,
        type: trailerModel.type);
  }
}
