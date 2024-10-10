---
title: "Episode 6: Discussing Pre-25.0 Bitcoin Core Vulnerability Disclosures"
permalink: /podcast/6-bitcoin-core-pre-25-disclosures/
layout: podcast
date: 2024-10-10
description: Gloria Zhao, Niklas Gögge, and 0xB10C discuss the recently disclosed Bitcoin Core pre-25.0 vulnerabilities.
---

Brink engineers [Gloria Zhao][] and [Niklas Gögge][] are joined by [0xB10C][]
talk through the recently disclosed Bitcoin Core pre-25.0 vulnerabilities.

This continues our previous discussions in [Episode 4][] on _pre_-0.21.0 and
[Episode 5][] on 0.21.0 Bitcoin Core Vulnerabilities.

<iframe src="https://podcasters.spotify.com/pod/show/bitcoinbrink/embed/episodes/Discussing-Pre-25-0-Bitcoin-Core-Vulnerability-Disclosures-e2pfsjd/a-abir376" height="102px" width="400px" frameborder="0" scrolling="no"></iframe>

* 0:00 - Introduction
* 0:48 - The [DoS vulnerability in headers sync][disclosure headers pre sync]
  * 3:12 - Discussion of checkpoints in the code
  * 10:11 - [Bitcoin Core #25717][bc25717] PR to fix the DoS vulnerability in headers sync
* 14:31 - The [denial-of-service (DoS) vulnerability in inventory send queue][disclosure dos inv send]
  * 14:42 - P2P background regarding transaction relay and inventory messages
  * 17:26 - Observations of increased network activity
  * 23:30 - [Bitcoin Core #27610][bc27610] PR to fix the inventory send queue DoS vulnerability
  * 25:35 - Stale blocks and impact on miners
  * 28:31 - [KIT Bitcoin monitoring website][kit monitoring] and [latency graph][kit latency graph]
  * 31:09 - Discussion of disclosure approach
* 34:10 - The [crash vulnerability in compact block relay][disclosure compact block relay]
  * 34:20 - [Compact block relay][optech compact block relay] background
  * 39:56 - Mechanics of a potential attack
  * 42:49 - Discovery of the vulnerability
  * 47:56 - [Bitcoin Core #26898][bc26898] PR to fix the crash vulnerability in compact block relay
  * 49:33 - Benefits of modularizing code
* 56:25 - Lessons learned

_Note: A vulnerability of 'hindered block propagation due to mutated
blocks' was also [disclosed][disclosure mutated blocks] and will be covered in a future podcast._

[Gloria Zhao]: https://x.com/glozow
[Niklas Gögge]: https://x.com/dergoegge
[0xB10C]: https://x.com/0xB10C
[episode 4]: /podcast/4-bitcoin-core-pre-21-disclosures/
[episode 5]: /podcast/5-bitcoin-core-21-disclosures/
[disclosure headers pre sync]: https://bitcoincore.org/en/2024/09/18/disclose-headers-oom/
[bc25717]: https://github.com/bitcoin/bitcoin/pull/25717
[disclosure dos inv send]: https://bitcoincore.org/en/2024/10/08/disclose-large-inv-to-send/
[bc27610]: https://github.com/bitcoin/bitcoin/pull/27610
[kit monitoring]: https://www.dsn.kastel.kit.edu/bitcoin/index.html
[kit latency graph]: https://www.dsn.kastel.kit.edu/bitcoin/plots/latencyall.png
[disclosure compact block relay]: https://bitcoincore.org/en/2024/10/08/disclose-blocktxn-crash/
[optech compact block relay]: https://bitcoinops.org/en/topics/compact-block-relay/
[bc26898]: https://github.com/bitcoin/bitcoin/pull/26898
[disclosure mutated blocks]: https://bitcoincore.org/en/2024/10/08/disclose-mutated-blocks-hindering-propagation/
