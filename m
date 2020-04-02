Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.775.1585807444161198700
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Apr 2020 23:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: zhe.he@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03263xvh026375
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 1 Apr 2020 23:03:59 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 1 Apr 2020 23:03:58 -0700
From: "He Zhe" <zhe.he@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] libvirt: Add setuid permission to virt-login-shell
Date: Thu, 2 Apr 2020 14:03:57 +0800
Message-ID: <1585807437-204361-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

virt-login-shell asks for setuid permission as follow.
"virt-login-shell: must be run as setuid root"

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-extended/libvirt/libvirt_6.1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt_6.1.0.bb b/recipes-extended/libvirt/libvirt_6.1.0.bb
index 7b10920..9aa78b7 100644
--- a/recipes-extended/libvirt/libvirt_6.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.1.0.bb
@@ -368,6 +368,9 @@ do_install_append() {
 	    # Force the connection to be tls.
 	    sed -i -e 's/^\(listen_tls\ =\ .*\)/#\1/' -e 's/^\(listen_tcp\ =\ .*\)/#\1/' ${D}/etc/libvirt/libvirtd.conf
 	fi
+
+	# virt-login-shell needs to run with setuid permission
+	chmod 4755 ${D}${bindir}/virt-login-shell
 }
 
 EXTRA_OECONF += " \
-- 
2.7.4

