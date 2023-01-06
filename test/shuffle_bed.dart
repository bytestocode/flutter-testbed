void main() {
  final originList = [1, 2, 3, 4, 5];
  print('originList: $originList');
  final duplicatedList = List.from(originList);
  print('duplicatedList: $duplicatedList');
  final shuffledList = originList..shuffle();
  print('shuffledList: $shuffledList');
  print('originList: $originList');
  print('duplicatedList: $duplicatedList');

  // originList: [1, 2, 3, 4, 5]
  // duplicatedList: [1, 2, 3, 4, 5]
  // shuffledList: [1, 4, 2, 5, 3]
  // originList: [1, 4, 2, 5, 3]
  // duplicatedList: [1, 2, 3, 4, 5]
}
