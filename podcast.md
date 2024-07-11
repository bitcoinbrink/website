---
layout: default
title: The Bitcoin Development Podcast | brink
description: Join Brink as we talk with our fellows, grantees, and friends in the Bitcoin space about Bitcoin and Lightning technology.
---

<div class="blog-container">

  <h1>The Bitcoin Development Podcast</h1>

  <p>Join Brink as we talk with our fellows, grantees, and friends in the Bitcoin space about Bitcoin and Lightning technology.</p>

  <p><em>Brink's The Bitcoin Development Podcast content is licensed Creative Commons <a href="https://creativecommons.org/licenses/by-sa/4.0/legalcode" target="_blank">CC BY-SA 4.0</a></em></p>

  {% include podcast-links.html %}

  <ul class="post-list">
    {% for pod in site.podcasts reversed %}
    <li>
      <span class="post-meta">{{ pod.date | date_to_string }}</span>
      <h2 class="post-title"><a href="{{ pod.permalink }}">{{ pod.title }}</a></h2>
      <p>{{ pod.description }}</p>
    </li>
    {% endfor %}
  </ul>
</div>
