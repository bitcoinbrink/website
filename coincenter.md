---
permalink: /coincenter.html
layout: default
---

<div class="about-container">
  <div class="about-image">
    <img class="about-logo" src="assets/images/brink_logo.png" alt="brink logo"/>
  </div>
</div>

<div class="media-container" style="margin-top:0px;">
  <ul class="media-list">
    <div class="media-list-row">
      <div class="image-column">
        <img src="assets/images/coincenter/brink.jpg" />
      </div>
      <div class="text-column">
        <h2 class="post-title">Brink is funding 12 Bitcoin developers</h2>
        <p class="post-description">
          <ul style="list-style-type:disc;margin-left:2em;text-align:left">
            <li>12 independent developers across 7 countries focused on Bitcoin and Lightning ecosystems</li>
            <li>Priority on securing, testing, and review</li>
            <li>Brink office in London for in-person collaboration</li>
            <li>See what our grantees are working on <a href="#current-grantees">below</a></li>
          </ul>
        </p>
      </div>
    </div>
    <div class="media-list-row">
      <div class="image-column">
        <img src="assets/images/coincenter/sob.png" />
      </div>
      <div class="text-column">
        <h2 class="post-title">Brink is onboarding new Bitcoin developers</h2>
        <p class="post-description">
          <ul style="list-style-type:disc;margin-left:2em;text-align:left">
            <li>Grantees run the weekly <a href="https://bitcoincore.reviews/">Bitcoin Core PR Review Club</a>, a pipeline for new developers</li>
            <li>Grantees regularly present at conferences and workshops</li>
            <li>Brink grantees are mentoring <a href="https://www.summerofbitcoin.org/">Summer of Bitcoin</a> interns</li>
            <li>Part time grants and mentorship for junior developers</li>
          </ul>
        </p>
      </div>
    </div>
    <div class="media-list-row">
      <div class="image-column">
        <img src="assets/images/coincenter/optech-site.png" />
      </div>
      <div class="text-column">
        <h2 class="post-title">Brink runs the community's premier technical resource, Bitcoin Optech</h2>
        <p class="post-description">
          <ul style="list-style-type:disc;margin-left:2em;text-align:left">
            <li>Weekly <a href="https://bitcoinops.org/en/publications/">technical newsletters</a> for developers</li>
            <li>A wiki of educational <a href="https://bitcoinops.org/en/topics/">topics</a></li>
            <li>Several in-person international workshops on taproot and scaling technology</li>
          </ul>
        </p>
      </div>
    </div>
    <div class="media-list-row">
      <div class="image-column">
        <img src="assets/images/coincenter/sponsors.png" />
      </div>
      <div class="text-column">
        <h2 class="post-title">Brink is entirely community funded</h2>
        <p class="post-description">
          <ul style="list-style-type:disc;margin-left:2em;text-align:left">
            <li>501c3 not for profit status</li>
            <li>Donations by some of the largest crypto companies</li>
            <li>Help Brink grow and sustain the developers securing the network</li>
          </ul><br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="mailto:mike@brink.dev"><button>Reach out about donating</button></a>
        </p>
      </div>
    </div>
  </ul>
</div>

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

<a href="mailto:mike@brink.dev"><button>Reach out about donating</button></a>

