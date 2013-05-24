Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9937EE0146C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 May 2013 11:05:27 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4OI5RaD010579
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 May 2013 11:05:27 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 24 May 2013 11:05:27 -0700
From: Joe Slater <jslater@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 24 May 2013 11:05:25 -0700
Message-ID: <1369418725-6697-3-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1369418725-6697-1-git-send-email-jslater@windriver.com>
References: <1369418725-6697-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Cc: joe.slater@windriver.com
Subject: [PATCH 2/2] lxc: use four fields for PACAKGECONFIG[] info
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

To be safe, we specifiy all four possible fields
even if some trailing ones are null.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 recipes-containers/lxc/lxc_0.9.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
index 1db6d40..1e36dd9 100644
--- a/recipes-containers/lxc/lxc_0.9.0.bb
+++ b/recipes-containers/lxc/lxc_0.9.0.bb
@@ -35,8 +35,8 @@ S = "${WORKDIR}/${PN}-${PV}"
 EXTRA_OECONF += "--with-distro=${DISTRO}"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[doc] = "--enable-doc,--disable-doc"
-PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath"
+PACKAGECONFIG[doc] = "--enable-doc,--disable-doc,,"
+PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
 PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
 
 inherit autotools
-- 
1.7.3.4


