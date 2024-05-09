Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53BDC10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:18:40 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.8665.1715257114667645036
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 May 2024 05:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Bp7rzCAb;
 spf=pass (domain: mvista.com, ip: 209.85.161.44, mailfrom: hprajapati@mvista.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5aa1bf6cb40so509291eaf.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 09 May 2024 05:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1715257114; x=1715861914; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0yca4gV1mhvJj3GfM3ZSyWRA77LX8JFJCmLV0eo9JyM=;
        b=Bp7rzCAbZaoqUjnbNh8u8q3N+o40Wt52xTrzHH2iss4Mq55VVvLH66EbXd35Do0Dj+
         NxSPBvO3lylaDFcJCHk767sv4lINH65Hy0wQl8kMrAAxnTYOqBBpaa88azg2I8lkirJ+
         14A8sdwSGzPeK2slc9f/ZB/q22etqOE6jPKLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715257114; x=1715861914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0yca4gV1mhvJj3GfM3ZSyWRA77LX8JFJCmLV0eo9JyM=;
        b=D7Pdx+orqSLm6ekkl3iPu7eHLpKIfwhSmKUWOdNC9jzx2xrDqHRVLj4xe4hx4ijAqk
         /pK9srg9TKtZTkNOIlIbc4sLxOdvY4wmRH8fGdJqUVRTPf8SbpxUD+Qh7jXNcata67Jy
         etfYVTry0x7Jcjn3qyhyzghyvnT9Iek018OSV2E0V4+Pl6VU+kVLytfxjpxLyOIF1eXo
         kc1751zHeMpny92Seqgu3nHXUrKLhyIajMN9gKjJeYNBcKq78C/ITiMVZiuLw90UoW/H
         cDdC7QuXS9HI6xZOGRULK0WCq2UkzizSb0FmHx9+vBoSzojJjQrGP0BUUmhp/ZhAoDaX
         xzMg==
X-Gm-Message-State: AOJu0YwJf7AKL9SYtRL55zb2D0I8bqMo/em6hO1CwZ5wg8EMqwdhSmTq
	GDG5LmtOdj5+Vo1FJOnJsG5MwMZ7vUYdScvc8H4YQAol8uIkWNU7MslBvj8yX2ASSF+Q8M5waNU
	v
X-Google-Smtp-Source: AGHT+IGx0ZLckpd6ymUqg9Xrde0JGAV7U8pNf1bmcK82swzNDeXWafoC+EZkbLmo/2OA1PX0sbKxnA==
X-Received: by 2002:a05:6871:2b24:b0:22e:ca72:faad with SMTP id 586e51a60fabf-24098933ccamr5714150fac.43.1715257113346;
        Thu, 09 May 2024 05:18:33 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.140])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2412a51b6e0sm245274fac.18.2024.05.09.05.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:18:33 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-virtualization][dunfell][PATCH] openvswitch: fix CVE-2020-35498 limitation in the OVS packet parsing
Date: Thu,  9 May 2024 17:48:24 +0530
Message-Id: <20240509121824.82134-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 09 May 2024 12:18:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8719

Upstream-Status: Backport https://github.com/openvswitch/ovs/commit/0625dc79aec73b966f206e55655a2816696246d0

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../openvswitch-git/CVE-2020-35498.patch      | 151 ++++++++++++++++++
 .../openvswitch/openvswitch_git.bb            |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/CVE-2020-35498.patch

