Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7064C25B74
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 02:34:08 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.5952.1715654029298736902
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 May 2024 19:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nMoqWP7l;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c74b27179dso3627574b6e.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 May 2024 19:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715654028; x=1716258828; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wTuZub+ufWRkp6foLXMtq0sBZKQddFQlYSI9bloI2HY=;
        b=nMoqWP7lTzchOByJFPTuRV7pT0usmJLNBorescQRaPwP0y9qD+1LYWQ6MMxGjTnArn
         YE3D+i2bwANF1cRfqMMUOJaLT+THcMrQ9rbgOyx8jfmC0IuzYInvJ3H6rgv/GmkRzTey
         M3ZvV3S28v1l1SR9Io3aPMD++THL4yG4n0L6VZjagx441BG6IogrJQe6XLdRYwbap1fS
         fb8C6Y8TleQWbta4f4lnpvzuKFgAQgLklNguLNA6nkdL+9n3ssMJldrQFRA3vo3v0DVZ
         yyzzgQ+Bpb1ZglMwI/vOlGLnO17eYOb2NPlL8/Va9IdNst+fLoF8YpqNaGwGJuNzpTtC
         EZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715654028; x=1716258828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTuZub+ufWRkp6foLXMtq0sBZKQddFQlYSI9bloI2HY=;
        b=nNA/Kns+6Ymk4FWMsbiPFIBfYSYmvjOurQZOUDhbTEUcoJq1tlSfV3/9QqZThyTYHl
         v7+NnqWSZ4+bZYC4dNm7jV7kd+v1s3A1JUudgY8LbhA3dBB40wi8XAeOSGJaMhjJhVw+
         j8kP0VxvRbAD7U4bizSF14ks5pFeUBgku94HCAKXrKt5PKg5KtBxMJ/cEm9+PBqOwDDz
         LUpvBMji57JY6UkS6cCKItVv8bPUiUnONJ0bRoTorVlKh83P916YlroJa1ENpmM4pd8B
         zTm1IGJRZsO8NrKqK82ax1ZNuB4bgkMmoPC4eSLZgdE/bnRcwXpGqmG/R/jyN0mnEFsT
         NEVw==
X-Gm-Message-State: AOJu0YxRlDJLuzniRpT9/KWqgjF3SrdsSVl5Nij5IYW+IoAO/ejgTYqx
	3IPXfl22JmVtN4whp6fE8fltxjCqHsOZHVVVz0+b/v+2UyHgjdgO
X-Google-Smtp-Source: AGHT+IFtmzTGa7BfClzOnhiWNNXzrDXxZxYBDs4MEmO6tvy5LcPuq0yCXMbLGEDG2BsYo6wkBU5h6Q==
X-Received: by 2002:a05:6808:618c:b0:3c8:61b8:e518 with SMTP id 5614622812f47-3c9970cf15fmr12256025b6e.52.1715654028247;
        Mon, 13 May 2024 19:33:48 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf280390sm515878585a.35.2024.05.13.19.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 19:33:47 -0700 (PDT)
Date: Mon, 13 May 2024 22:33:46 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][dunfell][PATCH] openvswitch: fix
 CVE-2020-35498 limitation in the OVS packet parsing
Message-ID: <ZkLNiroXkFEgApRG@gmail.com>
References: <20240509121824.82134-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509121824.82134-1-hprajapati@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 May 2024 02:34:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8723

merged.

Bruce

In message: [meta-virtualization][dunfell][PATCH] openvswitch: fix CVE-2020-35498 limitation in the OVS packet parsing
on 09/05/2024 Hitendra Prajapati wrote:

