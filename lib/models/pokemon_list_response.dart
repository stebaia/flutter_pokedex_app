class PokemonListResponse {
  int? count;
  String? next;
  String? previous;
  List<PokemonListResults>? results;

  PokemonListResponse({this.count, this.next, this.previous, this.results});

  PokemonListResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <PokemonListResults>[];
      json['results'].forEach((v) {
        results!.add(new PokemonListResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PokemonListResults {
  String? name;
  String? url;
  String? image;

  PokemonListResults({this.name, this.url, this.image});

  PokemonListResults.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    image  = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['image'] = this.image;
    return data;
  }
}