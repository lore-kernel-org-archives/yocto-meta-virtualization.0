Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6640ACC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:26:26 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15969.1792131978391696393
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 23:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JsTZh86l;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16530; q=dns/txt;
  s=iport01; t=1792131978; x=1793341578;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2GO87lygls1iUYtYHRQnlxkH2NPZdQGUN9yausihcKI=;
  b=JsTZh86lQf3h14FPdyl9TZGPx496a5EviwOulWqXujIo6/kjFaEQrxT6
   5XElncEaL7itrUykNYtcq7I5zVUjlMIl0Jk8b8jsNAGKm6bRdpRBHnTFj
   KenDMAGGeePz0G5nEfh0EpvjusoQf8GWzYGep4fZsYnWuleLmOp4Lu0Lc
   2Oe5LdICWFioq+/bYbNUE46vuKfjgSeXN2vKbmEHR12p7O00ISJnwKloz
   Bz1rfiPeQemKOBCgJXJxuGoZEe0mLZsUfqSyeSCI6nX9uAlHCRyBncRG9
   zeGDW3hUSY1kbPGyBKETnxODeGENVKZ9m14wcqMyNlvBDaE12hJBL/Yi8
   Q==;
X-CSE-ConnectionGUID: NM+3yp4+RfmfBkIkk3Mjyw==
X-CSE-MsgGUID: MujYacu4TXCyYPEUO97vPA==
X-IPAS-Result: =?us-ascii?q?A0CyAwBRwtFq/4z/Ja1ahTB1YENJlV5vi2WUNQ8BAQEPP?=
 =?us-ascii?q?RQEAQGFBQKOFQImOBMBAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZPDZATAgEDMgEYAS0QIDEgCysZgwIBgjoDNwMRvHSCLIEBgykBgVTYSw2CW?=
 =?us-ascii?q?gELFAGBOIVAgn+FJG0IAYR8JxsbgXKEfoIfQgKIJQSCIoEMgXiBL4ZpA40OS?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJX?=
 =?us-ascii?q?oErKWABEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJK?=
 =?us-ascii?q?EEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQegmWBDgErmQ6PE59uMHEKK?=
 =?us-ascii?q?IN2jCKPPoV8GjOEBIFXpRSTK4VdglmLMYQJkV1phGmBfyWBWXAVgyIJShkPj?=
 =?us-ascii?q?isEFYNggmTLdicyAjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:wyVfR627h1DAZhrevPbD5aZwkn2cJEfYwER7XKvMYLTBsI5bpzIOz
 TdKWjzUPKqDMWWheNpxYd6+/RsF7ZCEmtBjSwZv3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYtbDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGKmR1ZpwApqVND2RA3
 /85KzNWSxKSmLfjqF67YrEEasULNsLnOsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiYC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+OW2boCJIYDXHq25mG69u
 2D39m/kXi0qH82u8Re41SPzmNfmyHaTtIU6UefQGuRRqFeJ22ceThQNVVW6rP21okG7UtNbb
 UcT/0IGqKUu/Qm1T8PhQhS8oWyNoh8bXfJUEvYm80eczaHI5B6DAWoJRSIHb8Yp3PLaXhQw3
 VOP2tesDjt1vfjNEjSW96yfqnW5Pi19wXI+WBLohDAtu7HLyLzfRDqWJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:mjrtxq3f4I/kc41Pw5wtBgqjBJAkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: 9a23:AFd1H28jbsydYQgyZxqVv2gxWZs0aiGe9nnVLWW7KGVqE5iXWEDFrQ==
X-Talos-MUID: 9a23:2U1oPwSyDMKH9yXSRXTJmTNTPcx1v5ieI1E8qbg7nJjbKxRZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536243453"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:26:17 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 38202180001CD;
	Fri, 16 Oct 2026 06:26:17 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id D2DECCBF201; Thu, 15 Oct 2026 23:26:16 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [meta-virtualization][wrynose][PATCH 1/1] aardvark-dns: update to v1.17.1