> Upstream-Status: Backport https://github.com/openvswitch/ovs/commit/0625dc79aec73b966f206e55655a2816696246d0
> 
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../openvswitch-git/CVE-2020-35498.patch      | 151 ++++++++++++++++++
>  .../openvswitch/openvswitch_git.bb            |   1 +
>  2 files changed, 152 insertions(+)
>  create mode 100644 recipes-networking/openvswitch/openvswitch-git/CVE-2020-35498.patch
> 
> diff --git a/recipes-networking/openvswitch/openvswitch-git/CVE-2020-35498.patch b/recipes-networking/openvswitch/openvswitch-git/CVE-2020-35498.patch
> new file mode 100644
> index 00000000..5093f077
> --- /dev/null
> +++ b/recipes-networking/openvswitch/openvswitch-git/CVE-2020-35498.patch
> @@ -0,0 +1,151 @@
> +rom 0625dc79aec73b966f206e55655a2816696246d0 Mon Sep 17 00:00:00 2001
> +From: Flavio Leitner <fbl@sysclose.org>
> +Date: Mon, 26 Oct 2020 16:03:19 -0300
> +Subject: [PATCH] flow: Support extra padding length.
> +
> +Although not required, padding can be optionally added until
> +the packet length is MTU bytes. A packet with extra padding
> +currently fails sanity checks.
> +
> +Vulnerability: CVE-2020-35498
> +Fixes: fa8d9001a624 ("miniflow_extract: Properly handle small IP packets.")
> +Reported-by: Joakim Hindersson <joakim.hindersson@elastx.se>
> +Acked-by: Ilya Maximets <i.maximets@ovn.org>
> +Signed-off-by: Flavio Leitner <fbl@sysclose.org>
> +Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
> +
> +Upstream-Status: Backport [https://github.com/openvswitch/ovs/commit/0625dc79aec73b966f206e55655a2816696246d0]
> +CVE: CVE-2020-35498
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + lib/conntrack.c     |  2 +-
> + lib/dp-packet.h     | 10 +++++-----
> + lib/flow.c          |  6 +++---
> + tests/classifier.at | 36 ++++++++++++++++++++++++++++++++++++
> + 4 files changed, 45 insertions(+), 9 deletions(-)
> +
> +diff --git a/lib/conntrack.c b/lib/conntrack.c
> +index ff5a89457..0f486d74c 100644
> +--- a/lib/conntrack.c
> ++++ b/lib/conntrack.c
> +@@ -813,7 +813,7 @@ static void
> + reverse_nat_packet(struct dp_packet *pkt, const struct conn *conn)
> + {
> +     char *tail = dp_packet_tail(pkt);
> +-    uint8_t pad = dp_packet_l2_pad_size(pkt);
> ++    uint16_t pad = dp_packet_l2_pad_size(pkt);
> +     struct conn_key inner_key;
> +     const char *inner_l4 = NULL;
> +     uint16_t orig_l3_ofs = pkt->l3_ofs;
> +diff --git a/lib/dp-packet.h b/lib/dp-packet.h
> +index 9f8991faa..45655af46 100644
> +--- a/lib/dp-packet.h
> ++++ b/lib/dp-packet.h
> +@@ -81,7 +81,7 @@ struct dp_packet {
> + 
> +     /* All the following elements of this struct are copied in a single call
> +      * of memcpy in dp_packet_clone_with_headroom. */
> +-    uint8_t l2_pad_size;           /* Detected l2 padding size.
> ++    uint16_t l2_pad_size;          /* Detected l2 padding size.
> +                                     * Padding is non-pullable. */
> +     uint16_t l2_5_ofs;             /* MPLS label stack offset, or UINT16_MAX */
> +     uint16_t l3_ofs;               /* Network-level header offset,
> +@@ -118,8 +118,8 @@ void *dp_packet_resize_l2(struct dp_packet *, int increment);
> + void *dp_packet_resize_l2_5(struct dp_packet *, int increment);
> + static inline void *dp_packet_eth(const struct dp_packet *);
> + static inline void dp_packet_reset_offsets(struct dp_packet *);
> +-static inline uint8_t dp_packet_l2_pad_size(const struct dp_packet *);
> +-static inline void dp_packet_set_l2_pad_size(struct dp_packet *, uint8_t);
> ++static inline uint16_t dp_packet_l2_pad_size(const struct dp_packet *);
> ++static inline void dp_packet_set_l2_pad_size(struct dp_packet *, uint16_t);
> + static inline void *dp_packet_l2_5(const struct dp_packet *);
> + static inline void dp_packet_set_l2_5(struct dp_packet *, void *);
> + static inline void *dp_packet_l3(const struct dp_packet *);
> +@@ -327,14 +327,14 @@ dp_packet_reset_offsets(struct dp_packet *b)
> +     b->l4_ofs = UINT16_MAX;
> + }
> + 
> +-static inline uint8_t
> ++static inline uint16_t
> + dp_packet_l2_pad_size(const struct dp_packet *b)
> + {
> +     return b->l2_pad_size;
> + }
> + 
> + static inline void
> +-dp_packet_set_l2_pad_size(struct dp_packet *b, uint8_t pad_size)
> ++dp_packet_set_l2_pad_size(struct dp_packet *b, uint16_t pad_size)
> + {
> +     ovs_assert(pad_size <= dp_packet_size(b));
> +     b->l2_pad_size = pad_size;
> +diff --git a/lib/flow.c b/lib/flow.c
> +index 45bb96b54..353d5cd3e 100644
> +--- a/lib/flow.c
> ++++ b/lib/flow.c
> +@@ -655,7 +655,7 @@ ipv4_sanity_check(const struct ip_header *nh, size_t size,
> + 
> +     tot_len = ntohs(nh->ip_tot_len);
> +     if (OVS_UNLIKELY(tot_len > size || ip_len > tot_len ||
> +-                size - tot_len > UINT8_MAX)) {
> ++                size - tot_len > UINT16_MAX)) {
> +         return false;
> +     }
> + 
> +@@ -693,8 +693,8 @@ ipv6_sanity_check(const struct ovs_16aligned_ip6_hdr *nh, size_t size)
> +     if (OVS_UNLIKELY(plen + IPV6_HEADER_LEN > size)) {
> +         return false;
> +     }
> +-    /* Jumbo Payload option not supported yet. */
> +-    if (OVS_UNLIKELY(size - (plen + IPV6_HEADER_LEN) > UINT8_MAX)) {
> ++
> ++    if (OVS_UNLIKELY(size - (plen + IPV6_HEADER_LEN) > UINT16_MAX)) {
> +         return false;
> +     }
> + 
> +diff --git a/tests/classifier.at b/tests/classifier.at
> +index 88818618b..cdcd72c15 100644
> +--- a/tests/classifier.at
> ++++ b/tests/classifier.at
> +@@ -304,3 +304,39 @@ ovs-ofctl: "conjunction" actions may be used along with "note" but not any other
> + ])
> + OVS_VSWITCHD_STOP
> + AT_CLEANUP
> ++
> ++# Flow classifier a packet with excess of padding.
> ++AT_SETUP([flow classifier - packet with extra padding])
> ++OVS_VSWITCHD_START
> ++add_of_ports br0 1 2
> ++AT_DATA([flows.txt], [dnl
> ++priority=5,ip,ip_dst=1.1.1.1,actions=1
> ++priority=5,ip,ip_dst=1.1.1.2,actions=2
> ++priority=0,actions=drop
> ++])
> ++AT_CHECK([ovs-ofctl add-flows br0 flows.txt])
> ++packet=00020202020000010101010008004500001c00010000401176cc01010101010101020d6a00350008ee3a
> ++AT_CHECK([ovs-appctl ofproto/trace br0 in_port=1 $packet] , [0], [stdout])
> ++AT_CHECK([tail -2 stdout], [0],
> ++  [Megaflow: recirc_id=0,eth,ip,in_port=1,nw_dst=1.1.1.2,nw_frag=no
> ++Datapath actions: 2
> ++])
> ++# normal packet plus 255 bytes of padding (8bit padding).
> ++# 255 * 2 = 510
> ++padding=$(printf '%*s' 510 | tr ' ' '0')
> ++AT_CHECK([ovs-appctl ofproto/trace br0 in_port=1 ${packet}${padding}] , [0], [stdout])
> ++AT_CHECK([tail -2 stdout], [0],
> ++  [Megaflow: recirc_id=0,eth,ip,in_port=1,nw_dst=1.1.1.2,nw_frag=no
> ++Datapath actions: 2
> ++])
> ++# normal packet plus padding up to 65535 bytes of length (16bit limit).
> ++# 65535 - 43 = 65492
> ++# 65492 * 2 = 130984
> ++padding=$(printf '%*s' 130984 | tr ' ' '0')
> ++AT_CHECK([ovs-appctl ofproto/trace br0 in_port=1 ${packet}${padding}], [0], [stdout])
> ++AT_CHECK([tail -2 stdout], [0],
> ++  [Megaflow: recirc_id=0,eth,ip,in_port=1,nw_dst=1.1.1.2,nw_frag=no
> ++Datapath actions: 2
> ++])
> ++OVS_VSWITCHD_STOP
> ++AT_CLEANUP
> +-- 
> +2.25.1
> +
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 56a9c25f..c1cc23c0 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -32,6 +32,7 @@ SRC_URI = "file://openvswitch-switch \
>             file://systemd-update-tool-paths.patch \
>             file://systemd-create-runtime-dirs.patch \
>             file://CVE-2021-3905.patch \
> +           file://CVE-2020-35498.patch \
>             "
>  
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
> -- 
> 2.25.1
> 

