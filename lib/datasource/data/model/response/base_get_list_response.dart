abstract class BaseGetListResponse<T> {
  BaseGetListResponse({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<T>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;
  double? totalFinal;

  BaseGetListResponse.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    // data = List.from(json['data']).map((e) => T.fromJson(e)).toList();
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    links = List.from(json['links']).map((e) => Links.fromJson(e)).toList();
    nextPageUrl = null;
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = null;
    to = json['to'];
    total = json['total'];
    totalFinal = json['total_final'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current_page'] = currentPage;
    // _data['data'] = data?.map((e) => e.toJson()).toList();
    _data['first_page_url'] = firstPageUrl;
    _data['from'] = from;
    _data['last_page'] = lastPage;
    _data['last_page_url'] = lastPageUrl;
    _data['links'] = links?.map((e) => e.toJson()).toList();
    _data['next_page_url'] = nextPageUrl;
    _data['path'] = path;
    _data['per_page'] = perPage;
    _data['prev_page_url'] = prevPageUrl;
    _data['to'] = to;
    _data['total'] = total;
    return _data;
  }
}

class Links {
  Links({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  Links.fromJson(Map<String, dynamic> json) {
    url = null;
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['label'] = label;
    _data['active'] = active;
    return _data;
  }
}