---
layout: default
title: Brink | Media
description: Brink in the news.
---

<div class="media-container">

  <h1>Media</h1>

  <p>For media inquiries, please email <a href="mailto:info@brink.dev">info@brink.dev</a>.</p>

  <ul class="media-list">
    {% for news in site.data.media %}
    <div class="media-list-row" style="display: flex;">
      <div class="image-column" style="flex: 30%;">
        <a href="{{ news.website }}">
          <img src="{{ news.image }}" alt="{{ news.alt }}" style="max-width: 150px; border: 1px solid darkgray;"/>
          <br /><span>{{ news.name }}</span>
        </a>
      </div>
      <div class="text-column" style="flex: 70%">
        <span class="post-meta">{{ news.date | date_to_string }}</span>
        <h2 class="post-title"><a href="{{ news.url }}" style="text-decoration:none;">{{ news.title }}</a></h2>
        <p class="post-description">"{{ news.description }}" <a href="{{ news.url }}">More...</a></p>
      </div>
    </div>
    {% endfor %}
  </ul>
</div>
