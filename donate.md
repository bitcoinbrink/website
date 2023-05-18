---
layout: default
title: Donate | Brink
description: Brink and Marathon are partnering to raise $1,000,000 for Bitcoin developers.
---

<div id="donate-container">
  
<img style="width:100%" src="/assets/images/marathon-brink.png" />

<h1>Let's Raise $1,000,000 for Bitcoin Development</h1>

<p>Brink and Marathon Digital Holdings (MARA) have partnered to raise <em>$1,000,000</em> for Bitcoin developers. Marathon will match donations up to <b><em>$500,000</em></b>. All donations to Brink are 501(c)(3) tax-deductible and 100% of donations will support the Bitcoin developers <em>building</em>, <em>securing</em>, <em>testing</em>, and <em>reviewing</em> the Bitcoin Core software underpinning the Bitcoin network.</p>

<div class="text-column">
  <div class="progress-bg" style="background-color:lightgray;">
    <div class="progress-bar" id="progress-bar" style="width:0%">
      <h3 class="raised" id="raised">$0</h3>
    </div>
  </div>
</div>

<h2 id="countdown">Bitcoin 2023 Conference $2 for $1 donation match: <span id="counter"></span></h2>

<div class="donate-row">

<div class="donate-col">
<a href="https://checkout.opennode.com/p/5698f840-83ae-4226-a68c-9cfa3005bdbd"><button>₿ Donate bitcoin</button></a>
<br /><em>Lightning, onchain</em>
</div>

<div class="donate-col">
<a href="https://buy.stripe.com/9AQ4gA91a7Ts2mQfZ1"><button>$ Donate fiat</button></a>
<br /><em>Credit card, Cash App, Apple Pay, Google Pay. <a href="#other-fiat">Other options</a></em>
</div>

</div>

<div class="donate-row">

<div class="donate-col">
  <h3>What Developer Grants Provide:</h3>
  <ul style="list-style-type:disc;margin-left:2em;text-align:left">
    <li>Funding for developers focused on building, securing, testing, and reviewing Bitcoin Core</li>
    <li>Grantees help run <a href="https://bitcoinops.org/">Bitcoin Optech</a>, an educational resource</li>
    <li>Grantees help run the weekly <a href="https://bitcoincore.reviews/">Bitcoin PR Review Club</a>, a new developer pipeline</li>
    <li>Grantees mentor junior developers via Summer of Bitcoin and Qala</li>
    <li>See the projects our grantees are working on <a href="#current-grantees">below</a></li>
  </ul>
</div>

<div class="donate-col">
 <h3>Why Brink?</h3>
  <ul style="list-style-type:disc;margin-left:2em;text-align:left">
    <li>We fund <a href="https://www.coindesk.com/tech/2022/10/27/brink-emerges-as-the-top-funder-of-bitcoin-core-development-bitmex-research-says/">leading contributors</a> to the Bitcoin Core software</li>
    <li>9 independent Bitcoin developers across 5 countries</li>
    <li>Trusted by Marathon, John Pfeffer, Wences Casares, Tim Draper, Coinbase, Okcoin, and <a href="/sponsors">more</a></li>
    <li>Non-profit 501c3 tax-deductible donations</li>
    <li>London office for in-person collaboration</li>
    <li>100% funded by the community through donations</li>
  </ul>
</div>

</div>

<h2 id="current-grantees">Brink Grantees</h2>

<div class="team-container">
  {% for item in site.data.team.grantees %}
  <div class="team-row">
    <div class="image-column">
      <img src="{{ item.image }}" alt="{{ item.alt }}"/>
    </div>
    <div class="text-column">
      <h3 class="team-name">{{ item.name }}</h3>
      <p class="item-description">
        {{ item.description }}
      </p>
      <p class="item-description">
        <em>{{ item.quote }}</em>
      </p>
    </div>
  </div>
  {% endfor %}
</div>

<h2>FAQ</h2>

<h3>How is Brink funded?</h3>
<p>Brink is 100% funded by donations from members of the public and sponsorship from Bitcoin businesses.</p>

<h3>Are donations tax-deductible?</h3>
<p>Brink Technology, Inc is a 501(c)(3) organization (EIN 85-2919136). Donations to Brink from U.S. taxpayers can be deducted under IRC section 170.</p>

