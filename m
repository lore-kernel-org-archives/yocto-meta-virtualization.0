Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD38FC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 18:53:37 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web12.276.1657565608091959914
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 11:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=ITBsgs9p;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 6A0645C014D;
	Mon, 11 Jul 2022 14:53:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 11 Jul 2022 14:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1657565607; x=1657652007; bh=pK
	cLc4G8/xkbAnzMDS4jqIVhZm3pp1wgHYjE3HzUjls=; b=ITBsgs9pG3K9vD9fTA
	EqaeRg/DbsloqFfWrMVWQTZAik9Vh33l4tCGUM+HKGTRH5KatwvA01bHAk+PBst+
	SGQaEH0WaekkP8ZyiggogRM4tUubulTr011tN3FvPlD6rz0Gfb9uA2Tx/w1oqq2c
	ER1lr9WBFBkocinydLQ94roeRI0Ick56xN5uPkEExgoBb8AWy6vF9HQxu4a/lVKs
	FNcayRtjN5v18zrOkxr//Wm2fLx65CXuAne3xUFWWMgdPSLoXl3otrJWMm9HiPyu
	0e+U5h5Y5NyTVQWEApsSes/lVJG/30FvIPDnNMSzEtVl/CqrmBKXAtsjqqUOIxHX
	3ReA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657565607; x=1657652007; bh=pKcLc4G8/xkbA
	nzMDS4jqIVhZm3pp1wgHYjE3HzUjls=; b=p4hKjX+SParLLiqIxtbxSYe2IK/Z5
	udxc6rlxjy0hnD1cHjJo1XFn4xvb5lBbIQ/8WJ50o1lVdGoLOFa3PmdRI079sLJn
	s8ehrwMpfNZKJxAYJagWnNFSJyxERRtqbdJ8i70q8NF1yvDlbKzebG8a6T+yPL0e
	OOQbKOLyz8bMxNdyOafszH2+9Qms6yJimdp8Rzs7X1NfrA8q3oOsHQnCvwj0PpjV
	mU4AS2fUZ9hU4JAmjprhInjYPR+WXimFmj50QDa978KFbeHeAqG17vfKk4fb456M
	ONZcM/MLEyCPqv5G2lqLw4PZ2mQehRQN9233GR0/I0dqrsvvmjCxsTWCA==
X-ME-Sender: <xms:p3HMYsjNcw5VUM2qBhhJJl3WQFNzISp841h2cMuTiOTkEId7o42M4g>
    <xme:p3HMYlBqhp7j2CK6_avGGVfCSCUQya-busiMhkDJ1lgdAPyWLCtoQ2H6fywcHuWbD
    -BTFXl-Uz0OimATFUg>
X-ME-Received: 
 <xmr:p3HMYkF835tJLHYXOuFe0mWf7cZPLJ0853NV_kLYZcXyYoCj99RnPtxMIeVvVh2Nw4bOkvVS6Bi1I8SzEgMNLOhGyi9Hfy1vywGGVdMBRqrYURXW9GYjH43j>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghi
    sehghhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfevhfeggfffjeegle
    ekjeelieffjefggfekgefgfffgffeifeefgeehhfdtffenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtg
    homh
X-ME-Proxy: <xmx:p3HMYtS5mVZ9XX2CQo1IL_UU9LIHOvU9VdLzNx-XfNmWny58YRXn9Q>
    <xmx:p3HMYpxbHGAxjM2tUhDPyZRD_JTREXP4svaeDfA1twkJv2nAT-yUtQ>
    <xmx:p3HMYr7FF6NyKGBRePPqQae-aV98WiGJNGpxEh_N43ljrb8J9491KQ>
    <xmx:p3HMYqqrNkeglogUdov778dbcgsKUiB7xO8FZFK4oijCEQJZpFotdg>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 14:53:26 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH v2 2/4] podman: Silence docker emulation
 warnings
Date: Mon, 11 Jul 2022 20:53:03 +0200
Message-Id: <20220711185305.705539-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711185305.705539-1-andrei@gherzan.com>
References: <20220711185305.705539-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 18:53:37 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7437

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Podman can run in via a docker symlink emulating docker commands. By
default this generates a runtime warning. This change silences it via
the provided interface.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-containers/podman/podman_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 547bc4e..961cd18 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -93,6 +93,10 @@ do_install() {
 	if ${@bb.utils.contains('PACKAGECONFIG', 'docker', 'true', 'false', d)}; then
 		oe_runmake install.docker DESTDIR="${D}"
 	fi
+
+	# Silence docker emulation warnings.
+	mkdir -p ${D}/etc/containers
+	touch ${D}/etc/containers/nodocker
 }
 
 FILES:${PN} += " \
-- 
2.25.1


