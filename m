Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.8466.1625477412232516969
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 Jul 2021 02:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1659UA1C012827
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 5 Jul 2021 02:30:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1659U9IL003547
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 5 Jul 2021 02:30:10 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 5 Jul 2021 02:30:09 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Mon, 5 Jul 2021 02:30:08 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] skopeo: fix native skopeo failed if no libdevmapper.so.1.02 on host
Date: Mon, 5 Jul 2021 17:30:08 +0800
Message-ID: <20210705093008.10889-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

If host does not install libdevmapper.so.1.02, run native skopeo failed:
...
$ tmp-glibc/sysroots/x86_64/usr/sbin/skopeo -h
|tmp-glibc/sysroots/x86_64/usr/sbin/skopeo.real: error while loading
shared libraries: libdevmapper.so.1.02: cannot open shared object file: No such file or directory
...

Create wrapper to set LD_LIBRARY_PATH which using native
libdevmapper.so.1.02

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-containers/skopeo/skopeo_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index 6c95bf3e..19ac938b 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -84,6 +84,9 @@ do_install() {
 do_install_append_class-native() {
     create_cmdline_wrapper ${D}/${sbindir}/skopeo \
         --policy ${sysconfdir}/containers/policy.json
+
+    create_wrapper ${D}/${sbindir}/skopeo.real \
+        LD_LIBRARY_PATH=${STAGING_LIBDIR_NATIVE}
 }
 
 do_install_append_class-nativesdk() {
-- 
2.27.0

