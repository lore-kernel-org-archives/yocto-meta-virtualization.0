Return-Path: <Wenzong.Fan@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18B54E0086F; Tue,  2 Dec 2014 23:41:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0DDD6E0030B
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Dec 2014 23:41:13 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB37fCJs000254
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 2 Dec 2014 23:41:12 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Dec 2014 23:41:11 -0800
From: <wenzong.fan@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 3 Dec 2014 02:41:10 -0500
Message-ID: <1417592470-7582-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] lxc: add PACKAGECONFIG for selinux
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
X-List-Received-Date: Wed, 03 Dec 2014 07:41:16 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Add PACKAGECONFIG for 'selinux', otherwise there would be warnings like
below:

WARN: lxc: lxc rdepends on libselinux, but it isn't a build dependency?

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 recipes-containers/lxc/lxc_1.0.6.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_1.0.6.bb b/recipes-containers/lxc/lxc_1.0.6.bb
index 0805573..e6ec68d 100644
--- a/recipes-containers/lxc/lxc_1.0.6.bb
+++ b/recipes-containers/lxc/lxc_1.0.6.bb
@@ -40,11 +40,14 @@ S = "${WORKDIR}/${BPN}-${PV}"
 PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
 EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
 
-PACKAGECONFIG ??= "templates"
+PACKAGECONFIG ??= "templates \
+    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+"
 PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
 PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
 PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
 PACKAGECONFIG[templates] = ",,, ${PN}-templates"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
 
 inherit autotools pkgconfig ptest
 
-- 
1.7.9.5


