Return-Path: <patrick@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB8AE7AD43
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 13:25:00 +0000 (UTC)
Received: from st43p00im-ztbu10063601.me.com (st43p00im-ztbu10063601.me.com [17.58.63.174])
 by mx.groups.io with SMTP id smtpd.web11.107790.1696339494922263243
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Oct 2023 06:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=A7JhiW4W;
 spf=pass (domain: subset.ch, ip: 17.58.63.174, mailfrom: patrick@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1696339493; bh=TtNxnPetuFPryQKKVCgFi/jgMkb9k2Sw0NNPIA4zffU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=A7JhiW4WM0PzCbus7f1a60Hsj9YjSOcBYobI/0N4IuQ9lU2VmpGQhpp1MzK+XdPI+
	 ssiPl/X0GHqP6mWAt0LD0R0XFQP4okT8jz0MhxEziDr0O8SLBEhP21Gh5UQlrduVQR
	 y+1+MBszqMHmeUz6ui0tQdf6Aouw5wUCwfPKn8+e0DUOXMM9DQPBckwcITh2X2HGLw
	 as2xRwR0jz0uYrQeXGuK1njFJ0Z7Iw52+PZUvqD3ntOwwf4TmECSe5oMjranV/sk4Y
	 QkETQWiwgO7nDQzRhimy2rwD5bMXuaUto/MjlYzULu0xOtGHNlakd93X6uE+K+4x2X
	 q5YnWwqmY0low==
Received: from thinkpad.. (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
	by st43p00im-ztbu10063601.me.com (Postfix) with ESMTPSA id E10AF8C01CC;
	Tue,  3 Oct 2023 13:24:49 +0000 (UTC)
From: patrick@subset.ch
To: meta-virtualization@lists.yoctoproject.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-virtualization][PATCH] catatonit: update to version 0.2.0
Date: Tue,  3 Oct 2023 15:24:35 +0200
Message-ID: <20231003132435.3846212-1-patrick@subset.ch>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Proofpoint-GUID: GNFYNPPgTjAEtmfMFaZSt8ZI10P8z7GF
X-Proofpoint-ORIG-GUID: GNFYNPPgTjAEtmfMFaZSt8ZI10P8z7GF
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.591,18.0.572,17.11.176.26.0000000_definitions?=
 =?UTF-8?Q?=3D2023-07-31=5F02:2023-07-31=5F02,2020-02-14=5F11,2023-05-22?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 clxscore=1030
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2310030098
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Oct 2023 13:25:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8334

From: Patrick Wicki <patrick.wicki@siemens.com>

Main change is the relicense from GPL-3 to GPL-2, which will allow
catatonit (and hence podman) to be used in deployments where the license
previously posed an issue.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 .../catatonit/{catatonit_0.1.7.bb =3D> catatonit_0.2.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-containers/catatonit/{catatonit_0.1.7.bb =3D> catatonit_0=
.2.0.bb} (69%)

diff --git a/recipes-containers/catatonit/catatonit_0.1.7.bb b/recipes-co=
ntainers/catatonit/catatonit_0.2.0.bb
similarity index 69%
rename from recipes-containers/catatonit/catatonit_0.1.7.bb
rename to recipes-containers/catatonit/catatonit_0.2.0.bb
index da3973de..13537a4a 100644
--- a/recipes-containers/catatonit/catatonit_0.1.7.bb
+++ b/recipes-containers/catatonit/catatonit_0.2.0.bb
@@ -6,11 +6,11 @@ SUMMARY =3D "A container init that is so simple it's ef=
fectively brain-dead."
 HOMEPAGE =3D "https://github.com/openSUSE/catatonit"
 DESCRIPTION =3D "${SUMMARY}"
 SECTION =3D "base"
-LICENSE =3D "GPL-3.0-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
 SRC_URI =3D "git://github.com/openSUSE/${BPN};protocol=3Dhttps;branch=3D=
main"
-SRCREV =3D "d8d72fea155c144ed3bf298a35a1aba5625a5656"
+SRCREV =3D "7f0c9bb45d3490c3e7f579833c9b0689f78c8923"
 S =3D "${WORKDIR}/git"
=20
 inherit autotools
--=20
2.41.0


