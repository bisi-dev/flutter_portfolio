import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;
import 'package:timeago/timeago.dart' as timeago;
import 'dart:async';

import 'package:defiscan/theme/app_theme.dart';
import 'package:defiscan/models/history.dart';
import 'package:defiscan/screens/explorer/details.dart';

import 'history_list_view.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with TickerProviderStateMixin {
  AnimationController animationController;
  final ScrollController _scrollController = ScrollController();
  SwipeActionController controller;

  List<HistoryListData> historyList = [];
  List<HistoryListData> watchList = [];
  String lengthy = '0 Records';
  String lengthy2 = '0 Records';
  bool empty = false;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
    Timer(Duration(milliseconds: 500), onChange);
    history();
    watchlist();
    // Future.delayed(Duration(seconds: 5), (){
    //   print("Executed after 1 minute 4 seconds");
    //   print(watchList[0].id);
    // });
    controller = SwipeActionController(selectedIndexPathsChangeCallback:
        (changedIndexPaths, selected, currentCount) {
      setState(() {});
    });
  }

  void onChange() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
      content: Text('Please Install the app to utilize storage of search results. Thank you!'),
    ));
  }

  void history() async {
    Database database = await openDatabase(
      Path.join(await getDatabasesPath(), 'history.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE allList(id INTEGER PRIMARY KEY, account TEXT, address TEXT, username TEXT, balance TEXT, timestamp TEXT)',
        );
        await db.execute(
          'CREATE TABLE watchList(id INTEGER PRIMARY KEY, account TEXT, address TEXT, username TEXT, balance TEXT, timestamp TEXT)',
        );
      },
    );

    List<Map> dbList = await database.rawQuery('SELECT * FROM allList');

    setState(() {
      int count = dbList.length;
      count == 0 ? lengthy = 'History empty' : count == 1 ? lengthy = '1 Record' : lengthy = '$count Records';
      // count > 0 ? empty = false : empty = true;
      historyList.clear();
      for(var obj in dbList){
        historyList.add(HistoryListData(obj['id'], obj['account'], obj['address'], obj['username'], obj['balance'], obj['timestamp']));
      }
      historyList = historyList.reversed.toList();
    });

  }

  void watchlist() async {
    Database database = await openDatabase(
      Path.join(await getDatabasesPath(), 'history.db'),
    );

    List<Map> dbList2 = await database.rawQuery('SELECT * FROM watchList');

    setState(() {
      int count = dbList2.length;
      count == 0 ? lengthy2 = 'Watchlist empty' : count == 1 ? lengthy2 = '1 Record' : lengthy2 = '$count Records';
      watchList.clear();
      for(var obj in dbList2){
        watchList.add(HistoryListData(obj['id'], obj['account'], obj['address'], obj['username'], obj['balance'], obj['timestamp']));
      }
      watchList = watchList.reversed.toList();
    });

  }

  void remove(int id) async {
    Database database = await openDatabase(
      Path.join(await getDatabasesPath(), 'history.db'),
    );

    int id1 = await database.rawDelete('DELETE FROM allList WHERE id = $id');
    setState(() {
      history();
      watchlist();
    });
  }

  void removeAll() async {
    Database database = await openDatabase(
      Path.join(await getDatabasesPath(), 'history.db'),
    );

    int id1 = await database.rawDelete('DELETE FROM allList');
    setState(() {
      history();
      watchlist();
    });
  }

  void removeS(int id) async {
    Database database = await openDatabase(
      Path.join(await getDatabasesPath(), 'history.db'),
    );

    int id1 = await database.rawDelete('DELETE FROM watchList WHERE id = $id');
    setState(() {
      history();
      watchlist();
    });
  }

  void removeAllS() async {
    Database database = await openDatabase(
      Path.join(await getDatabasesPath(), 'history.db'),
    );

    int id1 = await database.rawDelete('DELETE FROM watchList');
    setState(() {
      history();
      watchlist();
    });
  }

  void insertS(HistoryListData list) async {

    Database database = await openDatabase(
      Path.join(await getDatabasesPath(), 'history.db'),
    );

    List<Map> dbList = await database.rawQuery('SELECT * FROM watchList WHERE address = "${list.address}"');

    try{
      int id1 = await database.rawDelete('DELETE FROM watchList WHERE address = "${list.address}"');
    }catch(e){}

    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO watchList(account, address, username, balance, timestamp) VALUES("${list.account}", "${list.address}", "${list.username}", "${list.balance}", "${list.timestamp}" )');
    });

    setState(() {
      history();
      watchlist();
    });

    dbList.length > 0
    ?ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.grey,
      duration: Duration(seconds: 1),
      content: Text('Already exists in Watchlist'),
    ))
    :ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.grey,
      duration: Duration(seconds: 1),
      content: Text('Added to Watchlist'),
    ));
  }

  Future<void> _copyToClipboard(String address) async {
    await Clipboard.setData(ClipboardData(text: address));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.grey,
      duration: Duration(seconds: 1),
      content: Text('Copied to clipboard'),
    ));
  }

  Future<void> _pullRefresh() async {
    setState(() {
      history();
      watchlist();
    });

  }

  Future<bool> isLoved2(String add) async{
    Database database = await openDatabase(
      Path.join(await getDatabasesPath(), 'history.db'),
    );

    List<Map> dbList = await database.rawQuery('SELECT * FROM watchList WHERE address = "$add"');
    print(dbList.length);

    return false;
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.buildLightTheme(),
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              All(),
              Watchlist(),
              ]
          ),
        ),
      ),
    );
  }

  Widget dullUI() {
    return Container(
      color: AppTheme.buildLightTheme().backgroundColor,
    );
    // return Container();
  }

  Widget All(){
    List inside = [];
    for(var obj in watchList){
      inside.add(obj.address);
    }
    return Stack(
      children: <Widget>[
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            children: <Widget>[
              // getAppBarUI(),
              Expanded(
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return getAppBarUI();
                            }, childCount: 1),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        floating: true,
                        delegate: ContestTabHeader(
                          getFilterBarUI(),
                        ),
                      ),
                    ];
                  },
                  body: empty ? dullUI() :
                  Container(
                    color: AppTheme.buildLightTheme()
                        .backgroundColor,
                    child: RefreshIndicator(
                      onRefresh: _pullRefresh,
                      child: ListView.builder(
                        // reverse: true,
                        itemCount: historyList.length,
                        padding:
                        const EdgeInsets.only(top: 0),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context,
                            int index) {
                          final int count =
                          historyList.length > 10
                              ? 10
                              : historyList.length;
                          final Animation<
                              double> animation = Tween<
                              double>(
                              begin: 0.0, end: 1.0)
                              .animate(CurvedAnimation(
                              parent:
                              animationController,
                              curve: Interval(
                                  (1 / count) * index,
                                  1.0,
                                  curve: Curves
                                      .fastOutSlowIn)));
                          animationController?.forward();
                          return SwipeActionCell(
                              backgroundColor: AppTheme.buildLightTheme()
                                .backgroundColor,
                              controller: controller,
                              index: index,
                              key: ValueKey(historyList[index]),
                              trailingActions: [
                                SwipeAction(
                                    title: 'Delete',
                                    icon: Icon(Icons.delete_forever, color: Colors.red, size:50),
                                    color: Colors.transparent,
                                    performsFirstActionWithFullSwipe: true,
                                    nestedAction: SwipeNestedAction(icon: Icon(Icons.check, color: Colors.red, size:50)),
                                    onTap: (handler) async {
                                      await handler(true);
                                      remove(historyList[index].id);
                                    }),
                                // SwipeAction(title: "action2", color: Colors.grey, onTap: (handler) {}),
                              ],
                              leadingActions: [
                                SwipeAction(
                                    // title: "Save",
                                    icon:
                                    // (true)
                                    (inside.contains(historyList[index].address))
                                        ?Icon(Icons.favorite,
                                        color: Colors.blue,
                                        size:50)
                                        :Icon(Icons.favorite_border,
                                        color: Colors.blue,
                                        size:50),
                                    color: Colors.transparent,
                                    onTap: (h){
                                      insertS(historyList[index]);
                                    },
                                    // onTap: (handler2) async {
                                    //   await handler2(true);
                                    //   setState(() {historyList;});
                                    // }
                                    ),
                                SwipeAction(
                                    // title: "Copy",
                                    icon: Icon(Icons.copy, color: Colors.grey, size:50),
                                    color: Colors.transparent,
                                    onTap: (i) {
                                      _copyToClipboard(historyList[index].address);
                                    }),
                              ],
                              child: HistoryListView(
                                callback: () async {
                                  var i = await Navigator.push<dynamic>(
                                      context,
                                      MaterialPageRoute<dynamic>(
                                      builder: (BuildContext
                                      context) =>
                                      DetailsScreen(
                                        historyList[
                                        index]
                                            .account ??
                                            '',
                                        historyList[
                                        index]
                                            .address ??
                                            '',
                                        historyList[
                                        index]
                                            .username ??
                                            '',
                                        historyList[
                                        index]
                                            .balance ??
                                            '',
                                      ),
                                          fullscreenDialog: true),
                                  );
                                  if (i != null) {
                                    history();
                                    watchlist();
                                  }
                                },
                                accountData:
                                historyList[index],
                                animation: animation,
                                animationController:
                                animationController,
                              ),
                            );
                          }
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget Watchlist(){
    return Stack(
      children: <Widget>[
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            children: <Widget>[
              // getAppBarUI(),
              Expanded(
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return getAppBarUI();
                            }, childCount: 1),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        floating: true,
                        delegate: ContestTabHeader(
                          getFilterBarUI2(),
                        ),
                      ),
                    ];
                  },
                  body:
                  Container(
                    color: AppTheme.buildLightTheme()
                        .backgroundColor,
                    child: RefreshIndicator(
                      onRefresh: _pullRefresh,
                      child: ListView.builder(
                        // reverse: true,
                          itemCount: watchList.length,
                          padding:
                          const EdgeInsets.only(top: 0),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context,
                              int index) {
                            final int count =
                            watchList.length > 10
                                ? 10
                                : watchList.length;
                            final Animation<
                                double> animation = Tween<
                                double>(
                                begin: 0.0, end: 1.0)
                                .animate(CurvedAnimation(
                                parent:
                                animationController,
                                curve: Interval(
                                    (1 / count) * index,
                                    1.0,
                                    curve: Curves
                                        .fastOutSlowIn)));
                            animationController?.forward();
                            return SwipeActionCell(
                              backgroundColor: AppTheme.buildLightTheme()
                                  .backgroundColor,
                              controller: controller,
                              index: index,
                              key: ValueKey(watchList[index]),
                              trailingActions: [
                                SwipeAction(
                                  // title: 'Delete',
                                    icon: Icon(Icons.delete_forever, color: Colors.red, size:50),
                                    color: Colors.transparent,
                                    performsFirstActionWithFullSwipe: true,
                                    nestedAction: SwipeNestedAction(icon: Icon(Icons.check, color: Colors.red, size:50)),
                                    onTap: (handler) async {
                                      await handler(true);
                                      removeS(watchList[index].id);
                                    }),
                                // SwipeAction(title: "action2", color: Colors.grey, onTap: (handler) {}),
                              ],
                              leadingActions: [
                                SwipeAction(
                                  // title: "Copy",
                                    icon: Icon(Icons.copy, color: Colors.grey, size:50),
                                    color: Colors.transparent,
                                    onTap: (c) {
                                      _copyToClipboard(watchList[index].address);
                                    }),
                              ],
                              child: HistoryListView(
                                callback: () async {
                                  var i = await Navigator.push<dynamic>(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                        builder: (BuildContext
                                        context) =>
                                            DetailsScreen(
                                              historyList[
                                              index]
                                                  .account ??
                                                  '',
                                              historyList[
                                              index]
                                                  .address ??
                                                  '',
                                              historyList[
                                              index]
                                                  .username ??
                                                  '',
                                              historyList[
                                              index]
                                                  .balance ??
                                                  '',
                                            ),
                                        fullscreenDialog: true),
                                  );
                                  if (i != null) {
                                    history();
                                    watchlist();
                                  }
                                },
                                accountData:
                                watchList[index],
                                animation: animation,
                                animationController:
                                animationController,
                              ),
                            );
                          }
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        TabBar(
          labelPadding: EdgeInsets.symmetric(vertical: 4.0),
          indicatorColor: Colors.blue,
          labelColor: Colors.blue,
          tabs: <Widget>[
            Tab(
              text: "ALL",
            ),
            Tab(
              child: Text('WATCHLIST'),
              // text: "WATCHLIST",
              // icon: Icon(Icons.close),
            )
          ],
        ),
      ],
    );
  }

  Widget getFilterBarUI() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 16,
            decoration: BoxDecoration(
              color: AppTheme.buildLightTheme().backgroundColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(0, -2),
                    blurRadius: 8.0),
              ],
            ),
          ),
        ),
        Container(
          color: AppTheme.buildLightTheme().backgroundColor,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$lengthy',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      removeAll();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Clear All',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.delete_forever,
                                color: AppTheme.buildLightTheme().errorColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Divider(
            height: 1,
          ),
        )
      ],
    );
  }

  Widget getFilterBarUI2() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 16,
            decoration: BoxDecoration(
              color: AppTheme.buildLightTheme().backgroundColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(0, -2),
                    blurRadius: 8.0),
              ],
            ),
          ),
        ),
        Container(
          color: AppTheme.buildLightTheme().backgroundColor,
          child: Padding(
            padding:
            const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$lengthy2',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      removeAllS();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Clear All',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.delete_forever,
                                color: AppTheme.buildLightTheme().errorColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Divider(
            height: 1,
          ),
        )
      ],
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.searchUI,
  );
  final Widget searchUI;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
