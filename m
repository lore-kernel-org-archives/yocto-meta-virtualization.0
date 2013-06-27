Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20AF4E01554
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Jun 2013 12:23:22 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5RJNLTM000187
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Jun 2013 12:23:21 -0700 (PDT)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 27 Jun 2013 12:23:21 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 27 Jun 2013 15:23:34 -0400
Message-ID: <1372361014-20814-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Subject: [PATCH] libvirt: switch to use volatile system for directory creation in /var/run
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
X-List-Received-Date: Thu, 27 Jun 2013 19:23:23 -0000
Content-Type: text/plain

libvirt relies on its Makefile's install rules to create several
directories in /var/run/libvirt. The use of ALLOW_EMPTY_ allows these
to be included in the RPM, however, they are cleared out at boot by
the volatile system. This causes issues since the libvirt runtime does
not check for the existence of these directories prior to attempting
to create files in them, resulting in errors. Here we add to the
volatiles allowing the required directories to be created at boot or
when the volatiles are updated.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.0.3.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
index 479ce7e..768ccc8 100644
--- a/recipes-extended/libvirt/libvirt_1.0.3.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -150,4 +150,25 @@ do_install_append() {
 	# This will wind up in the libvirtd package, but will NOT be invoked by default.
 	#
 	mv ${D}/${libexecdir}/libvirt-guests.sh ${D}/${sysconfdir}/init.d
+
+	# The /var/run/libvirt directories created by the Makefile
+	# are wiped out in volatile, we need to create these at boot.
+	rm -rf ${D}${localstatedir}/run
+	install -d ${D}${sysconfdir}/default/volatiles
+	echo "d root root 0755 ${localstatedir}/run/libvirt none" \
+	     > ${D}${sysconfdir}/default/volatiles/99_libvirt
+	echo "d root root 0755 ${localstatedir}/run/libvirt/lockd none" \
+	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
+	echo "d root root 0755 ${localstatedir}/run/libvirt/lxc none" \
+	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
+	echo "d root root 0755 ${localstatedir}/run/libvirt/network none" \
+	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
+	echo "d root root 0755 ${localstatedir}/run/libvirt/qemu none" \
+	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
+}
+
+pkg_postinst_libvirt() {
+        if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
+                /etc/init.d/populate-volatile.sh update
+        fi
 }
-- 
1.8.1.2


