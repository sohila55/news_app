class TopHeadlinesBody {
  final String country;
  final String? category;
  final String? sources;
  final String? q;
  final int? pageSize;
  final int? page;

  TopHeadlinesBody({
    this.country = 'us',
    this.category,
    this.sources,
    this.q,
    this.pageSize,
    this.page,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      if (category != null) 'category': category!,
      if (sources != null) 'sources': sources!,
      if (q != null) 'q': q!,
      if (pageSize != null) 'pageSize': pageSize!.toString(),
      if (page != null) 'page': page!.toString(),
    };
  }

  factory TopHeadlinesBody.fromMap(Map<String, dynamic> map) {
    return TopHeadlinesBody(
      country: map['country'] ?? 'us',
      category: map['category'],
      sources: map['sources'],
      q: map['q'],
      pageSize: map['pageSize']?.toInt(),
      page: map['page']?.toInt(),
    );
  }
}
