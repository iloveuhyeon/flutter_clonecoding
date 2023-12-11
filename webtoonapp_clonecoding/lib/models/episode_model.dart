class EpisodeModel {
  final String id, title, rating, data;

  EpisodeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        rating = json['rating'],
        data = json['data'];
}
