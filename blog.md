---
layout: default
title: Blog | brink
description: The latest news from Brink, our fellows, and our grantees.
---

<div class="blog-container">
  <ul class="post-list">
    {% for post in site.posts %}
    <li>
      <span class="post-meta">{{ post.date | date_to_string }}</span>
      <h2 class="post-title"><a href="{{ post.url }}">{{ post.title }}</a></h2>
      <p>{{ post.description }}</p>
    </li>
    {% endfor %}
  </ul>
</div>
