
class PageInfo {
  var lastPage;
  var currentPage;
  var limit;

  PageInfo({this.lastPage, this.currentPage, this.limit});

  PageInfo.fromJson(Map<String, dynamic> json) {
    lastPage = json['last_page'];
    currentPage = json['current_page'];
    limit = 15;
  }

  PageInfo.unknown() {
    currentPage = 0;
    lastPage = -1;
  }

  copyWith({currentPage, lastPage, limit}) {
    return PageInfo(
        lastPage: lastPage ?? this.lastPage,
        currentPage: currentPage ?? this.currentPage,
        limit: limit ?? this.limit
    );
  }

  hasNextPage() {
    return lastPage < 1 ? true : currentPage < lastPage;
  }

  nextPage() {
    return (currentPage ?? 0) + 1;
  }
}
