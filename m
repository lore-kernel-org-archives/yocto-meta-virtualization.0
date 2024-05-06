Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C32C25B5C
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 08:28:23 +0000 (UTC)
Received: from qs51p00im-qukt01072701.me.com (qs51p00im-qukt01072701.me.com [17.57.155.16])
 by mx.groups.io with SMTP id smtpd.web10.15963.1714984101569566833
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 May 2024 01:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=OrOxXfXA;
 spf=pass (domain: subset.ch, ip: 17.57.155.16, mailfrom: patrick.wicki@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1714984100; bh=CGvIFNfOaLiKG+mWo4D+Sk0kQ976KtZLKJAMggvfI4k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=OrOxXfXA/NXm5NWfc7UqBLEw6Pu7F2Lb5qHO//5JnrZnnotM9YpFyDbpuqQuj+hJB
	 57iI7m3rF04g1Kdns6XKuD4+4jnSszwgg/x30Zsum4MXybPft30pxZhTeZKaoL9VtQ
	 LAdE1EpytC5I0ydAo6NLqA8JDr5HPn9a7wLxU0Z/t/AAejVVevdgY1Wiq2TOwB2wni
	 qcdUJU2Q4EIJa30jcwRgACjra8WLojJjgymVUWQasS7yaUxqt5g3pE4Yiz45k+leCh
	 ayuiMBm1YGCBOHLzdH95SemrDPHln5MIVtyL3SXBxQVnnCyhKoYj7xgliRqQw3CCCt
	 CGt3X04ryH7IA==
Received: from localhost.localdomain (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01072701.me.com (Postfix) with ESMTPSA id B7D1A15C01C6;
	Mon,  6 May 2024 08:28:19 +0000 (UTC)
From: patrick.wicki@subset.ch
To: meta-virtualization@lists.yoctoproject.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-virtualization][PATCH v2 1/2] podman: remove skopeo rdepends
Date: Mon,  6 May 2024 10:28:05 +0200
Message-ID: <20240506082806.292832-1-patrick.wicki@subset.ch>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: x9tXUVw_WMOYxdG-Zq-5ZEYKaRW6qXmP
X-Proofpoint-GUID: x9tXUVw_WMOYxdG-Zq-5ZEYKaRW6qXmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_04,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=847 adultscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2405060056
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 May 2024 08:28:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8716

From: Patrick Wicki <patrick.wicki@siemens.com>

Podman does not require skopeo to run. They are both independent tools.
In distros like Debian, Fedora and Arch they don't depend on it either.
Skopeo also seems to be used in some of podman's tests, so it makes
sense to keep it around for the ptest.

We do require skopeo's libdevmapper dependency, so include that
directly. And inherit container-host to make sure the container configs
are present on the device.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 recipes-containers/podman/podman_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers=
/podman/podman_git.bb
index 32de3f0c..07c17449 100644
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
@@ -149,7 +150,7 @@ VIRTUAL-RUNTIME_base-utils-nsenter ?=3D "util-linux-n=
senter"
 COMPATIBLE_HOST =3D "^(?!mips).*"
=20
 RDEPENDS:${PN} +=3D "\
-	conmon ${VIRTUAL-RUNTIME_container_runtime} iptables ${VIRTUAL-RUNTIME_=
container_networking} skopeo ${VIRTUAL-RUNTIME_base-utils-nsenter} \
+	conmon ${VIRTUAL-RUNTIME_container_runtime} iptables libdevmapper ${VIR=
TUAL-RUNTIME_container_networking} ${VIRTUAL-RUNTIME_base-utils-nsenter} =
\
 	${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'fuse-overlayfs slirp=
4netns', '', d)} \
 "
 RRECOMMENDS:${PN} +=3D "slirp4netns \
@@ -172,5 +173,6 @@ RDEPENDS:${PN}-ptest +=3D " \
 	gnupg \
 	jq \
 	make \
+	skopeo \
 	tar \
 "
--=20
2.45.0


