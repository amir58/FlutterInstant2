enum OrderStatus { requested, accepted, refused }

enum PaymentMethod { paypal, cash, visa, masterCard }

class Payment {
  PaymentMethod paymentMethod;

  Payment(this.paymentMethod);

  void setPaymentMethod({required PaymentMethod paymentMethod}) {
    this.paymentMethod = paymentMethod;
  }

  void printPaymentMethod() {
    print(paymentMethod);
    print(paymentMethod.name);
    print(paymentMethod.index);
  }
}

main() {
  Payment payment = Payment(PaymentMethod.paypal);
  payment.printPaymentMethod();

  payment.setPaymentMethod(paymentMethod: PaymentMethod.visa);
  payment.printPaymentMethod();
}
