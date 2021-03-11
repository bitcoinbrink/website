---
layout: default
title: Donate | Brink
description: Brink is 100% funded by donations from members of the public and sponsorship from Bitcoin businesses.
---

<h1>Donate</h1>

<p>Brink is 100% funded by donations from members of the public and
sponsorship from Bitcoin businesses.</p>

<p>Brink Technology, Inc is a 501(c)(3) organization (EIN 85-2919136).
Donations to Brink from U.S. taxpayers can be deducted under IRC section 170.</p>

<h4>One-time Donation</h4>

<button data-checkout-mode="payment" data-price-id="price_1HqkSyArUr4rAMAltEjPznBR">$50.00</button>
<button data-checkout-mode="payment" data-price-id="price_1HqkT8ArUr4rAMAlvENz60HJ">$100.00</button>
<button data-checkout-mode="payment" data-price-id="price_1HqkTEArUr4rAMAlqd2g9EEa">$500.00</button>
<button data-checkout-mode="payment" data-price-id="price_1HqkTLArUr4rAMAlJkNGfFrZ">$1000.00</button>
<button data-checkout-mode="payment" data-price-id="price_1HqkTQArUr4rAMAllr5igJQ9">$2500.00</button>

<h4>Monthly Recurring Donation</h4>

<button data-checkout-mode="subscription" data-price-id="price_1Hph47ArUr4rAMAlxD7hYXMa">$5.00/mo</button>
<button data-checkout-mode="subscription" data-price-id="price_1HqkScArUr4rAMAl5H0staN4">$20.00/mo</button>
<button data-checkout-mode="subscription" data-price-id="price_1HqkSjArUr4rAMAlEt5w8qMk">$50.00/mo</button>
<button data-checkout-mode="subscription" data-price-id="price_1HqkSqArUr4rAMAl6yTaoLt1">$100.00/mo</button>

<div id="error-message"></div>

<h4>Bitcoin/Lightning Donation</h4>

<a href="https://checkout.opennode.com/p/5698f840-83ae-4226-a68c-9cfa3005bdbd"><button>Donate with bitcoin</button></a>

<p><em>For donations greater than $2500.00 USD, please email <a href="mailto:info@brink.dev">info@brink.dev</a></em></p>

<h2>Keep in touch</h2>
<p>Follow <a href="https://twitter.com/bitcoinbrink">@bitcoinbrink</a> on Twitter or subscribe to the Brink newsletter which includes fellow and grantee contribution updates as a result of your donations.</p>
{% include newsletter-signup.html %}

<script src="https://js.stripe.com/v3/"></script>
<script>
      var PUBLISHABLE_KEY = 'pk_live_51HotqwArUr4rAMAlHIbM3LGwGFb1k2UsRpi91MlbxlYXFJQFSGPcxrJXI3oREpQnWCbTVDHEdzh0RNxsdfzUcSvh002frYUK76';
      var DOMAIN = location.href.replace(/[^/]*$/, '');

      var stripe = Stripe(PUBLISHABLE_KEY);

      // Handle any errors from Checkout
      var handleResult = function (result) {
        if (result.error) {
          var displayError = document.getElementById('error-message');
          displayError.textContent = result.error.message;
        }
      };

      document.querySelectorAll('button').forEach(function (button) {
        button.addEventListener('click', function (e) {
          var mode = e.target.dataset.checkoutMode;
          var priceId = e.target.dataset.priceId;
          var items = [{ price: priceId, quantity: 1 }];
          stripe
            .redirectToCheckout({
              mode: mode,
              lineItems: items,
              successUrl:
                DOMAIN + 'success.html?session_id={CHECKOUT_SESSION_ID}',
              cancelUrl:
                DOMAIN + 'canceled.html?session_id={CHECKOUT_SESSION_ID}',
            })
            .then(handleResult);
        });
      });
    </script>
