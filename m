Return-Path: <felix@piedallu.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE0CE63F36
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 17:17:04 +0000 (UTC)
Received: from 7.mo580.mail-out.ovh.net (7.mo580.mail-out.ovh.net [46.105.48.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24875.1771262223675963136
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 09:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@piedallu.me header.s=mailkey header.b=Kv95NEXL;
 spf=softfail (domain: piedallu.me, ip: 46.105.48.3, mailfrom: felix@piedallu.me)
Received: from mxplan8.mail.ovh.net (unknown [10.110.43.66])
	by mo580.mail-out.ovh.net (Postfix) with ESMTPS id 4fF8b14CHDz5vvx;
	Mon, 16 Feb 2026 17:17:01 +0000 (UTC)
Received: from piedallu.me (37.59.142.96) by mxplan8.mail.ovh.net
 (172.16.2.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Mon, 16 Feb
 2026 18:17:01 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-96R001cbde11f5-ea9a-4bed-aca8-eed1f70a05ed,
                    56406BC51C322441719EFB98626FE52A09BB5D07) smtp.auth=postmaster@piedallu.me
X-OVh-ClientIp: 176.170.95.144
Received: from [127.0.1.1] (92-184-102-168.mobile.fr.orangecustomers.net [92.184.102.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by piedallu.me (Postfix) with ESMTPSA id 9ACEA16A068D;
	Mon, 16 Feb 2026 18:16:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=piedallu.me;
	s=mailkey; t=1771262215;
	bh=HQQEcnFeR1oiwf3PnV/D7h2sNZWrMhbYJItY/xFrFMs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Kv95NEXL5RzPCbZZjiq5fvThqa5vlr1M/Z3L+AK2bq1cIFdbCMuk8VtvUd0upQ5st
	 Pa1JqwWT8DQSRaUr2J2adNUinANH65M8A/2Oa3ZRGBTGi1XZZd6StzuqokoK4SOiyj
	 4beWA7dGRCZ5NPsTx8zvmCDyTvGSJa5e70AR3Exk=
From: felix@piedallu.me
Date: Mon, 16 Feb 2026 18:16:43 +0100
Subject: [PATCH 1/3] docker-moby: Update libnetwork
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-ID: <20260216-upstream-update-docker-moby-v1-1-8ddcc5b7ff63@non.se.com>
References: <20260216-upstream-update-docker-moby-v1-0-8ddcc5b7ff63@non.se.com>
In-Reply-To: <20260216-upstream-update-docker-moby-v1-0-8ddcc5b7ff63@non.se.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: =?utf-8?q?F=C3=A9lix_Pi=C3=A9dallu?= <felix.piedallu@non.se.com>, 
 pascal.eberhard@se.com
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771262214; l=1006;
 i=felix.piedallu@non.se.com; s=20250606; h=from:subject:message-id;
 bh=fFJSKe+51uTj5O2EczP7H20qq4lcu9A/4KR29H4hSRU=;
 b=NGtu+qxiy0opy3KQovq9nosDNKAHkd/7WWku4UsrLwBototBBtOjbRLY+nGXheQw5EUZdnjrz
 MQXIMxR9iSmDp39TCh151yOKJm+iQ7O+rx28zZ0VeQRhGAUUPRtSsTA
X-Developer-Key: i=felix.piedallu@non.se.com; a=ed25519;
 pk=Xe1dw6DIV7hmFbzuJfvaioG+S30kGix0QpIi5qPg99w=
X-MailScanner-ID: 9ACEA16A068D.A22FA
X-MailScanner: Found to be clean
X-MailScanner-From: felix@piedallu.me
X-Ovh-Tracer-GUID: 7dbb8d91-e9cb-4e0c-be27-0d45707ff7cd
X-Ovh-Tracer-Id: 5840324294150555869
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGqg3dNKtsHeqEE4nSbpnFNNgjx6Xe9eW4zTDzwkZwiH/89FZ5SY5M5pOFqR+DNydPHZr5J1Sgyzmn27v3GUWFI86X19/VhGcaoPGXhZDJ5Pmz2dyCyIWpftfbRU7Hgp7/H4VCqTZwMhAFKK1wRBwxAEJxhlhywKjIdEqvz/xSocYFKcPZD737SCx9nst5xPmQ5j/volzQmgY+yawdkSVkptIpmhmP3KEvxm0XLJCpPO58gLN+XGlNAt0VGfal4B/TyaxLC+WvNBFFJYrLlugIcQY9rH0USlOxoH1GZgbm2xG+rcsmRwPbqgctFr1i3JkIz3w23KpU9wIO4eAVXXZE2XbvcwHlAAJxN9wWWw4PNd+1oSv38pxUlDYVXlBsvvTHLr1Ssuyng/AxeOihl6BNokZ+vzRnL6HdGz8IzJZMMOH9CYmUbVHokCdzewUsD/bs+0wmN38I2iV5aOA/O/XSm+0fUkWGFeKnSGNtq9FwAEWCeqX/WguBC+vZSkNRGfb/URePrXVI4oiK45cxjmUXyCnZ0nJK0fRjA3zu7oHZ0WxoPGX1zw7fhQp0lv+PiphlrhzlHN9OTEhuP+UscJ6GIOCs50zJccjk7U3kF0dFRQCyB1RHPZsjwRsjvJQ9kSH5coxxa5XwLJbfzmPMd0LvbbvQiRCyjTL7wjYnS4al8jA
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Feb 2026 17:17:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9594

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


