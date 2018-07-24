Return-Path: <zhe.he@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DBE67E00DFD; Tue, 24 Jul 2018 04:08:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BA56E00DFC
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Jul 2018 04:08:59 -0700 (PDT)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w6OB8vZ2004996;
	Tue, 24 Jul 2018 04:08:57 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Tue, 24 Jul 2018 04:08:57 -0700
From: He Zhe <zhe.he@windriver.com>
To: meta-virtualization@yoctoproject.org, bruce.ashfield@gmail.com
Date: Tue, 24 Jul 2018 04:08:56 -0700
Message-Id: <20180724110856.925-2-zhe.he@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180724110856.925-1-zhe.he@windriver.com>
References: <20180724110856.925-1-zhe.he@windriver.com>
Subject: [PATCH] libvirt: Remove unsupported configure options and fix warning
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
X-List-Received-Date: Tue, 24 Jul 2018 11:08:59 -0000

xen and xen-inotify have been removed from upstream. We change
PACKAGECONFIG accordingly.

pkg_postinst has been deprecated, use pkg_postinst_ontarget instead.

WARNING: wrlinux-image-ovp-kvm-1.0-r0 do_rootfs: Intentionally failing
postinstall scriptlets of ['libvirt'] to defer them to first boot is
deprecated. Please place them into pkg_postinst_ontarget_${PN} ().

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-extended/libvirt/libvirt_4.3.0.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_4.3.0.bb b/recipes-extended/libvirt/libvirt_4.3.0.bb
index edd5261..e6dac5d 100644
--- a/recipes-extended/libvirt/libvirt_4.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_4.3.0.bb
@@ -175,7 +175,7 @@ PRIVATE_LIBS_${PN}-ptest = " \
 PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
                    remote macvtap libvirtd netcf udev python ebtables \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'libxl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
                   "
 
@@ -183,10 +183,8 @@ PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
 #
 PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu,"
 PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
-PACKAGECONFIG[xen] = "--with-xen,--without-xen,xen,"
 PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
 PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,libxl,"
-PACKAGECONFIG[xen-inotify] = "--with-xen-inotify,--without-xen-inotify,xen,"
 PACKAGECONFIG[uml] = "--with-uml, --without-uml,,"
 PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz,,"
 PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware,,"
@@ -305,7 +303,7 @@ do_install_ptest() {
 	done
 }
 
-pkg_postinst_libvirt() {
+pkg_postinst_ontarget_${PN}() {
         if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
                 /etc/init.d/populate-volatile.sh update
         fi
-- 
2.11.0


