Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E07DE0146C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 May 2013 11:05:27 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4OI5QvB005905
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 May 2013 11:05:26 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 24 May 2013 11:05:26 -0700
From: Joe Slater <jslater@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 24 May 2013 11:05:24 -0700
Message-ID: <1369418725-6697-2-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1369418725-6697-1-git-send-email-jslater@windriver.com>
References: <1369418725-6697-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Cc: joe.slater@windriver.com
Subject: [PATCH 1/2] lxc: specify distro
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
X-List-Received-Date: Fri, 24 May 2013 18:05:27 -0000
Content-Type: text/plain

CQID: 418191

Do not query the host to find out our distro.  We
specify the bitbake variable ${DISTRO} in order
to get the desired runtime default config file.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 recipes-containers/lxc/lxc_0.9.0.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
index 63ce2d6..1db6d40 100644
--- a/recipes-containers/lxc/lxc_0.9.0.bb
+++ b/recipes-containers/lxc/lxc_0.9.0.bb
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 PRIORITY = "optional"
-PR = "r1"
+PR = "r2"
 DEPENDS = "libxml2 libcap"
 RDEPENDS_${PN} = " \
 		rsync \
@@ -30,6 +30,10 @@ SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b
 
 S = "${WORKDIR}/${PN}-${PV}"
 
+# Let's not configure for the host distro.
+#
+EXTRA_OECONF += "--with-distro=${DISTRO}"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[doc] = "--enable-doc,--disable-doc"
 PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath"
-- 
1.7.3.4


