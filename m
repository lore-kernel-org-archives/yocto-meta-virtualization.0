Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A315EC61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 14:31:49 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9727.1788273104212071622
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 07:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mNwqwh1T;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso3793217b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 07:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788273103; x=1788877903; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RKmaIGwKvcjy72MCM1hn+YLN6HuCbMRjLBI/cQnoI+M=;
        b=mNwqwh1T08Uixk/eF78+LdkN+Ao5UHsMSOIAXj7OlLCM8idRe6jMyChDYSiJKpyWQt
         W2c0Vz1VkUeaLQvPIu6LIL0A9xYfp9CS0YDPFpWnpq7xQML1oQzBZmfRKEPT4pBi5tOR
         vE4Cyodj/JSGzLSf7oDbV72ZgCSfQ75qOTTdd6b6Bz8qrADqBgzGiGSpYbwb5/RNs+r8
         wpY/i9S+qy4PJ1BnpbZCsTaqhhn6a0f/534FibUm1efnnS1F3T5WO/bXGwLXhJHa2E6L
         OPeLolNS7B/lkBETAF2YWaREk8iX2JcQ4sWeiVdb0OOGsnQ2a3IUPxjzRhBsvGILGdbv
         AGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273103; x=1788877903;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKmaIGwKvcjy72MCM1hn+YLN6HuCbMRjLBI/cQnoI+M=;
        b=rr3mAMEvWVfyP6wLKAiARq//+DrljRJm2ZI9WvPwmq07bhLcfXHcMKwmCuCQCTB1mq
         69y+zB/libdiUGiyGGhizT7NfnnKeA90MN3BAqDPRfpZYF1mwHAwK2Nhl1ipW00Xym1F
         dnaWeGFlAE+NR27EOXpc+lpxLx0ORzaGIzAi2EOpicqfegFEXNje7kTlz+EyNs80CIjB
         wokV37l4lAFq0S+icbpXtSO/T8hx3BmHrHRDsUw+oDc3XMauiBIGpZCIt/G63rgPL5z8
         jVz05750uX81EUX8CZabEUNXrNNfiRIw5JFWukrYKmVgC1m3H/vAnYFPT+akBttZJkPF
         jvNg==
X-Gm-Message-State: AFuF++lH5T5kSlsoBfLi9aXkpAJyn8gCoF4uknFQUZZmKH7eCV33MADg
	PvDnsv3i+0PzqSAjPpHDySmqzg+/T/ImJyyyTlCUqpV1p6yJ8YzADiME
X-Gm-Gg: AR+sD11Wuoo4sXw7KUXtCsZubQKQ4yk6M0O2efAaKuQ5SBGzXsooaI5P4eIVAfrp6PP
	Hfwi5MZ9Z/OrYN72xkNhkWYClcV12mn89RmzA7fuD3DS6ruEfvGBsQE6SEqEakGUiA7qBiWwOFt
	hz/GlZLGrZLL/ZI7SBzzRTHL0gdS6kTovy5Un46+rSytrzkIhcbXlwPGc0jSgRyfQ69qoS18jVn
	XmzXB6Wsb9ZoaFjP1PMC1EwGy0WgrZyLrkFE/72OEBdBD3XLnoeW8VBUWX2BO+HGtBXN1TGViuv
	SvUK6OV6loioc+VjEs8sMffaqFrtYoNw6BwjH0L+8kA08iHcCMMn5kQ66PobGNMo5wQzSKwEAVZ
	hAE80MwjBWDuEc7R8y/7qGPNjrr7YZS+Drzf0IQ1u1iVeJ+GdbKnU69gP0q3N+6DYN6Qo0ewfzG
	U9zh4sodnLG+KpGr5X+ihdK1RUqUCvt9D87sY13U06vFuY9aBnJUZvmaAPM2vKKAyMVwFRI/6NW
	eztKaCVxdp8nw1PRps84Iyx4v9VAuKSRJCQRASsvYsJKswxhBWyx6Ygpq4ysrA8z1+RuHGkT7y0
	fWSuWsj/oha+2nGF0p9q+g2CrNOUMaewmaUmxx1qkv77vkOtFxROm3KkhzxC
X-Received: by 2002:a05:6a20:2d2c:b0:3d1:39e9:b261 with SMTP id adf61e73a8af0-3d7aacd026bmr14125407637.0.1788273103362;
        Tue, 01 Sep 2026 07:31:43 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1fd7a57a0sm5526453a12.29.2026.09.01.07.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:31:42 -0700 (PDT)
Message-ID: <6a96e1ce.0a537afd.394f1.3222@mx.google.com>
Date: Tue, 01 Sep 2026 07:31:42 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: jaeyoon.jung@lge.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization] [PATCH] irqbalance: add PACKAGECONFIG for ui
In-Reply-To: <20260825102425.3092801-1-jaeyoon.jung@lge.com>
References: <20260825102425.3092801-1-jaeyoon.jung@lge.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 14:31:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10071

Hi Jaeyoon,

merged, but only after some empirical checking. Reading the diff,
adding 'ui' to the default PACKAGECONFIG line reads as adding new
functionality that wasn't in the default set before, which is
normally the opt-in pattern we'd ask for (add the PACKAGECONFIG[ui]
entry so consumers can enable it, but don't put it in the default
line). So I did a fresh build of the pre-patch recipe first to see
what was actually being produced.

It turns out irqbalance-ui was already being built. configure.ac
defaults with_irqbalanceui=yes, PKG_CHECK_MODULES([NCURSESW]) finds
ncurses in the recipe sysroot via transitive DEPENDS from other
packages, and /usr/sbin/irqbalance-ui lands in the image with
configure log "checking for ncursesw... yes".

So our current PACKAGECONFIG default (without 'ui') was already
producing the ui binary; the recipe just wasn't declaring it. This
patch aligns the declared PACKAGECONFIG with what we've been
shipping, adds the explicit ncurses DEPENDS the build was silently
relying on, and gives consumers a way to actually opt out via
PACKAGECONFIG:remove.

For future PACKAGECONFIG changes that add or reorder default
entries, please include this kind of empirical verification in
the commit message: what the pre-patch build was actually
producing, and why the change preserves rather than adds default
behaviour. Otherwise the diff reads as an opt-in becoming default
without a matching justification, and it takes a reviewer
reproducing the build to trust the claim. I've added a maintainer
note to the merged commit summarising the check.

Bruce

