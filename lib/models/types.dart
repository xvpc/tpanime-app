class InfoTypes {
  final String id;
  final int? malId;
  final Map<String, dynamic> title;
  final List? synonyms;
  final bool? isLicensed;
  final bool? isAdult;
  final String? countryOfOrigin;
  final String image;
  final String? cover;
  final int? popularity;
  final String? color;
  final String? description;
  final String? status;
  final int? releaseDate;
  final Map<String, dynamic>? startDate;
  final Map<String, dynamic>? endDate;
  final int? totalEpisodes;
  final int? currentEpisode;
  final int? rating;
  final int? duration;
  final List? genres;
  final String? season;
  final List? studios;
  final String? subOrDub;
  final String? type;
  final List<dynamic>? recommendations;
  final List<dynamic>? characters;
  final List<dynamic>? relations;
  final List<dynamic>? episodes;

  InfoTypes({
    required this.id,
    this.malId,
    required this.title,
    this.synonyms,
    this.isLicensed,
    this.isAdult,
    this.countryOfOrigin,
    required this.image,
    this.cover,
    this.popularity,
    this.color,
    this.description,
    this.status,
    this.releaseDate,
    this.startDate,
    this.endDate,
    this.totalEpisodes,
    this.currentEpisode,
    this.rating,
    this.duration,
    this.genres,
    this.season,
    this.studios,
    this.subOrDub,
    this.type,
    this.recommendations,
    this.characters,
    this.relations,
    this.episodes,
  });
}

class characterTypes {
  final String id;
  final String? role;
  final Map<String, dynamic>? name;
  final String? image;
  final List? voiceActors;

  characterTypes({
    required this.id,
    this.role,
    required this.name,
    this.image,
    this.voiceActors,
  });
}