Date: Thu, 15 Oct 2026 23:25:55 -0700
Message-Id: <20261016062555.3887753-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016062555.3887753-1-dkelaiya@cisco.com>
References: <20261016062555.3887753-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Oct 2026 06:26:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10113

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping aardvark-dns to version v1.17.1-1-g880f690, which comprises the following commits:

    d9d17d4 release v1.17.1
    b2cf5c7 release notes for v1.17.1
    0bc10b3 migration to oidc connection
    b66c50e fix handling of incorrect tcp packets

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 7664fc908a6555c099f05457c6fa673ea44f18df)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../aardvark-dns/aardvark-dns-crates.inc      | 90 ++++++++++---------
 ...k-dns_1.17.0.bb => aardvark-dns_1.17.1.bb} |  2 +-
 2 files changed, 47 insertions(+), 45 deletions(-)
 rename recipes-containers/aardvark-dns/{aardvark-dns_1.17.0.bb => aardvark-dns_1.17.1.bb} (95%)

diff --git a/recipes-containers/aardvark-dns/aardvark-dns-crates.inc b/recipes-containers/aardvark-dns/aardvark-dns-crates.inc
index 8915d903..749f8ecb 100644
--- a/recipes-containers/aardvark-dns/aardvark-dns-crates.inc
+++ b/recipes-containers/aardvark-dns/aardvark-dns-crates.inc
@@ -8,7 +8,7 @@ SRC_URI += " \
     crate://crates.io/anstyle-parse/0.2.7 \
     crate://crates.io/anstyle-query/1.1.4 \
     crate://crates.io/anstyle-wincon/3.0.10 \
-    crate://crates.io/arc-swap/1.8.2 \
+    crate://crates.io/arc-swap/1.7.1 \
     crate://crates.io/async-trait/0.1.89 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/bitflags/2.10.0 \
@@ -17,11 +17,11 @@ SRC_URI += " \
     crate://crates.io/cc/1.2.44 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/cfg_aliases/0.2.1 \
-    crate://crates.io/chrono/0.4.44 \
-    crate://crates.io/clap/4.5.60 \
-    crate://crates.io/clap_builder/4.5.60 \
-    crate://crates.io/clap_derive/4.5.55 \
-    crate://crates.io/clap_lex/1.0.0 \
+    crate://crates.io/chrono/0.4.42 \
+    crate://crates.io/clap/4.5.51 \
+    crate://crates.io/clap_builder/4.5.51 \
+    crate://crates.io/clap_derive/4.5.49 \
+    crate://crates.io/clap_lex/0.7.6 \
     crate://crates.io/colorchoice/1.0.4 \
     crate://crates.io/core-foundation-sys/0.8.7 \
     crate://crates.io/critical-section/1.2.0 \
@@ -30,19 +30,18 @@ SRC_URI += " \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/endian-type/0.1.2 \
     crate://crates.io/enum-as-inner/0.6.1 \
-    crate://crates.io/fastrand/2.3.0 \
     crate://crates.io/find-msvc-tools/0.1.4 \
-    crate://crates.io/flume/0.12.0 \
+    crate://crates.io/flume/0.11.1 \
     crate://crates.io/form_urlencoded/1.2.2 \
-    crate://crates.io/futures/0.3.32 \
-    crate://crates.io/futures-channel/0.3.32 \
-    crate://crates.io/futures-core/0.3.32 \
-    crate://crates.io/futures-executor/0.3.32 \
-    crate://crates.io/futures-io/0.3.32 \
-    crate://crates.io/futures-macro/0.3.32 \
-    crate://crates.io/futures-sink/0.3.32 \
-    crate://crates.io/futures-task/0.3.32 \
-    crate://crates.io/futures-util/0.3.32 \
+    crate://crates.io/futures/0.3.31 \
+    crate://crates.io/futures-channel/0.3.31 \
+    crate://crates.io/futures-core/0.3.31 \
+    crate://crates.io/futures-executor/0.3.31 \
+    crate://crates.io/futures-io/0.3.31 \
+    crate://crates.io/futures-macro/0.3.31 \
+    crate://crates.io/futures-sink/0.3.31 \
+    crate://crates.io/futures-task/0.3.31 \
+    crate://crates.io/futures-util/0.3.31 \
     crate://crates.io/getrandom/0.2.16 \
     crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/heck/0.5.0 \
@@ -61,21 +60,22 @@ SRC_URI += " \
     crate://crates.io/icu_provider/2.1.1 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
