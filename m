Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.871.1578279664858227201
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Jan 2020 19:01:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 140.211.169.56, mailfrom: zangrc.fnst@cn.fujitsu.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C845E0144E; Sun,  5 Jan 2020 19:01:04 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 824FDE0144C
	for <meta-virtualization@yoctoproject.org>; Sun,  5 Jan 2020 19:01:03 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.69,400,1571673600"; 
   d="scan'208";a="81326348"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 11:01:01 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id C7D0F49E9329
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jan 2020 10:52:00 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 11:01:01 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 11:01:00 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization] [PATCH] python-kombu: upgrade 4.6.6 -> 4.6.7
Date: Mon, 6 Jan 2020 11:02:10 +0800
Message-ID: <20200106030210.32082-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: C7D0F49E9329.AA040
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-kombu.inc       | 4 ++--
 .../python/{python-kombu_4.6.6.bb =3D> python-kombu_4.6.7.bb}   | 0
 .../python/{python3-kombu_4.6.6.bb =3D> python3-kombu_4.6.7.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-kombu_4.6.6.bb =3D=
> python-kombu_4.6.7.bb} (100%)
 rename meta-openstack/recipes-devtools/python/{python3-kombu_4.6.6.bb =3D=
> python3-kombu_4.6.7.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-kombu.inc b/me=
ta-openstack/recipes-devtools/python/python-kombu.inc
index 8029707..8e3b8a8 100644
--- a/meta-openstack/recipes-devtools/python/python-kombu.inc
+++ b/meta-openstack/recipes-devtools/python/python-kombu.inc
@@ -4,8 +4,8 @@ SECTION =3D "devel/python"
 LICENSE =3D "BSD"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddaea7c168428449fbee05e644df92=
9f4"
=20
-SRC_URI[md5sum] =3D "5f751ea817b1f6a4293d4e3a01040d4f"
-SRC_URI[sha256sum] =3D "1760b54b1d15a547c9a26d3598a1c8cdaf2436386ac1f556=
1934bc8a3cbbbd86"
+SRC_URI[md5sum] =3D "7fe3e4e60926625b9a47a07e4f3ade2d"
+SRC_URI[sha256sum] =3D "67b32ccb6fea030f8799f8fd50dd08e03a4b99464ebc4952=
d71d8747b1a52ad1"
=20
 inherit pypi
=20
diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.6.6.bb=
 b/meta-openstack/recipes-devtools/python/python-kombu_4.6.7.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-kombu_4.6.6.bb
rename to meta-openstack/recipes-devtools/python/python-kombu_4.6.7.bb
diff --git a/meta-openstack/recipes-devtools/python/python3-kombu_4.6.6.b=
b b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.7.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python3-kombu_4.6.6.bb
rename to meta-openstack/recipes-devtools/python/python3-kombu_4.6.7.bb
--=20
2.20.1



