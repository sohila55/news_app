class NewsApiResponse {
  final String status;
  final int totalResults;
  final List<Article>? articles;

  NewsApiResponse({
    required this.status,
    required this.totalResults,
    this.articles,
  });

  factory NewsApiResponse.fromMap(Map<String, dynamic> map) {
    return NewsApiResponse(
      status: map['status'] ?? '',
      totalResults: map['totalResults']?.toInt() ?? 0,
      articles: map['articles'] != null
          ? List<Article>.from(
              (map['articles'] as List).map((x) => Article.fromMap(x)),
            )
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'totalResults': totalResults,
      if (articles != null)
        'articles': List<dynamic>.from(articles!.map((x) => x.toMap())),
    };
  }
}

class Article {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      source: map['source'] != null ? Source.fromMap(map['source']) : null,
      author: map['author'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'] != null
          ? DateTime.parse(map['publishedAt'])
          : null,
      content: map['content'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (source != null) 'source': source!.toMap(),
      if (author != null) 'author': author!,
      if (title != null) 'title': title!,
      if (description != null) 'description': description!,
      if (url != null) 'url': url!,
      if (urlToImage != null) 'urlToImage': urlToImage!,
      if (publishedAt != null) 'publishedAt': publishedAt!.toIso8601String(),
      if (content != null) 'content': content!,
    };
  }
}

class Source {
  final String? id;
  final String? name;

  Source({this.id, required this.name});

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(id: map['id'], name: map['name'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {if (id != null) 'id': id!, 'name': name};
  }
}
