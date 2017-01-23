Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D7F5E00828; Sun, 22 Jan 2017 21:05:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75780E00805
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jan 2017 21:05:11 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14997278"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jan 2017 13:05:08 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 19DBE47B1510
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 13:05:03 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 23 Jan 2017 13:05:07 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 23 Jan 2017 13:04:46 +0800
Message-ID: <1485147886-6043-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 19DBE47B1510.A3E96
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] python-lockfile: 0.10.2 -> 0.12.2
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
X-List-Received-Date: Mon, 23 Jan 2017 05:05:14 -0000
Content-Type: text/plain

Upgrade python-lockfile from 0.10.2 to 0.12.2.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-lockfile_0.10.2.bb => python-lockfile_0.12.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-lockfile_0.10.2.bb => python-lockfile_0.12.2.bb} (79%)

diff --git a/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb b/meta-openstack/recipes-devtools/python/python-lockfile_0.12.2.bb
similarity index 79%
rename from meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb
rename to meta-openstack/recipes-devtools/python/python-lockfile_0.12.2.bb
index 9ba93df..98f2f98 100644
--- a/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-lockfile_0.12.2.bb
@@ -8,8 +8,8 @@ SRCNAME = "lockfile"
 
 SRC_URI = "https://pypi.python.org/packages/source/l/lockfile/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1aa6175a6d57f082cd12e7ac6102ab15"
-SRC_URI[sha256sum] = "9e42252f17d1dd89ee31745e0c4fbe58862c25147eb0ef5295c9cd9bcb4ea2c1"
+SRC_URI[md5sum] = "a6a1a82957a23afdf44cfdd039b65ff9"
+SRC_URI[sha256sum] = "6aed02de03cba24efabcd600b30540140634fc06cfa603822d508d5361e9f799"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