diff --git a/recipes-networking/openvswitch/openvswitch-git/CVE-2020-35498.patch b/recipes-networking/openvswitch/openvswitch-git/CVE-2020-35498.patch
new file mode 100644
index 00000000..5093f077
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/CVE-2020-35498.patch
@@ -0,0 +1,151 @@
+rom 0625dc79aec73b966f206e55655a2816696246d0 Mon Sep 17 00:00:00 2001
+From: Flavio Leitner <fbl@sysclose.org>
+Date: Mon, 26 Oct 2020 16:03:19 -0300
+Subject: [PATCH] flow: Support extra padding length.
+
+Although not required, padding can be optionally added until
+the packet length is MTU bytes. A packet with extra padding
+currently fails sanity checks.
+
+Vulnerability: CVE-2020-35498
+Fixes: fa8d9001a624 ("miniflow_extract: Properly handle small IP packets.")
+Reported-by: Joakim Hindersson <joakim.hindersson@elastx.se>
+Acked-by: Ilya Maximets <i.maximets@ovn.org>
+Signed-off-by: Flavio Leitner <fbl@sysclose.org>
+Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
+
+Upstream-Status: Backport [https://github.com/openvswitch/ovs/commit/0625dc79aec73b966f206e55655a2816696246d0]
+CVE: CVE-2020-35498
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/conntrack.c     |  2 +-
+ lib/dp-packet.h     | 10 +++++-----
+ lib/flow.c          |  6 +++---
+ tests/classifier.at | 36 ++++++++++++++++++++++++++++++++++++
+ 4 files changed, 45 insertions(+), 9 deletions(-)
+
+diff --git a/lib/conntrack.c b/lib/conntrack.c
+index ff5a89457..0f486d74c 100644
+--- a/lib/conntrack.c
++++ b/lib/conntrack.c
+@@ -813,7 +813,7 @@ static void
+ reverse_nat_packet(struct dp_packet *pkt, const struct conn *conn)
+ {
+     char *tail = dp_packet_tail(pkt);
+-    uint8_t pad = dp_packet_l2_pad_size(pkt);
++    uint16_t pad = dp_packet_l2_pad_size(pkt);
+     struct conn_key inner_key;
+     const char *inner_l4 = NULL;
+     uint16_t orig_l3_ofs = pkt->l3_ofs;
+diff --git a/lib/dp-packet.h b/lib/dp-packet.h
+index 9f8991faa..45655af46 100644
+--- a/lib/dp-packet.h
++++ b/lib/dp-packet.h
+@@ -81,7 +81,7 @@ struct dp_packet {
+ 
+     /* All the following elements of this struct are copied in a single call
+      * of memcpy in dp_packet_clone_with_headroom. */
+-    uint8_t l2_pad_size;           /* Detected l2 padding size.
++    uint16_t l2_pad_size;          /* Detected l2 padding size.
+                                     * Padding is non-pullable. */
+     uint16_t l2_5_ofs;             /* MPLS label stack offset, or UINT16_MAX */
+     uint16_t l3_ofs;               /* Network-level header offset,
+@@ -118,8 +118,8 @@ void *dp_packet_resize_l2(struct dp_packet *, int increment);
+ void *dp_packet_resize_l2_5(struct dp_packet *, int increment);
+ static inline void *dp_packet_eth(const struct dp_packet *);
+ static inline void dp_packet_reset_offsets(struct dp_packet *);
+-static inline uint8_t dp_packet_l2_pad_size(const struct dp_packet *);
+-static inline void dp_packet_set_l2_pad_size(struct dp_packet *, uint8_t);
++static inline uint16_t dp_packet_l2_pad_size(const struct dp_packet *);
++static inline void dp_packet_set_l2_pad_size(struct dp_packet *, uint16_t);
+ static inline void *dp_packet_l2_5(const struct dp_packet *);
+ static inline void dp_packet_set_l2_5(struct dp_packet *, void *);
+ static inline void *dp_packet_l3(const struct dp_packet *);
+@@ -327,14 +327,14 @@ dp_packet_reset_offsets(struct dp_packet *b)
+     b->l4_ofs = UINT16_MAX;
+ }
+ 
+-static inline uint8_t
++static inline uint16_t
+ dp_packet_l2_pad_size(const struct dp_packet *b)
+ {
+     return b->l2_pad_size;
+ }
+ 
+ static inline void
+-dp_packet_set_l2_pad_size(struct dp_packet *b, uint8_t pad_size)
++dp_packet_set_l2_pad_size(struct dp_packet *b, uint16_t pad_size)
+ {
+     ovs_assert(pad_size <= dp_packet_size(b));
+     b->l2_pad_size = pad_size;
+diff --git a/lib/flow.c b/lib/flow.c
+index 45bb96b54..353d5cd3e 100644
+--- a/lib/flow.c
++++ b/lib/flow.c
+@@ -655,7 +655,7 @@ ipv4_sanity_check(const struct ip_header *nh, size_t size,
+ 
+     tot_len = ntohs(nh->ip_tot_len);
+     if (OVS_UNLIKELY(tot_len > size || ip_len > tot_len ||
+-                size - tot_len > UINT8_MAX)) {
++                size - tot_len > UINT16_MAX)) {
+         return false;
+     }
+ 
+@@ -693,8 +693,8 @@ ipv6_sanity_check(const struct ovs_16aligned_ip6_hdr *nh, size_t size)
+     if (OVS_UNLIKELY(plen + IPV6_HEADER_LEN > size)) {
+         return false;
+     }
+-    /* Jumbo Payload option not supported yet. */
+-    if (OVS_UNLIKELY(size - (plen + IPV6_HEADER_LEN) > UINT8_MAX)) {
++
++    if (OVS_UNLIKELY(size - (plen + IPV6_HEADER_LEN) > UINT16_MAX)) {
+         return false;
+     }
+ 
+diff --git a/tests/classifier.at b/tests/classifier.at
+index 88818618b..cdcd72c15 100644
+--- a/tests/classifier.at
++++ b/tests/classifier.at
+@@ -304,3 +304,39 @@ ovs-ofctl: "conjunction" actions may be used along with "note" but not any other
+ ])
+ OVS_VSWITCHD_STOP
+ AT_CLEANUP
++
++# Flow classifier a packet with excess of padding.
++AT_SETUP([flow classifier - packet with extra padding])
++OVS_VSWITCHD_START
++add_of_ports br0 1 2
++AT_DATA([flows.txt], [dnl
++priority=5,ip,ip_dst=1.1.1.1,actions=1
++priority=5,ip,ip_dst=1.1.1.2,actions=2
++priority=0,actions=drop
++])
++AT_CHECK([ovs-ofctl add-flows br0 flows.txt])
++packet=00020202020000010101010008004500001c00010000401176cc01010101010101020d6a00350008ee3a
++AT_CHECK([ovs-appctl ofproto/trace br0 in_port=1 $packet] , [0], [stdout])
++AT_CHECK([tail -2 stdout], [0],
++  [Megaflow: recirc_id=0,eth,ip,in_port=1,nw_dst=1.1.1.2,nw_frag=no
++Datapath actions: 2
++])
++# normal packet plus 255 bytes of padding (8bit padding).
++# 255 * 2 = 510
++padding=$(printf '%*s' 510 | tr ' ' '0')
++AT_CHECK([ovs-appctl ofproto/trace br0 in_port=1 ${packet}${padding}] , [0], [stdout])
++AT_CHECK([tail -2 stdout], [0],
++  [Megaflow: recirc_id=0,eth,ip,in_port=1,nw_dst=1.1.1.2,nw_frag=no
++Datapath actions: 2
++])
++# normal packet plus padding up to 65535 bytes of length (16bit limit).
++# 65535 - 43 = 65492
++# 65492 * 2 = 130984
++padding=$(printf '%*s' 130984 | tr ' ' '0')
++AT_CHECK([ovs-appctl ofproto/trace br0 in_port=1 ${packet}${padding}], [0], [stdout])
++AT_CHECK([tail -2 stdout], [0],
++  [Megaflow: recirc_id=0,eth,ip,in_port=1,nw_dst=1.1.1.2,nw_frag=no
++Datapath actions: 2
++])
++OVS_VSWITCHD_STOP
++AT_CLEANUP
+-- 
+2.25.1
+
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 56a9c25f..c1cc23c0 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -32,6 +32,7 @@ SRC_URI = "file://openvswitch-switch \
            file://systemd-update-tool-paths.patch \
            file://systemd-create-runtime-dirs.patch \
            file://CVE-2021-3905.patch \
+           file://CVE-2020-35498.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
-- 
2.25.1


