import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

import '../amplifyconfiguration.dart';

Future<void> configureAmplify() async {
  final auth = AmplifyAuthCognito();
  final storage = AmplifyStorageS3();
  final api = AmplifyAPI();

  try {
    await Amplify.addPlugins([auth, storage, api]);
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    //
  }
}
