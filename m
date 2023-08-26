Return-Path: <retpolanne@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7648BC83F01
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 17:28:47 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.12825.1693070917454845188
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 26 Aug 2023 10:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.net header.s=2017 header.b=pxf+VBpk;
 spf=pass (domain: posteo.net, ip: 185.67.36.66, mailfrom: retpolanne@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 36E8C240101
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 26 Aug 2023 19:28:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1693070915; bh=GX9z4eijogDrGh01ZwUI+P9ozd58mbA1SD4lE4xBc0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=pxf+VBpkYXqHEIsW2gxNE7GelAdmZ8w4sISZXD+xN08bXbBb8FbdOyEEIWvARaqKe
	 c/CYtNQn/ptnzfhrR70UvgkUutQv/m+BkJWXhgq8xR8xfVWpe7zHaJUV9TiIKMXCVA
	 pLT5QlOI/526THHYMhkJAKLy72Rgez2LABZdc5zj276ldRLIc4oxIW6wStA0ekwXmh
	 VLlbLdx4r9Hn6MqzxNC5wi6eYq8LMYU8d5stPwW5C7GdSCeBRa4GhjpCN2EU2Yz9LB
	 3WCu1kzj4cS51juwVbeBSmEmNEkT9W0O4hZ/PnpYbUHYFAAzOLCEyvHLhZg89tHWO2
	 IfqYn7WHDEtfA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4RY3h12Cl9z6tw2;
	Sat, 26 Aug 2023 19:28:33 +0200 (CEST)
From: Anne Macedo <retpolanne@posteo.net>
To: meta-virtualization@lists.yoctoproject.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: retpolanne@posteo.net
Subject: [meta-virtualization][m-c-s][PATCH] consul: fixes consul git urls
Date: Sat, 26 Aug 2023 17:28:23 +0000
Message-ID: <20230826172823.15707-1-retpolanne@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 26 Aug 2023 17:28:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8236

Fixes error:

URL: git://github.com/hashicorp/consul-migrate.git;branch=3Dmaster uses
git protocol which is no longer supported by github.
Please change to ;protocol=3Dhttps in the url.

when running bitbake with the meta-cloud-services layer.

Signed-off-by: Anne Macedo <retpolanne@posteo.net>
---
 .../consul/consul-migrate_git.bb                 | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-connectivity/consul/consul-migrate_git.bb b/recipes-=
connectivity/consul/consul-migrate_git.bb
index 7d784c2a..1393c912 100644
--- a/recipes-connectivity/consul/consul-migrate_git.bb
+++ b/recipes-connectivity/consul/consul-migrate_git.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD & MPL-2.0 & MIT"
 LIC_FILES_CHKSUM =3D "file://src/github.com/hashicorp/consul-migrate/LIC=
ENSE;md5=3Db278a92d2c1509760384428817710378"
=20
 GO_IMPORT =3D "github.com/hashicorp/consul-migrate"
-SRC_URI =3D "git://${GO_IMPORT}.git;branch=3Dmaster"
+SRC_URI =3D "https://${GO_IMPORT}.git;branch=3Dmaster"
 SRCREV =3D "678fb10cdeae25ab309e99e655148f0bf65f9710"
=20
 S =3D "${WORKDIR}/git"
@@ -18,13 +18,13 @@ SRCREV_bolt =3D "c6ba97b89e0454fec9aa92e1d33a4e2c5fc1=
f631"
 SRCREV_go-msgpack =3D "fa3f63826f7c23912c15263591e65d54d080b458"
=20
 SRC_URI +=3D " \
-   git://github.com/hashicorp/raft;name=3Draft;destsuffix=3Dgit/src/gith=
ub.com/hashicorp/raft;branch=3Dmaster;protocol=3Dhttps \
-   git://github.com/armon/go-metrics;name=3Dgo-metrics;destsuffix=3Dgit/=
src/github.com/armon/go-metrics;branch=3Dmaster;protocol=3Dhttps \
-   git://github.com/hashicorp/raft-boltdb;name=3Draft-boltdb;destsuffix=3D=
git/src/github.com/hashicorp/raft-boltdb;branch=3Dmaster;protocol=3Dhttps=
 \
-   git://github.com/hashicorp/raft-mdb;name=3Draft-mdb;destsuffix=3Dgit/=
src/github.com/hashicorp/raft-mdb;branch=3Dmaster;protocol=3Dhttps \
-   git://github.com/armon/gomdb;name=3Dgomdb;destsuffix=3Dgit/src/github=
.com/armon/gomdb;branch=3Dmaster;protocol=3Dhttps \
-   git://github.com/boltdb/bolt;name=3Dbolt;destsuffix=3Dgit/src/github.=
com/boltdb/bolt;branch=3Dmaster;protocol=3Dhttps \
-   git://github.com/hashicorp/go-msgpack;name=3Dgo-msgpack;destsuffix=3D=
git/src/github.com/hashicorp/go-msgpack;branch=3Dmaster;protocol=3Dhttps =
\
+   https://github.com/hashicorp/raft;name=3Draft;destsuffix=3Dgit/src/gi=
thub.com/hashicorp/raft;branch=3Dmaster;protocol=3Dhttps \
+   https://github.com/armon/go-metrics;name=3Dgo-metrics;destsuffix=3Dgi=
t/src/github.com/armon/go-metrics;branch=3Dmaster;protocol=3Dhttps \
+   https://github.com/hashicorp/raft-boltdb;name=3Draft-boltdb;destsuffi=
x=3Dgit/src/github.com/hashicorp/raft-boltdb;branch=3Dmaster;protocol=3Dh=
ttps \
+   https://github.com/hashicorp/raft-mdb;name=3Draft-mdb;destsuffix=3Dgi=
t/src/github.com/hashicorp/raft-mdb;branch=3Dmaster;protocol=3Dhttps \
+   https://github.com/armon/gomdb;name=3Dgomdb;destsuffix=3Dgit/src/gith=
ub.com/armon/gomdb;branch=3Dmaster;protocol=3Dhttps \
+   https://github.com/boltdb/bolt;name=3Dbolt;destsuffix=3Dgit/src/githu=
b.com/boltdb/bolt;branch=3Dmaster;protocol=3Dhttps \
+   https://github.com/hashicorp/go-msgpack;name=3Dgo-msgpack;destsuffix=3D=
git/src/github.com/hashicorp/go-msgpack;branch=3Dmaster;protocol=3Dhttps =
\
 "
=20
 inherit go
--=20
2.41.0


