class HistoryListData {
  int id;
  String account;
  String address;
  String username;
  String balance;
  String timestamp;

  HistoryListData(
      int id, String account, String address, String username, String balance,
      String timestamp) {
    this.id = id;
    this.account = account;
    this.address = address;
    this.username = username;
    this.balance = balance;
    this.timestamp = timestamp;
  }
}
