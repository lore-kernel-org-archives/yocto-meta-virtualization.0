Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98635E00B76; Fri, 11 Dec 2015 09:28:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BAA27E00B76
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 09:28:29 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBBHSSMf022365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 09:28:28 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 11 Dec 2015 09:28:28 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 11 Dec 2015 12:28:25 -0500
Message-ID: <1449854905-22308-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449854905-22308-1-git-send-email-mark.asselstine@windriver.com>
References: <1449854905-22308-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 3/3] openvswitch: enable systemd support
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
X-List-Received-Date: Fri, 11 Dec 2015 17:28:30 -0000
Content-Type: text/plain

Make the necessary updates to get openvswitch to be compatible with
systemd. Up to now if you built a systemd supported image openvswitch
was using the systemd sysvinit wrappers, by making these changes we
now support systemd natively.

Note that there is no equivalent systemd support for
openvswitch-testcontroller. Following the lead of upstream this
is not something that should be run by the init system.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-networking/openvswitch/openvswitch.inc | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
index 13c7d06..fc515e9 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -61,13 +61,21 @@ FILES_${PN}-brcompat = "${sbindir}/ovs-brcompatd"
 FILES_${PN}-switch = "\
 	${sysconfdir}/init.d/openvswitch-switch \
 	${sysconfdir}/default/openvswitch-switch \
+	${systemd_unitdir}/system/openvswitch.service \
+	${systemd_unitdir}/system/openvswitch-nonetwork.service \
 	"
 
 # silence a warning
 FILES_${PN} += "${datadir}/ovsdbmonitor"
 FILES_${PN} += "/run"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d systemd
+
+SYSTEMD_PACKAGES = "${PN}-switch"
+SYSTEMD_SERVICE_${PN}-switch = " \
+    openvswitch-nonetwork.service \
+    openvswitch-switch.service \
+"
 
 INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-testcontroller"
 INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
@@ -87,7 +95,11 @@ do_install_append() {
 	install -m 755 ${WORKDIR}/openvswitch-switch ${D}/${sysconfdir}/init.d/openvswitch-switch
 	true || rm -fr ${D}/${datadir}/${PN}/pki
 
-	install -d ${D}/${sysconfdir}/init.d/
+	install -d ${D}/${systemd_unitdir}/system/
+	install -m 644 ${S}/rhel/usr_lib_systemd_system_openvswitch.service \
+		${D}/${systemd_unitdir}/system/openvswitch-switch.service
+	install -m 644 ${S}/rhel/usr_lib_systemd_system_openvswitch-nonetwork.service \
+		${D}/${systemd_unitdir}/system/openvswitch-nonetwork.service
 
 	oe_runmake modules_install INSTALL_MOD_PATH=${D}
 }
-- 
2.1.4


