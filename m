Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D55C4345F
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 08:28:23 +0000 (UTC)
Received: from qs51p00im-qukt01072701.me.com (qs51p00im-qukt01072701.me.com [17.57.155.16])
 by mx.groups.io with SMTP id smtpd.web11.15851.1714984102387677147
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 May 2024 01:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=p3xta1cj;
 spf=pass (domain: subset.ch, ip: 17.57.155.16, mailfrom: patrick.wicki@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1714984101; bh=D4WbAuy9jcPKpf7MmMcTNk7ztItIfMfNdkHXV15LwmA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=p3xta1cjt8ZO5v7xzb1/UP8z0A2RaQB12zmftjUQf/nk2rIg4+8gpWB651K+4n9J4
	 XVE6DfzGQSsjSUCsaYSLBQpO2A/3dfa7KQxOd0XUlX1th+OO+ZfvxO2jGMji4+T7NK
	 EDZvcWqjj0/rc3pl5b1yVOFj+Qwa+ZiF0dDNiS5TJaVa8Sjq+9j4TRhWlBOf9HXk0Y
	 g8qCfDrRSfsFgm1AZa77EoLx32uwIdrsK07T7Oy0DSIWVeDwjzyOVE+IY5NNZZNqTC
	 l6PB7k0DgnYgThbsjd8H4SWfrBKlVhLhIdPk2xVBOO00bibT+dFep8CkM9muDXgEEp
	 cWYoQ5wCJsdiA==
Received: from localhost.localdomain (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01072701.me.com (Postfix) with ESMTPSA id D4EE715C013A;
	Mon,  6 May 2024 08:28:20 +0000 (UTC)
From: patrick.wicki@subset.ch
To: meta-virtualization@lists.yoctoproject.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-virtualization][PATCH v2 2/2] podman: require catatonit
Date: Mon,  6 May 2024 10:28:06 +0200
Message-ID: <20240506082806.292832-2-patrick.wicki@subset.ch>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240506082806.292832-1-patrick.wicki@subset.ch>
References: <20240506082806.292832-1-patrick.wicki@subset.ch>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: HlemrwG1b6eNHofzRblU3aij5a1glJac
X-Proofpoint-GUID: HlemrwG1b6eNHofzRblU3aij5a1glJac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_04,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=820 adultscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2405060056
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 May 2024 08:28:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8717

From: Patrick Wicki <patrick.wicki@siemens.com>

Alternatively, we could add it to RRECOMMENDS. But I would say, given
its name, managing pods is part of podman's core functionality and that
requires catatonit, which is currently only pulled in for the ptest:

root@qemux86-64:~# podman pod create
Error: building local pause image: finding pause binary: exec: "catatonit=
": executable file not found in $PATH

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 recipes-containers/podman/podman_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers=
/podman/podman_git.bb
index 07c17449..cba685c0 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -150,7 +150,7 @@ VIRTUAL-RUNTIME_base-utils-nsenter ?=3D "util-linux-n=
senter"
 COMPATIBLE_HOST =3D "^(?!mips).*"
=20
 RDEPENDS:${PN} +=3D "\
-	conmon ${VIRTUAL-RUNTIME_container_runtime} iptables libdevmapper ${VIR=
TUAL-RUNTIME_container_networking} ${VIRTUAL-RUNTIME_base-utils-nsenter} =
\
+	catatonit conmon ${VIRTUAL-RUNTIME_container_runtime} iptables libdevma=
pper ${VIRTUAL-RUNTIME_container_networking} ${VIRTUAL-RUNTIME_base-utils=
-nsenter} \
 	${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'fuse-overlayfs slirp=
4netns', '', d)} \
 "
 RRECOMMENDS:${PN} +=3D "slirp4netns \
@@ -167,7 +167,6 @@ RDEPENDS:${PN}-ptest +=3D " \
 	bash \
 	bats \
 	buildah \
-	catatonit \
 	coreutils \
 	file \
 	gnupg \
--=20
2.45.0


