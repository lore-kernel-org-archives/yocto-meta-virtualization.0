Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18676C04FFE
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 17:26:00 +0000 (UTC)
Received: from st43p00im-ztdg10073201.me.com (st43p00im-ztdg10073201.me.com [17.58.63.177])
 by mx.groups.io with SMTP id smtpd.web11.27613.1714411548960677697
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 10:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=XCe2b4Zx;
 spf=pass (domain: subset.ch, ip: 17.58.63.177, mailfrom: patrick.wicki@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1714411547; bh=65hHguiogGQSJPBH91VqwV0arO2RLnYruPc8d3Uqypo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=XCe2b4ZxWNYd37oOYXnHhz48MmW4FGoa68I8fyXainbo7ye7K+z1S2/oVFuq0+6fy
	 9lNVLKJ+Ypn62s8RQHzkUWgXUY//+auRiK/2MQgGDxEoUgLfIf7DnRAqtTDV++pHpb
	 0TKNExQfrN8WojUIKqz4lhJiG9ZMI+H7o6UNGVHXwb1V4hwus/9HUpMLrhl5rttzLY
	 OL3vk57pRrvicQdrO9LRtUKDFnrUp5j6LXTJ/rLyAnwwNamfV4tD00fJu2PTcB0hfK
	 RMkXCJxEWaQUAQEn66N58n8CNFCK+E7bzSwplcw7QzvT1uWysnC6Or5QaXxmhz6Ne3
	 knmZLo07lwctQ==
Received: from localhost.localdomain (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
	by st43p00im-ztdg10073201.me.com (Postfix) with ESMTPSA id 3B8AE9C0301;
	Mon, 29 Apr 2024 17:25:45 +0000 (UTC)
From: patrick.wicki@subset.ch
To: meta-virtualization@lists.yoctoproject.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-virtualization][PATCH 1/2] podman: remove skopeo rdepends
Date: Mon, 29 Apr 2024 19:25:22 +0200
Message-ID: <20240429172523.1635019-1-patrick.wicki@subset.ch>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Proofpoint-GUID: Q4ZYfaDEZ9-d1qx2HEN5YcnF5VbpQgEJ
X-Proofpoint-ORIG-GUID: Q4ZYfaDEZ9-d1qx2HEN5YcnF5VbpQgEJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_15,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1030 phishscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2404290113
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Apr 2024 17:26:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8704

From: Patrick Wicki <patrick.wicki@siemens.com>

Podman does not require skopeo to run. They are both independent tools.
In distros like Debian, Fedora and Arch they don't depend on it either.

We do require some of its dependencies, so include those directly.
Skopeo also seems to be used in some of podman's tests, so it makes
sense to keep it around for the ptest.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 recipes-containers/podman/podman_git.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers=
/podman/podman_git.bb
index f69dec16..41f090f0 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -55,6 +55,7 @@ TOOLCHAIN =3D "gcc"
 export BUILDFLAGS=3D"${GOBUILDFLAGS}"
=20
 inherit go goarch
+inherit container-host
 inherit systemd pkgconfig ptest
=20
 do_configure[noexec] =3D "1"
@@ -148,8 +149,13 @@ VIRTUAL-RUNTIME_base-utils-nsenter ?=3D "util-linux-=
nsenter"
=20
 COMPATIBLE_HOST =3D "^(?!mips).*"
=20
-RDEPENDS:${PN} +=3D "\
-	conmon ${VIRTUAL-RUNTIME_container_runtime} iptables ${VIRTUAL-RUNTIME_=
container_networking} skopeo ${VIRTUAL-RUNTIME_base-utils-nsenter} \
+RDEPENDS:${PN} +=3D " \
+	conmon \
+	iptables \
+	libdevmapper \
+	${VIRTUAL-RUNTIME_base-utils-nsenter} \
+	${VIRTUAL-RUNTIME_container_networking} \
+	${VIRTUAL-RUNTIME_container_runtime} \
 	${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'fuse-overlayfs slirp=
4netns', '', d)} \
 "
 RRECOMMENDS:${PN} +=3D "slirp4netns \
@@ -172,5 +178,6 @@ RDEPENDS:${PN}-ptest +=3D " \
 	gnupg \
 	jq \
 	make \
+	skopeo \
 	tar \
 "
--=20
2.44.0


