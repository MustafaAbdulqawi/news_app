import 'dart:convert';
TopHeadlinesResponse topHeadlinesResponseFromJson(String str) => TopHeadlinesResponse.fromJson(json.decode(str));
class TopHeadlinesResponse {
  TopHeadlinesResponse({
      String? status, 
      num? totalResults, 
      List<TopHeadlinesArticles>? articles,}){
    _status = status;
    _totalResults = totalResults;
    _articles = articles;
}

  TopHeadlinesResponse.fromJson(dynamic json) {
    _status = json['status'];
    _totalResults = json['totalResults'];
    if (json['articles'] != null) {
      _articles = [];
      json['articles'].forEach((v) {
        _articles?.add(TopHeadlinesArticles.fromJson(v));
      });
    }
  }
  String? _status;
  num? _totalResults;
  List<TopHeadlinesArticles>? _articles;

  String get status => _status ?? "";
  num get totalResults => _totalResults ?? 0;
  List<TopHeadlinesArticles> get articles => _articles ?? [];


}

TopHeadlinesArticles articlesFromJson(String str) => TopHeadlinesArticles.fromJson(json.decode(str));
class TopHeadlinesArticles {
  TopHeadlinesArticles({
      Source? source, 
      String? author, 
      String? title, 
      String? description, 
      String? url, 
      String? urlToImage, 
      String? publishedAt, 
      String? content,}){
    _source = source;
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
}

  TopHeadlinesArticles.fromJson(dynamic json) {
    _source = json['source'] != null ? Source.fromJson(json['source']) : null;
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
    _content = json['content'];
  }
  Source? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;

  Source get source => _source ?? Source();
  String get author => _author ?? "";
  String get title => _title ?? "";
  String get description => _description ?? "";
  String get url => _url ?? "";
  String get urlToImage => _urlToImage ?? "";
  String get publishedAt => _publishedAt ?? "";
  String get content => _content ?? "";


}

Source sourceFromJson(String str) => Source.fromJson(json.decode(str));
class Source {
  Source({
      String? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Source.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;

  String get id => _id ?? "";
  String get name => _name ?? "";


}