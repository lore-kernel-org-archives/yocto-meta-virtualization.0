Return-Path: <felix@piedallu.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C906AEC110A
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 16:36:16 +0000 (UTC)
Received: from 9.mo579.mail-out.ovh.net (9.mo579.mail-out.ovh.net [46.105.58.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39344.1771864573472326757
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 08:36:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@piedallu.me header.s=mailkey header.b=dM7mVFRA;
 spf=softfail (domain: piedallu.me, ip: 46.105.58.100, mailfrom: felix@piedallu.me)
Received: from mxplan8.mail.ovh.net (unknown [10.109.249.146])
	by mo579.mail-out.ovh.net (Postfix) with ESMTPS id 4fKRLg1tbMz5vsq;
	Mon, 23 Feb 2026 16:36:10 +0000 (UTC)
Received: from piedallu.me (37.59.142.105) by mxplan8.mail.ovh.net
 (172.16.2.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Mon, 23 Feb
 2026 17:36:10 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-105G00651c303f6-1cac-455d-9e83-b75d6a69ab96,
                    2C24A2C219CBC5CDE540945932125BCC2609A321) smtp.auth=postmaster@piedallu.me
X-OVh-ClientIp: 82.66.229.222
Received: from [127.0.1.1] (92-184-100-178.mobile.fr.orangecustomers.net [92.184.100.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by piedallu.me (Postfix) with ESMTPSA id 1236A16A068E;
	Mon, 23 Feb 2026 17:36:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=piedallu.me;
	s=mailkey; t=1771864567;
	bh=HQQEcnFeR1oiwf3PnV/D7h2sNZWrMhbYJItY/xFrFMs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dM7mVFRA4nrPUJSwQY75cPb7bzZheseenXv9kdHnQXxH3KZ429NQOxq855njY/YVV
	 qfWTI+0vLnM8Tb+WKfF4+u5dQWBk6J70800FZGnNff48QSftq6yW5UaBmP/XoBWonW
	 868j8ewwdFhXbEA0O/j2W0lMT3ZC01pZCOalvu+w=
From: felix@piedallu.me
Date: Mon, 23 Feb 2026 17:35:56 +0100
Subject: [PATCH v2 2/4] docker-moby: Update libnetwork
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-ID: <20260223-upstream-update-docker-moby-v2-2-5bc0d679d988@non.se.com>
References: <20260223-upstream-update-docker-moby-v2-0-5bc0d679d988@non.se.com>
In-Reply-To: <20260223-upstream-update-docker-moby-v2-0-5bc0d679d988@non.se.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: =?utf-8?q?F=C3=A9lix_Pi=C3=A9dallu?= <felix.piedallu@non.se.com>, 
 pascal.eberhard@se.com
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771864566; l=1006;
 i=felix.piedallu@non.se.com; s=20250606; h=from:subject:message-id;
 bh=fFJSKe+51uTj5O2EczP7H20qq4lcu9A/4KR29H4hSRU=;
 b=9DL5PKdl/VcLMv5uKgWgId+n39zKYlsw4VgjQxfDo7Z31T0PSl2wQ9mZaKpT5jeSMETCl8EIW
 4cCnWc1VHsKBLYCMDoMlbGo275TFViiQ//qRFZMNLm+91zdYpksMzGv
X-Developer-Key: i=felix.piedallu@non.se.com; a=ed25519;
 pk=Xe1dw6DIV7hmFbzuJfvaioG+S30kGix0QpIi5qPg99w=
X-MailScanner-ID: 1236A16A068E.A2E21
X-MailScanner: Found to be clean
X-MailScanner-From: felix@piedallu.me
X-Ovh-Tracer-GUID: 2e6ed826-3ec9-4149-ad0b-05a0d1cacb9f
X-Ovh-Tracer-Id: 9365798375986989277
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFDLHIMx44YIKqaHQAqdb+E6BVamVRdkRNYn2U99YzmANfmLTO9M/T7YXq3ekKu9/A/bvVXcw6vw/zwQTbF7rvXHulRL143TYq6sYTu7faWSDCRHiI01KSX7jA03KPuH3A1q1bIxB/esU/qLGjRr/Fc0bNMZVPypZmPsoJ7vVDHsQ6oDbblM3/Y2O3wH4CWEhFAEGcfbFXXvQRLW1rXC3Y71kX4XQJHJq/IlLxD+WbLu4JtYinA7JKRDkgfz3aLarqgTgYTGMe2UW5/EilDkej+Wgm3xAFLE4Mm04rn+FgtVCdfZ1uQR2PSnoeYjeg97CHNNLaDguhy5psIqqvfmyipr/6BqQocvLIiZ1dDuqfD4oP46NlzRvgiBD0VkiBTGzbA4xK70XBR3aNgfVhWgKkvQeBjst6Pd3jIyNuRTePfUATidgvZ9AkFPUyqu2PX4mxmcw1CmY4/fVDAE2F1rZy13nzfg9In33JUGL7ZcllK4WunOt6/I+oOeyqfEQcBAaRjcVbhCAiSOy45CYnfy3kHFyw3IG19c7u6z0+ng1oL9gMrWbSRlOUocRTh0ymtAdjcwvIrPLVm7AAi9z3kZWoAb/cHWOGT+gClu+CZ5litT+5ZQnQ6YN3fY/JYIDahnKpjCIHt4/T5CMZ25ebNwwUCfPFYkuAy6xbcwoO3YsLWGw
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Feb 2026 16:36:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9605

From: F=C3=A9lix Pi=C3=A9dallu <felix.piedallu@non.se.com>

Bumping libnetwork to version v0.7.0-dev.3-1876-g3797618f, which comprise=
s the following commits:

    9a98d9c9 libnetwork: processEndpointDelete: Fix deadlock between getS=
vcRecords and processEndpointDelete

Signed-off-by: F=C3=A9lix Pi=C3=A9dallu <felix.piedallu@non.se.com>
---
 recipes-containers/docker/docker-moby_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-conta=
iners/docker/docker-moby_git.bb
index 1331930e..216353bd 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -45,7 +45,7 @@ DESCRIPTION =3D "Linux container runtime \
 #
=20
 SRCREV_moby =3D "f417435e5f6216828dec57958c490c4f8bae4f98"
-SRCREV_libnetwork =3D "67e0588f1ddfaf2faf4c8cae8b7ea2876434d91c"
+SRCREV_libnetwork =3D "3797618f9a38372e8107d8c06f6ae199e1133ae8"
 SRCREV_cli =3D "01f933261885c0126edb3f47fd56d048ae31265a"
 SRCREV_FORMAT =3D "moby_libnetwork"
 SRC_URI =3D "\

--=20
2.52.0


