import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/payment_method.dart';
import '../../viewmodels/cart_viewmodel.dart';
import '../../viewmodels/order_viewmodel.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  PaymentMethod _selectedPaymentMethod = PaymentMethod.creditCard;
  bool _isProcessing = false;

  void _processOrder(BuildContext context) async {
    setState(() {
      _isProcessing = true;
    });

    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
    final orderViewModel = Provider.of<OrderViewModel>(context, listen: false);

    bool success = await orderViewModel.processOrder(
      cartItems: cartViewModel.cartItems,
      paymentMethod: _selectedPaymentMethod,
    );

    setState(() {
      _isProcessing = false;
    });

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Order completed successfully with ${_selectedPaymentMethod.name}')),
      );
      cartViewModel.clearCart();
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Order failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Total: \$${cartViewModel.totalPrice}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Select Payment Method:',
              style: TextStyle(fontSize: 18),
            ),
            ListTile(
              title: const Text('Credit Card'),
              leading: Radio<PaymentMethod>(
                value: PaymentMethod.creditCard,
                groupValue: _selectedPaymentMethod,
                onChanged: (PaymentMethod? value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Debit Card'),
              leading: Radio<PaymentMethod>(
                value: PaymentMethod.debitCard,
                groupValue: _selectedPaymentMethod,
                onChanged: (PaymentMethod? value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('PayPal'),
              leading: Radio<PaymentMethod>(
                value: PaymentMethod.paypal,
                groupValue: _selectedPaymentMethod,
                onChanged: (PaymentMethod? value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Cash'),
              leading: Radio<PaymentMethod>(
                value: PaymentMethod.cash,
                groupValue: _selectedPaymentMethod,
                onChanged: (PaymentMethod? value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            _isProcessing
                ? Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: () => _processOrder(context),
                    child: Text('Complete Order'),
                  ),
          ],
        ),
      ),
    );
  }
}
