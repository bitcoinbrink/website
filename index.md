---
layout: default
title: Brink
---

<div class="about-container">
  <div class="about-image">
    <img class="about-logo" src="assets/images/brink_logo.png" alt="brink logo"/>
  </div>
</div>

Brink exists to strengthen the Bitcoin protocol and network through
fundamental research and development, and to support the Bitcoin
developer community through funding, education, and mentoring.

We support and mentor new contributors to open source Bitcoin
development through our [fellowship program](/programs#fellowships), and
support the work of established Bitcoin protocol engineers through our
[grants program](/programs#grants).

We were founded in 2020 with generous financial support from
John Pfeffer and Wences Casares. We are 100% funded by donations from
individuals and organizations who wish to support the open source Bitcoin
network and protocol.

Subscribe to the Brink newsletter or
follow [@bitcoinbrink](https://twitter.com/bitcoinbrink) on Twitter to receive
updates on what else we are working on.
{% include newsletter-signup.html %}

<div class="team-container">
  <h1>Team</h1>
  {% for item in site.data.team.officers %}
  <div class="team-row">
    <div class="image-column">
      <img src="{{ item.image }}" alt="{{ item.alt }}"/>
    </div>
    <div class="text-column">
      <h2 class="team-name">{{ item.name }}</h2>
      <h3 class="item-title">{{ item.title | upcase }}</h3>
      <p class="item-description">
        {{ item.description }}
      </p>
      {% if item.social %}
      <div class="team-social">
        <a href="{{ item.link }}" target="_blank">{{ item.social }}</a>
      </div>
      {% endif %}
    </div>
  </div>
  {% endfor %}
</div>
<div class="team-container">
  <h1 id="board">Board</h1>
  <p>John and Mike serve on the board, along with the following independent board members:</p>
  {% for item in site.data.team.board %}
  <div class="team-row">
    <div class="image-column">
      <img src="{{ item.image }}" alt="{{ item.alt }}"/>
    </div>
    <div class="text-column">
      <h2 class="team-name">{{ item.name }}</h2>
      <p class="item-description">
        {{ item.description }}
      </p>
      {% if item.social %}
      <div class="team-social">
        <a href="{{ item.link }}" target="_blank">{{ item.social }}</a>
      </div>
      {% endif %}
    </div>
  </div>
  {% endfor %}
</div>

<!-- <div class="about-container"> -->
<!--   <div class="contact-row"> -->
<!--     <div class="about-icon"> -->
<!--       <img src="assets/images/mail.png" alt="white mail icon" /> -->
<!--     </div> -->
<!--     <div class="about-contact"> -->
<!--       <a href="mailto:info@brink.dev"><h2>info@brink.dev</h2></a> -->
<!--     </div> -->
<!--   </div> -->
<!--   <div class="contact-row"> -->
<!--     <div class="about-icon"> -->
<!--       <img src="assets/images/twitter.png" alt="white twitter icon" /> -->
<!--     </div> -->
<!--     <div class="about-contact"> -->
<!--       <a href="https://twitter.com/brinkfund" target="_blank" rel="noopener"><h2>@brinkfund</h2></a> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
