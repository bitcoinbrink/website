---
layout: default
title: Brink | Sponsors
description: Thank you to all of our generous donors who make our work possible.
---

<div class="sponsors-container">
  <h1>Founding Sponsors</h1>
  <p>Our founding sponsors generously funded our start-up costs as well as our ongoing costs.</p>
  <div class="sponsors-row">
    {% for sponsor in site.data.sponsors.founding %}
    <div class="sponsors-col">
      <img src="{{ sponsor.image }}" alt="{{ sponsor.alt }}" style="max-height: 200px"/>
      <h4 class="post-title">{{ sponsor.name }}</h4>
    </div>
    {% endfor %}
  </div>
</div>

<div class="sponsors-container">
  <h2>Fellowship and Grant Partners</h2>
  <p>Our Fellowship and Grant partners make our programs possible by providing
  funding for our fellows and grantees as well as associated costs.</p>
  <div class="sponsors-row">
    {% for sponsor in site.data.sponsors.grants %}
    <div class="sponsors-col">
      <a href="{{ sponsor.website }}">
        <img src="{{ sponsor.image }}" alt="{{ sponsor.alt }}" style="max-height: 200px"/>
        <h4 class="post-title">{{ sponsor.name }}</h4>
      </a>
    </div>
    {% endfor %}
  </div>
</div>

