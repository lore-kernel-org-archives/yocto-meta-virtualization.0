Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A950C19F29
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 09:13:01 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web12.3972.1659431580732371006
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Aug 2022 02:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=bLEnAc3f;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24,
 mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id F2F4732000F9;
	Tue,  2 Aug 2022 05:12:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 02 Aug 2022 05:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1659431579; x=1659517979; bh=/C
	byZPjw9pUHJ8FPr6AqU4DrzExxNE6T7ZNkEiQuyc8=; b=bLEnAc3fSeJQX3U5mR
	qYlaQBxeZRzEPi0VhjRMgWOHanrpywtEwjKGGPE1VUCBJFA4pD1rHgygbJ+ZTSKZ
	vcmmj4kwiWljQXrH3PqAD8jl5De9bHBoRSrjx/O43K5QYuZgjEdfShf4oasXU3bQ
	e+uLecudUvPDdsHBSnFdhjn38c+oy+zgdmDLMgx8+DKvQYztDElwAayCmOvrSi/E
	gs1duRR8ZC+xTW+oOQ6hUtr0Ga9jL/qnin+NN6TQm2PjmGg00C9bW1SNv0MeLOrq
	BZr8CPl6JBG41N8acKQaazujgLYoxe1BezR1a1U/7+MyxCyjutUHJpyvYNN4+svv
	Qk7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1659431579; x=1659517979; bh=/CbyZPjw9pUHJ
	8FPr6AqU4DrzExxNE6T7ZNkEiQuyc8=; b=FRXv+gc+sDpXUuDLEnwCvY9Fbf2J8
	v1ZbnFLSZO+jQDyBBVeIRCFu2idiIQbBsVlgdEEhBWNpzjkCbA5OW7thiUASxHtn
	dKuxbzvdRgVarONVoQC/sUyBUOEELWDO+LbC+sWSrw2lwP4KZ53cPHd8S95Y9sBt
	ZpabdFb9whRNeOJfOXGFvixcOaDhRpLWNCsFFWlZuC3PFCXOg5PIUku5rKayAGBH
	yTHCryBYKIhytTTtS9s3Ua3PNWbNRofBcxNThDnknUyoDFOZzxCgx8bJ/I2ZMfXg
	KmHvol/pz/tBD2ZmFL2B+gFWuDNGhrHleyaj3chCs0enGzJxGHvWI9uNA==
X-ME-Sender: <xms:m-roYiglMSF-BS-38ptuWUt2ANGIJIPBCFekvKTglQRrE8LtnvGC0Q>
    <xme:m-roYjDeJIJXyeC6XUW7dW3ukoseiblJNbMSIkwliix3YlspJJqk66mGQIO_sMFem
    ItcjkrxXQQ7OeFtR54>
X-ME-Received: 
 <xmr:m-roYqES8vRIPnxwh9ovcLAxpV-ws9NEpq49Tuko3lLR5QIkMKbgZUmjtLB2R07VJmAZfA4SGB2xQB9UFxY8z-HOBj3T28NzCfvFlHU3CFinBJFK5aQeQI3K>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvddvhedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepueelheegjeehgeefgfduie
    ekgeegfedvledtleejtefgledvkefhffeuvdejudfgnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:m-roYrQAHteAOhI35VNh6Ljv2UvAzyWtsRo8uSYPuBYzZTOJH4wEdA>
    <xmx:m-roYvzIm4ZyVs-1_Jvl2X6KQMfOBGcTSS3Ue6v5fekh5SbcMuSNCg>
    <xmx:m-roYp6XHZh5bPry3-uXZZTAS4pjoQHY3CdhjbUp3XSuL9M0Vkmg4Q>
    <xmx:m-roYoruqF6EWvw6TRuhO3MdK1NgcWcCp2-vfuOD_vwPzq4qZox6lw>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Aug 2022 05:12:58 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH 3/4] podman: Use gcc-based
 toolchain
Date: Tue,  2 Aug 2022 11:12:48 +0200
Message-Id: <20220802091249.3695386-3-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802091249.3695386-1-andrei@gherzan.com>
References: <20220802091249.3695386-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Aug 2022 09:13:01 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7488

From: Andrei Gherzan <andrei.gherzan@huawei.com>

clang-based builds are still broken due to:
https://github.com/llvm/llvm-project/issues/53999

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-containers/podman/podman_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index bdc9ea0..e155c7b 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -44,6 +44,9 @@ exclude_graphdriver_btrfs exclude_graphdriver_devicemapper"
 # overide LDFLAGS to allow podman to build without: "flag provided but not # defined: -Wl,-O1
 export LDFLAGS=""
 
+# https://github.com/llvm/llvm-project/issues/53999
+TOOLCHAIN = "gcc"
+
 inherit go goarch
 inherit systemd pkgconfig
 
-- 
2.25.1


