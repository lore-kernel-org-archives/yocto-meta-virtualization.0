Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.9284.1577952487557744868
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Jan 2020 00:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1CE43E013C8; Thu,  2 Jan 2020 00:08:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48ADFE0134B
	for <meta-virtualization@yoctoproject.org>; Thu,  2 Jan 2020 00:08:05 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; 
   d="scan'208";a="81233521"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 16:08:02 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id F108249E9311
	for <meta-virtualization@yoctoproject.org>; Thu,  2 Jan 2020 15:59:05 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 16:07:59 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 2 Jan 2020 16:07:58 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-cliff: upgrade 2.16.0 -> 2.17.0
Date: Thu, 2 Jan 2020 16:09:13 +0800
Message-ID: <20200102080913.31226-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: F108249E9311.A9565
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-cliff.inc       | 4 ++--
 .../python/{python-cliff_2.16.0.bb =3D> python-cliff_2.17.0.bb} | 0
 .../{python3-cliff_2.16.0.bb =3D> python3-cliff_2.17.0.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-cliff_2.16.0.bb =3D=
> python-cliff_2.17.0.bb} (100%)
 rename meta-openstack/recipes-devtools/python/{python3-cliff_2.16.0.bb =3D=
> python3-cliff_2.17.0.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-cliff.inc b/me=
ta-openstack/recipes-devtools/python/python-cliff.inc
index cc66717..8a7ec7d 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff.inc
+++ b/meta-openstack/recipes-devtools/python/python-cliff.inc
@@ -4,8 +4,8 @@ SECTION =3D "devel/python"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
=20
-SRC_URI[md5sum] =3D "89e96c6c8c5922832e124ed81c21a55b"
-SRC_URI[sha256sum] =3D "622e777b8ac2eb479708fe53893c37b2fd5469ce2c6c5b79=
4a658246f05c6b81"
+SRC_URI[md5sum] =3D "d51b9a153c6d9ba597c47bb34cb13366"
+SRC_URI[sha256sum] =3D "f5a1c6b32047aa0d272398d311fd711d41dd5e1cd5195ebe=
36ebb47f464416fa"
=20
 inherit pypi
=20
diff --git a/meta-openstack/recipes-devtools/python/python-cliff_2.16.0.b=
b b/meta-openstack/recipes-devtools/python/python-cliff_2.17.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-cliff_2.16.0.bb
rename to meta-openstack/recipes-devtools/python/python-cliff_2.17.0.bb
diff --git a/meta-openstack/recipes-devtools/python/python3-cliff_2.16.0.=
bb b/meta-openstack/recipes-devtools/python/python3-cliff_2.17.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python3-cliff_2.16.0.b=
b
rename to meta-openstack/recipes-devtools/python/python3-cliff_2.17.0.bb
--=20
2.20.1



