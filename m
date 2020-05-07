Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.1517.1588877884408059526
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 May 2020 11:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 047Iw2Zb018029
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 7 May 2020 11:58:03 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 11:58:02 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20885)	id 4B6A2900E88;
 Thu,  7 May 2020 11:58:02 -0700 (PDT)
From: sakib.sajal@windriver.com
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] libvirt: uprev v6.1 -> v6.3
Date: Thu, 7 May 2020 11:57:51 -0700
Message-ID: <20200507185751.74583-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Changelog:
https://www.libvirt.org/news.html#v6.3.0

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc                | 7 +++++--
 .../libvirt/{libvirt_6.1.0.bb => libvirt_6.3.0.bb}         | 7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)
 rename recipes-extended/libvirt/{libvirt_6.1.0.bb => libvirt_6.3.0.bb} (96%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index c5b0fbd..bad4391 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -17,8 +17,11 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 
-SRC_URI[libvirt_python.md5sum] = "2834626b07da6ac4ca1559abfd55c118"
-SRC_URI[libvirt_python.sha256sum] = "be644f4809c0e1d368e3ac065df3c66a26dcfe61ecb607ee9706e1799f22c35a"
+SRC_URI[libvirt_python.md5sum] = "4cf898350ee9a47f94986d402c153bdb"
+SRC_URI[libvirt_python.sha256sum] = "c772421ecc144f098f4ab15db700c62db9b9e6e76b876217edcfd62e9ce02750"
+SRC_URI[libvirt_python.sha1sum] = "de484d1778b485d130485b5bce54a53f6b69a4dc"
+SRC_URI[libvirt_python.sha384sum] = "bf1236da1028cf92f38aacbe58aa17d99d5119a16d545d716b0787ffa5abb3c54244b13574447fad454298a49e6765df"
+SRC_URI[libvirt_python.sha512sum] = "717badd58a7b9fcc7f603a556f10ad571546750d97732ae1ebc82765d970bb2c19e355197cf49195b961ca492b24f91ea0b938ca6b85970bfd2473a781f2716e"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt_6.1.0.bb b/recipes-extended/libvirt/libvirt_6.3.0.bb
similarity index 96%
rename from recipes-extended/libvirt/libvirt_6.1.0.bb
rename to recipes-extended/libvirt/libvirt_6.3.0.bb
index 9aa78b7..bdcc67a 100644
--- a/recipes-extended/libvirt/libvirt_6.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.3.0.bb
@@ -42,8 +42,11 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://gnutls-helper.py \
           "
 
-SRC_URI[libvirt.md5sum] = "a870e63f20fac2ccf98e716d05256145"
-SRC_URI[libvirt.sha256sum] = "167c185be45560e73dd3e14ed375778b555c01455192de2dafc4d0f74fabebc0"
+SRC_URI[libvirt.md5sum] = "1bd4435f77924f5ec9928b538daf4a02"
+SRC_URI[libvirt.sha256sum] = "74069438d34082336e99a88146349e21130552b96efc3b7c562f6878127996f5"
+SRC_URI[libvirt.sha1sum] = "8607721bafccf4b7727cb93fef4c36a23c849ab3"
+SRC_URI[libvirt.sha384sum] = "773996c338395f12c1319bef0f880787e7ef019710c66076e870e3031e16142c51d89539de2317036e93df5af6165f80"
+SRC_URI[libvirt.sha512sum] = "29805cd59745c21b7c84b6c5aebe6e791b9bee84a83cfbc5debafe37cd40120f1773d96286434611a5b9d8726d34ee84083f36108f3f5eb74c0bd848c4e34e38"
 
 inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd perlnative
 USERADD_PACKAGES = "${PN}"
-- 
2.24.1

