enum PaymentMethod {
  creditCard,
  debitCard,
  paypal,
  cash,
}

extension PaymentMethodExtension on PaymentMethod {
  String get name {
    switch (this) {
      case PaymentMethod.creditCard:
        return 'Credit Card';
      case PaymentMethod.debitCard:
        return 'Debit Card';
      case PaymentMethod.paypal:
        return 'PayPal';
      case PaymentMethod.cash:
        return 'Cash';
      default:
        return '';
    }
  }
}
