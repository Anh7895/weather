
abstract class HomePageEvent {}

class InitDataPageEvent extends HomePageEvent{


  InitDataPageEvent();
}

class ChangePageEvent extends HomePageEvent {
  final int currentIndex;

  ChangePageEvent({this.currentIndex = 0});
}

