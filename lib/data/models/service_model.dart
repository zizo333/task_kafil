import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
  const ServiceModel({
    required this.id,
    required this.mainImage,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
    required this.title,
    required this.averageRating,
    required this.completedSalesCount,
    required this.recommended,
  });

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'] as int,
      mainImage: map['main_image'] as String? ?? '',
      price: map['price'] as num? ?? 0,
      discount: map['discount'] as num? ?? 0,
      priceAfterDiscount: map['price_after_discount'] as num? ?? 0,
      title: map['title'] as String? ?? '',
      averageRating: map['average_rating'] as num? ?? 0,
      completedSalesCount: map['completed_sales_count'] as num? ?? 0,
      recommended: map['recommended'] as bool? ?? false,
    );
  }

  final int id;
  final String mainImage;
  final num price;
  final num discount;
  final num priceAfterDiscount;
  final String title;
  final num averageRating;
  final num completedSalesCount;
  final bool recommended;

  @override
  List<Object?> get props => [
        id,
        mainImage,
        price,
        discount,
        priceAfterDiscount,
        title,
        averageRating,
        completedSalesCount,
        recommended,
      ];
}
