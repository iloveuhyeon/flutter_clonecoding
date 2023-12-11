import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoonapp_clonecoding/models/detail_model.dart';
import 'package:webtoonapp_clonecoding/models/episode_model.dart';
import 'package:webtoonapp_clonecoding/models/webtoon.dart';

class ApiService {
  static const String baseURL =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseURL/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<DetailModel> getDetailToons(String id) async {
    final url = Uri.parse('$baseURL/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return DetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<EpisodeModel>> getEpisodeToons(String id) async {
    List<EpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseURL/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(EpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
