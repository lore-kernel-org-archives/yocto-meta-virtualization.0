Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B775C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 20:26:55 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.1413.1683059205930259638
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 May 2023 13:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=XBRaoF5B;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1683059206;
  x=1714595206;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XceQPOapkLP/jd6el3XcdBrH7wuO1N5jLnOOSTxqdTU=;
  b=XBRaoF5BVxJtNyo3OS4ZH9JjXer6j5HvMAMt4mGALIJZFowK8FRHwc54
   udVRX8k3SZvDPme6WX9QFiGwsUI5O/DfCldHQ2rq0OKMGJ7bGIU4DB8WP
   mjCX/QhmNkXeQw7+sTfow2EqkLgwqokKIb3VpFWbcGMrHA6+HzM3R35BZ
   gsZeO+etxZ+0LlaIFvygqpGxDK+JnHcH571NdFp7d8ddjSt0Z4tSNY7/u
   DkODHRydE6c/4SDRFC8FH9vkmhnCxNyq+ZTI8/gi/5ayr2HnOhIVcmfV4
   wjgOSUw91w32RiU2h+IKEbN0KPpaU7tzbKHcSy1nR3Mq+Ub1rL4rfH+fQ
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 4/8] aardvark-dns: Fetch the crate instead of the Git repository
Date: Tue, 2 May 2023 22:26:27 +0200
Message-ID: <20230502202631.2102074-4-pkj@axis.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8022

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb b/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb
index 10901eb..ac2fc6d 100644
--- a/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb
+++ b/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb
@@ -4,15 +4,11 @@ HOMEPAGE = "https://github.com/containers/aardvark-dns"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "cb1a462dd8427e33355f6907394a0646f5a26bf2"
-
-# how to get aardvark-dns could be as easy as but default to a git checkout:
-# SRC_URI += "crate://crates.io/aardvark-dns/1.2.0"
-SRC_URI = "git://github.com/containers/aardvark-dns;protocol=https;nobranch=1 \
+SRC_URI = "crate://crates.io/${BPN}/${PV} \
            file://run-ptest"
 require ${BPN}-crates.inc
 
-S = "${WORKDIR}/git"
+SRC_URI[aardvark-dns-1.2.0.sha256sum] = "1f9d011e5edaa6e0fa055e383bec03a46c9ef35dfa346883aeb5bf86b794a949"
 
 inherit cargo cargo-update-recipe-crates features_check ptest
 

