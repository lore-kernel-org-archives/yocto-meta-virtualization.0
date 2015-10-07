Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2FB0E00D4B; Wed,  7 Oct 2015 08:38:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 7FD72E00CF9
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Oct 2015 08:38:52 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 7 Oct 2015
	17:38:51 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 7 Oct 2015 17:38:44 +0200
Message-ID: <1444232325-22859-3-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444232325-22859-1-git-send-email-josep.puigdemont@enea.com>
References: <1444232325-22859-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido/kilo][PATCH 2/3] python-cliff-tablib: add recipe
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
X-List-Received-Date: Wed, 07 Oct 2015 15:38:53 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../python/python-cliff-tablib_git.bb              | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-cliff-tablib_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-cliff-tablib_git.bb b/meta-openstack/recipes-devtools/python/python-cliff-tablib_git.bb
new file mode 100644
index 0000000..bd74348
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-cliff-tablib_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "tablib formatters for cliff"
+HOMEPAGE = "https://github.com/dreamhost/cliff-tablib"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "git://github.com/dreamhost/cliff-tablib;branch=master"
+# 1.1 release
+SRCREV="a83bf47d7dfbb690dd53e189c532f0859898db04"
+PV="1.1+git${SRCPV}"
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+DEPENDS += " \
+    python-pbr \
+    "
+
+RDEPENDS_${PN} += " \
+    python-pbr \
+    python-cliff \
+    python-tablib \
+    "
-- 
1.9.1


