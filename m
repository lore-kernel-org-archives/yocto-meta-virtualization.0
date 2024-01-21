Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA55BC47422
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 18:22:54 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web10.53541.1705861368295299165
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 21 Jan 2024 10:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm3 header.b=yrkkGmS8;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=PshJ8fS2;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.28, mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 9F7D85C005F;
	Sun, 21 Jan 2024 13:22:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 21 Jan 2024 13:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1705861367; x=1705947767; bh=7BqE6khaCEyZu0SZjZbi6
	GjcUnZkcXHP8yVbRZx2Yqc=; b=yrkkGmS8CmE4WuAgxdbmyUOrbsohLxT1thEHQ
	TvdRic86m4pzvbm1TZ9jBwDhXBKvzmiBqr3fB+iBN2vViLSvb0Qk0UHmQ3IF221n
	FKPGWm74R6RrZUI8JSbojJEcsZfr5J5wSq6X63Z5JFqgrT858AwpvmkFRPzTEDSE
	z/x1bbfXa28CtX4+SYOX4GXkUPBsGNMcULohPtVZP/a7sQ4qwBNbCIy/gxGgZ32t
	d9DBSGs8nijMPem80ttK6sv3Kral5EEfGai8NZXhoA+zCdd1Xfr99Ed7iimpqeiy
	qeF66AQAkZiGROjK/MNNxWIECwh8k5zipHoUhg5X1uqUpoZ+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705861367; x=1705947767; bh=7BqE6khaCEyZu0SZjZbi6GjcUnZk
	cXHP8yVbRZx2Yqc=; b=PshJ8fS28TEW4a2DGMZnSiwk4aMApnsmkQlg8209Ma7i
	ZLGZ4m8dtB/2kjwUKv6hBJB10DPfisIHpTxjwclNXXakb/7rPe9vQEwdnWvMirY4
	BZPGeiQR7rkqBJuYit1NJoScMgnzLsJjZke3ETu00dh+E9eTMhV9ZwoPaBstDfrv
	OqxLg2Pth7U63EVdb2p08OfByh/G/3cUemJ3C5gANn+nAguGg1POZKlB6RnK5SM/
	FEV+p08wZ+W1pmen8CXel1vc1IqbigtkEtsAKH/4TpnER83kUhWA0WHMIli7YtIM
	v2umFG0UhI526RKZTH9o+QS885Vtj3LOig42kGyHxQ==
X-ME-Sender: <xms:92CtZbdYIExf6EoYxgUlbDXcMM3h_21i92D3YeEdWeu4OcsWylGFiA>
    <xme:92CtZRNMJDycNTS5LYd2Bg-R5VAXtFcyzpyCX-XoyuzJEw63GC0YSU-3M2s6KPWQ3
    l1Xiifr4HjjODEMJ-M>
X-ME-Received: <xmr:92CtZUjOscpC8s3LvpPUCLZEGsbcZ2NFuhH0Q7_-QIP_dYbtFkQrhVfhC5bSeyje5p_PZ69fadoeIpCicB2YQYss>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekgedgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhk
    ohhffhdrnhgvtheqnecuggftrfgrthhtvghrnheptdevteekjeduudehhfdthfethfdvff
    ehlefftdffieelfeduleeiueffvdfftdeinecuffhomhgrihhnpehgihhthhhusgdrtgho
    mhenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehprg
    hvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:92CtZc_wTOwkw8vwPrHyOoFwhe3XplUFbXT0QBfrkxYWYLeql3BPJA>
    <xmx:92CtZXtGNHrfA2ryhkZYMRNrH17e2iuoqq2NVqys486AiZLqEg6OYw>
    <xmx:92CtZbEg3yMPmTeXvBiHhgsNHb5qgmAEdq4WEVW4mGKniFIcrxSCEw>
    <xmx:92CtZV1sv0BsB4g2RE6QoxBYvS5pMcJ_01yza80eJB389MNKwHj3Sw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 21 Jan 2024 13:22:46 -0500 (EST)
From: Pavel Zhukov <pavel@zhukoff.net>
To: meta-virtualization@lists.yoctoproject.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [meta-virtualization][PATCH] python3-docker: Update to 7.0.0
Date: Sun, 21 Jan 2024 19:22:43 +0100
Message-ID: <20240121182243.631823-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 21 Jan 2024 18:22:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8549

Update package to fix compatibility fix docker from the layer.

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 .../{python3-docker_5.0.0.bb => python3-docker_7.0.0.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename recipes-devtools/python/{python3-docker_5.0.0.bb => python3-docker_7.0.0.bb} (62%)

diff --git a/recipes-devtools/python/python3-docker_5.0.0.bb b/recipes-devtools/python/python3-docker_7.0.0.bb
similarity index 62%
rename from recipes-devtools/python/python3-docker_5.0.0.bb
rename to recipes-devtools/python/python3-docker_7.0.0.bb
index 44d65b05..ada94876 100644
--- a/recipes-devtools/python/python3-docker_5.0.0.bb
+++ b/recipes-devtools/python/python3-docker_7.0.0.bb
@@ -3,10 +3,11 @@ HOMEPAGE = "https://github.com/docker/docker-py"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
 
-SRC_URI[md5sum] = "9cc5156a2ff6458a8f52114b9bbc0d7e"
-SRC_URI[sha256sum] = "3e8bc47534e0ca9331d72c32f2881bb13b93ded0bcdeab3c833fb7cf61c0a9a5"
+SRC_URI[md5sum] = "b08eeccf6a5efd11c316c08207edfeef"
+SRC_URI[sha256sum] = "323736fb92cd9418fc5e7133bc953e11a9da04f4483f828b527db553f1e7e5a3"
 
 DEPENDS += "${PYTHON_PN}-pip-native"
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
 RDEPENDS:${PN} += " \
         ${PYTHON_PN}-misc \
@@ -14,6 +15,6 @@ RDEPENDS:${PN} += " \
         ${PYTHON_PN}-docker-pycreds \
         ${PYTHON_PN}-requests \
         ${PYTHON_PN}-websocket-client \
+	${PYTHON_PN}-packaging \
 "
-
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
-- 
2.43.0


