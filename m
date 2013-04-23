Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7589BE013C3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 Apr 2013 12:26:46 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3NJQjX2013177
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 Apr 2013 12:26:45 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 23 Apr 2013 12:26:44 -0700
From: Joe Slater <jslater@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 23 Apr 2013 12:26:44 -0700
Message-ID: <1366745204-17291-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Cc: joe.slater@windriver.com
Subject: [PATCH] openvswitch: update version to 1.9.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Apr 2013 19:26:46 -0000
Content-Type: text/plain

CQID: 393776

Update recipe to version 1.9.0.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../{openvswitch_1.4.3.bb => openvswitch_1.9.0.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename recipes-networking/openvswitch/{openvswitch_1.4.3.bb => openvswitch_1.9.0.bb} (96%)

diff --git a/recipes-networking/openvswitch/openvswitch_1.4.3.bb b/recipes-networking/openvswitch/openvswitch_1.9.0.bb
similarity index 96%
rename from recipes-networking/openvswitch/openvswitch_1.4.3.bb
rename to recipes-networking/openvswitch/openvswitch_1.9.0.bb
index 6764073..bfaa004 100644
--- a/recipes-networking/openvswitch/openvswitch_1.4.3.bb
+++ b/recipes-networking/openvswitch/openvswitch_1.9.0.bb
@@ -14,7 +14,7 @@ RDEPENDS_${PN}-pki = "${PN}"
 RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
 RRECOMMENDS_${PN} += "kernel-module-openvswitch"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
 	file://openvswitch-switch \
@@ -23,8 +23,8 @@ SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
 	file://openvswitch-controller-setup \		
 	"
 
-SRC_URI[md5sum] = "66df8e84f579e734aa4a43bc502baffd"
-SRC_URI[sha256sum] = "be1ae1ecff0ff095d24f552c148dd4d2931d187bbb35b3d9205416a0aca746a8"
+SRC_URI[md5sum] = "e9004202b0e10c0de9870f19d2044f11"
+SRC_URI[sha256sum] = "825730db82c7b46a142f057a43345590c299e66704ef7a88d9ed4ffd0c3d6b64"
 LIC_FILES_CHKSUM = "file://COPYING;md5=49eeb5acb1f5e510f12c44f176c42253"
 
 # Don't compile kernel modules by default since it heavily depends on 
-- 
1.7.3.4


