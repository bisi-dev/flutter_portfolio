class AccountsListData {
  String chain;
  String balance;
  String fiatBalance;
  String username;
  String account;
  String image;

  AccountsListData(
      String chain, String balance, String fiatBalance, String account,
      [String username = 'Anonymous', String image = '']) {
    this.chain = chain;
    this.balance = balance;
    this.fiatBalance = fiatBalance;
    this.account = account;
    this.username = username;
    this.image = image;
  }
}
