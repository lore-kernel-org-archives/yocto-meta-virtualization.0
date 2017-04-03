Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 38594E00ADB; Mon,  3 Apr 2017 03:27:20 -0700 (PDT)
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
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
	[217.70.183.198])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23497E00AD0
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Apr 2017 03:27:17 -0700 (PDT)
Received: from mfilter32-d.gandi.net (mfilter32-d.gandi.net [217.70.178.163])
	by relay6-d.mail.gandi.net (Postfix) with ESMTP id 1247BFB8A3;
	Mon,  3 Apr 2017 12:27:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter32-d.gandi.net
Received: from relay6-d.mail.gandi.net ([IPv6:::ffff:217.70.183.198])
	by mfilter32-d.gandi.net (mfilter32-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id FbXLs25hY5y2; Mon,  3 Apr 2017 12:27:15 +0200 (CEST)
X-Originating-IP: 82.34.23.153
Received: from host0.betafive.co.uk
	(cpc116908-shep14-2-0-cust920.8-3.cable.virginm.net [82.34.23.153])
	(Authenticated sender: noreply@paulbarker.me.uk)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 529B5FB8CE;
	Mon,  3 Apr 2017 12:27:15 +0200 (CEST)
Received: by host0.betafive.co.uk (Postfix, from userid 2525)
	id BA25F416B191; Mon,  3 Apr 2017 11:27:14 +0100 (BST)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  3 Apr 2017 11:27:13 +0100
Message-Id: <20170403102713.1536-5-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170403102713.1536-1-pbarker@toganlabs.com>
References: <20170403102713.1536-1-pbarker@toganlabs.com>
Subject: [PATCH 4/4] cgroup-lite: Inherit allarch
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

This recipe just installs a pair of shell scripts.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 recipes-containers/cgroup-lite/cgroup-lite_1.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/cgroup-lite/cgroup-lite_1.11.bb b/recipes-containers/cgroup-lite/cgroup-lite_1.11.bb
index b3af6f4..065d0ea 100644
--- a/recipes-containers/cgroup-lite/cgroup-lite_1.11.bb
+++ b/recipes-containers/cgroup-lite/cgroup-lite_1.11.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://cgroups-init"
 SRC_URI[md5sum] = "b20976194ee8fdb61e6b55281fb6ead4"
 SRC_URI[sha256sum] = "a79ab9ae6fb3ff3ce0aa5539b055c0379eaffdc6c5f003af4010fcea683c1a45"
 
+inherit allarch
 inherit update-rc.d
 
 INITSCRIPT_NAME = "cgroups-init"
-- 
2.11.0


