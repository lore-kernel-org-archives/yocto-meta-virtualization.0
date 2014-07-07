Return-Path: <Alexandru.Vaduva@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ABAB6E006B7; Mon,  7 Jul 2014 06:53:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 2D2FBE0056D
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Jul 2014 06:53:33 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Mon, 7 Jul 2014
	15:53:31 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4470)	id 1FCCB288F30;
	Mon,  7 Jul 2014 15:53:31 +0200 (CEST)
From: Alexandru.Vaduva <Alexandru.Vaduva@enea.com>
To: <meta-virtualization@yoctoproject.org>
Message-ID: <1404741209-8765-1-git-send-email-Alexandru.Vaduva@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: Alexandru.Vaduva@enea.com does not
	designate permitted sender hosts)
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Subject: [PATCH 1/1] multipath-tools: added support for autotools-brokensep.
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
Date: Mon, 07 Jul 2014 13:53:46 -0000
X-Original-Date: Mon, 7 Jul 2014 15:53:29 +0200
X-List-Received-Date: Mon, 07 Jul 2014 13:53:46 -0000
Content-Type: text/plain

Separed build dir caused problem, the autotools support needs fixing.

Signed-off-by: Alexandru.Vaduva <Alexandru.Vaduva@enea.com>
---
 recipes-extended/multipath-tools/multipath-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/multipath-tools/multipath-tools_git.bb b/recipes-extended/multipath-tools/multipath-tools_git.bb
index 633b9f2..e2076d3 100644
--- a/recipes-extended/multipath-tools/multipath-tools_git.bb
+++ b/recipes-extended/multipath-tools/multipath-tools_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http"
 SRCREV = "d3683ab18b386e9b3b54b59a122c689e9ebdf5cf"
 PV = "0.4.9+gitr${SRCPV}"
 
-inherit autotools
+inherit autotools-brokensep
 
 EXTRA_OEMAKE="LIB=${libdir} exec_prefix=${exec_prefix} libdir=${libdir}"
 
-- 
1.9.1


