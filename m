Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169D1C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 17:26:00 +0000 (UTC)
Received: from st43p00im-ztdg10073201.me.com (st43p00im-ztdg10073201.me.com [17.58.63.177])
 by mx.groups.io with SMTP id smtpd.web11.27614.1714411549938745157
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 10:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=AEUIJ1hs;
 spf=pass (domain: subset.ch, ip: 17.58.63.177, mailfrom: patrick.wicki@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1714411549; bh=tLdqI3KgNQwkciZ9GQAyEbS7xNS/NSXOtw4zprd0+3M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=AEUIJ1hsigIFruaPHpHR66rndcsH8zbzvp9M/2etRTPJNb4eMv+x91W7kVuc2zM1l
	 gqy4YchHGwmBFOJRQfY6+0RILtdppFefUH/v5rUDz8kCXUe2QkJAXzMx3EdI/3Zcpw
	 xXR0XDYOr4tK2UohqY4rz1yG6LgeLyGWZT+rIcKJcqgIMXN9t5SNMqh1mmuVsWTa6t
	 vTALELeADRuBjc+xt+W7RUh7R6Cp2Wzm6i4sT8Y/IBrRUJ9NB4QvMEgRZbdbPU4j96
	 EeYM0S+5oTUDAPx9BspPnvK3zmbbIAgAXNZQSsm6EFG1WxqbJvJMENfVB1MA6uWvtO
	 FN1P7+MnWf6tg==
Received: from localhost.localdomain (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
	by st43p00im-ztdg10073201.me.com (Postfix) with ESMTPSA id 7D9CE9C03DB;
	Mon, 29 Apr 2024 17:25:47 +0000 (UTC)
From: patrick.wicki@subset.ch
To: meta-virtualization@lists.yoctoproject.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-virtualization][PATCH 2/2] podman: require catatonit
Date: Mon, 29 Apr 2024 19:25:23 +0200
Message-ID: <20240429172523.1635019-2-patrick.wicki@subset.ch>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429172523.1635019-1-patrick.wicki@subset.ch>
References: <20240429172523.1635019-1-patrick.wicki@subset.ch>
MIME-Version: 1.0
X-Proofpoint-GUID: DGv3_rgHLW4gtryPZnfKTu72qiWRiMKI
X-Proofpoint-ORIG-GUID: DGv3_rgHLW4gtryPZnfKTu72qiWRiMKI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_15,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 mlxlogscore=802 clxscore=1030 phishscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2404290113
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Apr 2024 17:26:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8705

From: Patrick Wicki <patrick.wicki@siemens.com>

Alternatively, we could add it to RRECOMMENDS. But I would say, given
its name, managing pods is part of podman's core functionality and that
requires catatonit, which is currently only pulled in for the ptest:

root@qemux86-64:~# podman pod create
Error: building local pause image: finding pause binary: exec: "catatonit=
": executable file not found in $PATH

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 recipes-containers/podman/podman_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers=
/podman/podman_git.bb
index 41f090f0..7bdefba5 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -150,6 +150,7 @@ VIRTUAL-RUNTIME_base-utils-nsenter ?=3D "util-linux-n=
senter"
 COMPATIBLE_HOST =3D "^(?!mips).*"
=20
 RDEPENDS:${PN} +=3D " \
+	catatonit \
 	conmon \
 	iptables \
 	libdevmapper \
@@ -172,7 +173,6 @@ RDEPENDS:${PN}-ptest +=3D " \
 	bash \
 	bats \
 	buildah \
-	catatonit \
 	coreutils \
 	file \
 	gnupg \
--=20
2.44.0


