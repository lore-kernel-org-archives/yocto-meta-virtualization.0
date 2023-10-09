Return-Path: <patrick@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5743E95A9E
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 15:35:20 +0000 (UTC)
Received: from qs51p00im-qukt01072302.me.com (qs51p00im-qukt01072302.me.com [17.57.155.13])
 by mx.groups.io with SMTP id smtpd.web11.65474.1696865710842968219
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 08:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=ES3yhlXW;
 spf=pass (domain: subset.ch, ip: 17.57.155.13, mailfrom: patrick@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1696865709; bh=cDP2yrl4AcC81XiRNu0QByWSZVPIAEiC3igzLIn+3ls=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ES3yhlXWZ28mIatWygCeMwyei9sec3RM83a4KVTIVaGvyrEzirL9D8cWWdpoauqte
	 9m/RJy2saub4Iu7d69ZUhAPbg07rZBDh3zTL5tSrfq06N3nBLwPYyIjGfDcwV6oH6A
	 I+xuO0OaD1ok1hkjmtg6/QfWq2aCAyOyuFipZpiSOdCwZ5AgWj52/9GZk2QcbLOU26
	 HZlhPmekdgOFb7ChMR/WzNNtQt9hgGjZp3nWTKbYK+EjJvEqlmxx16jgfP2pRPUonK
	 WZxsWGX+GrTtuJy7zM6FnHMaclYWcYj6r/ypN2wDMu5raxsZNBr2yeakPv0FJBAsYn
	 KV5Hp51s3B4HA==
Received: from localhost.localdomain (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01072302.me.com (Postfix) with ESMTPSA id C02BA6300152;
	Mon,  9 Oct 2023 15:35:08 +0000 (UTC)
From: patrick@subset.ch
To: meta-virtualization@lists.yoctoproject.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-virtualization][PATCH v2] catatonit: update to version 0.2.0
Date: Mon,  9 Oct 2023 17:34:49 +0200
Message-ID: <20231009153449.151855-1-patrick@subset.ch>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <ZSPs3QhJ+7TPatj2@gmail.com>
References: <ZSPs3QhJ+7TPatj2@gmail.com>
MIME-Version: 1.0
X-Proofpoint-GUID: Si78MgmaurMB4xEgC8mnGlnjCiPHJWv6
X-Proofpoint-ORIG-GUID: Si78MgmaurMB4xEgC8mnGlnjCiPHJWv6
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-11=5F01:2022-01-11=5F01,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 clxscore=1030
 mlxscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2310090129
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Oct 2023 15:35:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8343

From: Patrick Wicki <patrick.wicki@siemens.com>

Main change is the relicense from GPL-3 to GPL-2, which will allow
catatonit (and hence podman) to be used in deployments where the license
previously posed an issue.

Contains the following commits:

        7f0c9bb version: release catatonit 0.2.0
        fe191ef license: switch to GPLv2-or-later

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
2.42.0


