import 'package:allfreezed/controller/view_controller.dart';
import 'package:allfreezed/models/github_model.dart';
import 'package:allfreezed/views/profile_view/widget/main_profile.dart';
import 'package:allfreezed/views/profile_view/widget/sub_details.dart';
import 'package:allfreezed/views/web_viewpage/webview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/colors.dart';


// ignore: must_be_immutable
class Profile extends StatelessWidget {
  String? user;
  Profile({required this.user}) {}
  @override
  Widget build(BuildContext context) {
    // Provider.of <CheckconnectivityProvider>(context).getInternetConnectivity(context);

    print('ihkj');
    final s = MediaQuery.of(context).size.height;
    final datauser = Provider.of<GithubDataNotifier>(context, listen: false);
    return Scaffold(
      // co
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        
        actions: [
          CircleAvatar(
            radius: 50,
            child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlVvaUaLaNpixP_VC6ZkFfa44mDqvDK7-qH7SGhiLIalxqeJTjFz2isCd1lH8_kPmKqNI&usqp=CAU'),
          )
        ],
        backgroundColor: Colorss.black,
        title: const Text.rich(TextSpan(children: <InlineSpan>[
          TextSpan(
            text: 'GITHUB ',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colorss.white),
          ),
          TextSpan(
            text: 'USER',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colorss.green),
          )
        ])),
        centerTitle: true,
      ),
      body: FutureBuilder<Github?>(
        future: datauser.fetchGitHubData(user!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return Container(
              color: const Color.fromARGB(255, 35, 34, 34),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Profileviewmain(
                        login: snapshot.data?.login ?? "Login not available",
                        avatarUrl:
                        snapshot.data?.avatarUrl ?? "URL not available",
                        name: snapshot.data?.name ?? "Name not available",
                        id: snapshot.data?.id.toString() ?? "ID not available",
                        followers: snapshot.data?.followers.toString() ?? "0",
                        following: snapshot.data?.following.toString() ?? "0",
                      ),
                      Profilesub(
                        bio: snapshot.data?.bio ?? "Bio not available",
                        company:
                            snapshot.data?.company ?? "Company not available",
                        location:
                            snapshot.data?.location ?? "Location not available",
                        type: snapshot.data?.type ?? "Type not available",
                        publicRepos:
                            snapshot.data?.publicRepos.toString() ?? "0",
                        publicGists:
                            snapshot.data?.publicGits.toString() ?? "0",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: 'createdAt  ',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                  children: <TextSpan>[
                                TextSpan(
                                  text: '${snapshot.data!.createdAt}',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: s * 0.01,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ])),
                          RichText(
                              text: TextSpan(
                                  text: '  updatedAt  ',
                                  style: const TextStyle(
                                    color: Colorss.white,
                                    fontSize: 13,
                                  ),
                                  children: <TextSpan>[
                                TextSpan(
                                  text: ' ${snapshot.data!.updatedAt}',
                                  style: TextStyle(
                                    color: Colorss.green,
                                    fontSize: s * 0.01,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ])),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Material(
                        color: Color.fromRGBO(32, 32, 32, 1),
                        child: InkWell(
                          
                          splashColor: Colors.white,
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticleScreen(
                                    blogUrl: snapshot.data!.htmlUrl??''),
                              )),
                          child: Container(
                            height: 45,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(width: 1, color: Colors.white),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(90, 90, 90, 1),
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlVvaUaLaNpixP_VC6ZkFfa44mDqvDK7-qH7SGhiLIalxqeJTjFz2isCd1lH8_kPmKqNI&usqp=CAU'),
                                  radius: 9,
                                ),
                                Text(
                                  '  ${snapshot.data!.login}',
                                  style: const TextStyle(
                                      color: Colorss.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // --------------------------------------------------------------------------------------------------------------------------------------------------------

                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color.fromARGB(255, 249, 249, 249),
                  child: Image.asset('assets/Firefly 20231107202942.png'),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'User not Found !',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ));
          }
        },
      ),
    );
  }
}
