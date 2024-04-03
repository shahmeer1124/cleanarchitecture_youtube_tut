import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testproj/core/errors/exceptions.dart';
import 'package:testproj/core/utils/constants.dart';
import 'package:testproj/src/unbored/data/models/bored_data_model.dart';
import 'package:testproj/src/unbored/domain/entities/bored.dart';

abstract class BoredLocalDataSource {
  BoredLocalDataSource();
  Future<LocalBoredModel> getMessage();
}

class BoredRemoteDataSourceImpl implements BoredLocalDataSource {
  BoredRemoteDataSourceImpl({required http.Client client}) : _client = client;
  final http.Client _client;
  @override
  Future<LocalBoredModel> getMessage() async {
    try {
      final response = await _client.get(Uri.parse(kApiPath));
      if (response.statusCode == 200) {
        final decodedData =
            await jsonDecode(response.body) as Map<String, dynamic>;
        return BoredDataModel.fromJson(decodedData);
      } else {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }
    } on Exception {
      throw const ServerException(
          message: 'Server not responding please try again later',
          statusCode: 500,);
    }
  }
}
