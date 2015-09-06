Return-Path: <Jianchuan.Wang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1D0DE00CBF; Sat,  5 Sep 2015 23:52:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C337E00C46
	for <meta-virtualization@yoctoproject.org>;
	Sat,  5 Sep 2015 23:52:58 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t866qws6022747
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 5 Sep 2015 23:52:58 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Sat, 5 Sep 2015 23:52:57 -0700
From: <jianchuan.wang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sun, 6 Sep 2015 14:43:25 +0800
Message-ID: <1441521806-12787-2-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1441521806-12787-1-git-send-email-jianchuan.wang@windriver.com>
References: <1441521806-12787-1-git-send-email-jianchuan.wang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] irqbalance: add systemd support
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
X-List-Received-Date: Sun, 06 Sep 2015 06:52:59 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Add irqbalanced.service file for systemd support.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 recipes-extended/irqbalance/irqbalance.inc                 | 9 ++++++++-
 recipes-extended/irqbalance/irqbalance/irqbalanced.service | 9 +++++++++
 recipes-extended/irqbalance/irqbalance_1.0.6.bb            | 1 +
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/irqbalance/irqbalance/irqbalanced.service

diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
index 10265c9..53275d1 100644
--- a/recipes-extended/irqbalance/irqbalance.inc
+++ b/recipes-extended/irqbalance/irqbalance.inc
@@ -18,7 +18,10 @@ DEPENDS = "glib-2.0"
 INITSCRIPT_NAME = "irqbalanced"
 INITSCRIPT_PARAMS = "defaults"
 
-inherit autotools update-rc.d pkgconfig
+inherit autotools update-rc.d pkgconfig systemd
+
+SYSTEMD_PACKAGES = "irqbalance"
+SYSTEMD_SERVICE_irqbalance = "irqbalanced.service"
 
 EXTRA_OECONF = "--program-transform-name= \
 	       "
@@ -37,4 +40,8 @@ do_install () {
         install -d ${D}${sysconfdir}/init.d
         cat ${S}/irqbalance.init | sed -e's,/usr/sbin,${sbindir},g' > ${D}${sysconfdir}/init.d/irqbalanced
         chmod 755 ${D}${sysconfdir}/init.d/irqbalanced
+
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/irqbalanced.service ${D}${systemd_unitdir}/system
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/irqbalanced.service
 }
diff --git a/recipes-extended/irqbalance/irqbalance/irqbalanced.service b/recipes-extended/irqbalance/irqbalance/irqbalanced.service
new file mode 100644
index 0000000..5b284fa
--- /dev/null
+++ b/recipes-extended/irqbalance/irqbalance/irqbalanced.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=irqbalance daemon
+After=syslog.target
+
+[Service]
+ExecStart=@SBINDIR@/irqbalance --foreground
+
+[Install]
+WantedBy=multi-user.target
diff --git a/recipes-extended/irqbalance/irqbalance_1.0.6.bb b/recipes-extended/irqbalance/irqbalance_1.0.6.bb
index ed0249a..76c08a1 100644
--- a/recipes-extended/irqbalance/irqbalance_1.0.6.bb
+++ b/recipes-extended/irqbalance/irqbalance_1.0.6.bb
@@ -13,4 +13,5 @@ SRC_URI = "http://irqbalance.googlecode.com/files/irqbalance-${PV}.tar.gz \
            file://add-initscript.patch \
            file://irqbalance-Add-status-and-reload-commands.patch \
            file://fix-configure-libcap-ng.patch \
+           file://irqbalanced.service \
           "
-- 
1.9.1


