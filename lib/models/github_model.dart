import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_model.freezed.dart';
part 'github_model.g.dart';

@freezed
class Github with _$Github {
  factory Github({
  String? login,
  int ?id,
  @JsonKey(name: "avatar_url") String? avatarUrl,
  String? gravatarId,
  String? url,
 @JsonKey(name:"html_url") String? htmlUrl,
  String? followersUrl,
  String? followingUrl,
  String? gistsUrl,
  String? starredUrl,
  String? subscriptionsUrl,
  String? organizationsUrl,
  String? reposUrl,
  String? eventsUrl,
  String? receivedEventsUrl,
  String? type,
  bool ?siteAdmin,
  String? name,
  String? company,  // Make the 'company' field nullable
  String? blog,
  String? location, // Make the 'location' field nullable
  String? email,  // Make the 'email' field nullable
  String? hireable,  // Make the 'hireable' field nullable
  String? bio,
  String? twitterUsername,  // Make the 'twitterUsername' field nullable
  @JsonKey(name: "public_repos")int? publicRepos,
  @JsonKey(name:'public_gists') int? publicGits,
  int? followers,
  int? following,
  @JsonKey(name: 'created_at') String? createdAt,
  @JsonKey(name: 'updated_at') String? updatedAt,

  }) = _Github;

  factory Github.fromJson(Map<String, dynamic> json) =>
      _$GithubFromJson(json);
}
