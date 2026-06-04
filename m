Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71525CD6E57
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 00:41:34 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1256.1780533692674726912
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 17:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SIfZB27q;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0aa420401so921045ad.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Jun 2026 17:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780533692; x=1781138492; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAOhCy03pCfDyZ+RxDNlH03cuiN/TAhzM+cVpglT8Hk=;
        b=SIfZB27qKVugPhXElsMqLw1/Kx59l85h2VbcapW3ewN6w8J87/7T+MCufLBoebY+vP
         pzYSPNd8K7ZI/ZnXvi/hr/e7V54Krg7r0kuuC6MJ79QkveJEsYaE2UZL8YyXW/uUJ4c9
         B1DQd8DMWwXnsy8uzPmVi9+THvpribNv32WkJsKIxsWd66cwp4u/dl9T7THiTlsNp6/9
         5Esjk/rFpdPF9Q98RzxdrNjMUMM6aeIsW+jEQ9njA98ojBsGhn6dMF/lr7rt+9S9bLi+
         DC5+0/qDXVdNal5j89SoOaY9GzJKmL9cmjkcs8p+fsHNFaU2HmouJXVvNdchjkreNijI
         F/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780533692; x=1781138492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nAOhCy03pCfDyZ+RxDNlH03cuiN/TAhzM+cVpglT8Hk=;
        b=NFjqeBf0V8hcUcL/VWS+sdQeX5lvaOlYMwqm/fIqqvnbPmJD4qw3eJnXPo63wQqSnR
         SkhTH+/ByOBwiKu4Rs0wldruAs7ujt0O+KEuIeiizTTWp1MwrIjT6dC8dbFGCvkGy5Ar
         M77CeeO5ETAGFkcS12se0Lp4ZAB2H/5VEiwGtJR2Ls2ZX4vqNRcMubOnz46wwifW7vHy
         GWdhPegGRgdrraxqQmBfWDiQG0YPC/q+TQSe4WmYsO1tYn4woc+B2xtJq1oh/XD8c/sA
         WWoKmCF76d7LtzPxHjAY57y/U7AmUgnFQPJ4Tv3gAFo27HWHuurac8/YINmwH6I35a5N
         BlVw==
X-Gm-Message-State: AOJu0YyOsNwX0ToLCYleshHBgQ/xn0MpjseFSdmUvnXkQBzd7M3uLwyi
	b9o7eQ2i7T7ZzBKcUo/b2qSiQTT+QvbPxT1K3FKc9DsMlYbq9h7KcpPiRmBgjA==
X-Gm-Gg: Acq92OGmueZ55NIF7vsD9oU3nceR/Mou6JNx+iKNFE21vso7uuIku5my9aD8YPcllZg
	U5IZUcmMxbVsE7LteL8GYNbV/7el1uDtb3/5X2uRJZMVXbk8e++heOXrW6JXRxrTnGWxAE3d4DR
	FmUFbUKHRN3tlic7NBgLqVx8fVXCpyYsT4MaT5VAp/UAlfIVv9b6LqNdn+RT0TUKAutEJLzxiRG
	4oL9K3er/ZFGdINQXktejQJuETbsNRrtNCLXwhNTp7ycLt7eECgSqE0ChTFHkjmhFgYArIUiKpV
	iF+eo8QqatV6P/Gr3Gin4PItF3459oZgVFfrwYm6baGsTWp4A1maoC4BQNtyW77wqXIW0FZf2bD
	tOOrQfApxdtCxZh0uB/NZLhozNqCB9h24ZhcmlPEZ8paMxwKQBWywJiaGu35g5+k5BMgn90Yd7q
	1JW/wqY1oAg093jVB8AZX1mRidQ6ePDoaxvUGWxkvixSb2TYGhoORZioojNktqyTeSqoFl+c2aN
	X441+t4VBu/L6ubO3ClVu+9vbuuciwBtz3l+3CVErY3
X-Received: by 2002:a17:902:d4c9:b0:2c0:ccdb:e029 with SMTP id d9443c01a7336-2c163d609f3mr61675145ad.18.1780533692032;
        Wed, 03 Jun 2026 17:41:32 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f87920sm39057215ad.24.2026.06.03.17.41.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 03 Jun 2026 17:41:31 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH 2/2] container-image-multiarch: add helper recipe
Date: Wed,  3 Jun 2026 17:41:20 -0700
Message-ID: <20260604004120.97156-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604004120.97156-1-tim.orling@konsulko.com>
References: <20260604004120.97156-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Jun 2026 00:41:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9848

Similar to core-image-ptest.bb, this recipe uses mcextend to add
multiarch support for any recipe in CONTAINER_IMAGES variable which is
populated by the CONTAINER_IMAGES_META_VIRT variable in
container-image-packagelists.inc.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../images/container-image-multiarch.bb       | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 recipes-containers/images/container-image-multiarch.bb

diff --git a/recipes-containers/images/container-image-multiarch.bb b/recipes-containers/images/container-image-multiarch.bb
new file mode 100644
index 00000000..d3b586f4
--- /dev/null
+++ b/recipes-containers/images/container-image-multiarch.bb
@@ -0,0 +1,25 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "vcontainer"
+
+require conf/distro/include/container-image-packagelists.inc
+
+DESCRIPTION += "Enable building the ${MCNAME} multiarch image."
+SUMMARY ?= "${MCNAME} multiarch image."
+HOMEPAGE ?= "https://www.yoctoproject.org/"
+LICENSE ?= "MIT"
+LIC_FILES_CHKSUM ?= "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+
+CONTAINER_IMAGES = "${CONTAINER_IMAGES_META_VIRT}"
+
+inherit oci-multiarch
+
+BBCLASSEXTEND = "${@' '.join(['mcextend:'+x for x in d.getVar('CONTAINER_IMAGES').split()])}"
+
+OCI_MULTIARCH_RECIPE = "${MCNAME}"
+OCI_MULTIARCH_PLATFORMS = "aarch64 x86_64"
+
+python () {
+    if not d.getVar("MCNAME"):
+        raise bb.parse.SkipRecipe("No class extension set")
+}
-- 
2.54.0


