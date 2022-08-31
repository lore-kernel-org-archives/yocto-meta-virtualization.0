Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19DEECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 11:06:10 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web08.23933.1661943960502331613
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 04:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm2 header.b=hUsqcp0Y;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 9B2D15C0069;
	Wed, 31 Aug 2022 07:05:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 31 Aug 2022 07:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661943959; x=1662030359; bh=iGeVkeaoQRRz7MyCEsy8xlTPd
	TQ7YIbrqfPpbYNtAMk=; b=hUsqcp0Y/8hBDBfTHGELZjmI+5GXaLoaxGUXz1YoM
	AI7cvdCpmQm7cdCOKlk1OHcK1Z7uAc6OOe4jJ6n2rflk6R+xhDcifStyOXh7KVTo
	BULv+l1DDmDPe8NjOvG9XunIdk+i88Vs/NiOvTl4uhN7VhLQt5ic7CGlbcHTqMgj
	XLnTpjFVwuCgxaFYwFx7NFAE7YBeAz7eDrg1XTkcjKcUFWkaGuhv9E9PCEopeaS6
	c5+QF6u2hoORdrBGH4FQA7RKN5ogpmLs7pvn0ngPi/ePmuWZMryNFbcYkqRxCGru
	+4oFW6ujKEKsmkhRMxN16ZuxVli6mDmgDkfDKIzFkPamw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661943959; x=1662030359; bh=iGeVkeaoQRRz7MyCEsy8xlTPdTQ7YIbrqfP
	pbYNtAMk=; b=hoVQU/QBvho80j9se1b8+9/4wyCI7evg7wcY8g9Q/s44E9/wZRd
	zlyPtda1AXjP3EMw1ZiY/i8zsntLhLEPH4z0FgNYiB3p2ot1078U1oPiOj51EmE+
	4qnrUA1D7yZpEvvso2fwOg1srVxbNVZlF/bvuQfFCSJVhBSV7Zn0prEvJYqF7b0E
	Cgk/wiKf/ghAidJbDwQIbaopjtO4mlDkaIuIxLgJfb2UFAeM2sJhHuYPDIPDTMmy
	4+wZl4vfZbaUTEByfO4ctM2kjUzGrs5xavoILNdrzfAfsq3Vij9LYeyonvJKL9Io
	BWB4wwMkIu660dl1EdR5aPa8I4VP+VQOoSw==
X-ME-Sender: <xms:l0APYyQGSa3hsotBIkFO7NRvfSQROrAVw-i2sKT0F9Fa2OPLI4ZzTA>
    <xme:l0APY3wRwoy9Kbxitxn0uwgJoAZR0QjuTuazwRU5gHx13-mWN-uaDf_TMLhK81xBi
    hnwayYwBl0NXK7jhf0>
X-ME-Received: 
 <xmr:l0APY_0xB-iFSu-oxsV2K1TqJ_WtC35NXjqLSsXP028ZVaHWNZ4ur5CxozY3G4omfX3HasZ4BVsAqbl5JjHtTn-djBTt4DMrDvKpznqIvBSklUqmuUpeeiHW>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdekiedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjeffveelleeigedvieeiuddvtd
    ffleettdeitdfgffejhfeigeekvdduvefhtedtnecuffhomhgrihhnpehgihhthhhusgdr
    tghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:l0APY-ACGQL1raFNyWHGGfsMUW8kEX0L7x_doBluJtJ4Wz9eIRVprg>
    <xmx:l0APY7g9_39yBfw_76fG9p9lFKBJR7mu6CJ3McwkbPWvBDy95eLaaw>
    <xmx:l0APY6ozp8dQ4vFO0AC9eS3oer0kMs3PBn_A_UI6uE8s9i4-15FsRw>
    <xmx:l0APYzaKuXNLLZ-HCREJK72XshdDvGJ38qzdiZsYCHwdaHnznIugzQ>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Aug 2022 07:05:58 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH] podman: Fix merge typo
Date: Wed, 31 Aug 2022 13:05:46 +0200
Message-Id: <20220831110546.3898236-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 31 Aug 2022 11:06:10 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7587

From: Andrei Gherzan <andrei.gherzan@huawei.com>

2b28d64667e4c22434b9db0a87a1265a0caedb66 brought a typo when resolving
merge/rebase conflict. This fixes it.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-containers/podman/podman_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 65e0205..09bf827 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -23,7 +23,7 @@ SRC_URI = " \
     file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
     file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
     file://CVE-2022-27649.patch;patchdir=src/import \
-    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://00-podman-rootless.conf', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
 "
 
 LICENSE = "Apache-2.0"
-- 
2.25.1