-    crate://crates.io/inotify/0.11.1 \
+    crate://crates.io/inotify/0.11.0 \
     crate://crates.io/inotify-sys/0.1.5 \
     crate://crates.io/ipnet/2.11.0 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itoa/1.0.15 \
     crate://crates.io/js-sys/0.3.82 \
-    crate://crates.io/libc/0.2.183 \
+    crate://crates.io/libc/0.2.177 \
     crate://crates.io/litemap/0.8.1 \
     crate://crates.io/lock_api/0.4.14 \
-    crate://crates.io/log/0.4.29 \
+    crate://crates.io/log/0.4.28 \
     crate://crates.io/memchr/2.7.6 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/mio/1.1.0 \
+    crate://crates.io/nanorand/0.7.0 \
     crate://crates.io/nibble_vec/0.1.0 \
-    crate://crates.io/nix/0.31.2 \
+    crate://crates.io/nix/0.30.1 \
     crate://crates.io/num-conv/0.1.0 \
     crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/num_threads/0.1.7 \
@@ -83,6 +83,7 @@ SRC_URI += " \
     crate://crates.io/once_cell_polyfill/1.70.2 \
     crate://crates.io/percent-encoding/2.3.2 \
     crate://crates.io/pin-project-lite/0.2.16 \
+    crate://crates.io/pin-utils/0.1.0 \
     crate://crates.io/portable-atomic/1.11.1 \
     crate://crates.io/potential_utf/0.1.4 \
     crate://crates.io/powerfmt/0.2.0 \
@@ -120,7 +121,7 @@ SRC_URI += " \
     crate://crates.io/tinystr/0.8.2 \
     crate://crates.io/tinyvec/1.10.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
-    crate://crates.io/tokio/1.50.0 \
+    crate://crates.io/tokio/1.48.0 \
     crate://crates.io/tokio-macros/2.6.0 \
     crate://crates.io/tokio-util/0.7.17 \
     crate://crates.io/tracing/0.1.41 \
@@ -183,7 +184,7 @@ SRC_URI[anstyle-1.0.13.sha256sum] = "5192cca8006f1fd4f7237516f40fa183bb07f8fbdfe
 SRC_URI[anstyle-parse-0.2.7.sha256sum] = "4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2"
 SRC_URI[anstyle-query-1.1.4.sha256sum] = "9e231f6134f61b71076a3eab506c379d4f36122f2af15a9ff04415ea4c3339e2"
 SRC_URI[anstyle-wincon-3.0.10.sha256sum] = "3e0633414522a32ffaac8ac6cc8f748e090c5717661fddeea04219e2344f5f2a"
-SRC_URI[arc-swap-1.8.2.sha256sum] = "f9f3647c145568cec02c42054e07bdf9a5a698e15b466fb2341bfc393cd24aa5"
+SRC_URI[arc-swap-1.7.1.sha256sum] = "69f7f8c3906b62b754cd5326047894316021dcfe5a194c8ea52bdd94934a3457"
 SRC_URI[async-trait-0.1.89.sha256sum] = "9035ad2d096bed7955a320ee7e2230574d28fd3c3a0f186cbea1ff3c7eed5dbb"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[bitflags-2.10.0.sha256sum] = "812e12b5285cc515a9c72a5c1d3b6d46a19dac5acfef5265968c166106e31dd3"
