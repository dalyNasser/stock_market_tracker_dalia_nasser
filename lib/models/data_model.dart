class DataModel {

  final String? name;
  final String? date;
  final String? symbol;
  final String? exchange;
  final double? open;
  final double? high;
  final double? low;
  final double? close;
  final double? volume;
  final double? adjOpen;
  final double? adjHigh;
  final double? adjLow;
  final double? adjClose;
  final double? adjVolume;

  DataModel( {
    this.name,
    required this.date,
    required this.symbol,
    required this.exchange,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    required this.adjOpen,
    required this.adjHigh,
    required this.adjLow,
    required this.adjClose,
    required this.adjVolume,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      date: json['date'],
      name: json['name'],
      symbol: json['symbol'],
      exchange: json['exchange'],
      open: json['open'],
      high: json['high'],
      low: json['low'],
      close: json['close'],
      volume: json['volume'],
      adjOpen: json['adj_open'],
      adjHigh: json['adj_high'],
      adjLow: json['adj_low'],
      adjClose: json['adj_close'],
      adjVolume: json['adj_volume'],
    );
  }
}
