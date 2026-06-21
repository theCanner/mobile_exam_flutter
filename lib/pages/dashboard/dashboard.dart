import 'package:flutter/material.dart';
import 'package:mobile_exam/api/dashboard/dashboard.api.dart';
import 'package:mobile_exam/components/custom_header.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  State<DashboardPage> createState() => DashboardPageStata();
}

class DashboardPageStata extends State<DashboardPage> {
  // final dashboard = Dashboard();

  List menuItems = [
    // {
    //   "name": "YouTube",
    //   "history":
    //       "YouTube is an American online video-sharing platform headquartered in San Bruno, California, founded by three former PayPal employees—Chad Hurley, Steve Chen, and Jawed Karim—in February 2005. Google bought the site in November 2006 for US1.65 billion, since which it operates as one of Google's subsidiaries.\n\nYouTube allows users to upload videos, view them, rate them with likes and dislikes, share them, add videos to playlists, report, make comments on videos, and subscribe to other users. The slogan Broadcast Yourself used for several years and the reference to user profiles as Channels signifies the premise upon which the platform is based, of allowing anyone to operate a personal broadcasting station in resemblance to television with the extension of video on demand.\n\nAs such, the platform offers a wide variety of user-generated and corporate media videos. Available content includes video clips, TV show clips, music videos, short and documentary films, audio recordings, movie trailers, live streams, and other content such as video blogging, short original videos, and educational videos.",
    //   "iconUrl": "https://indexcodex.com/api/v1/assets/youtube_icon.png",
    //   "imgUrl": "https://indexcodex.com/api/v1/assets/youtube.png",
    //   "webUrl": "https://youtube.com/",
    // },
    // {
    //   "name": "Spotify",
    //   "history":
    //       "Spotify offers digital copyright restricted recorded audio content, including more than 100 million songs and six million podcast titles, from record labels and media companies. Users can search for music based on artist, album, or genre, and can create, edit, and share playlists.",
    //   "iconUrl": "https://indexcodex.com/api/v1/assets/spotify_icon.png",
    //   "imgUrl": "https://indexcodex.com/api/v1/assets/spotify.png",
    //   "webUrl": "https://spotify.com/",
    // },
    // {
    //   "name": "Facebook",
    //   "history":
    //       "Facebook is a social media and social networking service owned by the American technology conglomerate Meta. Its name derives from the face book directories often given to American university students.",
    //   "iconUrl": "https://indexcodex.com/api/v1/assets/facebook_icon.png",
    //   "imgUrl": "https://indexcodex.com/api/v1/assets/facebook.png",
    //   "webUrl": "https://facebook.com/",
    // },
  ];

  Future<void> _loadItems() async {
    // menuItems = await dashboard.getItems();
    setState(() {
      menuItems.add({
        "name": "other",
        "history": "",
        "iconUrl": "",
        "imgUrl": "",
        "webUrl": "",
      });
    });

    print(menuItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(child: CustomHeader()),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(60),
        itemCount: menuItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 60,
          crossAxisSpacing: 60,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          final isOther = item['name'] == 'other';
          return Center(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: GestureDetector(
                onTap: () => print('yes'),
                child: isOther
                    ? Container(
                        width: 150,
                        height: 150,
                        color: Colors.amber[600],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.logout, color: Colors.white, size: 70),
                          ],
                        ),
                      )
                    : Image.network(
                        item['iconUrl'],
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadItems();
  }
}
