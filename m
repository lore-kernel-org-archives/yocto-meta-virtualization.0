Return-Path: <bogdan.purcareata@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F234E0076C; Thu,  2 Oct 2014 09:35:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.110.141 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* 1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0141.outbound.protection.outlook.com [157.56.110.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85CF4E00749
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 Oct 2014 09:35:11 -0700 (PDT)
Received: from BY2PR03CA077.namprd03.prod.outlook.com (10.141.249.50) by
	BN1PR03MB188.namprd03.prod.outlook.com (10.255.200.151) with Microsoft
	SMTP Server (TLS) id 15.0.1039.15; Thu, 2 Oct 2014 16:03:13 +0000
Received: from BY2FFO11FD005.protection.gbl (2a01:111:f400:7c0c::179) by
	BY2PR03CA077.outlook.office365.com (2a01:111:e400:2c5d::50) with
	Microsoft SMTP Server (TLS) id 15.0.1044.10 via Frontend Transport;
	Thu, 2 Oct 2014 16:03:12 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD005.mail.protection.outlook.com (10.1.14.126) with Microsoft
	SMTP Server (TLS) id 15.0.1029.15 via Frontend Transport;
	Thu, 2 Oct 2014 16:03:12 +0000
Received: from exile.ea.freescale.net (exile.ea.freescale.net [10.171.73.223])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s92G34s5006293; Thu, 2 Oct 2014 09:03:11 -0700
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 2 Oct 2014 19:01:18 -0400
Message-ID: <1412290878-18574-3-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1412290878-18574-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1412290878-18574-1-git-send-email-bogdan.purcareata@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(36756003)(92566001)(86362001)(99396003)(64706001)(48376002)(76176999)(62966002)(88136002)(92726001)(47776003)(15202345003)(85306004)(26826002)(15975445006)(44976005)(87936001)(50466002)(6806004)(10300001)(87286001)(120916001)(19580395003)(19580405001)(102836001)(21056001)(31966008)(50986999)(575784001)(68736004)(20776003)(84676001)(95666004)(76482002)(89996001)(97736003)(46102003)(2351001)(229853001)(93916002)(105606002)(106466001)(77156001)(104166001)(15395725005)(110136001)(33646002)(85852003)(50226001)(80022003)(107046002)(104016003)(4396001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR03MB188;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BN1PR03MB188;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Forefront-PRVS: 03524FBD26
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=bogdan.purcareata@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/2] lxc: fixup VPATH builds
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
X-List-Received-Date: Thu, 02 Oct 2014 16:35:18 -0000
Content-Type: text/plain

Rework patch 5b57bf462b41142deae0479c06f4da8e0b66bb7e [lxc: fixup VPATH builds]
since the new version of LXC refactored one of the files and it no longer
applies. Provide a fix for what's left.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 .../automake-ensure-VPATH-builds-correctly.patch   |   26 ++++++++++++++++++++
 recipes-containers/lxc/lxc_1.0.6.bb                |    1 +
 2 files changed, 27 insertions(+)
 create mode 100644 recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch

diff --git a/recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch b/recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch
new file mode 100644
index 0000000..2b5c853
--- /dev/null
+++ b/recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch
@@ -0,0 +1,26 @@
+From fe23085d9a40d6d78387d9ce8ddb65785fe8d6e5 Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Thu, 2 Oct 2014 18:31:50 -0400
+Subject: [PATCH] automake: ensure VPATH builds correctly
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+---
+ src/tests/Makefile.am |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tests/Makefile.am b/src/tests/Makefile.am
+index d74c10d..6225f78 100644
+--- a/src/tests/Makefile.am
++++ b/src/tests/Makefile.am
+@@ -66,7 +66,7 @@ buildtest-TESTS: $(TESTS)
+ install-ptest:
+ 	install -d $(TEST_DIR)
+ 	install -D ../lxc/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
+-	install -D ../../config/test-driver $(TEST_DIR)/../../config/test-driver
++	install -D $(top_srcdir)/config/test-driver $(TEST_DIR)/../../config/test-driver
+ 	cp Makefile $(TEST_DIR)
+ 	@(for file in $(TESTS); do install $$file $(TEST_DIR);  done;)
+ 	sed -i 's|^Makefile:|_Makefile:|' $(TEST_DIR)/Makefile
+-- 
+1.7.10.4
+
diff --git a/recipes-containers/lxc/lxc_1.0.6.bb b/recipes-containers/lxc/lxc_1.0.6.bb
index 5b1eb0a..2d384dd 100644
--- a/recipes-containers/lxc/lxc_1.0.6.bb
+++ b/recipes-containers/lxc/lxc_1.0.6.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
 	file://runtest.patch \
 	file://run-ptest \
+	file://automake-ensure-VPATH-builds-correctly.patch \
 	"
 SRC_URI[md5sum] = "4aad3aee84b42faa194e44091d723a3b"
 SRC_URI[sha256sum] = "fc6bffa750f00daaa92aa33d719c1cc235146aa779ebd2a64a0c24423977cf14"
-- 
1.7.10.4


