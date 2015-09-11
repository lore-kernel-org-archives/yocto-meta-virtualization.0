Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53BF1E00D16; Fri, 11 Sep 2015 07:42:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A7FDE00B18
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Sep 2015 07:42:05 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8BEg5gP028744
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Sep 2015 07:42:05 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 11 Sep 2015 07:42:04 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Fri, 11 Sep 2015 10:42:04 -0400
Message-ID: <1441982524-31476-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] libvirt: get libvirt-guests systemd service running
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
X-List-Received-Date: Fri, 11 Sep 2015 14:42:10 -0000
Content-Type: text/plain

While testing libvirt with the new systemd init I found that the
libvirt-guests service was failing to run since the libvirt-guests.sh
script was not where it was expected. If we are building for systemd
init system use the default installation location which is used
upstream for the libvirt-guests.sh script.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/libvirt/libvirt_1.2.17.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.2.17.bb b/recipes-extended/libvirt/libvirt_1.2.17.bb
index 28a22bb..6f269f9 100644
--- a/recipes-extended/libvirt/libvirt_1.2.17.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.17.bb
@@ -107,6 +107,7 @@ FILES_${PN}-libvirtd = " \
         /usr/lib/sysctl.d/60-libvirtd.conf \
 	${sbindir}/libvirtd \
 	${systemd_unitdir}/system/* \
+	${@base_contains('DISTRO_FEATURES', 'sysvinit', '', '${libexecdir}/libvirt-guests.sh', d)} \
         "
 
 FILES_${PN}-virsh = "${bindir}/virsh"
@@ -215,9 +216,11 @@ do_install_append() {
 	install -m 0755 ${WORKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
 	install -m 0644 ${WORKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
 
-	# This will wind up in the libvirtd package, but will NOT be invoked by default.
-	#
-	mv ${D}/${libexecdir}/libvirt-guests.sh ${D}/${sysconfdir}/init.d
+	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+	    # This will wind up in the libvirtd package, but will NOT be invoked by default.
+	    #
+	    mv ${D}/${libexecdir}/libvirt-guests.sh ${D}/${sysconfdir}/init.d
+	fi
 
 	# The /var/run/libvirt directories created by the Makefile
 	# are wiped out in volatile, we need to create these at boot.
-- 
2.1.4


