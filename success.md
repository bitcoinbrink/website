---
permalink: /success.html
layout: default
---

<div class="container">
  <h2>Donation Successful</h2>

  <p><strong>Your payment was successful. Thank you for your contribution.</strong></p>
  <p><strong><span id="session"></span></strong></p>
  <p>Contact <a href="mailto:info@brink.dev">info@brink.dev</a> with any questions</p>

</div>

<script>
  var urlParams = new URLSearchParams(window.location.search);

  if (urlParams.has("session_id")) {
    document.getElementById("session").textContent = urlParams.get(
      "session_id"
    );
  }
</script>