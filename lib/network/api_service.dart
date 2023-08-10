import 'dart:io';

import 'package:dio/dio.dart';
import 'package:untitled/models/company_detail.dart';
import 'package:untitled/models/company_model.dart';
import 'package:untitled/models/country_model.dart';
import 'package:untitled/models/result_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Result<List<CountryModel>>> getCountries() async {
    String url = 'https://easyenglishuzb.free.mockoapp.net/countries';
    try {
      final response = await _dio.get(url);
      if (response.statusCode == HttpStatus.ok) {
        return Result.success(
            (response.data['data']['countries'] as List).map((e) => CountryModel.fromJson(e)).toList());
      }
      return Result.fail('Error: Status code is not equal to 200');
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  Future<Result<List<CountryModel>>> getCompanies() async {
    String url = 'https://easyenglishuzb.free.mockoapp.net/companies';
    try {
      final response = await _dio.get(url);
      if (response.statusCode == HttpStatus.ok) {
        return Result.success((response.data['data'] as List).map((e) => CompanyModel.fromJson(e)).toList());
      }
      return Result.fail('Error: Status code is not equal to 200');
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  Future<Result<CountryModel>> getCompanyDetail(int id) async {
    String url = 'https://easyenglishuzb.free.mockoapp.net/companies/$id';
    try {
      final response = await _dio.get(url);
      if (response.statusCode == HttpStatus.ok) {
        return Result.success(CompanyDetailModel.fromJson(response.data));
      }
      return Result.fail('Error: Status code is not equal to 200');
    } catch (e) {
      return Result.fail(e.toString());
    }
  }
}
