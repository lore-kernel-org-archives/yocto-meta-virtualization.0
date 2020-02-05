Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.2033.1580874402062255041
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Feb 2020 19:46:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0153kfBh000343
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 4 Feb 2020 19:46:41 -0800 (PST)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.468.0; Tue, 4 Feb 2020
 19:46:21 -0800
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] libvirt: inherit perlnative for pod2man
Date: Tue, 4 Feb 2020 19:46:21 -0800
Message-ID: <20200205034621.126564-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

pod2man is now provided by perlnative instead host.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/libvirt/libvirt_5.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_5.5.0.bb b/recipes-extended/libvirt/libvirt_5.5.0.bb
index 6a84f98..3f07619 100644
--- a/recipes-extended/libvirt/libvirt_5.5.0.bb
+++ b/recipes-extended/libvirt/libvirt_5.5.0.bb
@@ -43,7 +43,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
 SRC_URI[libvirt.md5sum] = "27c5fb6c8d2d46eb9e8165aeb3b499b0"
 SRC_URI[libvirt.sha256sum] = "2306ef0947a594f91ec9da4b8b0307bdb54b897f17de19f48e8ecdca08ff35e8"
 
-inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd
+inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd perlnative
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r qemu; -r kvm"
 USERADD_PARAM_${PN} = "-r -g qemu -G kvm qemu"
-- 
2.21.0

