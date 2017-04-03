Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56BFFE00AD5; Mon,  3 Apr 2017 03:27:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [217.70.183.198 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 3372 seconds by postgrey-1.32 at yocto-www;
	Mon, 03 Apr 2017 03:27:17 PDT
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
	[217.70.183.198])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22952E00A4C
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Apr 2017 03:27:17 -0700 (PDT)
Received: from mfilter33-d.gandi.net (mfilter33-d.gandi.net [217.70.178.164])
	by relay6-d.mail.gandi.net (Postfix) with ESMTP id 26DBDFB8CE;
	Mon,  3 Apr 2017 12:27:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter33-d.gandi.net
Received: from relay6-d.mail.gandi.net ([IPv6:::ffff:217.70.183.198])
	by mfilter33-d.gandi.net (mfilter33-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id DQbzrH68oq4O; Mon,  3 Apr 2017 12:27:15 +0200 (CEST)
X-Originating-IP: 82.34.23.153
Received: from host0.betafive.co.uk
	(cpc116908-shep14-2-0-cust920.8-3.cable.virginm.net [82.34.23.153])
	(Authenticated sender: noreply@paulbarker.me.uk)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8E756FB8DB;
	Mon,  3 Apr 2017 12:27:15 +0200 (CEST)
Received: by host0.betafive.co.uk (Postfix, from userid 2525)
	id AF458416B17A; Mon,  3 Apr 2017 11:27:14 +0100 (BST)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  3 Apr 2017 11:27:10 +0100
Message-Id: <20170403102713.1536-2-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170403102713.1536-1-pbarker@toganlabs.com>
References: <20170403102713.1536-1-pbarker@toganlabs.com>
Subject: [PATCH 1/4] netns: Update to latest HEAD
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
X-List-Received-Date: Mon, 03 Apr 2017 10:27:20 -0000

There have been a couple of fixes and new features upstream, let's bring
them in. The upstream URL has also changed slightly.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 recipes-networking/netns/netns_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
index 470dfac..f41ff70 100644
--- a/recipes-networking/netns/netns_git.bb
+++ b/recipes-networking/netns/netns_git.bb
@@ -3,8 +3,8 @@ SUMMARY = "Runc hook for setting up default bridge networking."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20ce4c6a4f32d6ee4a68e3a7506db3f1"
 
-SRC_URI = "git://github.com/jfrazelle/netns;branch=master"
-SRCREV = "2804050eeab661bfa75c3aa06bdcf60273b02ca7"
+SRC_URI = "git://github.com/jessfraz/netns;branch=master"
+SRCREV = "85b1ab9fcccbaa404a2636b52a48bbde02437cf7"
 PV = "0.1.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
@@ -23,8 +23,8 @@ do_compile() {
 	# We also need to link in the ipallocator directory as that is not under
 	# a src directory.
 	ln -sfn . "${S}/vendor/src"
-	mkdir -p "${S}/vendor/src/github.com/jfrazelle/netns"
-	ln -sfn "${S}/ipallocator" "${S}/vendor/src/github.com/jfrazelle/netns/ipallocator"
+	mkdir -p "${S}/vendor/src/github.com/jessfraz/netns"
+	ln -sfn "${S}/ipallocator" "${S}/vendor/src/github.com/jessfraz/netns/ipallocator"
 	export GOPATH="${S}/vendor"
 
 	# Pass the needed cflags/ldflags so that cgo
-- 
2.11.0


