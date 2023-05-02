Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7D1C7EE2A
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 20:26:55 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.1436.1683059206694351525
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 May 2023 13:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=f8ntRvp0;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1683059207;
  x=1714595207;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=J+aCApjUA23xIpNTEwNVLNNjKlf8rHQxRvnJNH0hBcU=;
  b=f8ntRvp0UIoIpqjJr5+SzEySH4n2tDVwp7u2sjzkM/FwkMUWNQDv5iKh
   fMZAzvp5aHPv/vgSH/GF/ANgBil8TURjom7OAkugMvEmxHFUh3OeJeSm0
   5wgziM8WeUEv+spiOvc+gbjuGt5EXYC2IizCzXVLutP9PgcYmkZt3I+ms
   B0PB8BkG+GCyeGMW8eJoXAVSzm3RsD2NhNJBc2u8BEyNO15XcHTLgcyoo
   s+TVd1DR0zgovCv6Kk6vjWDFLEWSV+c/3zCENsTCxc9h+B7vCUh9yd0K7
   bWX1NChHSqMpVLWZ48rOchpQUzterp1VujpRkv4w3G5r4/vRvHbzDBNqv
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 8/8] netavark: Fetch the crate instead of the Git repository
Date: Tue, 2 May 2023 22:26:31 +0200
Message-ID: <20230502202631.2102074-8-pkj@axis.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230502202631.2102074-1-pkj@axis.com>
References: <20230502202631.2102074-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 May 2023 20:26:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8025

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 recipes-containers/netavark/netavark_1.2.0.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/recipes-containers/netavark/netavark_1.2.0.bb b/recipes-containers/netavark/netavark_1.2.0.bb
index be7cff5..0b16d2b 100644
--- a/recipes-containers/netavark/netavark_1.2.0.bb
+++ b/recipes-containers/netavark/netavark_1.2.0.bb
@@ -4,16 +4,12 @@ HOMEPAGE = "https://github.com/containers/netavark"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "90cccc1c21f26fbc473a201ce3b30d77667c7635"
-
-# how to get netavark could be as easy as but default to a git checkout:
-# SRC_URI += "crate://crates.io/netavark/1.2.0"
-SRC_URI = "git://github.com/containers/netavark.git;protocol=https;nobranch=1 \
+SRC_URI = "crate://crates.io/${BPN}/${PV} \
            file://tests.patch \
            file://run-ptest"
 require ${BPN}-crates.inc
 
-S = "${WORKDIR}/git"
+SRC_URI[netavark-1.2.0.sha256sum] = "8d636ecaab6dcbc7989cde720d290d8ff30d9eb69f3a2b3cb70d4135e721b936"
 
 PACKAGECONFIG ?= "aardvark-dns"
 

