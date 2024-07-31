---
title: "Episode 5: Discussing 0.21.0 Bitcoin Core Vulnerability Disclosures"
permalink: /podcast/5-bitcoin-core-21-disclosures/
layout: podcast
date: 2024-07-31
description: Gloria Zhao and Niklas Gögge discuss the recently disclosed Bitcoin Core 0.21.0 vulnerabilities.
---

Brink engineers [Gloria Zhao][] and [Niklas Gögge][] talk through the recently
disclosed Bitcoin Core 0.21.0 vulnerabilities.

This continues our previous discussion in [Episode 4][] on _pre_-0.21.0 Bitcoin Core Vulnerabilities.

<iframe src="https://podcasters.spotify.com/pod/show/bitcoinbrink/embed/episodes/Discussing-0-21-0-Bitcoin-Core-Vulnerability-Disclosures-e2mm5sr/a-abf8rv1" height="102px" width="400px" frameborder="0" scrolling="no"></iframe>

* 0:00 - Introduction
* 1:07 - Background on Bitcoin peer-to-peer address relay
* 4:30 - Bitcoin Core's AddrMan (address manager) data structure
* 5:37 - [Disclosure of remote crash due to addr message spam][addrman-int-overflow]
* 8:51 - Address spamming observed on the network
* 10:57 - [Bitcoin Core #22387][bc22387] PR to fix addr message spam
* 13:46 - Background on Miniupnp, the UPnP library used by Bitcoin Core
* 15:18 - The bug in Miniupnpc
* 16:33 - [Disclosure of the impact of an infinite loop bug in the miniupnp dependency][disclose-upnp-oom]
* 17:50 - [Bitcoin Core #20421][bc20421] PR to fix the infinite loop bug in the miniupnp dependency
* 18:46 - Lessons learned

[Gloria Zhao]: https://x.com/glozow
[Niklas Gögge]: https://x.com/dergoegge
[episode 4]: /podcast/4-bitcoin-core-pre-21-disclosures/
[addrman-int-overflow]: https://bitcoincore.org/en/2024/07/31/disclose-addrman-int-overflow/
[bc22387]: https://github.com/bitcoin/bitcoin/pull/22387
[disclose-upnp-oom]: https://bitcoincore.org/en/2024/07/31/disclose-upnp-oom/
[bc20421]: https://github.com/bitcoin/bitcoin/pull/20421