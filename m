Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.13893.1589901840992233239
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 May 2020 08:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04JFNDsc027727
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 May 2020 08:23:49 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 19 May 2020
 08:23:24 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 81F982002B;
 Tue, 19 May 2020 11:23:24 -0400 (EDT)
From: sakib.sajal@windriver.com
To: <meta-virtualization@lists.yoctoproject.org>
CC: Sakib Sajal <sakib.sajal@windriver.com>
Subject: [meta-virtualization][PATCH v2] libvirt: uprev v6.1.0 -> v6.3.0
Date: Tue, 19 May 2020 11:23:01 -0400
Message-ID: <20200519152301.40812-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Minor update bringing in new features, improvements
and bug fixes.
Most notable changes:
- vbox: removed support for version 5.0 and 5.1 APIs
- vbox: added support for version 6.0 and 6.1 APIs
- qemu: Various embed driver fixes
- qemu: Add virtiofs support
- qemu: support disabling hotplug/unplug of PCIe devices
- xen: Add support for 'passthrough' hypervisor feature

Straightforward uprev, requiring patch refreshes to
remove fuzz.

Build and runtime behaviour is identical to older
version v6.1.0.

ptest summary:
===================================
Testsuite summary for libvirt 6.3.0
===================================
- TOTAL: 129
- PASS:  123
- SKIP:  1
- XFAIL: 0
- FAIL:  5
- XPASS: 0
- ERROR: 0

Failed test:
- virschematest
- domaincapstest
- qemuxml2argvtest
- qemuhotplugtest
- virsh-auth

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
V2 changes:
- include test summary
- update commit log to include notable changes

 recipes-extended/libvirt/libvirt-python.inc                   | 4 ++--
 .../libvirt/{libvirt_6.1.0.bb => libvirt_6.3.0.bb}            | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename recipes-extended/libvirt/{libvirt_6.1.0.bb => libvirt_6.3.0.bb} (99%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index c5b0fbd..7b87d5e 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -17,8 +17,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 
-SRC_URI[libvirt_python.md5sum] = "2834626b07da6ac4ca1559abfd55c118"
-SRC_URI[libvirt_python.sha256sum] = "be644f4809c0e1d368e3ac065df3c66a26dcfe61ecb607ee9706e1799f22c35a"
+SRC_URI[libvirt_python.md5sum] = "4cf898350ee9a47f94986d402c153bdb"
+SRC_URI[libvirt_python.sha256sum] = "c772421ecc144f098f4ab15db700c62db9b9e6e76b876217edcfd62e9ce02750"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt_6.1.0.bb b/recipes-extended/libvirt/libvirt_6.3.0.bb
similarity index 99%
rename from recipes-extended/libvirt/libvirt_6.1.0.bb
rename to recipes-extended/libvirt/libvirt_6.3.0.bb
index 9aa78b7..229c56e 100644
--- a/recipes-extended/libvirt/libvirt_6.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.3.0.bb
@@ -42,8 +42,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://gnutls-helper.py \
           "
 
-SRC_URI[libvirt.md5sum] = "a870e63f20fac2ccf98e716d05256145"
-SRC_URI[libvirt.sha256sum] = "167c185be45560e73dd3e14ed375778b555c01455192de2dafc4d0f74fabebc0"
+SRC_URI[libvirt.md5sum] = "1bd4435f77924f5ec9928b538daf4a02"
+SRC_URI[libvirt.sha256sum] = "74069438d34082336e99a88146349e21130552b96efc3b7c562f6878127996f5"
 
 inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd perlnative
 USERADD_PACKAGES = "${PN}"
-- 
2.24.0

