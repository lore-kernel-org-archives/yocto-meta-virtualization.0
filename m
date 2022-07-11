Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8C2CCA47B
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:00:50 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web12.28112.1657544445758769628
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=q+UNVaiL;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 1D3B25C011A;
	Mon, 11 Jul 2022 09:00:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 11 Jul 2022 09:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1657544445; x=1657630845; bh=pK
	cLc4G8/xkbAnzMDS4jqIVhZm3pp1wgHYjE3HzUjls=; b=q+UNVaiLjMLI40GMgf
	IuGTsZ9E1sCCPIf9M2bbyOdN7kLKp6eVW2atDuqjB35eNMvS7LLIaTZVAq7jqlUM
	MqcFxAfPmskatZqALbf3ufDrcFtjJmvhlub6e0cZSz2hrShIhj/BZDp/nMqcbwdT
	RRRUr7bP/Meb87xV9D3llG1vW4xqeT+yqvgJBLianE/yzTzvgQ2CVTg3yC3ws1kk
	zdDj2CKkGjY0inT/joka6iiTjdLeITTBglBK8SqIoaLiO63V3t6QnnHjgNgjwD2o
	T4olSo+KsRcg9/nMcIuTbQVJ4tQCUanJS++Ghhk27jKTujiYaZQvIxPMvuH+pK2/
	x6cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657544445; x=1657630845; bh=pKcLc4G8/xkbA
	nzMDS4jqIVhZm3pp1wgHYjE3HzUjls=; b=AjqA7EdrwzIHmWJBeVytLvlKGvLED
	UZ1UAoyViT3wHcf0ZI32iX+5Kbq6s5/DNf/cuzdH8gevpyw4A5cr3lrPKh1r91LQ
	vg1fJpuSxm+Gt50Fumq0avDlatWHULgQl/nDDv2SaZb7rcCNM8YOHcAqKqt4Q/KC
	oNOW3Lh8r9duaVtY0stm5fZIXWc192h96wgLq4SZPZcXByK8a2HwvahoyCNzZYH7
	8VH3Qd13JRGQlmUfkuTYrqq36BYFuT0EuO3FhR18JP+5+3SFlEjVve3ClGoE/5ln
	+IVj9VLcAkJa2Mm9pyczESuJAIb/P1KM99IW6T2Dw4gLX8y1VB2TCuf+g==
X-ME-Sender: <xms:_B7MYj0vjyeuIx4GjozFqgr8xvP-2_Ov1smVfzCvGj68_gvGnbXNsA>
    <xme:_B7MYiEHmjaDnOVetzhiWgCx-YoxVjWtxYlfVpcMnxKplcya6NYM9CZ0tDU4kSEFu
    ouvueZB4dI845gwAT8>
X-ME-Received: 
 <xmr:_B7MYj4HycnpDfCC-nOVUTQ4zkEg1Tkwy6l0rOaIC6FLZTlf-7DZRXZeRaxQxG13lpvHTbQxvJs_1CCpyau8W8rtXQCRwM6HqXG-S6XUm1VIKcvQRvVCU51P>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjefhvefhgefgffejgeelke
    ejleeiffejgffgkeeggfffgfffieeffeeghefhtdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:_B7MYo01JT0iIRJPsQUlLgvuH7UzHviloN1ltnt10kic7rKdqN4YrQ>
    <xmx:_B7MYmE_NFccjzUaV_CNsVmnnQOiZhB9SOXHx0X3BoMyjSdQMoVvOQ>
    <xmx:_B7MYp--gh7jLDimTyYqNUw6AZ3U8N0OMm-C5uPYs7ToSeTyWd60nw>
    <xmx:_R7MYoOFxml1uOwHb6jIROie2pmOTdMsWip1I7Dan62Va5_dhp2zNQ>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 09:00:44 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH 2/3] podman: Silence docker emulation
 warnings
Date: Mon, 11 Jul 2022 15:00:21 +0200
Message-Id: <20220711130022.3264142-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711130022.3264142-1-andrei@gherzan.com>
References: <20220711130022.3264142-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 13:00:50 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7422

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