<h3>How do I claim a tax deduction?</h3>
<p>If you provided an email when you donated, we will email you a receipt with details at the end of the year.</p>

<h3>How much of the donations do grantees get?</h3>
<p>Brink's operational costs have been covered by our <a href="/sponsors">Founding Sponsors</a> allowing all donations to go 100% to the developer grantees.</p>

<h3>Do you offer monthly recurring donation options?</h3>
<p>
<button data-checkout-mode="subscription" class="stripe" data-price-id="price_1Hph47ArUr4rAMAlxD7hYXMa">$5.00/mo</button>
<button data-checkout-mode="subscription" class="stripe" data-price-id="price_1HqkScArUr4rAMAl5H0staN4">$20.00/mo</button>
<button data-checkout-mode="subscription" class="stripe" data-price-id="price_1HqkSjArUr4rAMAlEt5w8qMk">$50.00/mo</button>
<button data-checkout-mode="subscription" class="stripe" data-price-id="price_1HqkSqArUr4rAMAl6yTaoLt1">$100.00/mo</button>
<button data-checkout-mode="subscription" class="stripe" data-price-id="price_1MZykdArUr4rAMAlsC0PEpet">$250.00/mo</button>
<button data-checkout-mode="subscription" class="stripe" data-price-id="price_1MZykdArUr4rAMAl13jojzYv">$500.00/mo</button>
<button data-checkout-mode="subscription" class="stripe" data-price-id="price_1MZykeArUr4rAMAlANbXog0U">$1000.00/mo</button>
<br />
<em>If you'd like to donate more than $1,000/mo, please send us an email <a href="mailto:donate@brink.dev">donate@brink.dev</a>.</em></p>

<h3 id="other-fiat">How else can I donate fiat?</h3>
<p>In addition to credit card donations including Apple Pay and Google Pay we can accept donations via:
  <ul>
    <li><a href="https://www.dafdirect.org/DAFDirect/daflink?_dafdirect_settings=ODUyOTE5MTM2XzIxMTFfYWJlNTBiNDItY2EyMC00YjYxLThhODctZDk0ZDZhMTRjZmIz&designatedText=UHJvZ3JhbXM=">Donor-Advised Funds</a> (Learn more <a href="/blog/2021/03/26/donate-bitcoin/">here</a>)</li>
    <li>Stablecoins: 
    <a href="https://etherscan.io/address/0x04A0455D3529B383e32C80aF746B8438da5F873e">USDC, USDT, BUSD</a>
    </li>
    <li>Reach out to <a href="mailto:donate@brink.dev">donate@brink.dev</a> for other options</li>
  </ul>
</p>

<h3>Other questions?</h3>
<p>Questions or curious about what we are working on? Feel free to email us to discuss <a href="mailto:donate@brink.dev">donate@brink.dev</a>.</p>

</div>

<div id="error-message"></div>

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

      document.querySelectorAll('button.stripe').forEach(function (button) {
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

      // countdown
      // Set the date we're counting down to
      var countDownDate = Date.UTC(2023, 4, 22, 4, 59, 59)

      // Update the count down every 1 second
      var x = setInterval(function() {

        // Get today's date and time
        var now = new Date().getTime();

        // Find the distance between now and the count down date
        var distance = countDownDate - now;

        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);
        document.getElementById("counter").innerHTML = days + "d " + hours + "h "
        + minutes + "m " + seconds + "s ";
      }, 1000);

  var url = 'https://docs.google.com/spreadsheets/d/1TImxWQG1NLyAtTJo74F4vCZd_BeKuh4jnzYhOQcso58/gviz/tq?tqx=out:json&tq&gid=0';
  fetch(url)
    .then(response => response.text())
    .then(data => updateData(data.substring(47).slice(0, -2))  
    );

  function updateData(jsonString){
    var json = JSON.parse(jsonString);
    raised = json.table.rows[0].c[0].v
    percent = json.table.rows[0].c[1].v
    document.getElementById('raised').innerHTML = "$" + raised.toLocaleString("en-US");
    document.getElementById('progress-bar').style.width = percent*100+"%";
  }
</script>
