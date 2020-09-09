Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.7948.1599689011220246088
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Sep 2020 15:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: joe.slater@windriver.com)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6C22338C1439
	for <meta-virtualization@yoctoproject.org>; Wed,  9 Sep 2020 15:03:30 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 089M2wSO031892
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Wed, 9 Sep 2020 15:03:19 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Sep 2020
 15:02:48 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <meta-virtualization@yoctoproject.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-virt][PATCH 1/1] container-base: rename recipe
Date: Wed, 9 Sep 2020 15:02:48 -0700
Message-ID: <20200909220248.17026-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Change to container-base-image since the convention is to
have "image" in image recipe names.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 recipes-extended/images/{container-base.bb =3D> contain-base-image.bb} |=
 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-extended/images/{container-base.bb =3D> contain-base-imag=
e.bb} (100%)

diff --git a/recipes-extended/images/container-base.bb b/recipes-extended=
/images/contain-base-image.bb
similarity index 100%
rename from recipes-extended/images/container-base.bb
rename to recipes-extended/images/contain-base-image.bb
--=20
2.7.4

