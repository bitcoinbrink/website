---
layout: default
title: Programs | Brink
description: Brink supports and mentors new contributors to open source Bitcoin development
  through our fellowship program, and supports the work of established Bitcoin protocol engineers
  through our grants program.
---

# <span id="fellowship">Fellowship</span>

The Brink fellowship is an intensive one-year program to onboard exceptional
software engineers into Bitcoin protocol development. Developed and coordinated
by Brink director John Newbery, the fellowship draws on John’s four years
experience of contributing to Bitcoin Core, running the [Chaincode
Residencies](https://residency.chaincode.com/) and [PR Review
Club](https://bitcoincore.reviews/), and mentoring many Bitcoin open source
contributors.

As a Brink fellow, you’ll spend a year working alongside our engineering team and the other
Brink fellows. You’ll learn about all aspects of the Bitcoin Core system,
including consensus, peer-to-peer networking, wallets and cryptography. You’ll
become an effective open source contributor, and will start making
contributions to the project from day one. By the end of your fellowship,
you’ll have a track record of high-quality, high-impact contributions to
Bitcoin Core or other open source projects, and you’ll be very well positioned
to seek funding or employment to continue your open source Bitcoin career.

If you love Bitcoin and can’t imagine wanting to work on any other project,
then there’s no better place to start your Bitcoin career. You’ll receive
dedicated mentoring and support, be surrounded by passionate Bitcoiners, and
learn by doing - making contributions to Bitcoin Core and other projects.

We’re looking for developers from all backgrounds to apply. You need to be
passionate about Bitcoin and hungry to make contributions to the project.
There are no specific educational requirements - evidence of prior open source
contributions (code review, technical writing, etc) is far more important.

Fellows will be paid a competitive salary, with all of the benefits you’d
expect for a software engineering job. The fellowship takes place in our London
office, so applicants must be prepared to relocate. We may be able to help with
travel and visas on a case-by-case basis.

<a href="https://brink.homerun.co/fellowship"><button>Apply for
the Fellowship</button></a>

<h2 id="brink_fellows">Brink Fellows</h2>

<div class="team-container">
  {% for item in site.data.team.fellows %}
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
      {% if item.social %}
      <div class="team-social">
        <a href="{{ item.link }}" target="_blank">{{ item.social }}</a>
      </div>
      {% endif %}
    </div>
  </div>
  {% endfor %}
</div>

# <span id="grants">Grants</span>

Bitcoin's long-term success requires a sustainable funding model
for open source developers to maintain and extend the protocol, test and
review code changes, and fix critical bugs in the software. Brink was founded
to support Bitcoin development and Bitcoin open source developers. Our grant
program is central to that mission.

The grant program awards year-long grants to established Bitcoin protocol
developers to work full time on open source Bitcoin projects. Our primary focus
is on the security and stability of the base protocol, but we will also fund
research and development on extending functionality, scalability and usability of
Bitcoin and related projects, including Lightning and other layer two technologies.

The grant program is open to developers anywhere in the world. Grant applicants must:

- have a track record of making high-quality, security-first contributions to
  Bitcoin or related projects.
- be committed to transparency and accountability. Brink is a publicly funded
  organization, and grantees are expected to publicly commit to project
  deliverables and give regular public updates on progress.
- be self-motivated and self-driven. Grantees will provide regular public
  updates on their projects, but day-to-day will be working independently. To
  be successful, grantees must thrive in a no-management work environment.
- be able to work collaboratively and constructively with other open-source
  contributors.
- be committed to increasing the impact of their contributions, growing the
  developer ecosystem and scaling Bitcoin and related projects.

<a href="https://brink.homerun.co/grants"><button>Apply for a Grant</button></a>

<h2 id="brink_grantees">Brink Grantees</h2>

<div class="team-container">
  {% for item in site.data.team.grantees %}
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
      {% if item.social %}
      <div class="team-social">
        <a href="{{ item.link }}" target="_blank">{{ item.social }}</a>
      </div>
      {% endif %}
    </div>
  </div>
  {% endfor %}
</div>

## Stay updated

Follow [@bitcoinbrink](https://twitter.com/bitcoinbrink) on Twitter or subscribe to our
newsletter including updates on project progress and accouncements of new
fellows and grantees.
{% include newsletter-signup.html %}
