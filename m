Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8BAF6E00858; Tue,  7 Apr 2015 02:54:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63A4BE007A0
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Apr 2015 02:54:37 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t379sbVA021938
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 7 Apr 2015 02:54:37 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 7 Apr 2015 02:54:36 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 7 Apr 2015 17:54:35 +0800
Message-ID: <1428400475-29014-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] nodejs: remove the bbappend
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
X-List-Received-Date: Tue, 07 Apr 2015 09:54:43 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

nodejs has been updated to 0.12.0 and all bash scripts
are re-packaged in nodejs-npm which has the correct rdepends,
so this bbappend is no longer needed.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-openstack/recipes-devtools/nodejs/nodejs_0.8.18.bbappend | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 meta-openstack/recipes-devtools/nodejs/nodejs_0.8.18.bbappend

diff --git a/meta-openstack/recipes-devtools/nodejs/nodejs_0.8.18.bbappend b/meta-openstack/recipes-devtools/nodejs/nodejs_0.8.18.bbappend
deleted file mode 100644
index d98052a..0000000
--- a/meta-openstack/recipes-devtools/nodejs/nodejs_0.8.18.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-RDEPENDS_${PN} += " bash"
-- 
1.9.1


