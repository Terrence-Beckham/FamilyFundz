class ExpenseCategory {
  final String name;
  final String icon;

  const ExpenseCategory({
    required this.name,
    required this.icon,
  });

  // Convert SwiftUI system icons to Flutter icons
  String get flutterIcon {
    switch (icon) {
      case 'house.fill':
        return 'home';
      case 'lightbulb.fill':
        return 'lightbulb';
      case 'cart.fill':
        return 'shopping_cart';
      case 'car.fill':
        return 'directions_car';
      case 'fork.knife':
        return 'restaurant';
      case 'film.fill':
        return 'movie';
      case 'heart.fill':
        return 'favorite';
      case 'shield.fill':
        return 'shield';
      case 'tshirt.fill':
        return 'checkroom';
      case 'graduationcap.fill':
        return 'school';
      case 'stroller.fill':
        return 'stroller';
      case 'scissors':
        return 'content_cut';
      case 'bookmark.fill':
        return 'bookmark';
      case 'creditcard.fill':
        return 'credit_card';
      case 'gift.fill':
        return 'card_giftcard';
      case 'airplane':
        return 'flight';
      case 'pawprint.fill':
        return 'pets';
      case 'desktopcomputer':
        return 'computer';
      case 'banknote.fill':
        return 'savings';
      case 'hammer.fill':
        return 'build';
      case 'bandage.fill':
        return 'medical_services';
      case 'hands.sparkles.fill':
        return 'volunteer_activism';
      case 'chart.bar.xaxis':
        return 'bar_chart';
      case 'doc.text.magnifyingglass':
        return 'description';
      case 'paintbrush.fill':
        return 'brush';
      case 'square.grid.2x2.fill':
        return 'grid_view';
      case 'briefcase.fill':
        return 'work';
      case 'laptopcomputer':
        return 'laptop';
      case 'house.and.arrow.up.fill':
        return 'real_estate_agent';
      case 'chart.line.uptrend.xyaxis':
        return 'trending_up';
      case 'arrow.2.circlepath.circle.fill':
        return 'replay';
      case 'bitcoinsign.circle.fill':
        return 'currency_bitcoin';
      case 'chart.line.uptrend.xyaxis.circle.fill':
        return 'show_chart';
      default:
        return 'question_mark';
    }
  }
}