@@ -192,11 +193,11 @@ SRC_URI[bytes-1.10.1.sha256sum] = "d71b6127be86fdcfddb610f7182ac57211d4b18a3e9c8
 SRC_URI[cc-1.2.44.sha256sum] = "37521ac7aabe3d13122dc382493e20c9416f299d2ccd5b3a5340a2570cdeb0f3"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
-SRC_URI[chrono-0.4.44.sha256sum] = "c673075a2e0e5f4a1dde27ce9dee1ea4558c7ffe648f576438a20ca1d2acc4b0"
-SRC_URI[clap-4.5.60.sha256sum] = "2797f34da339ce31042b27d23607e051786132987f595b02ba4f6a6dffb7030a"
-SRC_URI[clap_builder-4.5.60.sha256sum] = "24a241312cea5059b13574bb9b3861cabf758b879c15190b37b6d6fd63ab6876"
-SRC_URI[clap_derive-4.5.55.sha256sum] = "a92793da1a46a5f2a02a6f4c46c6496b28c43638adea8306fcb0caa1634f24e5"
-SRC_URI[clap_lex-1.0.0.sha256sum] = "3a822ea5bc7590f9d40f1ba12c0dc3c2760f3482c6984db1573ad11031420831"
+SRC_URI[chrono-0.4.42.sha256sum] = "145052bdd345b87320e369255277e3fb5152762ad123a901ef5c262dd38fe8d2"
+SRC_URI[clap-4.5.51.sha256sum] = "4c26d721170e0295f191a69bd9a1f93efcdb0aff38684b61ab5750468972e5f5"
+SRC_URI[clap_builder-4.5.51.sha256sum] = "75835f0c7bf681bfd05abe44e965760fea999a5286c6eb2d59883634fd02011a"
+SRC_URI[clap_derive-4.5.49.sha256sum] = "2a0b5487afeab2deb2ff4e03a807ad1a03ac532ff5a2cee5d86884440c7f7671"
+SRC_URI[clap_lex-0.7.6.sha256sum] = "a1d728cc89cf3aee9ff92b05e62b19ee65a02b5702cff7d5a377e32c6ae29d8d"
 SRC_URI[colorchoice-1.0.4.sha256sum] = "b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75"
 SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
 SRC_URI[critical-section-1.2.0.sha256sum] = "790eea4361631c5e7d22598ecd5723ff611904e3344ce8720784c93e3d83d40b"
@@ -205,19 +206,18 @@ SRC_URI[deranged-0.5.5.sha256sum] = "ececcb659e7ba858fb4f10388c250a7252eb0a27373
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[endian-type-0.1.2.sha256sum] = "c34f04666d835ff5d62e058c3995147c06f42fe86ff053337632bca83e42702d"
 SRC_URI[enum-as-inner-0.6.1.sha256sum] = "a1e6a265c649f3f5979b601d26f1d05ada116434c87741c9493cb56218f76cbc"
-SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
 SRC_URI[find-msvc-tools-0.1.4.sha256sum] = "52051878f80a721bb68ebfbc930e07b65ba72f2da88968ea5c06fd6ca3d3a127"
