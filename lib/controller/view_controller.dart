import 'package:allfreezed/models/github_model.dart';
import 'package:allfreezed/service/api_services.dart';
import 'package:flutter/material.dart';


class GithubDataNotifier with ChangeNotifier {
  final GithubConnections apiClient = GithubConnections();
  Github? githubData;

  Future<Github?> fetchGitHubData(String name) async {
    githubData = await apiClient.fetchWeather(name);
    print(githubData?.name);
    return githubData;
  }
  
}
