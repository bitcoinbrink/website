---
layout: default
title: Brink | Media
description: Brink in the news.
---

<div class="media-container">

  <h1>Media</h1>

  <p>For media inquiries, please email <a href="mailto:info@brink.dev">info@brink.dev</a>.</p>

  <ul class="post-list">
    {% for news in site.data.media %}
    <li>
      <span class="post-meta">{{ news.date | date_to_string }}</span>
      <h2 class="post-title"><a href="{{ news.url }}">{{ news.title }}</a></h2>
      <p class="post-description">"{{ news.description }}" <a href="{{ news.url }}">More...</a></p>
    </li>
    {% endfor %}
  </ul>
</div>
