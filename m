Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D04CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:26:26 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15968.1792131978306456856
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 23:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fyKqZckp;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2147; q=dns/txt;
  s=iport01; t=1792131978; x=1793341578;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jQQdJ/zldv1TDD/iFH55HonH9JujzuIywlen0NIAgkc=;
  b=fyKqZckpb9xUy+CWoGpZ8TY/8Ixar6n0xejPAMkEefM1xY0IMtwhlhl9
   VEiFPxAwTotOMQ7VPxap89Oi00C9Buz99W/yFhqT9b7lY9dGvNKUHpwHL
   5/Auy7QhBpE7mUGeJ+AIMJVCNUBGQG6qF58Uh3DDvfLfiSVFz1W1R51K1
   b7YQcjHrnuCxm8JaZd3Pj5ZDFgmJLc5xDrJVOWjzrH7+Awt27P1jcz8ZF
   S6UeIOfvz2JAGX0DURT2QjV6YaYf3o+CGe98UbgHi6I8g2vzRGS/yxyi4
   r7IbqAFypuiLGLI9h+trJ3PGI8jglF9Qpj5Y1Ny6s/4NIMIVZJLgn/qaB
   A==;
X-CSE-ConnectionGUID: FS705bWAR9yv5Fzr06FBfQ==
X-CSE-MsgGUID: VsRqBG63Qv65e/LgOORI3w==
X-IPAS-Result: =?us-ascii?q?A0BpBABLw9Fq/47/Ja1aHgEBCxIMggULg0xgQ0mTWQGCc?=
 =?us-ascii?q?J4fFIFqDwEBAQ89FAQBAYUFjhcCJjYHDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBU2ARgBGxIwXESDAgGCdAMRBrxxgiyBAYMpAT8CQ?=
 =?us-ascii?q?1DbPhWBOIVAiCNtCAGEfCcbG4FyhH6CYQEBgUdmhXgEgiJ6EpchSIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWABE?=
 =?us-ascii?q?BeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMH?=
 =?us-ascii?q?QVyCAINCQcpGA1IESw3FRkEPm4HkhQegWGBAwE9UiuBGxlQByEFpXChDwoog?=
 =?us-ascii?q?3aMIpU6GjOEBKZrkyuFXYJZizGWT4RpgW8DMoFHCwdwFYMiCUoZD5IkgX/MW?=
 =?us-ascii?q?ycyAjsCBwIHDgMLkWotgU8BAQ?=
IronPort-Data: A9a23:tfHTcaNDHGJdxe/vrR32lsFynXyQoLVcMsEvi/4bfWQNrUp2hWAPx
 mIYXGqOa/qCamrwKN50b42//EIDvJHSz9U3QHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gmAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69tVUxlrN7IxwLdmHzxg5
 +ZAdh4nYCnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmES/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNnwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQsi+a1a4uKJIziqcN9oF2iv
 0jpoT/AHE9HOZu7xh2iyFP3mbqa9c/8cMdIfFGizdZvjUGag3ISEgELXF+6s/Cli0m4c9ZeM
 FAPvDspprQ17FasTNT2Q1u/unHsg/IHc8BbH+t/7ESGzbDZpl7EQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:Vbx8ZqmUAzbT2Vi5MgSzmNJ5cazpDfIa3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHNuQ8bpE0dKz2DrMpbnmBENjo=
X-Talos-CUID: 9a23:f5Kqqmxcrf/rkz7y/eY0BgU6IZ99L3fi5U2BMlHlJ3RzEOO7Y1GprfY=
X-Talos-MUID: 9a23:634BygXyzDpwh7rq/AH3vihIG5kz2rrwVU1KtZohnPOlbjMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536039768"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:26:17 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 33B0518000351;
	Fri, 16 Oct 2026 06:26:17 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id D0896CC1611; Thu, 15 Oct 2026 23:26:16 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [meta-virtualization][wrynose][PATCH 0/1] aardvark-dns: update to v1.17.1
Date: Thu, 15 Oct 2026 23:25:54 -0700
Message-Id: <20261016062555.3887753-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Oct 2026 06:26:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10112

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the aardvark-dns v1.17.1 security release to Wrynose. The
release fixes CVE-2026-35406, where a truncated TCP DNS query followed
by a connection reset can leave aardvark-dns in an unrecoverable loop
at 100% CPU usage [1]. Upstream reports that versions 1.16.0 through
1.17.0 are affected and that 1.17.1 contains the fix.

This update follows OE's stable release policy: upstream prepared
v1.17.1 on its v1.17 maintenance branch, and the runtime change is the
security fix. The other commits contain release and CI metadata; the
release introduces no runtime features or API changes [2].

The recipe selects merge commit 880f6903d225,
described by git as v1.17.1-1-g880f690. Its source tree is identical to
the signed v1.17.1 tag at d9d17d4fe9d0a43512f6203042543deb3431a1bb,
so the selected revision contains no post-release source changes.

The crate version changes restore the dependency versions pinned on
upstream's v1.17 maintenance branch. The previous SRCREV,
b36c4cc80b2d15135acf88c5684bcbede48ec5fd, was a main-branch snapshot
whose Cargo package version had already moved to 2.0.0-dev. This
accounts for the dependency version decreases in the recipe update.

Scarthgap carries aardvark-dns 1.10.0 and is outside the affected
version range, so no corresponding Scarthgap backport is required.

Validation completed:
- The submitted patch matches the locally formatted Wrynose commit.
- The pre-change recipe blobs match the current upstream Wrynose
  baseline, and the patch applies without conflicts.
- The selected merge commit and signed v1.17.1 tag have identical
  source trees.

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-35406
[2] https://github.com/containers/aardvark-dns/releases/tag/v1.17.1

Bruce Ashfield (1):
  aardvark-dns: update to v1.17.1

 .../aardvark-dns/aardvark-dns-crates.inc      | 90 ++++++++++---------
 ...k-dns_1.17.0.bb => aardvark-dns_1.17.1.bb  |  2 +-
 2 files changed, 47 insertions(+), 45 deletions(-)
 rename recipes-containers/aardvark-dns/{aardvark-dns_1.17.0.bb => aardvark-dns_1.17.1.bb} (95%)

-- 
2.35.6


