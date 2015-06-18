Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 466D9E00A65; Thu, 18 Jun 2015 13:10:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDB87E00957
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Jun 2015 13:10:51 -0700 (PDT)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5IKAnr4011980
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Thu, 18 Jun 2015 13:10:50 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.85)
	(envelope-from <amy.fong@windriver.com>)
	id 1Z5g8r-00071K-Az; Thu, 18 Jun 2015 16:10:29 -0400
Date: Thu, 18 Jun 2015 16:10:29 -0400
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org, amy.fong@windriver.com
Message-ID: <20150618201029.GA26966@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] seabios fails to build when ccache enabled
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
X-List-Received-Date: Thu, 18 Jun 2015 20:10:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From eadb837b8467af26a7370427e4cb98ccad63c670 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Wed, 17 Jun 2015 16:40:25 -0400
Subject: [PATCH] seabios fails to build when ccache enabled

HOSTCC needs to be quoted since it may have whitespace values.
(as in the case when ccache is enabled)

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-extended/seabios/seabios_1.7.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/seabios/seabios_1.7.5.bb b/recipes-extended/seabios/seabios_1.7.5.bb
index 511578f..d57e250 100644
--- a/recipes-extended/seabios/seabios_1.7.5.bb
+++ b/recipes-extended/seabios/seabios_1.7.5.bb
@@ -23,7 +23,7 @@ FILES_${PN} = "/usr/share/firmware"
 DEPENDS = "util-linux-native file-native bison-native flex-native gettext-native iasl-native python-native"
 
 TUNE_CCARGS = ""
-EXTRA_OEMAKE += "HOSTCC=${BUILD_CC}"
+EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
 EXTRA_OEMAKE += "CROSS_PREFIX=${TARGET_PREFIX}"
 
 do_configure() {
-- 
2.1.4


