import 'package:hive/hive.dart';

import '../models/history.dart';

class LocalRepository {
  static var history = Hive.box('history');
  static var watchlist = Hive.box('watchlist');

  static void initLocalDatabase() async {
    await Hive.openBox('history');
    await Hive.openBox('watchlist');
  }

  static Future<List<History>> historyList() async {
    List<History> historyList = [];
    for (int i = 0; i < history.length; i++) {
      List dbList = history.getAt(i);
      historyList.add(History(
          id: i,
          account: dbList[0],
          address: dbList[1],
          username: dbList[2],
          balance: dbList[3],
          timestamp: dbList[4]));
    }
    return historyList.reversed.toList();
  }

  static Future<List<History>> watchList() async {
    List<History> watchList = [];
    for (int i = 0; i < watchlist.length; i++) {
      List dbList = watchlist.getAt(i);
      watchList.add(History(
          id: i,
          account: dbList[0],
          address: dbList[1],
          username: dbList[2],
          balance: dbList[3],
          timestamp: dbList[4]));
    }
    print(watchList);
    return watchList.reversed.toList();
  }

  static void insertEntry(
      {required String account,
      required address,
      required username,
      required balance,
      required currency}) async {
    try {
      await history.delete(address);

      await history.put(address, [
        account,
        address,
        username,
        "$balance $currency",
        DateTime.now().toString()
      ]);
    } catch (e) {
      return;
    }
  }

  static void removeEntry(
      {required String databaseName, required String address}) async {
    Hive.box(databaseName).delete(address);
  }

  static void removeAll({required String databaseName}) async {
    for (int i = 0; i < 10; i++) {
      Hive.box(databaseName).deleteAt(0);
    }
  }

  static Future<String> addToWatchList(History history) async {
    try {
      await watchlist.delete(history.address);

      await watchlist.put(history.address, [
        history.account,
        history.address,
        history.username,
        history.balance,
        history.timestamp
      ]);
    } catch (e) {
      return e.toString();
    }

    return 'Added to Watchlist';
  }
}
