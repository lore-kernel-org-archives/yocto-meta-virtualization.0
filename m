Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBE9C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:14:11 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156209.1783358041445102691
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 10:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PnAIemPq;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84783bce476so2199510b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 10:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358041; x=1783962841; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pPzEH0GYSu4qpBwIXEH7Gn4zV3lkxREztNl/F2AIL8Y=;
        b=PnAIemPqNy8XWthOUdQZqME/7v8oBC2AXmLPWTWi/ihfkYyr40iT0FiXO9BLWZhjRV
         YeKochzl55du4VPR1hFeirqXaORCDIFq9+App6sLAxcEXRjzeD1mJOLeGhwaCvBPJYZT
         452eTVNsARHGm6hcPSvHx3w4G7xQctjydG8Yo6/36bZzRQCOUMNfwpLtl2O4eGPUt2Mj
         V7Pc6MkF+5VgKtUYa/JFbUz09EH0JWlKr7PIAxjh5e0kVlHDisDMaHdMs8vDY3cy6huK
         /CmhHv8cbt6FtKzsxiOuW/ZiRYba6vclWQrPhOBjiGWZ7H+yCQhHKSWTS90RLRcBdSX0
         glTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358041; x=1783962841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pPzEH0GYSu4qpBwIXEH7Gn4zV3lkxREztNl/F2AIL8Y=;
        b=J1SW2EgIRd6aL9PSI+LqnEKEOz3ovV2K0WzAiRHzyxxbWXGU2OwIys8qiKKf899VVE
         KkU10eCh+ABcxnpGhV0ZY71gNgS1D6wOhUnlhYlexLMuEkHhy7jpE1BTL000GGCuU8ly
         8iOC5dp/P2Z5C2sP+cbDDiAvJLTTEihJkGDN7KF06SzcooitoK+lQpG2YkGZVpQrd20N
         V+DRrtHegJ7xufFT5DCVYVgvQUo6ux4l79c5F8IcnBjD0JABAoGFWloX6t4RuO6Lt0p/
         tBDsPubnZKVROqHU/yhbIQyUGLcdzyv5Ub43i/hwtBv2SIhMYMxxPj3MuaEPb7JKSQcY
         zmXA==
X-Gm-Message-State: AOJu0YyUeRCz2XgMvLsC+sD0pOTPo71f8oaR86PZ5p1u5LQ5FRx/1NnT
	BZLrx+zFnMYUwrEFsQ/ZpBeyaw4g6EsvYNYNmWsC4BpzFa9KRyNtWkVKjDAr/Q==
X-Gm-Gg: AfdE7ck7r5NXz2Is0uCtQ0liNGuUI8j4Tba//rMyQeoe3rWsgGvs79HZEyzzhKMWBN1
	RBPvLnclYqR+d0Sx1BiOj5Z6LLyjca+m4f27Dj2FVtSiBpkXDVTNNbGe1XyCCHUcTzz/zorUF0V
	8w/6i6H2M8E/8RLmIo4/+lpG9RUCzOsAo+M48B+xGgU4wmc/GmJnEI2wZdfgBvqO3uBsqKoxSEf
	N/7Y9TXIox3qbIAFz0yAa8qJOugNKadY6nhj9MmZEjmD5VfFQ2dUHOjX7ILzbyXm6q7wTI/y6N/
	nMxPWowN59XFBrG5i3SMeZTIzrYmHkKx62rWLrkm58UKhc0EEGt1WD+WhLz1kZz978Lj91+3pr8
	u1Ucg/7YNhsUxT3IMGOVcinhFvi5M8/ry5NPG2Y+fmFJ7mFTEDjiBIxJk8S4Raxipm/3adOpHNU
	ArDdrdHeDPYDeFheG7EzXe4bxHSjnVGM0+KelZC2lHzqqZVloqYfQVOgnUngRzDH1fZrYNJLYNf
	ctYqBWXKJ4f
X-Received: by 2002:a05:6a00:14cf:b0:845:d111:c68f with SMTP id d2e1a72fcca58-84826d122c2mr1555971b3a.1.1783358040870;
        Mon, 06 Jul 2026 10:14:00 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bd1078sm4121873b3a.24.2026.07.06.10.13.58
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 10:13:59 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH v2 07/13] vcontainer-bbmask.inc: allow 'mosquitto', 'libwebsockets'
Date: Mon,  6 Jul 2026 10:12:42 -0700
Message-ID: <e1b4da16f190765d6cf50cc6e8f410b4043597e4.1783356922.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783356922.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com> <cover.1783356922.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 17:14:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9931

Allow meta-networking/recipes-connectivity/mosquitto and required
dependency meta-oe/recipes-connectivity/libwebsockets

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 conf/distro/include/vcontainer-bbmask.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/vcontainer-bbmask.inc b/conf/distro/include/vcontainer-bbmask.inc
index ac74464f..f79ea9b9 100644
--- a/conf/distro/include/vcontainer-bbmask.inc
+++ b/conf/distro/include/vcontainer-bbmask.inc
@@ -88,8 +88,8 @@ BBMASK += "meta-virtualization/recipes-networking/passt/"
 # ---------------------------------------------------------------------------
 # meta-oe / meta-networking: mask heavyweight categories
 # ---------------------------------------------------------------------------
-BBMASK += "meta-oe/recipes-(?!devtools|extended|support)"
-BBMASK += "meta-networking/recipes-(?!filter|support)"
+BBMASK += "meta-oe/recipes-(?!devtools|extended|support|connectivity/libwebsockets)"
+BBMASK += "meta-networking/recipes-(?!filter|support|connectivity/mosquitto)"
 BBMASK += "meta-openstack/recipes-dbs/postgresql/"
 BBMASK += "meta-oe/dynamic-layers/networking-layer/recipes-core/"
 BBMASK += "meta-openstack/recipes-extended/libvirt/"
-- 
2.54.0


