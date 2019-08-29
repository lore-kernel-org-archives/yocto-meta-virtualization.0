Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2690E00DF0; Thu, 29 Aug 2019 02:40:22 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89BA3E00D33
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 02:40:21 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7T9e0Y2025057
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 02:40:11 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 29 Aug 2019 02:39:49 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 29 Aug 2019 17:39:48 +0800
Message-ID: <20190829093948.2738-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] openvswitch: install ovs-systemd-reload
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
X-List-Received-Date: Thu, 29 Aug 2019 09:40:23 -0000
Content-Type: text/plain

Install ovs-systemd-reload as openvswitch.service uses it.

  openvswitch.service:ExecReload=/usr/share/openvswitch/scripts/ovs-systemd-reload

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-networking/openvswitch/openvswitch.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
index 8aab739..46865bd 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -129,6 +129,9 @@ do_install_append() {
 	install -m 644 ${S}/rhel/usr_lib_systemd_system_ovsdb-server.service \
 		${D}/${systemd_unitdir}/system/ovsdb-server.service
 
+	install -d ${D}/usr/share/openvswitch/scripts/
+	install -m 755 ${S}/rhel/usr_share_openvswitch_scripts_ovs-systemd-reload ${D}/usr/share/openvswitch/scripts/ovs-systemd-reload
+
 	oe_runmake modules_install INSTALL_MOD_PATH=${D}
 	install -d ${D}${libdir}/python${PYTHON_BASEVERSION}/site-packages
 	cp -r ${S}/python/ovstest/ ${D}${libdir}/python${PYTHON_BASEVERSION}/site-packages/
-- 
2.17.1


