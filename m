Return-Path: <felix@piedallu.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED906EC1110
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 16:36:16 +0000 (UTC)
Received: from 1.mo580.mail-out.ovh.net (1.mo580.mail-out.ovh.net [178.33.252.199])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39343.1771864573430740220
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 08:36:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@piedallu.me header.s=mailkey header.b=efIfz9pk;
 spf=softfail (domain: piedallu.me, ip: 178.33.252.199, mailfrom: felix@piedallu.me)
Received: from mxplan8.mail.ovh.net (unknown [10.109.249.37])
	by mo580.mail-out.ovh.net (Postfix) with ESMTPS id 4fKRLg28QRz5vl6;
	Mon, 23 Feb 2026 16:36:11 +0000 (UTC)
Received: from piedallu.me (37.59.142.103) by mxplan8.mail.ovh.net
 (172.16.2.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Mon, 23 Feb
 2026 17:36:10 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-103G005fbfdb7a5-b7db-403a-a275-f3abee55dd81,
                    2C24A2C219CBC5CDE540945932125BCC2609A321) smtp.auth=postmaster@piedallu.me
X-OVh-ClientIp: 82.66.229.222
Received: from [127.0.1.1] (92-184-100-178.mobile.fr.orangecustomers.net [92.184.100.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by piedallu.me (Postfix) with ESMTPSA id 60D5B16A068C;
	Mon, 23 Feb 2026 17:36:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=piedallu.me;
	s=mailkey; t=1771864566;
	bh=BGnuL4ZFg1manOUFkH95nt/aN/OGb/i6pslKS+kTmUI=;
	h=From:Subject:Date:To:Cc;
	b=efIfz9pkmYJA3XiwdBoxTprZRVBmEfook6fN6AIS8xlUr+mihtP83Bz7aGQhWuIl2
	 pC16fLS66FGaUzW1WUvTQqv4rLYGtdM1zydXO09xZBkxCQpPuw4IIX+vppfGmo7SEX
	 RsZ1CImLHIa+nEvcHgF2ryNwIPEdwS4jNHdbynyw=
From: felix@piedallu.me
Subject: [PATCH v2 0/4] Update docker-moby to v25.0.9
Date: Mon, 23 Feb 2026 17:35:54 +0100
Message-ID: <20260223-upstream-update-docker-moby-v2-0-5bc0d679d988@non.se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-B4-Tracking: v=1; b=H4sIAOqBnGkC/53OQQ7CIBAF0KsY1tIArVBdeQ/TBcwMSkxLA7WxM
 b276Mpl427+X7w/L5YpBcrstHuxRHPIIQ4lqP2Owc0OV+IBS2ZKKC2U1Pwx5imR7cuBdiKOEe6
 UeB/dwlG0SqM7HKV2rAhjIh+eX/3SlXwLeYpp+Y7N8tNuc2fJBa+NbagGK0Cr8xCHKlMFsf/sb
 EcQTKPQ+lY17m/EGCld6x0I+P+TFhHg4Iz3uv5FunVd35XzjdiWAQAA
To: meta-virtualization@lists.yoctoproject.org
Cc: =?utf-8?q?F=C3=A9lix_Pi=C3=A9dallu?= <felix.piedallu@non.se.com>, 
 pascal.eberhard@se.com
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771864566; l=1400;
 i=felix.piedallu@non.se.com; s=20250606; h=from:subject:message-id;
 bh=BGnuL4ZFg1manOUFkH95nt/aN/OGb/i6pslKS+kTmUI=;
 b=wnpSPBC5wtkqS01alTO3E/KRT4ObkwDCWyCgW6mreFMwXV3jkovkHUzm6KavAOOiDnZWS22n7
 c/AJvnsMjA4B3nrdGpnFYKdMApmn8bZFRq0OXvjMsg9ZU/NbViBYxI/
X-Developer-Key: i=felix.piedallu@non.se.com; a=ed25519;
 pk=Xe1dw6DIV7hmFbzuJfvaioG+S30kGix0QpIi5qPg99w=
X-MailScanner-ID: 60D5B16A068C.A32C1
X-MailScanner: Found to be clean
X-MailScanner-From: felix@piedallu.me
X-Ovh-Tracer-GUID: dd38060f-cd7f-40f5-b0f0-616158cb68dd
X-Ovh-Tracer-Id: 9365798375458769117
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEMH/9ghXO7nmdwQupi7edFiiaPCK6JzD4sYGHPwpWRdkTEdebIJo4tMhcOSJ9xT6GZWWcL3l0cS3DyV4314H8BKPLY0qKy3w6VS0yXdYZvaPIqH+Gyb36iXcKh1QkEhRTDSOtGYjVksdJ3Ciy6jVI9xVVsrvvZXUwxXDKu3l/K2KgKFw61497L+0BLBX/8eNtmRIpv99fGW7ogyE2VRiG/3x3/BVFCf0Q6sNum5/GzaRz+/duQEVJELDxUviXGPcC7mYRHXDMyfl/jFHXGYGqxaGlss7ustvTjweU4LlMKTXtZARTUl6knJl3PSMxo7HYNdfyC6Sm+VutOos/5Q5bCjLTCiWMdjb7eoZFfCQ+iU9VV/gTO1UQ8ApseL9tzipmVsrktDaaSyPf4BVlKQfvgiq1J8H4lsDyb3k4MF2P6pfl2dClvrZFDN4AXDrPCQozAdHQYACUtv5odI/nMTIeEc8VIVPd90m9BXQwflqnwHlChFCt/JD6xpnpCwQl9amoa3dOljRA5lP4ZjBUwwqxFvv2EBXIU3axdyao35Wo54OMUasrgyDI4qn5TKzya9D8fjUDm3PqQH2rxos6OugecAx2DHLPMficB0K4zs4EmVaSW+ST5+TCBypLgGxybXfBuSLYvxaCv5CKPN8BHDEfGzHIZhplza9P4bQ85PCNe/Q
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Feb 2026 16:36:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9606

This patch suite updates docker-moby to version v25.0.9 and
removes the patches that were backported upstream for this release.

Note: This is not the latest release of the v25.0 branch but the
latest supporting Go 1.22, provided in oe-core scarthgap.
Updating to newer releases will require updating go to 1.23.

Signed-off-by: F=C3=A9lix Pi=C3=A9dallu <felix.piedallu@non.se.com>
---
Changes in v2:
- Revert ec01a803 adding CVE patches backported upstream
- Link to v1: https://lists.yoctoproject.org/g/meta-virtualization/messag=
e/9591

---
F=C3=A9lix Pi=C3=A9dallu (4):
      Revert "docker-moby: Security fix for CVE-2024-41110"
      docker-moby: Update libnetwork
      docker-moby: Update docker cli
      docker-moby: Update to v25.0.9

 recipes-containers/docker/docker-moby_git.bb       |  13 +-
 .../docker/files/CVE-2024-29018.patch              | 344 ---------------=
------
 .../docker/files/CVE-2024-36620.patch              |  39 ---
 .../docker/files/CVE-2024-36621.patch              |  82 -----
 .../docker/files/CVE-2024-41110_1.patch            | 177 -----------
 .../docker/files/CVE-2024-41110_2.patch            |  99 ------
 6 files changed, 4 insertions(+), 750 deletions(-)
---
base-commit: 78abd77b8695705e6e55266745c838bb665486de
change-id: 20260216-upstream-update-docker-moby-d0826db5916b

Best regards,
--=20
F=C3=A9lix Pi=C3=A9dallu <felix.piedallu@non.se.com>


