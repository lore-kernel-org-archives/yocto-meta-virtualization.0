Return-Path: <Wenlin.Kang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8CBD3E00CB0; Sat,  8 Oct 2016 00:17:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57D84E00C09
	for <meta-virtualization@yoctoproject.org>;
	Sat,  8 Oct 2016 00:17:06 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u987H4S7029885
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 8 Oct 2016 00:17:04 -0700 (PDT)
Received: from wind-k.wrs.com (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 8 Oct 2016 00:17:04 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sat, 8 Oct 2016 15:17:02 +0800
Message-ID: <1475911022-27159-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lxc: add glibc-utils to rdepend
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
X-List-Received-Date: Sat, 08 Oct 2016 07:17:12 -0000
Content-Type: text/plain

getent is needed by lxc-net of lxc, but current system misses it,
so add glibc-utils to lxc's rdepend, fix this issue.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 recipes-containers/lxc/lxc_2.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/lxc_2.0.0.bb
index e436057..53068a8 100644
--- a/recipes-containers/lxc/lxc_2.0.0.bb
+++ b/recipes-containers/lxc/lxc_2.0.0.bb
@@ -18,6 +18,7 @@ RDEPENDS_${PN} = " \
 		perl-module-constant \
 		perl-module-overload \
 		perl-module-exporter-heavy \
+		glibc-utils \
 "
 RDEPENDS_${PN}-ptest += "file make"
 
-- 
2.7.4


