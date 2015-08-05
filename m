Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1DDBE00A99; Wed,  5 Aug 2015 13:29:58 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC981E00A01
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 13:29:57 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t75KTvNZ010611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 5 Aug 2015 13:29:57 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 5 Aug 2015 13:29:57 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 5 Aug 2015 16:29:43 -0400
Message-ID: <1438806592-32745-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org, mark.asselstine@windriver.com
Subject: [m-c-s][PATCH 02/11] meta-openstack: add wildcard to libvirt bbappend
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
X-List-Received-Date: Wed, 05 Aug 2015 20:29:58 -0000
Content-Type: text/plain

This is currently a dangling bbappend as libvirt is now version
1.2.15. The content of the file appears to still be relevant so simply
renaming this bbappend to apply to a range of releases. This will
throw a warning as no 'sanlock' PKGCONFIG currently exists in the base
recipe, a commit will be sent for meta-virtualizaiton to add this.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-extended/libvirt/libvirt_1.%.bbappend           | 13 +++++++++++++
 .../recipes-extended/libvirt/libvirt_1.2.12.bbappend        | 13 -------------
 2 files changed, 13 insertions(+), 13 deletions(-)
 create mode 100644 meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
 delete mode 100644 meta-openstack/recipes-extended/libvirt/libvirt_1.2.12.bbappend

diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
new file mode 100644
index 0000000..195633b
--- /dev/null
+++ b/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
@@ -0,0 +1,13 @@
+PACKAGECONFIG ?= "qemu lxc test remote macvtap libvirtd udev yajl \
+	 	 python sanlock ebtables \
+		 ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+		"
+
+inherit useradd
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system libvirt"
+
+do_install_append() {
+	sed -e "s:^#unix_sock_group =:unix_sock_group =:g" -i ${D}/etc/libvirt/libvirtd.conf
+	sed -e "s:^#unix_sock_rw_perms =:unix_sock_rw_perms =:g" -i ${D}/etc/libvirt/libvirtd.conf
+}
diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_1.2.12.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_1.2.12.bbappend
deleted file mode 100644
index 195633b..0000000
--- a/meta-openstack/recipes-extended/libvirt/libvirt_1.2.12.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-PACKAGECONFIG ?= "qemu lxc test remote macvtap libvirtd udev yajl \
-	 	 python sanlock ebtables \
-		 ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
-		"
-
-inherit useradd
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "--system libvirt"
-
-do_install_append() {
-	sed -e "s:^#unix_sock_group =:unix_sock_group =:g" -i ${D}/etc/libvirt/libvirtd.conf
-	sed -e "s:^#unix_sock_rw_perms =:unix_sock_rw_perms =:g" -i ${D}/etc/libvirt/libvirtd.conf
-}
-- 
2.1.4


