class TxnsListData {
  String from;
  String to;
  String value;
  String timeStamp;
  String gas;
  bool isSent = false;

  TxnsListData(
    String from,
    String to,
    String value,
    String fiatValue,
    String gas,
    bool isSent,
  ) {
    this.from = from;
    this.to = to;
    this.value = value;
    this.timeStamp = fiatValue;
    this.gas = gas;
    this.isSent = isSent;
  }
}
