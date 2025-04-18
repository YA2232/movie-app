import 'package:dartz/dartz.dart';

abstract class TvRepo {
  Future<Either> getTvPopular();
  Future<Either> searchTv(String query);
}
