class NetworksListData {
  String titleTxt;
  bool isSelected;

  NetworksListData({
    this.titleTxt = '',
    this.isSelected = false,
  });

  static List<NetworksListData> networksList = [
    NetworksListData(
      titleTxt: 'All',
      isSelected: true,
    ),
    NetworksListData(
      titleTxt: 'Bitcoin',
      isSelected: true,
    ),
    NetworksListData(
      titleTxt: 'Ethereum',
      isSelected: true,
    ),
    NetworksListData(
      titleTxt: 'Polygon',
      isSelected: true,
    ),
    // NetworksListData(
    //   titleTxt: 'Polygon',
    //   isSelected: false,
    // ),
    // NetworksListData(
    //   titleTxt: 'Binance Smart Chain',
    //   isSelected: false,
    // ),
    // NetworksListData(
    //   titleTxt: 'Arbitrum',
    //   isSelected: false,
    // ),
    // NetworksListData(
    //   titleTxt: 'Avalanche',
    //   isSelected: false,
    // ),
    // NetworksListData(
    //   titleTxt: 'MoonRiver',
    //   isSelected: true,
    // ),
    NetworksListData(
      titleTxt: 'Ropsten',
      isSelected: true,
    ),
    NetworksListData(
      titleTxt: 'Rinkeby',
      isSelected: true,
    ),
    NetworksListData(
      titleTxt: 'Goerli',
      isSelected: true,
    ),
    NetworksListData(
      titleTxt: 'Kovan',
      isSelected: true,
    ),
  ];
}
