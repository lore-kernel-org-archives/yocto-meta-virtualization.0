Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F3B4E00AE6; Mon,  3 Apr 2017 03:27:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [217.70.183.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
	[217.70.183.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2CC3E00A9A
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Apr 2017 03:27:47 -0700 (PDT)
Received: from mfilter26-d.gandi.net (mfilter26-d.gandi.net [217.70.178.154])
	by relay3-d.mail.gandi.net (Postfix) with ESMTP id B92CAA80C4;
	Mon,  3 Apr 2017 12:27:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter26-d.gandi.net
Received: from relay3-d.mail.gandi.net ([IPv6:::ffff:217.70.183.195])
	by mfilter26-d.gandi.net (mfilter26-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id h7JznFf28y_r; Mon,  3 Apr 2017 12:27:45 +0200 (CEST)
X-Originating-IP: 82.34.23.153
Received: from host0.betafive.co.uk
	(cpc116908-shep14-2-0-cust920.8-3.cable.virginm.net [82.34.23.153])
	(Authenticated sender: noreply@paulbarker.me.uk)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4C1A5A80E4;
	Mon,  3 Apr 2017 12:27:45 +0200 (CEST)
Received: by host0.betafive.co.uk (Postfix, from userid 2525)
	id B77B1416B190; Mon,  3 Apr 2017 11:27:14 +0100 (BST)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  3 Apr 2017 11:27:12 +0100
Message-Id: <20170403102713.1536-4-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170403102713.1536-1-pbarker@toganlabs.com>
References: <20170403102713.1536-1-pbarker@toganlabs.com>
Cc: Paul Barker <paul@paulbarker.me.uk>
Subject: [PATCH 3/4] runc-opencontainers: Drop unnecessary branch spec from SRC_URI
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
X-List-Received-Date: Mon, 03 Apr 2017 10:27:48 -0000

From: Paul Barker <paul@paulbarker.me.uk>

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 recipes-containers/runc/runc-opencontainers_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 4a6e8cd..139e3bd 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,8 +1,7 @@
 include runc.inc
 
 SRCREV = "75f8da7c889acc4509a0cf6f0d3a8f9584778375"
-SRC_URI = "git://github.com/opencontainers/runc;branch=master \
-          "
+SRC_URI = "git://github.com/opencontainers/runc"
 RUNC_VERSION = "1.0.0-rc3"
 PROVIDES += "virtual/runc"
 RPROVIDES_${PN} = "virtual/runc"
-- 
2.11.0


