Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA698E00AA2; Fri, 20 Jan 2017 01:44:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C262E00A6B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 01:44:40 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14950074"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2017 17:44:35 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C0CE447B0CBF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 17:44:35 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 20 Jan 2017 17:44:36 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 20 Jan 2017 17:44:15 +0800
Message-ID: <1484905455-1488-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: C0CE447B0CBF.A9B53
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] python-routes: 1.13 -> 2.4.1
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
X-List-Received-Date: Fri, 20 Jan 2017 09:44:43 -0000
Content-Type: text/plain

1) Upgrade python-routes from 1.13 to 2.4.1.
2) Change the License file's name and checksum,since the license file is changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-routes_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-routes_git.bb b/meta-openstack/recipes-devtools/python/python-routes_git.bb
index 814339b..408f0a8 100644
--- a/meta-openstack/recipes-devtools/python/python-routes_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-routes_git.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "A Python re-implementation of the Rails routes system."
 HOMEPAGE = "http://routes.groovie.org"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=aa6285dc7b7c93b3905bb2757f33eb62"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=90976c1a0e3029278f882cfe2e84a6ae"
 
-PV = "1.13+git${SRCPV}"
-SRCREV = "467501d5fcfa265b3dfae615e7f0dcda8ce79d4e"
+PV = "2.4.1+git${SRCPV}"
+SRCREV = "2dcef8079cf09f427eeb0be62374f6c1a52bf59d"
 
 SRCNAME = "Routes"
 SRC_URI = "git://github.com/bbangert/routes.git"
-- 
2.7.4




