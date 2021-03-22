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
    <div class="media-list-row">
      <div class="image-column">
        <a href="{{ news.url }}">
          <img src="/assets/images/media/{{ news.image }}" alt="{{ news.alt }}" />
          <br /><span>{{ news.name }}</span>
        </a>
      </div>
      <div class="text-column">
        <span class="post-meta">{{ news.date | date_to_string }}</span>
        <h2 class="post-title"><a href="{{ news.url }}" style="text-decoration:none;">{{ news.title }}</a></h2>
        <p class="post-description">"{{ news.description }}" <a href="{{ news.url }}">More...</a></p>
      </div>
    </div>
    {% endfor %}
  </ul>
</div>
