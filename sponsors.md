---
layout: default
title: Brink | Sponsors
description: Thank you to all of our generous donors who make our work possible.
---

<div class="sponsors-container">
  <h2>Founding Sponsors</h2>
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

<div class="program-sponsors-container">
  <h2>Program Partners</h2>
  <p>Our Fellowship and Grant partners make our programs possible by providing
  funding for our fellows and grantees as well as associated costs.</p>
  {% assign grants_sorted = site.data.sponsors.grants | sort: 'amount' | reverse  %}
  {% assign grant_largest = grants_sorted.first.amount | divided_by: 100 %}
  {% for sponsor in grants_sorted %}
  <div class="program-sponsors-row">
    <div class="image-column">
      {% if sponsor.website %}
        <a href="{{ sponsor.website }}">
      {% endif %}
        <img src="{{ sponsor.image }}" alt="{{ sponsor.alt }}" />
        <br /><span>{{ sponsor.name }}</span>
      {% if sponsor.website %}
        </a>
      {% endif %}
    </div>
    <div class="text-column">
      <div class="progress-bg">
        <div class="progress-bar" style="width:100%">
        	<h3 class="raised">{{ sponsor.amount_formatted }}</h3>
        </div>
      </div>
    </div>
  </div>
  {% endfor %}
</div>

<div class="sponsors-providers-container">
  <h2>Service Providers</h2>
  <p>Brink thanks our service provider partners for their generous donations.</p>
  <div class="sponsors-row">
    {% for sponsor in site.data.sponsors.providers %}
    <div class="sponsors-col">
      <a href="{{ sponsor.website }}">
        <img src="{{ sponsor.image }}" alt="{{ sponsor.alt }}" />
        <br /><span>{{ sponsor.name }} - {{ sponsor.type }}</span>
      </a>
    </div>
    {% endfor %}
  </div>
</div>
