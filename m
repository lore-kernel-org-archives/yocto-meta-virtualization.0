Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.10576.1636687424201725043
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 19:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AC3Ngiv030892
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Nov 2021 19:23:43 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1AC3NgGi001217
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Nov 2021 19:23:42 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 19:23:41 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 11 Nov 2021 19:23:40 -0800
From: "kai" <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] libvirt: do not install /var/log for target
Date: Fri, 12 Nov 2021 11:23:35 +0800
Message-ID: <20211112032335.5922-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

/var/log is normally a link to /var/volatile/log and /var/volatile is a tmpfs
mount. So anything created in /var/log will not be available when the tmpfs is
mounted.

Not install /var/log to avoid 'empty-dirs' qa issue:

| ERROR: libvirt-7.2.0-r0 do_package_qa: QA Issue: libvirt installs files in
  /var/volatile, but it is expected to be empty [empty-dirs]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-extended/libvirt/libvirt_7.2.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
index b7f8383a..b49bd11a 100644
--- a/recipes-extended/libvirt/libvirt_7.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
@@ -232,6 +232,10 @@ do_install:append() {
 	echo "d root root 0755 /run/libvirt/qemu none" \
 	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
 
+	# /var/log is normally a link to /var/volatile/log
+	# and /var/volatile is a tmpfs mount which should be clean.
+	rm -rf ${D}${localstatedir}/log
+
 	# Manually set permissions and ownership to match polkit recipe
 	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
 		install -d -m 0700 ${D}/${datadir}/polkit-1/rules.d
-- 
2.33.0

