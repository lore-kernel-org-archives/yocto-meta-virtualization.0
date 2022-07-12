Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92BAC433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 14:20:29 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web11.9576.1657635619764808368
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 07:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=JgCyWAtR;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 049E53200932;
	Tue, 12 Jul 2022 10:20:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 12 Jul 2022 10:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1657635618; x=1657722018; bh=Xt
	6EkqSBpagSt0PeKLrWC3rRH7JPJrLdwqCakjpQ97c=; b=JgCyWAtRZAWKzZAitW
	hjUV4f+Gk0FAaDMet0SPaXEpPa/ASxgT327V6wZTf83DEtfnOobnX2FchXX/9kaO
	lpQ64G8JfficDyje2YRX4CLWVZETJK2PJeCFoiFKnh9PuCy4mBf3IVNFl6I8uU5N
	EJS599ZbGC9DLLVREbkRwF3iTh1HHkOp2U3bgtwrHFpf+2qHcIobReaoPmoT+DHq
	T+gK7QUvZtODyqYC9FTHLICYex/++NssqWytFZuwIHc82t0SU2p7H5Rw3X56Y1Cp
	/AE8bT6b4gUk5L11+HSlbQLCpUo5jsyrS+qQEwDRHV27W6z7ZU2iONDdk1ZH32Ix
	BpjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657635618; x=1657722018; bh=Xt6EkqSBpagSt
	0PeKLrWC3rRH7JPJrLdwqCakjpQ97c=; b=WCq/Gi7ojQ7rmgmhwIs3xVnMB6iIZ
	3R2M4rEjnmZKg3tAjsRPGXBzcjfZIr2iicPZCx/YqaYVQ4nAdPdij0+nT4UsP4+f
	q9PWP72Flna0zRhC/HoKCvR1tx0ftF07qqsuRXvgD1MU3I+uAPM60BxYmZ7kntch
	dF9PQxT/vKoIKeLzSLpYe/BgLHT/YuCWfy1ObhTDcXrpYASu+6zkfTxQ8NjTrKDD
	/6euYgZSSt9I6SEjAN713mhVFyyY7DtERMelnfN3oRhkNvg4KYyBg6fqM7GmpMSQ
	WkYsZl+LSzL7qdPTl+z/m5BvIs0XfsjoOSbspMH+UsOp86IsvXvsIh1mQ==
X-ME-Sender: <xms:IoPNYr1V3OLMq2ri3B0FueWvjWYY8j3Y_59atcPZoaDkocpK68K7aA>
    <xme:IoPNYqFrCsVGq-AvW7Jhg8uBYh_ovwV19z9hOWkJnSmhCKxxyWxLB79_SfeIalRgm
    H0R2QzIIhwKEU1p7w0>
X-ME-Received: 
 <xmr:IoPNYr7R7g-RwvrkT0BhzjoCcufPBnXrlqLfKLgNgxbkq_ydOL700JV8bVWAJyE8BOsQZSxE7f552PlWf-aHdM5wpNO7eoAT91Gtd-ue9z01iv9TAP7m2dck>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjefhvefhgefgffejgeelke
    ejleeiffejgffgkeeggfffgfffieeffeeghefhtdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:IoPNYg1uK73upnEV_qa7WF2WzICRdu55f7r_z0hzOGWvFBRaOyBQLg>
    <xmx:IoPNYuFNnYZIn-8BhgaAxaLfm_Ik8pfY-oXgQtz5OGsWtA_3PBTQCg>
    <xmx:IoPNYh_rRA-h_oMCkZG96mI6ZiPEfu1vp7e8C106GNQ-6PWKNcLB5g>
    <xmx:IoPNYgNOK3JyEQ8asRplUv5Ful7Yk160fdpdsgj3MfXX0VhW-wDj4w>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Jul 2022 10:20:17 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH v2 2/4] podman: Silence docker
 emulation warnings
Date: Tue, 12 Jul 2022 16:19:59 +0200
Message-Id: <20220712142001.881461-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712142001.881461-1-andrei@gherzan.com>
References: <20220712142001.881461-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Jul 2022 14:20:29 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7446

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Podman can run in via a docker symlink emulating docker commands. By
default this generates a runtime warning. This change silences it via
the provided interface.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-containers/podman/podman_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 727a298..4693bd6 100644
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


