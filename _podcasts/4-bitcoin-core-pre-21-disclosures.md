---
title: "Episode 4: Discussing Pre-0.21.0 Bitcoin Core Vulnerability Disclosures"
permalink: /podcast/4-bitcoin-core-pre-21-disclosures/
layout: podcast
date: 2024-07-11
description: Gloria Zhao and Niklas Gögge discuss the recently disclosed Bitcoin Core pre-0.21.0 vulnerabilities.
---

Brink engineers [Gloria Zhao][] and [Niklas Gögge][] talk through the recently
disclosed Bitcoin Core pre-0.21.0 vulnerabilities.

<iframe src="https://podcasters.spotify.com/pod/show/bitcoinbrink/embed/episodes/Discussing-Pre-0-21-0-Bitcoin-Core-Vulnerability-Disclosures-e2ltlkr/a-abe67gk" height="102px" width="400px" frameborder="0" scrolling="no"></iframe>

* 0:00 - Introductions and motivation for disclosures
* 3:17 - [Absolute value of a signed integer leads to rejection of all blocks][disclosure netsplit]
* 13:50 - [Too many misbehaving peers leads to DoS][disclosure banlist]
* 21:17 - [Nested loop without deduplication leads to stalling][disclosure orphanage]
* 27:34 - [Vulnerability in dependency leads to potential RCE][disclosure miniupnpc]
* 34:17 - Large memory allocation in peer [receiver buffer][disclosure receive buffer] and [send buffer][disclosure
  send buffer]
* 35:41 - [Payment request fetch causes mysterious crashing][disclosure bip72]
* 37:39 - [Misordered logic permits download of blocks bypassing checkpoints][disclosure low diff headers]
* 42:21 - Lessons learned from these disclosures

[Gloria Zhao]: https://x.com/glozow
[Niklas Gögge]: https://x.com/dergoegge
[disclosure netsplit]: https://bitcoincore.org/en/2024/07/03/disclose-timestamp-overflow/
[disclosure banlist]: https://bitcoincore.org/en/2024/07/03/disclose-unbounded-banlist/
[disclosure orphanage]: https://bitcoincore.org/en/2024/07/03/disclose-orphan-dos/
[disclosure miniupnpc]: https://bitcoincore.org/en/2024/07/03/disclose_upnp_rce/
[disclosure receive buffer]: https://bitcoincore.org/en/2024/07/03/disclose_receive_buffer_oom/
[disclosure send buffer]: https://bitcoincore.org/en/2024/07/03/disclose-inv-buffer-blowup/
[disclosure bip72]: https://bitcoincore.org/en/2024/07/03/disclose-bip70-crash/
[disclosure low diff headers]: https://bitcoincore.org/en/2024/07/03/disclose-header-spam/
