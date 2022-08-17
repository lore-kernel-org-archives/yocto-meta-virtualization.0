Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8AEC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 16:36:26 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.30946.1660754179548510240
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 09:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=D8p5W5Tw;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id D35AB5C0143;
	Wed, 17 Aug 2022 12:36:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 17 Aug 2022 12:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1660754178; x=1660840578; bh=jZoZyujw2gonhsd992IHCi+aG
	wYSZFl28iJco9K7OUk=; b=D8p5W5Tw+pk5bIDlxEBaJUPoR/EnzYZpRDRXlDZrC
	gwy/IDQCLGdhz7BxRXV44Q4t01fJiTHPWNx1v3njzUUi6ab8GDjbeI/WEKnuogge
	fdHSv2lLsnMjq87k8IWOEOIkYN9pO6sJ5/+v20YBzrQToSWaDhclen4PkN9+zolY
	n/Xzw5B36chxKKEAY3+5T7qwQtHwmlSHZv8I5IeeNx+awnMwce2MIIZpiSNFxVr1
	A7JCt68Ch+aVrdhq7otpFOOAXO0msfQbfnJMBbOPhEz7CwsDy+YwkKh3cVnkJO9+
	pUDegpupK4xUh73b9hZe4k1VT1/Gut5O6bLW/7LieS89Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1660754178; x=1660840578; bh=jZoZyujw2gonhsd992IHCi+aGwYSZFl28iJ
	co9K7OUk=; b=19lrB4Xv5QntEuiyr2LysGLufvEJ+J0SeI8c56FN4xutA3J2h1V
	aC/oUelJHpXHelY1TgOljcvs7IHLv2z9TXd43XbE6ISeZihc8kZ6K02qSaBcMFSE
	Qu062IVBcqVmX8Q9rzM9ATnv10NEaH3GX5aphuFh1ZJ8b89U7ogFbENVDLkJalxO
	XblqPaCNzYMv22xVtq9vKIdJVO9/EmFET/dtzRqhSlxgzbfdFb5+p2EWIThXXTId
	4AwDNZ2ybXVHnW0/wZ84yoZeQLebZ7FvtnAIhlMXP/x2XQA5HNUa+dEmK5iPo26K
	y4jrIFCnO2mKOP87iGftOS/eByzW5moxacg==
X-ME-Sender: <xms:ARn9YhBcLYJLaXtWhYuf9h1Fk3x6TrtLFXUhvo9-g_hWbZ090ndlvQ>
    <xme:ARn9YviuvDRskDKCTJgU7rGgQFvKsX2_tYhIdWWORi0-cmOju800jD249dM3TE10K
    A8SEFzu_BtG8ps3uh4>
X-ME-Received: 
 <xmr:ARn9YsmniU0cMnZ2E3gh6ZXfxhjLyjnA9chotrhvPN9ZsMdJKUzExtEfeIZLgRp1li8EuOL5Kd8_W173kj8vKAbpCCdgm53Lv9-8NkKZeSbW2FowGqV6XBQp>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeelhfevveelffevgeefte
    eljeetvdegjedttdehhffhtdeihfevgeffgeegkeenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:ARn9YrxyivAisAWnpUvQDtvXYRmukv66I85RSad10-ez8En2plJYHA>
    <xmx:ARn9YmSGm9fNUv3PtemYdPTmkGiB2HUk3NrQ60lu5ha9ZEoI304Ucg>
    <xmx:ARn9YuasDKVgXWR8F7ejm4Rb2ZLjYODzPcqy_5s1MptBPqIrXqPGCA>
    <xmx:Ahn9YpKZnnN1YLDvz_3fphC2ZdQlaZDHPRPTSpKePI-Hlv1ZXfdfWg>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 12:36:17 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH] singularity: Drop explicit runtime dep
 glibc
Date: Wed, 17 Aug 2022 18:36:09 +0200
Message-Id: <20220817163609.558405-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Aug 2022 16:36:26 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7537

From: Andrei Gherzan <andrei.gherzan@huawei.com>

There is no need we can see for this dependency to be provided as such -
especially forcing this to using glibc.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-containers/singularity/singularity_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/singularity/singularity_git.bb b/recipes-containers/singularity/singularity_git.bb
index 321a9a6..e3903ec 100644
--- a/recipes-containers/singularity/singularity_git.bb
+++ b/recipes-containers/singularity/singularity_git.bb
@@ -2,7 +2,7 @@
 # Singularity build / config: read up on the dev-so test for more info)
 INSANE_SKIP:${PN} += "dev-so"
 
-RDEPENDS:${PN} += "glibc python3 ca-certificates openssl bash e2fsprogs-mke2fs"
+RDEPENDS:${PN} += "python3 ca-certificates openssl bash e2fsprogs-mke2fs"
 
 LICENSE = "BSD-3-Clause | Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYRIGHT.md;md5=be78c34e483dd7d8439358b1e024b294 \
-- 
2.25.1


