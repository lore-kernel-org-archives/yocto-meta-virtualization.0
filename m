Return-Path: <matt@mattfischer.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF148CD040B
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 21:29:43 +0000 (UTC)
Received: from outbound.ci.icloud.com (outbound.ci.icloud.com [57.103.91.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75748.1767648582968123711
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 13:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mattfischer.com header.s=sig1 header.b=bv8nQ17c;
 spf=pass (domain: mattfischer.com, ip: 57.103.91.23, mailfrom: matt@mattfischer.com)
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-13 (Postfix) with ESMTPS id D9782180054A;
	Mon,  5 Jan 2026 21:29:40 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mattfischer.com; s=sig1; bh=Hb8okF5H18JAbXJbYDlqBJBhpXlENBU321o0bqAJDVo=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=bv8nQ17c/crUcN6j2TzGgorTGAYVtj2uzLdi3IrhPey1J20+LMHhCuUjNVb0nFsMNbgryx5e5a0kXEravli+BP1QsOUW4whwi39wCoK2+VxrV/x0Nypf5KCA575niCMHGr96bvt1rOF3a97t8Qegkwp/wfc4xPYRjS6AdfMQMauu4oZuN2So6gW1sL5w/3WpcXxMipVvdAwi+AP1vncGbn/ZIQacSV7MVUpBOlBZ5cax13RnxW3RwW6clWHIJMea98TYOPSQQUQ4ZBneotmpiEDU47TpFILE6Mg9Qsa2Lq2TlNVPS/iCS3JW9xQynSV7xGWeHP0kLxh/NdWoc8kNUw==
mail-alias-created-date: 1360949849000
Received: from localhost.localdomain (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-13 (Postfix) with ESMTPSA id 36E341800733;
	Mon,  5 Jan 2026 21:29:40 +0000 (UTC)
From: Matt Fischer <matt@mattfischer.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Matt Fischer <matt@mattfischer.com>
Subject: [meta-virtualization][PATCH] upgrade podman to 5.7.1
Date: Mon,  5 Jan 2026 14:29:37 -0700
Message-ID: <20260105212937.23936-1-matt@mattfischer.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Proofpoint-GUID: KD7uDm5Dk2pxRh6PtSMQmDYqDBM8q0vS
X-Authority-Info: v=2.4 cv=AYm83nXG c=1 sm=1 tr=0 ts=695c2d45 cx=c_apl:c_pps
 a=2G65uMN5HjSv0sBfM2Yj2w==:117 a=2G65uMN5HjSv0sBfM2Yj2w==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7nxxn1fGAAAA:8 a=NEAV23lmAAAA:8
 a=tQZETNswaE74xU0kkcsA:9 a=nvJ6Zc2ttj52kgJnnvGM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE4NyBTYWx0ZWRfXzJhDi5fN5QWn
 sV9INm58mrhUlSKJiaqQc2TBvoFmj9SFQVCXGOSS2EP8f76xOpafUhJwPa48zSIth2BLseYUsv9
 wBAcoqmkVwbYxV/NqdHnnArkCd6coZz1LrmRVH8tRqCjt0m/rL7O5s45W3MYY/StIVe/UXhFgv/
 cMO+8sua2WjOKlRWx/wKDbHrk9niBj8d1SV/i3rpiMAji+Fyrhm0lssR7JKaA8na/sg/sGd10dG
 clxik029OXeZ7BzKHSvzjPZ1+9uNV/k/KqfhUCHtBHpy+3TRJfhwKN1FgBJ5G05oC3bd8vMs80l
 FxZ8v62zzbLKZe1+zOh
X-Proofpoint-ORIG-GUID: KD7uDm5Dk2pxRh6PtSMQmDYqDBM8q0vS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxlogscore=905 malwarescore=0 spamscore=0 mlxscore=0
 suspectscore=0 clxscore=1030 adultscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2601050187
X-JNJ: AAAAAAABqbu598xbjWfdTbPpaIcCr9gjnqqDbBfN2X6BbpyUZPXtxknLqQYm0Lu69xGBzxFPEh8mT0qlhv9Pxv2roi2byns1IfqCjGMu2alel4yNy4+pSUPfLyBJoulbXh4/RxVfPxqZU96E1kkpr6CKJDyzxjuGU2zk46TMwjWTr7vBzf54ATMxUkzdpvPm+Wfl/HHi0iCAQvDLaEsuptKxpsmT1e6JrZxo5J85W629kZfky4WKXvWjKzSk96U6jfWPgjZaAoLZ43F6IANzk8khr+LTPTdy5OURccl1hWIWEJzKmYlZKN7TZBnwuz+4QEYLYKa5NH5U75iJzC5sbGqMCP3FZ+W61io/YZlG2Kr4NRRT9YK7g3gxZUl4jt793cYqBcfgGWTiexEVf36+LPzMnvR0Yenkr6MspwlV7j67fba08aO+AwTuZ9LW4x//kwh0zpWXiJg0x4z/rr6GVua8VHAwlc9g1tLV3bHuJUlag+dBnCCTrz01Toj8OG9CHWBcKrGiSZdTQeclwtkgIVL3vcOyFEzhioqTaLlMl+2O8V5FG6TmV2cev5pxIADTd/ujeC67l8mu9ZRFGAI2DnfifHe9zHP6rkYpnWSREnpRw+ghPM6vpocV6GZxiVXe/U3s1VVDvcvOgOxS1LY=
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 05 Jan 2026 21:29:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9518

This patch updates podman to 5.7.1 which is the latest release
as of today.

Signed-off-by: Matt Fischer <matt@mattfischer.com>
---
 recipes-containers/podman/podman_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers=
/podman/podman_git.bb
index f09e01f8..0a80456d 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -16,9 +16,9 @@ DEPENDS =3D " \
     gettext-native \
 "
=20
-SRCREV =3D "3529cd312f28b0d44ad9647aa652fb4437b9bb1c"
+SRCREV =3D "f845d14e941889ba4c071f35233d09b29d363c75"
 SRC_URI =3D " \
-    git://github.com/containers/libpod.git;branch=3Dv5.6;protocol=3Dhttp=
s;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
+    git://github.com/containers/libpod.git;branch=3Dv5.7;protocol=3Dhttp=
s;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-=
rootless.conf', '', d)} \
 "
=20
@@ -27,10 +27,11 @@ LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D=
3d9b931fa23ab1cacd0087f9e2ee12
=20
 GO_IMPORT =3D "import"
=20
-PV =3D "v5.6.2"
+PV =3D "v5.7.1"
=20
 CVE_STATUS[CVE-2022-2989] =3D "fixed-version: fixed since v4.3.0"
 CVE_STATUS[CVE-2023-0778] =3D "fixed-version: fixed since v4.5.0"
+CVE_STATUS[CVE-2025-52881] =3D "fixed-version: fixed since v5.7.0"
=20
 PACKAGES =3D+ "${PN}-contrib"
=20
--=20
2.50.1 (Apple Git-155)


