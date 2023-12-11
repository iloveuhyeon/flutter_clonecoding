import 'package:flutter/material.dart';
import 'package:webtoonapp_clonecoding/models/detail_model.dart';
import 'package:webtoonapp_clonecoding/models/episode_model.dart';
import 'package:webtoonapp_clonecoding/services/api_services.dart';

class DetailScreen extends StatefulWidget {
  final String title, id, thumb;

  const DetailScreen(
      {super.key, required this.title, required this.id, required this.thumb});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<DetailModel> webtoon;
  late Future<List<EpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getDetailToons(widget.id);
    episodes = ApiService.getEpisodeToons(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Hero(
                tag: widget.id,
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(10, 10),
                        color: Colors.black.withOpacity(0.3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(widget.thumb, headers: const {
                    'User-Agent':
                        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                    'Referer': 'https://comic.naver.com',
                  }),
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: webtoon,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.about);
              }
              return const Text("...");
            },
          )
        ],
      ),
    );
  }
}
