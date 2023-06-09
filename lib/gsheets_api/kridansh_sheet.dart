import 'package:flutter/foundation.dart';
import 'package:gsheets/gsheets.dart';
import '../models/youtube.dart';

/*
@KridanshSheetApi contains functions for getting the database google sheet named @Kridansh_23_App_Database
Reference Link - https://docs.google.com/spreadsheets/d/1ZYPfBc8x5r-QMnt0iKoJ_HAJ3VCKFQOCfDB8ySRWIQA/edit#gid=0
 */
class KridanshSheetApi {
  // Initialising the credentials from the json file downloaded from the google cloud console after enabling @Google Sheets API
  static const _credentials = r''' 
  {
  "type": "service_account",
  "project_id": "kridansh-23-app",
  "private_key_id": "06fe6a9f4972700820fe9eac388bdd683ae18021",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCjfV58qUOda8US\n64Af38EzfZfZEbEgU4NidmhaV8/kTMGMUYQXRaxqOJ2Gyrm4U4sjPUfzJcMASXuR\nbHIdxRG0+5qUFdES/91m9/zxEcpi51CTff4ooZQVa5/AFICj2ELVc7zc8+6aGBzS\n2NJt/WCeiZtjKiHMwnvDPJTzm1fJ3otyTqBH0Yv5SiHM79W2a+zKj94gBOtZGakx\n1VTzGNxZU7Ch5SY1XUiYtY3ye8skxFThhjDYyyWdQc3syMwpm/7s8tq3Ot3cUucu\nIRpiB1n9qgqDU/SX6N0N+GpwQWBE5kfkStzhAFnt7uTv4apNxii6d1x5JuaTnD08\n21stmZgnAgMBAAECggEAD9aBKkjIJ5O9S41r4+qXD/1pPJqa/aY0J/w6NLz6re5a\nS6pz8Os2KN4jiIooFA69KmSb4pa0aC6LiCAo1/BzkYRUSmc9/Kiz0pn7M4FaiVqe\nSC41n8sItPXa9nkl/c62qXClCa9J3JIHF3fwvr4D4lKIrpfHdCDHwOH5Y2DCUD2/\n7HaDJe1DlQiwJjmPZn381JpLzi/5QKvLt442d84dzHtQbaisSF+dKUb4XmRo6ZJB\nOLTzIN6jISkr4WzkQC+HEv46Fh0ZjWl5BiLTpHVPQgQ2g1DK8bqvQZix5aM9LHGS\nty+UyhOzT8hjoJK7ppWV1Ukuib0P9VKJoClylUBB4QKBgQDgVgrGZ2CKpQIVFEky\n0pNDlHdFvcdtQnWIybHgILRUUbeKC3hmWsRtrkh7ssQeisrVd5R7Kqt1NbOazQPD\nXvJaR2WiXEWQX3NCoum4bU241k5wK6MuMMt/Ebwi9C5TFJTM0zDpnqunueyZKV50\n3vNnGTH85UN8w/3i2xOdwGI+hwKBgQC6kMJKc9foUvXHJ8AyFFF+firN8+MErb2T\nE396ThJKKh8RUZH9T149C2r7aW0sT1TGl1HyFyH3oqmjLRJhBUYAuNO4eP2psqYx\nUzHF+IfiFiQvcmDaMYcermiWSb1qF0E0SKx9S94UM1zIdCcrrO/kgd2xBMYCqFhB\nNL5xRsuhYQKBgQCv8cuxoBKPqqrfbXGbcpwdPKvu/tESWDVmewoPBpdoKk8Q7b4Y\nSMgWXcJrgeFfMuuyUH8bunOPEfczSefRqv3Y4HZNyKCmgrYbZTp5cwCqHyqVvyPU\nbmCr4HT11R0f+9xYaKrMD64BdkiiN1flwZaVHaWe+xDbIbxV2AyihOiIsQKBgFml\nY2apIW8GJglrZWPq9XnFoEXUUhqWbYh1jwSy7QDsGn+U5YSFla/Zg6+I6ienewHu\nBjdAvFakt8SrzLAH+6ovJbT3llPrfwYmhr0s/gY6Q2r1F+rgb5/jiGfmyPhocjFw\nVkniobStNYEwpv3KnH79lAwSUh9GyxmSAYymywQhAoGBANZK8RC58uOVSER+Inom\nmDlsGj4+UK715bkMlf3O7wa7oZVmHwrybyTMAvAQmAIWuV4xtLJdCgUtd6xdTsOi\n/Ff5ugQsbqfTVViW5zyd5uLMEMa5HPvPzQkaF6EOh0dozrHD/jhcM6ZuMMVpnnCS\nKqfWVXRLvWf81KJ5593fupYL\n-----END PRIVATE KEY-----\n",
  "client_email": "kridansh-23-app@kridansh-23-app.iam.gserviceaccount.com",
  "client_id": "111704217952554112894",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/kridansh-23-app%40kridansh-23-app.iam.gserviceaccount.com"
}

  ''';

  // Google sheets ID extracted from the Reference Link mentioned above.
  static const _spreadsheetId = '1ZYPfBc8x5r-QMnt0iKoJ_HAJ3VCKFQOCfDB8ySRWIQA';

  // Initialising the whole database sheet named @Kridansh_23_App_Database
  static final _kridanshSheets = GSheets(_credentials);

  // #################################################################################

  /*
  Youtube Sheet named @Youtube_Links which contains the youtube highlight links.
  @Function - {initYoutubeSheet} function gets the @Youtube_Links sheet and if its first row is empty then initialises it with youtube model fields.
  @Function - {_getWorksheet} is a private function that gets the sheet is not available created one.
  @Function - {getYoutubeById} gets a link by an id.
  @Function - {getAllYoutube} gets all youtube links.
   */
  static Worksheet? _youtubeSheet;

  static Future initYoutubeSheet() async {
    try {
      final spreadsheet = await _kridanshSheets.spreadsheet(_spreadsheetId);
      _youtubeSheet = await _getWorksheet(spreadsheet, title: 'Youtube_Links');
      final firstRow = YoutubeFields.getFields();
      _youtubeSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      if (kDebugMode) {
        print("Init error: $e");
      }
    }
  }

  static Future<Youtube?> getYoutubeById(int id) async {
    if (_youtubeSheet == null) return null;

    final json = await _youtubeSheet!.values.map.rowByKey(id, fromColumn: 1);

    return json == null ? null : Youtube.fromJson(json);
  }

  static Future<List<Youtube>> getAllYoutube() async {
    if (_youtubeSheet == null) return <Youtube>[];

    final youtubeLinks = await _youtubeSheet!.values.map.allRows();
    return youtubeLinks == null
        ? <Youtube>[]
        : youtubeLinks.map(Youtube.fromJson).toList();
  }

  static Future<Worksheet?> _getWorksheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title);
    }
  }
}
