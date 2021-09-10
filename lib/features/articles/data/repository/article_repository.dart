import 'package:dartz/dartz.dart';
import 'package:nyt_app/core/AppStrings/error_strings.dart';
import 'package:nyt_app/core/Network/network_info.dart';
import 'package:nyt_app/core/error/exceptions.dart';
import 'package:nyt_app/core/error/failures.dart';
import 'package:nyt_app/features/articles/data/datasource/articles_remote_data_source.dart';
import 'package:nyt_app/features/articles/domain/entities/article.dart';
import 'package:nyt_app/features/articles/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NetworkInfo networkInfo;
  final ArticleRemoteDataSrouce remoteDataSrouce;
  ArticleRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSrouce,
  });

  @override
  Future<Either<Failure, List<Article>>> getMostPopularArticle(
      {required String type, required int days}) async {
    if (await networkInfo.isConnected()) {
      try {
        final remoteResult = await remoteDataSrouce.getMostPopularArticle(
            type: type, days: days);
        return Right(remoteResult.results);
      } on ServerException catch (e) {
        return Left(UnExpectedServerResponseFailure(e.message));
      } catch (e) {
        return Left(UnknownFailuer(message: e.toString()));
      }
    } else {
      return Left(InternetConnectionFailure(NO_INTERNET));
    }
  }

  @override
  Future<Either<Failure, List<Article>>> searchArticle(
      {required String query}) async {
    if (await networkInfo.isConnected()) {
      try {
        final remoteResult = await remoteDataSrouce.searchArticle(query: query);
        return Right(remoteResult.response.docs);
      } on ServerException catch (e) {
        return Left(UnExpectedServerResponseFailure(e.message));
      } catch (e) {
        return Left(UnknownFailuer(message: e.toString()));
      }
    } else {
      return Left(InternetConnectionFailure(NO_INTERNET));
    }
  }
}
