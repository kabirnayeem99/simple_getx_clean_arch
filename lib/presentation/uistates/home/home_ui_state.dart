class HomeUiState {
  HomePageTab tab;
  int position;

  HomeUiState({
    required this.tab,
    required this.position,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomeUiState &&
          runtimeType == other.runtimeType &&
          tab == other.tab);

  @override
  int get hashCode => tab.hashCode;

  @override
  String toString() {
    return 'HomeUiState{ tab: $tab, position: $position,}';
  }

  HomeUiState copyWith({
    HomePageTab? tab,
    int? position,
  }) {
    return HomeUiState(
      tab: tab ?? this.tab,
      position: position ?? this.position,
    );
  }

  factory HomeUiState.init() {
    return HomeUiState(
      tab: HomePageTab.posts,
      position: 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tab': tab,
      'position': position,
    };
  }

  factory HomeUiState.fromMap(Map<String, dynamic> map) {
    return HomeUiState(
      tab: map['tab'] as HomePageTab,
      position: map['position'] as int,
    );
  }
}

enum HomePageTab {
  posts,
  users,
}
