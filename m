Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E47C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 08:54:51 +0000 (UTC)
Received: from wfhigh2-smtp.messagingengine.com (wfhigh2-smtp.messagingengine.com [64.147.123.153])
 by mx.groups.io with SMTP id smtpd.web10.3666.1718268888275487993
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Jun 2024 01:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm1 header.b=cz0nXEig;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=jXf9Gqp9;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.153, mailfrom: pavel@zhukoff.net)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id 4BCCC180012F;
	Thu, 13 Jun 2024 04:54:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 13 Jun 2024 04:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1718268886; x=1718355286; bh=9zWrIrw3lW/8YqcdbzXT5
	oWHMp/0ACN3NIhMC0ZqX+s=; b=cz0nXEig/hnroMh8R+vWEOPNBul12eJeEnwUO
	d/tuW5wdw5itFPTv0aP1SaYzNe7Y/9YC4msqH9SBJ+VZuVhgEZ0QEUj8fHhaHPu3
	UiIS3etvni0YwCaARZxHCE19LPrVWFDc0LN4rT8sVoT6f3h+NwQRtT9KEqTekhua
	IaT1E+SHnuIwwjHshlFcqJCdi/R5BW3sJpikGNtcvjENm5u1Kds+JwJhWFqsJpQR
	Sjjv7aEbdWLIzZFlZuGD/iL/szk4x7Jr1p9GIOKzNytL2tstX5ZlcLLOA6iPkwWQ
	pcObkyMGBzhZAT+KDy11P/7Y0+UlqcmCdszLFCZQihi7v8A2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718268886; x=1718355286; bh=9zWrIrw3lW/8YqcdbzXT5oWHMp/0
	ACN3NIhMC0ZqX+s=; b=jXf9Gqp9C6ocnmf6Gv/XhQGeQ/6cN7QsBxi8Lw7xbsfD
	KPMF1GWP+4d+PL4tK/Pc+odiL+afs2sx6nfZEoLy7JsyL26Wp0YqZKUjGZYNoEjM
	tuUPm43iC67Pqyxxr+VEQM7taUSCr/h40C3A2/GmhZrSwVJoXs8wRk19UKwHrGko
	rik0Oi2DJFbntpH2pJgTvvwuMa7BP12bK7Om7DK4L6cJgVeQli8lGlS8XWAWzY9X
	t2ZzKKkeRMziHEocrRhQHsoIxFDeFwYxci2EeHfHrJxttVzlWLrn3MNhzBRq/qO2
	h7b0GOfcyhyH0Hx41fTEsEOXi4tvhZqVsl8LlONdvA==
X-ME-Sender: <xms:1rNqZha_Xsg-xTmxdyrsr5h1j_DqcnfbkWhayKB-_PYHGkNJ9bY67w>
    <xme:1rNqZoY8Q_Q_CHjJPDR3TLZPN1YPcmBpVDgzdqe6jdpKbWINL_a2YYn93Ci1FYeXR
    MmUA7wQOMCZsDU7oeI>
X-ME-Received: <xmr:1rNqZj-B6V89PoE6SL2orzZnp3HUsBDN6RaG0ZoqkAQl2h4CQBjdeA6y_eE-5JYzrDFegmPsoqfE7Zjl0ef2hTgC87E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedujedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejkeejudegledtkeejhfettdefje
    euffehieekvddugfdtffffledvvdefhfenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:1rNqZvoNgq1Phd1C5aCO5G13rFagAP5CZx0rdGvDonECgbf2ZFTA8A>
    <xmx:1rNqZspTqqP1vjnrT92mUJPoj7zQI2Kr5WLKBTHkYlB9zwrGBsKZew>
    <xmx:1rNqZlTF66GcJChwjILKyF4Qy7hCqaRsd5GTE2uAXN4EpvR8x3aZ0Q>
    <xmx:1rNqZkoOuvj1LnRVUjcvJRn7rFy4jyl369mqe9-3pmiTjf3JVQoktQ>
    <xmx:1rNqZj1Q_DGWhtvfRWId_Xj0xJNr2zFLHlMF-XUzzT6dNXAOZgdga4-f>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jun 2024 04:54:45 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: meta-virtualization@lists.yoctoproject.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [meta-virtualization][RFC][PATCH] meta-virt-container.inc: Install shadow in read-only rootfs
Date: Thu, 13 Jun 2024 10:54:10 +0200
Message-ID: <20240613085409.1860824-2-pavel@zhukoff.net>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 13 Jun 2024 08:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8796

Podman requires /etc/sub[g]uid for rootless mode but the file is being deleted
if shadow is in ROOTFS_RO_UNNEEDED (even if different package like the
podman itself provides it) and rpm backend is used.

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 conf/distro/include/meta-virt-container.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/distro/include/meta-virt-container.inc b/conf/distro/include/meta-virt-container.inc
index c3ac8394..7a8a9616 100644
--- a/conf/distro/include/meta-virt-container.inc
+++ b/conf/distro/include/meta-virt-container.inc
@@ -38,3 +38,4 @@ VIRTUAL-RUNTIME_container_orchestration ??= "k3s"
 
 VIRTUAL-RUNTIME_cri ??= "virtual-containerd"
 VIRTUAL-RUNTIME_cni ??= "cni"
+ROOTFS_RO_UNNEEDED:remove = " shadow"
-- 
2.44.2


