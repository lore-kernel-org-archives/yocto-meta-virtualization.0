Return-Path: <adrian.ratiu@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F6E7E00B5C; Tue,  2 Feb 2016 04:10:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS, TVD_SPACE_RATIO,
	TVD_SPACE_RATIO_MINFP autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [130.164.80.23 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
	*  2.7 TVD_SPACE_RATIO_MINFP TVD_SPACE_RATIO_MINFP
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76FCAE00AD8
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Feb 2016 04:10:47 -0800 (PST)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u12BfGGt023830 for <meta-virtualization@yoctoproject.org>;
	Tue, 2 Feb 2016 05:41:16 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020205411597-550091 ;
	Tue, 2 Feb 2016 05:41:15 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 2 Feb 2016 13:40:51 +0200
Message-Id: <bdcab133a78c52ebbe33e55b8027e1740ae4cb67.1454413132.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/02/2016 05:41:16 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/02/2016 05:41:16 AM,
	Serialize complete at 02/02/2016 05:41:16 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-02_08:, , signatures=0
Subject: [meta-cloud-services][PATCH 1/6] openssh: update 6.% -> 7.%
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
X-List-Received-Date: Tue, 02 Feb 2016 12:10:49 -0000

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../recipes-connectivity/openssh/openssh_6.%.bbappend         | 11 -----------
 .../recipes-connectivity/openssh/openssh_7.%.bbappend         | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-openstack/recipes-connectivity/openssh/openssh_6.%.bbappend
 create mode 100644 meta-openstack/recipes-connectivity/openssh/openssh_7.%.bbappend

diff --git a/meta-openstack/recipes-connectivity/openssh/openssh_6.%.bbappend b/meta-openstack/recipes-connectivity/openssh/openssh_6.%.bbappend
deleted file mode 100644
index bfc543a..0000000
--- a/meta-openstack/recipes-connectivity/openssh/openssh_6.%.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
-SRC_URI += "file://mcs-sshd"
-SRC_URI += "file://mcs-sshd_config"
-
-do_install_append() {
-    if ${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
-        install -D -m 644 ${WORKDIR}/mcs-sshd ${D}/etc/pam.d/sshd
-        install -D -m 644 ${WORKDIR}/mcs-sshd_config ${D}/etc/ssh/sshd_config
-    fi
-}
diff --git a/meta-openstack/recipes-connectivity/openssh/openssh_7.%.bbappend b/meta-openstack/recipes-connectivity/openssh/openssh_7.%.bbappend
new file mode 100644
index 0000000..bfc543a
--- /dev/null
+++ b/meta-openstack/recipes-connectivity/openssh/openssh_7.%.bbappend
@@ -0,0 +1,11 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://mcs-sshd"
+SRC_URI += "file://mcs-sshd_config"
+
+do_install_append() {
+    if ${@base_contains('DISTRO_FEATURES', 'OpenLDAP', 'true', 'false', d)}; then
+        install -D -m 644 ${WORKDIR}/mcs-sshd ${D}/etc/pam.d/sshd
+        install -D -m 644 ${WORKDIR}/mcs-sshd_config ${D}/etc/ssh/sshd_config
+    fi
+}
-- 
2.7.0


