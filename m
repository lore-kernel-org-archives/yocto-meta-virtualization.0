Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A58C32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 00:07:48 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web11.5355.1661299663019983661
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 17:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=vJ4VBzsx;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 6D0793200754;
	Tue, 23 Aug 2022 20:07:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 23 Aug 2022 20:07:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661299660; x=1661386060; bh=YXrWtAtrNG3Txq/776YM57tma
	H7deDKxxeLOEc2je9w=; b=vJ4VBzsxCHYsoVxm74qCf0Gj9yPMUBLAKYWfskSez
	dQiDp3YNeAtThqKtEcg6Yio7oDM4bH3pYaGsXi7p/1HzqHlLbdQCa8DxaRkCHDLw
	FL2lbdGMHiu4h4oa4CKGer2NdvbPbR0NJ1Il2yMjF7U3Sh10bv4gOrc6iCEzAEHm
	bLct1+3fW7KPjEP5EuPs6XZRyYl/ZfhklVWi0HffPpFl0auLrh6Hs6034e/rUC4J
	D8myIrTsqnlPw+Vvhn4EDOWa9oAbBYhNvEiJi1F2YEKRW2AAh7OTRAQN1es+h6Zh
	gQxP29K8U/FqZccp0IS/rnDmGbH0DzBGFtNhVVDjBSAXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661299660; x=1661386060; bh=YXrWtAtrNG3Txq/776YM57tmaH7deDKxxeL
	OEc2je9w=; b=lmKxz6pGujXN4UUmnRnABqkXPTLxDBmveWEY+MElstnVv6znkrU
	oRmhfYHTJE+iRWOykycfzFaBfmNUYbdkw556M5lCcgDgdowCEhf8ZYdxwada9yZ8
	LjrauSCqkCV7LMVDeJ5KWOlQ8gzn57wfdCVS0Q6yXRszfJhm9TxVQUn8LfhEVjhF
	bm9C7RLwSa2/x5eZykXRn4ZJSserWBTQLdrzQem25+ADKbHHQgvC08hVZFF8HeYy
	DMswrj+AScbHHnDzbw9Oqapp4udS69cSXITQCH/GSrF1S8oJpbUcL1SNQpyg3l90
	Y2OhpOgEljx9a0MrgeQiGRiZLOHLAJb+RBg==
X-ME-Sender: <xms:zGsFY6z18mVJ_E6kQcnCoW7LQ6pHu1PVMpM9ZbHABoKB1IMowdMjKA>
    <xme:zGsFY2Q-sZuVpu199L8X2aEX1aOYOIIPElYvjRv5myiWSxg_2-zznQI0sbzXY8zW8
    4gFFp7s1k-NGPr_9tY>
X-ME-Received: 
 <xmr:zGsFY8XAFbzLXUJWGZelPmE1lvCfIeNYcC0b4FjmTKDFQRrLGtTopyy9ETKgAusoV3_w_SfOTkmK5u3Ls9JfU87zeYCFcjIdztSc9aKPsUoaw1msQZSxW2RR>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejtddgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjeffveelleeigedvieeiuddvtd
    ffleettdeitdfgffejhfeigeekvdduvefhtedtnecuffhomhgrihhnpehgihhthhhusgdr
    tghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:zGsFYwh-83Cn1a7II_6JYPYZDNjlRFWDhB9dWxwGplR6VIqJsz5E6w>
    <xmx:zGsFY8CdizZLHuary1v1FWEuNvRfWfEPGaCJglbD7Lfz0RBVFFYESQ>
    <xmx:zGsFYxJHExdbyAVC2LbWoa6JYaPri0R4eG7fBixqHcgYZQgrjQceMg>
    <xmx:zGsFY15CKRX4tbYC6duaPG3bmazNP7v1G7qNDk7DXjU3eWols65HrQ>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Aug 2022 20:07:39 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH] podman: Rename podman-rootless.conf
 sysctl file to aid overrides
Date: Wed, 24 Aug 2022 02:07:19 +0200
Message-Id: <20220824000719.2495588-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Aug 2022 00:07:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7556

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Files are sorted in lexicographic order. Moving podman-rootless.conf to
something greater then '00' would help with systems providing default
values in other configuration files that can be overridden by
podman-rootless.conf.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../{00-podman-rootless.conf => 50-podman-rootless.conf}      | 0
 recipes-containers/podman/podman_git.bb                       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-containers/podman/podman/{00-podman-rootless.conf => 50-podman-rootless.conf} (100%)

diff --git a/recipes-containers/podman/podman/00-podman-rootless.conf b/recipes-containers/podman/podman/50-podman-rootless.conf
similarity index 100%
rename from recipes-containers/podman/podman/00-podman-rootless.conf
rename to recipes-containers/podman/podman/50-podman-rootless.conf
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 9b92094..e999192 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -22,7 +22,7 @@ SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v4.1;protocol=https \
     file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
     file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
-    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://00-podman-rootless.conf', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
 "
 
 LICENSE = "Apache-2.0"
@@ -105,7 +105,7 @@ do_install() {
 
 	if ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'true', 'false', d)}; then
 		install -d "${D}${sysconfdir}/sysctl.d"
-		install -m 0644 "${WORKDIR}/00-podman-rootless.conf" "${D}${sysconfdir}/sysctl.d"
+		install -m 0644 "${WORKDIR}/50-podman-rootless.conf" "${D}${sysconfdir}/sysctl.d"
 	fi
 }
 
-- 
2.25.1


