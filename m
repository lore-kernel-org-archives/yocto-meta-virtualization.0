Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F1FFE00B7B; Fri, 31 Jul 2015 12:15:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E05CE00498
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 12:15:26 -0700 (PDT)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6VJFONK011568
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 12:15:24 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.85)
	(envelope-from <amy.fong@windriver.com>) id 1ZLFly-0000s3-1a
	for meta-virtualization@yoctoproject.org;
	Fri, 31 Jul 2015 15:15:14 -0400
Date: Fri, 31 Jul 2015 15:15:14 -0400
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Message-ID: <20150731191513.GA3297@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] oe-meta-go: fix dependency description
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
X-List-Received-Date: Fri, 31 Jul 2015 19:15:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 994526a353544e2f4b1a6d75dbb2b260110c8a07 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Fri, 31 Jul 2015 15:12:45 -0400
Subject: [PATCH] oe-meta-go: fix dependency description

Fix oe-meta-go dependency entry in README file

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 README | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/README b/README
index beb3760..778323b 100644
--- a/README
+++ b/README
@@ -20,7 +20,10 @@ layers: meta-oe
 	meta-networking
         meta-filesystems
         meta-python
-        oe-meta-go
+
+URI: git://github.com/errordeveloper/oe-meta-go.git
+branch: master
+revision: HEAD
 
 BBFILE_PRIORITY_openembedded-layer = "4"
 
-- 
2.4.6


