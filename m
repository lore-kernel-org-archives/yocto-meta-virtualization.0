Return-Path: <amarnath.valluri@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BB90AE009C3; Wed,  8 Feb 2017 05:49:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [134.134.136.100 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3941BE009B9
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Feb 2017 05:49:55 -0800 (PST)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 08 Feb 2017 05:49:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="818478643"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Feb 2017 05:49:53 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Wed,  8 Feb 2017 15:46:34 +0200
Message-Id: <1486561594-24053-4-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486561594-24053-1-git-send-email-amarnath.valluri@intel.com>
References: <1486561594-24053-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 4/4] libvirt: Replace systemd units location to match with bitbake environment.
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
X-List-Received-Date: Wed, 08 Feb 2017 13:49:56 -0000

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 recipes-extended/libvirt/libvirt_1.3.5.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb b/recipes-extended/libvirt/libvirt_1.3.5.bb
index c848c99..206f59f 100644
--- a/recipes-extended/libvirt/libvirt_1.3.5.bb
+++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
@@ -213,6 +213,12 @@ PACKAGECONFIG[wireshark] = "--with-wireshark-dissector,--without-wireshark-disse
 # Enable the Python tool support
 require libvirt-python.inc
 
+do_configure_prepend() {
+	systemd_system_unitdir="${@d.getVar('systemd_system_unitdir')}"
+	sed -i -e "s;^SYSTEMD_UNIT_DIR =.*;SYSTEMD_UNIT_DIR = $systemd_system_unitdir;" \
+	     ${S}/daemon/Makefile.am ${S}/src/Makefile.am ${S}/tools/Makefile.am
+}
+
 do_install_append() {
 	install -d ${D}/etc/init.d
 	install -d ${D}/etc/libvirt
-- 
2.7.4


