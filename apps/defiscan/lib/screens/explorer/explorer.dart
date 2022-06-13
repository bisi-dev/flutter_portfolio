import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;
import 'package:ens_dart/ens_dart.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

import 'package:defiscan/core/defiscan.dart';
import 'package:defiscan/core/constants.dart';
import 'package:defiscan/core/prefs.dart';
import 'package:defiscan/models/accounts.dart';
import 'package:defiscan/theme/app_theme.dart';
import 'package:defiscan/screens/settings/networks.dart';

import 'details.dart';
import 'explorer_list_view.dart';
import '../../main.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({Key key}) : super(key: key);

  @override
  _ExplorerPageState createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage>
    with TickerProviderStateMixin {
  AnimationController animationController;
  final ScrollController _scrollController = ScrollController();

  DeFiScan deFiScan = DeFiScan();
  AppPreference appPreference = AppPreference();
  String entry = '';
  List<AccountsListData> accountsList = [];
  String lengthy = 'Start By Searching...';
  bool wait = true;
  bool animate = false;
  bool error = false;
  String imageUrl = logoImage;
  bool isFinished = false;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
    explore();
  }

  void paste() async {
    var data = await Clipboard.getData('text/plain');
    if(data == null){
      var data2 = await Clipboard.getData('text/html');
      setState(() {
        entry = (data2?.text?.toString()).toString();
      });
    } else{
      setState(() {
        entry = (data.text.toString()).toString();
      });
    }
  }

  void explore() async {
    final client = Web3Client(mainnetRPC, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(wsRPC).cast<String>();
    });
    final ens = Ens(client: client);

    String dateTime = DateTime.now().toString();

    setState(() {
      wait = false;
      animate = true;
      lengthy = 'Searching...';
    });

    //null
    if (entry == '') {
      setState(() {
        accountsList.clear();
        lengthy = 'Start by Searching...';
        wait = true;
        animate = false;
      });
      return;
    }

    // bitcoin
    if (entry.startsWith('1') ||
        entry.startsWith('3') ||
        entry.startsWith('bc1')) {
      String accountBTC = await deFiScan.getAccountBTC(entry);
      String fiatBTC = await deFiScan.getCoinBalance(accountBTC, 'bitcoin');
      String user = 'Anonymous';
      imageUrl = bitcoinImage;

      // 1KoG15hRKk4Ley15tYYmEA9frRN5XqoGFw
      setState(() {
        lengthy = 'BTC Account Found';
        accountsList.clear();
        accountsList.add(AccountsListData(
            "Bitcoin", '$accountBTC BTC', fiatBTC, entry, user, imageUrl));

        wait = false;
        animate = false;
        error = false;
      });
      return;
    }

    //ens
    if (entry.contains('.eth')) {
      String address = (await ens.withName(entry).getAddress()).toString();
      // imageUrl = 'https://metadata.ens.domains/mainnet/avatar/$entry';
      imageUrl = ethereumImage;

      if (address == '0x0000000000000000000000000000000000000000') {
        setState(() {
          lengthy = 'NO ENS Record';
          accountsList.clear();
          wait = false;
          animate = false;
          error = false;
        });
        return;
      }

      String accountMain = await deFiScan.getAccount(mainnetRPC, address);
      String accountPolygon = await deFiScan.getAccount(polygonRPC, address);
      String accountRopsten = await deFiScan.getAccount(ropstenRPC, address);
      String accountRinkeby = await deFiScan.getAccount(rinkebyRPC, address);
      String accountGoerli = await deFiScan.getAccount(goerliRPC, address);
      String accountKovan = await deFiScan.getAccount(kovanRPC, address);
      //vitalik.eth

      String fiatMain = await deFiScan.getCoinBalance(accountMain, 'ethereum');
      String fiatPolygon =
          await deFiScan.getCoinBalance(accountPolygon, 'matic-network');
      String fiatRopsten =
          await deFiScan.getCoinBalance(accountRopsten, 'ethereum');
      String fiatRinkeby =
          await deFiScan.getCoinBalance(accountRinkeby, 'ethereum');
      String fiatGoerli =
          await deFiScan.getCoinBalance(accountGoerli, 'ethereum');
      String fiatKovan =
          await deFiScan.getCoinBalance(accountKovan, 'ethereum');

      setState(() {
        lengthy = 'ETH Account Found';
        accountsList.clear();
        accountsList.add(AccountsListData("Ethereum Mainnet",
            '$accountMain ETH', fiatMain, address, entry, imageUrl));
        accountsList.add(AccountsListData(
            "Polygon", '$accountPolygon MATIC', fiatPolygon, entry));
        accountsList.add(AccountsListData(
            "Ropsten", '$accountRopsten ETH', fiatRopsten, entry));
        accountsList.add(AccountsListData(
            "Rinkeby", '$accountRinkeby ETH', fiatRinkeby, entry));
        accountsList.add(AccountsListData(
            "Goerli", '$accountGoerli ETH', fiatGoerli, entry));
        accountsList.add(
            AccountsListData("Kovan", '$accountKovan ETH', fiatKovan, entry));
        wait = false;
        animate = false;
        error = false;
      });
      return;
    }

    // ethereum
    if (entry.startsWith('0x')) {
      String user = 'Anonymous';
      imageUrl = ethereumImage;

      try {
        final username = await ens.withAddress('$entry').getName();
        user = username;
      } catch (e) {}

      String accountMain = await deFiScan.getAccount(mainnetRPC, entry);
      String accountPolygon = await deFiScan.getAccount(polygonRPC, entry);
      String accountRopsten = await deFiScan.getAccount(ropstenRPC, entry);
      String accountRinkeby = await deFiScan.getAccount(rinkebyRPC, entry);
      String accountGoerli = await deFiScan.getAccount(goerliRPC, entry);
      String accountKovan = await deFiScan.getAccount(kovanRPC, entry);
      // '0x9aceC6fbD28fc102ac6D415abE0BC47ab53EE6F0'
      //0x65546F3419e360b6C62c88F8A060cD1c112bb80B
      //0xd8da6bf26964af9d7eed9e03e53415d37aa96045

      String fiatMain = await deFiScan.getCoinBalance(accountMain, 'ethereum');
      String fiatPolygon =
          await deFiScan.getCoinBalance(accountPolygon, 'matic-network');
      String fiatRopsten =
          await deFiScan.getCoinBalance(accountRopsten, 'ethereum');
      String fiatRinkeby =
          await deFiScan.getCoinBalance(accountRinkeby, 'ethereum');
      String fiatGoerli =
          await deFiScan.getCoinBalance(accountGoerli, 'ethereum');
      String fiatKovan =
          await deFiScan.getCoinBalance(accountKovan, 'ethereum');

      setState(() {
        lengthy = 'ETH Account Found';
        accountsList.clear();
        accountsList.add(AccountsListData("Ethereum Mainnet",
            '$accountMain ETH', fiatMain, entry, user, imageUrl));
        accountsList.add(AccountsListData(
            "Polygon", '$accountPolygon MATIC', fiatPolygon, entry));
        accountsList.add(AccountsListData(
            "Ropsten", '$accountRopsten ETH', fiatRopsten, entry));
        accountsList.add(AccountsListData(
            "Rinkeby", '$accountRinkeby ETH', fiatRinkeby, entry));
        accountsList.add(AccountsListData(
            "Goerli", '$accountGoerli ETH', fiatGoerli, entry));
        accountsList.add(
            AccountsListData("Kovan", '$accountKovan ETH', fiatKovan, entry));
        wait = false;
        animate = false;
        error = false;
      });
      return;
    }
    wait = false;
    animate = false;
    error = true;
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
                          body:
                              //WILY
                              wait
                                  ? dullUI()
                                  : animate
                                      ? animatify()
                                      : error
                                          ? errorUI()
                                          : listUI()),
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
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.buildLightTheme().backgroundColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(38.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 8.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 2, right: 16, top: 4, bottom: 4),
                  child:
                      TextField(
                    controller: TextEditingController()..text = '$entry',
                    onChanged: (String txt) {
                      entry = txt;
                    },
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    cursorColor: AppTheme.buildLightTheme().primaryColor,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                          icon: const Icon(Icons.paste),
                          onPressed: () {
                            paste();
                          }),
                      // suffixIcon: Icon(Icons.exit_to_app),
                      border: InputBorder.none,
                      hintText: 'Search for Accounts / Addresses',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppTheme.buildLightTheme().primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(50.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  explore();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(FontAwesomeIcons.search,
                      size: 20,
                      color: AppTheme.buildLightTheme().backgroundColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dullUI() {
    return Container(
      color: AppTheme.buildLightTheme().backgroundColor,
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                // decoration: new BoxDecoration(
                //     image: new DecorationImage(
                //         fit: BoxFit.contain,
                //         colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.modulate,),
                //         image: new AssetImage('assets/images/logo.png', package: App.pkg))),
              ),
            ),
            isFinished ? Container() : Container()

            // Expanded(
            //   flex: 1,
            //   child: Padding(
            //     padding: const EdgeInsets.only(right: 40.0),
            //     child: FittedBox(
            //       fit: BoxFit.scaleDown,
            //       child: Row(
            //         children: [
            //           Text(
            //             ' ',
            //             style: TextStyle(fontSize: 8.0),
            //           ),
            //           DefaultTextStyle(
            //             style: const TextStyle(
            //               fontSize: 22.0,
            //               color: Colors.blue,
            //               overflow: TextOverflow.clip
            //             ),
            //             child: AnimatedTextKit(
            //               animatedTexts: [
            //                 RotateAnimatedText('BITCOIN'),
            //                 RotateAnimatedText('ETHEREUM'),
            //                 RotateAnimatedText('ENS ADDRESS'),
            //                 RotateAnimatedText('POLYGON'),
            //               ],
            //               isRepeatingAnimation: false,
            //               onFinished: (){
            //                 setState(() {
            //                   isFinished = true;
            //                 });
            //               },
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
    // return Container();
  }

  Widget animatify() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoadingAnimationWidget.staggeredDotsWave(color: Colors.blue, size: 100),
      ],
    );
  }

  Widget errorUI() {
    return Container(
      color: AppTheme.buildLightTheme().backgroundColor,
      child: Center(
        child: Text(
          'Oops, Something\'s wrong. Please try again',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }

  Widget listUI() {
    return Container(
      color: AppTheme.buildLightTheme().backgroundColor,
      child: ListView.builder(
        itemCount: accountsList.length,
        padding: const EdgeInsets.only(top: 8),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          final int count = accountsList.length > 10 ? 10 : accountsList.length;
          final Animation<double> animation =
              Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animationController,
                  curve: Interval((1 / count) * index, 1.0,
                      curve: Curves.fastOutSlowIn)));
          animationController?.forward();
          if (index == 0) {
            return AccountListViewCard(
              callback: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.blue,
                  duration: Duration(seconds: 3),
                  content: Text('Please Download the app on playstore to continue. Thank you!'),
                ));
                // Navigator.push<dynamic>(
                //   context,
                //   MaterialPageRoute<dynamic>(
                //       builder: (BuildContext context) => DetailsScreen(
                //             accountsList[index].chain ?? '',
                //             accountsList[index].account ?? '',
                //             accountsList[index].username ?? '',
                //             accountsList[index].balance ?? '',
                //           ),
                //       fullscreenDialog: true),
                // );
              },
              accountData: accountsList[0],
              animation: animation,
              animationController: animationController,
            );
          } else {
            return AccountListView(
              callback: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Colors.blue,
                  duration: Duration(seconds: 3),
                  content: Text('Please Download the app on playstore to continue. Thank you!'),
                ));
              },
              accountData: accountsList[index],
              animation: animation,
              animationController: animationController,
            );
          }
        },
      ),
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
                      Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => NetworksScreen(),
                            fullscreenDialog: true),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.sort,
                                color: AppTheme.buildLightTheme().primaryColor),
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
