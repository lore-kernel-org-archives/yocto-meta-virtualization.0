Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1CF49E00DF8; Tue, 10 Sep 2019 20:26:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72E79E00DF2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Sep 2019 20:26:44 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8B3QMfr001713
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Sep 2019 20:26:33 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 10 Sep 2019 20:26:11 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 10 Sep 2019 20:26:11 -0700
Message-ID: <20190911032611.77049-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] ceph: fix ceph-crash failed with /var/lib/ceph/crash/posted not found
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
X-List-Received-Date: Wed, 11 Sep 2019 03:26:45 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

root@intelx86-64: journalctl -xe
ceph-crash[854]: ERROR:_main_:directory /var/lib/ceph/crash/posted does
not exist; please create

Create the directory for both of systemd and sysvinit

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 recipes-extended/ceph/ceph_14.2.3.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/recipes-extended/ceph/ceph_14.2.3.bb b/recipes-extended/ceph/ceph_14.2.3.bb
index 722efe3..25a8ea2 100644
--- a/recipes-extended/ceph/ceph_14.2.3.bb
+++ b/recipes-extended/ceph/ceph_14.2.3.bb
@@ -81,12 +81,36 @@ do_install_append () {
 	rm ${D}${systemd_unitdir}/system/ceph-fuse.target ${D}${systemd_unitdir}/system/ceph-fuse@.service
 }
 
+do_install_append_class-target () {
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/tmpfiles.d
+		echo "d /var/lib/ceph/crash/posted 0755 root root - -" > ${D}${sysconfdir}/tmpfiles.d/ceph-placeholder.conf
+	fi
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/default/volatiles
+		echo "d root root 0755 /var/lib/ceph/crash/posted none" > ${D}${sysconfdir}/default/volatiles/99_ceph-placeholder
+	fi
+}
+
+pkg_postinst_${PN}() {
+	if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
+		${sysconfdir}/init.d/populate-volatile.sh update
+	fi
+}
+
 FILES_${PN} += "\
 		${libdir}/rados-classes/*.so.* \
 		${libdir}/ceph/compressor/*.so \
 		${libdir}/rados-classes/*.so \
 		${libdir}/ceph/*.so \
 "
+
+FILES_${PN} += " \
+    /etc/tmpfiles.d/ceph-placeholder.conf \
+    /etc/default/volatiles/99_ceph-placeholder \
+"
+
 FILES_${PN}-python = "\
                 ${PYTHON_SITEPACKAGES_DIR}/* \
 "
-- 
2.23.0


