class Stock {
  final String name;

  //thương hiệu
  final String brand;

  //tên cty
  final String producer;

  //tổng giá trị công ty
  final double totalPrice;

  //giá cổ phiếu bình thường
  final double price;

  //giá cổ phiếu thời điểm hiện tại
  final double currentPrice;

  //pe
  final double pe;

  //lợi nhuận
  final double profit;

  //doanh thu quý
  final double revenue;
  Stock(
    this.name,
    this.brand,
    this.producer,
    this.totalPrice,
    this.price,
    this.currentPrice,
    this.pe,
    this.profit,
    this.revenue,
  );
}
