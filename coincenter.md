---
permalink: /coincenter.html
layout: default
---

<div class="about-container">
  <div class="about-image">
    <img class="about-logo" src="assets/images/brink_logo.png" alt="brink logo"/>
  </div>
</div>

Brink is a 501c3 dedicated to supporting the Bitcoin software, protocol,
and network through developer funding, education, and mentoring. See why John
Pfeffer, Tim Draper, Wences Casares, Coinbase, Okcoin, and others have partnered
with Brink to advance Bitcoin's mission...

Help Brink grow and sustain the developers securing the Bitcoin software.

<a href="mailto:donate@brink.dev"><button>Email us to learn about our 2023 plans</button></a>

<div class="media-container" style="margin-top:0px;">
  <ul class="media-list">
    <div class="media-list-row">
      <div class="image-column">
        <img src="/assets/images/media/coindesk.png" />
      </div>
      <div class="text-column">
        <h2 class="post-title">"Brink Emerges as the Top Funder of Bitcoin Core Development"</h2>
        <p class="post-description">
          Independent research from BitMex Research and CoinDesk state: "The nonprofit has funded the highest number of active Bitcoin Core developers and reviewers". <a href="https://www.coindesk.com/tech/2022/10/27/brink-emerges-as-the-top-funder-of-bitcoin-core-development-bitmex-research-says/">More...</a>
        </p>
      </div>
    </div>
    <div class="media-list-row">
      <div class="image-column">
        <img src="assets/images/coincenter/brink.jpg" />
      </div>
      <div class="text-column">
        <h2 class="post-title">Brink is funding Bitcoin developers</h2>
        <p class="post-description">
          <ul style="list-style-type:disc;margin-left:2em;text-align:left">
            <li>Independent developers across 5 countries focused on Bitcoin</li>
            <li>Priority on securing, testing, and review</li>
            <li>Brink office in London for in-person collaboration</li>
            <li>See what our grantees are working on <a href="#current-grantees">below</a></li>
          </ul>
        </p>
      </div>
    </div>
    <div class="media-list-row">
      <div class="image-column">
        <img src="assets/images/coincenter/optech-site.png" />
      </div>
      <div class="text-column">
        <h2 class="post-title">Brink is onboarding new Bitcoin developers</h2>
        <p class="post-description">
          <ul style="list-style-type:disc;margin-left:2em;text-align:left">
            <li>Brink grantees help run the community's premier educational and technical resource, <a href="https://bitcoinops.org/">Bitcoin Optech</a>. Weekly newsletters, podcasts, wiki, workshops</li>
            <li>Grantees run the weekly <a href="https://bitcoincore.reviews/">Bitcoin PR Review Club</a>, a pipeline for new developers</li>
            <li>Brink grantees mentor junior developers via the Summer of Bitcoin and Qala programs</li>
            <li>Physical London office promotes mentorship</li>
          </ul>
        </p>
      </div>
    </div>
  </ul>
</div>

<a href="mailto:donate@brink.dev"><button>Reach out about donating</button></a>

# Current Grantees

<div class="team-container">
{% assign team = site.data.team.fellows | concat: site.data.team.grantees %}
  {% for item in team %}
  <div class="team-row">
    <div class="image-column">
      <img src="{{ item.image }}" alt="{{ item.alt }}"/>
    </div>
    <div class="text-column">
      <h3 class="team-name">{{ item.name }}</h3>
      <h4 class="item-title">{{ item.title | upcase }}</h4>
      <p class="item-description">
        {{ item.description }}
      </p>
    </div>
  </div>
  {% endfor %}
</div>

<h2>Donate</h2>

Brink is entirely donation supported. Help Bitcoin by making a donation.

<a href="mailto:donate@brink.dev"><button>Reach out about donating</button></a>
