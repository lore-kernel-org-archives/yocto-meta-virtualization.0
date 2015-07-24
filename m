Return-Path: <Chris.Braga@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE35FE00A3C; Fri, 24 Jul 2015 12:52:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 561EDE00942
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 Jul 2015 12:52:00 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6OJpxvm000438
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 Jul 2015 12:51:59 -0700 (PDT)
Received: from yow-ovp2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 24 Jul 2015 12:51:48 -0700
From: Christopher Braga <chris.braga@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Message-ID: <1437767518-1829-2-git-send-email-chris.braga@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1437767518-1829-1-git-send-email-chris.braga@windriver.com>
References: <1437767518-1829-1-git-send-email-chris.braga@windriver.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:40 -0800
Subject: [PATCH 2/2] go-net uprev
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
Date: Fri, 24 Jul 2015 19:52:01 -0000
X-Original-Date: Fri, 24 Jul 2015 15:51:58 -0400
X-List-Received-Date: Fri, 24 Jul 2015 19:52:01 -0000
Content-Type: text/plain

Uprev go-net to acquire major library additions required for some packages.

Signed-off-by: Christopher Braga <chris.braga@windriver.com>
---
 recipes-devtools/go/go-net_hg.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-devtools/go/go-net_hg.bb b/recipes-devtools/go/go-net_hg.bb
index 9eff3ea..589860d 100644
--- a/recipes-devtools/go/go-net_hg.bb
+++ b/recipes-devtools/go/go-net_hg.bb
@@ -8,11 +8,11 @@ SRCNAME = "go.net"
 
 PKG_NAME = "code.google.com/p/${SRCNAME}"
 #SRC_URI = "hg://code.google.com/p;module=go.net"
-SRC_URI = "https://code.google.com/p/go.net_code.google.com_.p_84a4013f96e01fdd14b65d260a78b543e3702ee1.tar.gz"
+SRC_URI = "https://code.google.com/p/go.net_code.google.com_.p_937a34c9de13c766c814510f76bca091dee06028.tar.gz"
 
-#SRCREV = "84a4013f96e01fdd14b65d260a78b543e3702ee1"
-SRC_URI[md5sum] = "090610b237f6a3c92116bb5e0f994331"
-SRC_URI[sha256sum] = "c02f1b407cd388e3e5a7728092b3a50eab55f26627bee9d1f3e2e8373a7c058e"
+#SRCREV = "937a34c9de13c766c814510f76bca091dee06028"
+SRC_URI[md5sum] = "135570428770be62df1367a91bc1e9d0"
+SRC_URI[sha256sum] = "42b011afe50fc9131f09d84674a60af5a6186b492571d791d73d0715b74f2f09"
 
 S = "${WORKDIR}/${SRCNAME}"
 
-- 
2.1.4


