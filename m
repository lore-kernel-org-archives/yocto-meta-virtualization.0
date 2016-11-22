Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90E88E00CF2; Tue, 22 Nov 2016 10:56:52 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 938FFE00CD8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 10:56:46 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAMIukpE018531
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 10:56:46 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 22 Nov 2016 10:56:45 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 22 Nov 2016 13:56:16 -0500
Message-ID: <1479840976-10540-5-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
References: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 4/4] dnsmasq: allow net interfaces to config their own dnsmasq instance
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
X-List-Received-Date: Tue, 22 Nov 2016 18:56:52 -0000
Content-Type: text/plain

This addition to dnsmasq allows an interface to define a dnsmasq
configuration file as /var/lib/dnsmasq/%i/dnsmasq.conf and have their
dnsmasq instance controlled via systemctl dnsmasq@%i.service (where
'%i' is the interface name).

To use this simply create the dnsmasq.conf file as above and enable
the systemd service like:

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-support/dnsmasq/dnsmasq/dnsmasq@.service | 12 ++++++++++++
 recipes-support/dnsmasq/dnsmasq_2.%.bbappend     | 16 ++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 recipes-support/dnsmasq/dnsmasq/dnsmasq@.service
 create mode 100644 recipes-support/dnsmasq/dnsmasq_2.%.bbappend

diff --git a/recipes-support/dnsmasq/dnsmasq/dnsmasq@.service b/recipes-support/dnsmasq/dnsmasq/dnsmasq@.service
new file mode 100644
index 0000000..9e36a36
--- /dev/null
+++ b/recipes-support/dnsmasq/dnsmasq/dnsmasq@.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=DHCP and DNS caching server for %i.
+After=network.target
+
+[Service]
+ExecStart=/usr/bin/dnsmasq -k --conf-file=/var/lib/dnsmasq/%i/dnsmasq.conf
+ExecReload=/bin/kill -HUP $MAINPID
+Restart=on-failure
+RestartSec=5
+
+[Install]
+WantedBy=multi-user.target
diff --git a/recipes-support/dnsmasq/dnsmasq_2.%.bbappend b/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
new file mode 100644
index 0000000..2acfd0c
--- /dev/null
+++ b/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
@@ -0,0 +1,16 @@
+# Allow individual network interfaces to easily configure
+# their own dnsmasq instance.
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += " \
+    file://dnsmasq@.service \
+    "
+
+do_install_append() {
+    install -d ${D}/${sysconfdir}/systemd
+    install -d ${D}/${sysconfdir}/systemd/system
+    install -m 644 ${WORKDIR}/dnsmasq@.service ${D}/${sysconfdir}/systemd/system/.
+}
+
+FILES_${PN} += "${sysconfdir}/systemd/system/dnsmasq@.service"
-- 
2.7.4


