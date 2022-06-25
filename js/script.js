function makePayment() {

    var random = Math.floor(Math.random() * 100000).toString()
    var txRef = "unique_transaction_ref" + random

    FlutterwaveCheckout({
      public_key: "FLWPUBK_TEST-SANDBOXDEMOKEY-X",
      tx_ref: txRef,
      amount: 1000,
      currency: "NGN",
      payment_options: "card, banktransfer, ussd",
      meta: {
        consumer_id: 23,
        consumer_mac: "92a3-912ba-1192a",
      },
      customer: {
        email: "flwcustomer@qa.team",
        phone_number: "12345678910",
        name: "FLW customer",
      },
      customizations: {
        title: "Test Payment",
        description: "Flutter with Flutterwave",
      },
    });
  }