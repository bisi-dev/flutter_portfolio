import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;
import 'package:getwidget/getwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:defiscan/core/defiscan.dart';
import 'package:defiscan/core/constants.dart';
import 'package:defiscan/models/transactions.dart';
import 'package:defiscan/theme/app_theme.dart';

class DetailsScreen extends StatefulWidget {
  String iD;
  String account;
  String username;
  String balance;
  DetailsScreen(this.iD, this.account, this.username, this.balance);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  final ScrollController _scrollController = ScrollController();

  final double infoHeight = 364.0;
  Animation<double> animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  List<TxnsListData> list = [];
  String url = '';
  String fiatBalance = '...';
  String balance = 'Recalibrating';
  String dateTime = DateTime.now().toString();
  bool watch = false;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    isWatched();
    details();
    super.initState();
  }

  void details() async {
    DeFiScan deFiScan = DeFiScan();
    String baseURL = '';
    url = logoImage;
    Database database = await openDatabase(
      Path.join(await getDatabasesPath(), 'history.db'),
    );

    if(widget.iD == 'Bitcoin'){
      setState(() {
        url = bitcoinImage;
      });
      String accountBTC = await deFiScan.getAccountBTC(widget.account);
      String fiatBTC = await deFiScan.getCoinBalance(accountBTC, 'bitcoin');
      setState(() {
        balance = '$accountBTC BTC';
        fiatBalance = fiatBTC;
      });
      var data = await deFiScan.getAccountTxnBTC(widget.account);
      dynamic info = data;
      setState(() {
        list.clear();
        for (var obj in info) {
          bool isSent = false;
          if (obj['result'] <= 0) {
            isSent = true;
          }
          double value = obj['result'].toDouble();
          value = value/(pow(10, 8));
          RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
          String finalValue = value.toString().replaceAll(regex, '');
          String timeStamp = deFiScan.convertTime(obj['time'].toString());
          list.add(TxnsListData('BTC address', 'BTC address', '$finalValue BTC', timeStamp,
              obj['fee'].toString(), isSent));
        }
      });

      try {
        int id1 = await database.rawDelete(
            'DELETE FROM allList WHERE address = "${widget.account}"');
        await database.transaction((txn) async {
          int id1 = await txn.rawInsert(
              'INSERT INTO allList(account, address, username, balance, timestamp) VALUES("Bitcoin", "${widget.account}", "${widget.username}", "$balance", "$dateTime" )');
        });
        int id2 = await database.rawDelete(
            'DELETE FROM watchList WHERE address = "${widget.account}"');
        id2 > 0
            ? await database.transaction((txn) async {
                int id2 = await txn.rawInsert(
                    'INSERT INTO watchList(account, address, username, balance, timestamp) VALUES("Bitcoin", "${widget.account}", "${widget.username}", "$balance", "$dateTime" )');
              })
            : id2 = 0;

      } catch (e) {}
      return;
    }

    if (widget.iD == 'Ethereum Mainnet') {
      setState(() {
        url = ethereumImage;
      });
      String accountMain =
          await deFiScan.getAccount(mainnetRPC, widget.account);
      String fiatMain = await deFiScan.getCoinBalance(accountMain, 'ethereum');
      setState(() {
        balance = '$accountMain ETH';
        fiatBalance = fiatMain;
      });
      baseURL = mainnetURL;
      var data = await deFiScan.getAccountTxn(baseURL, widget.account);
      dynamic info = data['result'];
      // print(info);
      // print(info.length);
      setState(() {
        list.clear();
        for (var obj in info) {
          bool isSent = false;
          if (obj['from'] == widget.account) {
            isSent = true;
          }
          double value = double.parse(obj['value']);
          value = value/(pow(10, 18));
          // String finalValue = value.toStringAsFixed(6);
          RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
          String finalValue = value.toString().replaceAll(regex, '');
          String timeStamp = deFiScan.convertTime(obj['timeStamp']);
          list.add(TxnsListData(obj['from'], obj['to'], '$finalValue ETH', timeStamp,
              obj['gas'], isSent));
        }
        // list = info.toList();
      });

      try {
        int id1 = await database.rawDelete(
            'DELETE FROM allList WHERE address = "${widget.account}"');
        await database.transaction((txn) async {
          int id1 = await txn.rawInsert(
              'INSERT INTO allList(account, address, username, balance, timestamp) VALUES("Ethereum Mainnet", "${widget.account}", "${widget.username}", "$balance", "$dateTime" )');
        });
        int id2 = await database.rawDelete(
            'DELETE FROM watchList WHERE address = "${widget.account}"');
        id2 > 0
            ? await database.transaction((txn) async {
                int id2 = await txn.rawInsert(
                    'INSERT INTO watchList(account, address, username, balance, timestamp) VALUES("Ethereum Mainnet", "${widget.account}", "${widget.username}", "$balance", "$dateTime" )');
              })
            : id2 = 0;

      } catch (e) {}


      return;
    }
  }

  void isWatched() async{
    Database database = await openDatabase(
      Path.join(await getDatabasesPath(), 'history.db'),
    );

    List<Map> dbList = await database.rawQuery('SELECT * FROM watchList WHERE address = "${widget.account}"');
    setState(() {
      if(dbList.length > 0){
        watch = true;
      }
    });
  }

  void addToWatchList () async{
    Database database = await openDatabase(
      Path.join(await getDatabasesPath(), 'history.db'),
    );

    List<Map> dbList = await database.rawQuery('SELECT * FROM watchList WHERE address = "${widget.account}"');

    try{
      int id1 = await database.rawDelete('DELETE FROM watchList WHERE address = "${widget.account}"');
    }catch(e){}

    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO watchList(account, address, username, balance, timestamp) VALUES("${widget.iD}", "${widget.account}", "${widget.username}", "${widget.balance}", "$dateTime" )');
    });

    setState(() {
      watch = true;
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

  Future<void> setData() async {
    animationController?.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
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
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;
    return Theme(
      data: AppTheme.buildLightTheme(),
      child: Container(
        child: Scaffold(
          body: Stack(
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
                    SizedBox(height: MediaQuery.of(context).padding.top),
                    Expanded(
                      child: NestedScrollView(
                        controller: _scrollController,
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                return Column(
                                  children: <Widget>[
                                    getSearchBarUI(),
                                  ],
                                );
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
                        body: AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: opacity1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            child: ListView.builder(
                              padding: const EdgeInsets.only(top: 8),
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return GFAccordion(
                                    // title: list[index]['blockNumber'],
                                    titleChild: list[index].isSent
                                        ? Text('${list[index].value} debited ${list[index].timeStamp ?? ''}' )
                                        : Text('${list[index].value} credited ${list[index].timeStamp ?? ''}' ),
                                    titleBorder: Border.all(
                                      color: list[index].isSent
                                          ? Colors.redAccent
                                          : Colors.greenAccent,
                                    ),
                                    titleBorderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    // content: list[index]['timeStamp'],s
                                    contentChild: list[index].isSent
                                        ? Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('TRANSFER OUT TO'),
                                            Text(list[index].to ?? '')
                                          ],
                                        )
                                        : Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('TRANSFER IN FROM'),
                                            Text(list[index].to ?? '')
                                          ],
                                        ),
                                    collapsedIcon: Icon(Icons.add),
                                    expandedIcon: Icon(Icons.minimize));
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getSearchBarUI() {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.2,
              child: CachedNetworkImage(
                imageUrl: '$url',
                // placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // child: Image.asset(
              //   '$url',
              //   fit: BoxFit.cover,
              // ),
            ),
          ],
        ),
        Positioned(
          // top: (MediaQuery.of(context).size.width / 1.2) - 35,
          top: 15,
          right: 15,
          child: ScaleTransition(
            alignment: Alignment.center,
            scale: CurvedAnimation(
                parent: animationController, curve: Curves.fastOutSlowIn),
            child: Card(
              color: watch
                  ?   Colors.blue
                  : Colors.white,
              // color: AppTheme.buildLightTheme().primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              elevation: 30.0,
              child: Container(
                width: 40,
                height: 40,
                child: Center(
                  child: watch
                      ?   IconButton(icon: Icon(
                    Icons.favorite,
                    color: AppTheme.nearlyWhite,
                    size: 20,),
                    onPressed: addToWatchList)
                      :  IconButton(icon: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.blue,
                    size: 20,),
                      onPressed: addToWatchList)
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: SizedBox(
            width: AppBar().preferredSize.height,
            height: AppBar().preferredSize.height,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius:
                    BorderRadius.circular(AppBar().preferredSize.height),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppTheme.nearlyBlack,
                ),
                onTap: () {
                  //WIP
                  Navigator.pop(context, 0);
                },
              ),
            ),
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.only(top: 5.0, left: MediaQuery.of(context).size.width - 80),
        //   child: ScaleTransition(
        //     alignment: Alignment.center,
        //     scale: CurvedAnimation(
        //         parent: animationController!, curve: Curves.fastOutSlowIn),
        //     child: Card(
        //       color: AppTheme.buildLightTheme().primaryColor,
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(50.0)),
        //       elevation: 10.0,
        //       child: Container(
        //         width: 60,
        //         height: 60,
        //         child: Center(
        //           child: Icon(
        //             Icons.favorite,
        //             color: AppTheme.nearlyWhite,
        //             size: 30,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }

  Widget getFilterBarUI() {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 24,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${widget.iD}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      letterSpacing: 0.27,
                      color: AppTheme.darkerText,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(0.0),
                    width: 200,
                    child: Text(
                      '${widget.account}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 0.27,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      widget.username.contains('eth')
                          ? Icon(
                              Icons.verified_user,
                              size: 13,
                            )
                          : Text(''),
                      Text(
                        '${widget.username}',
                        // 'Web Design\nCourse',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          letterSpacing: 0.27,
                          // color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${balance}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 22,
                          letterSpacing: 0.27,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              '$fiatBalance',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 22,
                                letterSpacing: 0.27,
                                color: AppTheme.buildLightTheme().primaryColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'TRANSACTIONS',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
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
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Sort',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.sort,
                                    color: AppTheme.buildLightTheme()
                                        .primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
        ),
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
  double get maxExtent => 132.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
