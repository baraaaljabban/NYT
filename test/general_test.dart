import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nyt_app/core/error/exceptions.dart';
import 'package:nyt_app/features/articles/data/Model/article_most_popular_response.dart';
import 'package:nyt_app/features/articles/data/repository/article_repository.dart';

import 'core/Network/network_info_test.mocks.dart';
import 'features/artilces/data/datasource/remote_data_srouce_test.mocks.dart';

void main() {
  late ArticleRepositoryImpl repository;
  late MockArticleRemoteDataSrouce mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockArticleRemoteDataSrouce();
    mockNetworkInfo = MockNetworkInfo();
    repository = ArticleRepositoryImpl(
      remoteDataSrouce: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected()).thenAnswer((_) async => true);
      });

      body();
    });
  }

  group('getMostPopularArticle', () {
    final responseModel = ArticleMostPopularResponse(results: []);
    final response = responseModel;

    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected()).thenAnswer((_) async => true);
        // act
        repository.getMostPopularArticle(type: "emailed", days: 7);
        // assert
        verify(mockNetworkInfo.isConnected());
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getMostPopularArticle(
                  type: "emailed", days: 7))
              .thenAnswer((_) async => responseModel);
          // act
          final result =
              await repository.getMostPopularArticle(type: "emailed", days: 7);
          // assert
          verify(mockRemoteDataSource.getMostPopularArticle(
              type: "emailed", days: 7));
          expect(result, equals(response));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getMostPopularArticle(type: "", days: 2))
              .thenThrow(ServerException(message: ""));
          // act
          final result =
              await repository.getMostPopularArticle(type: "", days: 2);
          // assert
          verify(mockRemoteDataSource.getMostPopularArticle(type: "", days: 2));
          expect(result, equals(Left(UnExpectedServerResponseException)));
        },
      );
    });
  });

  group('getMostPopularArticle', () {
    ArticleMostPopularResponse responseModel =
        ArticleMostPopularResponse(results: []);
    final response = responseModel;

    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected()).thenAnswer((_) async => true);
        // act
        repository.getMostPopularArticle(days: 7, type: "emailed");
        // assert
        verify(mockNetworkInfo.isConnected());
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getMostPopularArticle(
                  days: 7, type: "emailed"))
              .thenAnswer((_) async => responseModel);
          // act
          final result =
              await repository.getMostPopularArticle(days: 7, type: "emailed");
          // assert
          verify(mockRemoteDataSource.getMostPopularArticle(
              days: 7, type: "emailed"));
          expect(result, equals(response));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getMostPopularArticle(
                  days: 7, type: "emailed"))
              .thenAnswer((_) async => responseModel);
          // act
          await repository.getMostPopularArticle(days: 7, type: "emailed");
          // assert
          verify(mockRemoteDataSource.getMostPopularArticle(
              days: 7, type: "emailed"));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getMostPopularArticle(
                  days: 7, type: "emailed"))
              .thenThrow(ServerException(message: ""));
          // act
          final result =
              await repository.getMostPopularArticle(days: 7, type: "emailed");
          //  assert
          verify(mockRemoteDataSource.getMostPopularArticle(
              days: 7, type: "emailed"));
          expect(result, equals(Left(UnExpectedServerResponseException)));
        },
      );
    });
  });
}