-SRC_URI[flume-0.12.0.sha256sum] = "5e139bc46ca777eb5efaf62df0ab8cc5fd400866427e56c68b22e414e53bd3be"
+SRC_URI[flume-0.11.1.sha256sum] = "da0e4dd2a88388a1f4ccc7c9ce104604dab68d9f408dc34cd45823d5a9069095"
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
-SRC_URI[futures-0.3.32.sha256sum] = "8b147ee9d1f6d097cef9ce628cd2ee62288d963e16fb287bd9286455b241382d"
-SRC_URI[futures-channel-0.3.32.sha256sum] = "07bbe89c50d7a535e539b8c17bc0b49bdb77747034daa8087407d655f3f7cc1d"
-SRC_URI[futures-core-0.3.32.sha256sum] = "7e3450815272ef58cec6d564423f6e755e25379b217b0bc688e295ba24df6b1d"
-SRC_URI[futures-executor-0.3.32.sha256sum] = "baf29c38818342a3b26b5b923639e7b1f4a61fc5e76102d4b1981c6dc7a7579d"
-SRC_URI[futures-io-0.3.32.sha256sum] = "cecba35d7ad927e23624b22ad55235f2239cfa44fd10428eecbeba6d6a717718"
-SRC_URI[futures-macro-0.3.32.sha256sum] = "e835b70203e41293343137df5c0664546da5745f82ec9b84d40be8336958447b"
-SRC_URI[futures-sink-0.3.32.sha256sum] = "c39754e157331b013978ec91992bde1ac089843443c49cbc7f46150b0fad0893"
-SRC_URI[futures-task-0.3.32.sha256sum] = "037711b3d59c33004d3856fbdc83b99d4ff37a24768fa1be9ce3538a1cde4393"
-SRC_URI[futures-util-0.3.32.sha256sum] = "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
+SRC_URI[futures-0.3.31.sha256sum] = "65bc07b1a8bc7c85c5f2e110c476c7389b4554ba72af57d8445ea63a576b0876"
+SRC_URI[futures-channel-0.3.31.sha256sum] = "2dff15bf788c671c1934e366d07e30c1814a8ef514e1af724a602e8a2fbe1b10"
+SRC_URI[futures-core-0.3.31.sha256sum] = "05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e"
+SRC_URI[futures-executor-0.3.31.sha256sum] = "1e28d1d997f585e54aebc3f97d39e72338912123a67330d723fdbb564d646c9f"
+SRC_URI[futures-io-0.3.31.sha256sum] = "9e5c1b78ca4aae1ac06c48a526a655760685149f0d465d21f37abfe57ce075c6"
+SRC_URI[futures-macro-0.3.31.sha256sum] = "162ee34ebcb7c64a8abebc059ce0fee27c2262618d7b60ed8faf72fef13c3650"
+SRC_URI[futures-sink-0.3.31.sha256sum] = "e575fab7d1e0dcb8d0c7bcf9a63ee213816ab51902e6d244a95819acacf1d4f7"
+SRC_URI[futures-task-0.3.31.sha256sum] = "f90f7dce0722e95104fcb095585910c0977252f286e354b5e3bd38902cd99988"
+SRC_URI[futures-util-0.3.31.sha256sum] = "9fa08315bb612088cc391249efdc3bc77536f16c91f6cf495e6fbe85b20a4a81"
 SRC_URI[getrandom-0.2.16.sha256sum] = "335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592"
 SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
@@ -236,21 +236,22 @@ SRC_URI[icu_properties_data-2.1.1.sha256sum] = "02845b3647bb045f1100ecd6480ff52f
 SRC_URI[icu_provider-2.1.1.sha256sum] = "85962cf0ce02e1e0a629cc34e7ca3e373ce20dda4c4d7294bbd0bf1fdb59e614"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
-SRC_URI[inotify-0.11.1.sha256sum] = "bd5b3eaf1a28b758ac0faa5a4254e8ab2705605496f1b1f3fbbc3988ad73d199"
+SRC_URI[inotify-0.11.0.sha256sum] = "f37dccff2791ab604f9babef0ba14fbe0be30bd368dc541e2b08d07c8aa908f3"
 SRC_URI[inotify-sys-0.1.5.sha256sum] = "e05c02b5e89bff3b946cedeca278abc628fe811e604f027c45a8aa3cf793d0eb"
 SRC_URI[ipnet-2.11.0.sha256sum] = "469fb0b9cefa57e3ef31275ee7cacb78f2fdca44e4765491884a2b119d4eb130"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
 SRC_URI[js-sys-0.3.82.sha256sum] = "b011eec8cc36da2aab2d5cff675ec18454fad408585853910a202391cf9f8e65"
-SRC_URI[libc-0.2.183.sha256sum] = "b5b646652bf6661599e1da8901b3b9522896f01e736bad5f723fe7a3a27f899d"
+SRC_URI[libc-0.2.177.sha256sum] = "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
 SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
-SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
+SRC_URI[log-0.4.28.sha256sum] = "34080505efa8e45a4b816c349525ebe327ceaa8559756f0356cba97ef3bf7432"
 SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[mio-1.1.0.sha256sum] = "69d83b0086dc8ecf3ce9ae2874b2d1290252e2a30720bea58a5c6639b0092873"
+SRC_URI[nanorand-0.7.0.sha256sum] = "6a51313c5820b0b02bd422f4b44776fbf47961755c74ce64afc73bfad10226c3"
 SRC_URI[nibble_vec-0.1.0.sha256sum] = "77a5d83df9f36fe23f0c3648c6bbb8b0298bb5f1939c8f2704431371f4b84d43"
-SRC_URI[nix-0.31.2.sha256sum] = "5d6d0705320c1e6ba1d912b5e37cf18071b6c2e9b7fa8215a1e8a7651966f5d3"
+SRC_URI[nix-0.30.1.sha256sum] = "74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6"
 SRC_URI[num-conv-0.1.0.sha256sum] = "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[num_threads-0.1.7.sha256sum] = "5c7398b9c8b70908f6371f47ed36737907c87c52af34c268fed0bf0ceb92ead9"
@@ -258,6 +259,7 @@ SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515
 SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
 SRC_URI[percent-encoding-2.3.2.sha256sum] = "9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220"
 SRC_URI[pin-project-lite-0.2.16.sha256sum] = "3b3cff922bd51709b605d9ead9aa71031d81447142d828eb4a6eba76fe619f9b"
+SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
 SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
 SRC_URI[potential_utf-0.1.4.sha256sum] = "b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77"
 SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
@@ -295,7 +297,7 @@ SRC_URI[time-macros-0.2.24.sha256sum] = "30cfb0125f12d9c277f35663a0a33f8c30190f4
 SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
 SRC_URI[tinyvec-1.10.0.sha256sum] = "bfa5fdc3bce6191a1dbc8c02d5c8bffcf557bafa17c124c5264a458f1b0613fa"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[tokio-1.50.0.sha256sum] = "27ad5e34374e03cfffefc301becb44e9dc3c17584f414349ebe29ed26661822d"
+SRC_URI[tokio-1.48.0.sha256sum] = "ff360e02eab121e0bc37a2d3b4d4dc622e6eda3a8e5253d5435ecf5bd4c68408"
 SRC_URI[tokio-macros-2.6.0.sha256sum] = "af407857209536a95c8e56f8231ef2c2e2aff839b22e07a1ffcbc617e9db9fa5"
 SRC_URI[tokio-util-0.7.17.sha256sum] = "2efa149fe76073d6e8fd97ef4f4eca7b67f599660115591483572e406e165594"
 SRC_URI[tracing-0.1.41.sha256sum] = "784e0ac535deb450455cbfa28a6f0df145ea1bb7ae51b821cf5e7927fdcfbdd0"
diff --git a/recipes-containers/aardvark-dns/aardvark-dns_1.17.0.bb b/recipes-containers/aardvark-dns/aardvark-dns_1.17.1.bb
similarity index 95%
rename from recipes-containers/aardvark-dns/aardvark-dns_1.17.0.bb
rename to recipes-containers/aardvark-dns/aardvark-dns_1.17.1.bb
index 7ed9fb96..7b7b0abd 100644
--- a/recipes-containers/aardvark-dns/aardvark-dns_1.17.0.bb
+++ b/recipes-containers/aardvark-dns/aardvark-dns_1.17.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/containers/aardvark-dns"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "b36c4cc80b2d15135acf88c5684bcbede48ec5fd"
+SRCREV = "880f6903d2259ce0049daed0985ae694f2c1b0ac"
 
 # It is possible to fetch the source using the crate fetcher instead:
 #SRC_URI = "crate://crates.io/${BPN}/${PV}"
-- 
2.35.6


