Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77055E00AE6; Mon, 21 Oct 2019 00:58:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 150DFE00874
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Oct 2019 00:58:37 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.67,322,1566835200"; d="scan'208";a="77266046"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Oct 2019 15:58:36 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 0F4CA40925DD
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Oct 2019 15:50:41 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 21 Oct 2019 15:58:34 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 21 Oct 2019 15:58:45 +0800
Message-ID: <20191021075845.22601-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 0F4CA40925DD.AC9F2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-designateclient: upgrade 2.7.0 -> 3.0.0
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
X-List-Received-Date: Mon, 21 Oct 2019 07:58:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The latest version cannot be found in branch stable/pike,so switch to master.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-designateclient_git.bb           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-designateclient_git.bb b/meta-openstack/recipes-devtools/python/python-designateclient_git.bb
index a6f7cbf..42efb08 100644
--- a/meta-openstack/recipes-devtools/python/python-designateclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-designateclient_git.bb
@@ -28,10 +28,10 @@ RDEPENDS_${PN} += " \
         "
 
 SRCNAME = "designateclient"
-SRC_URI = "git://github.com/openstack/${BPN}.git;branch=stable/pike"
+SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
 
-PV = "2.7.0+git${SRCPV}"
-SRCREV = "77a705857f2c303a03fdbccd4460a68b61d92fd0"
+PV = "3.0.0+git${SRCPV}"
+SRCREV = "093d8d7170cbf6ef8c7a7c0ff2a4dcd7ecd6361b"
 S = "${WORKDIR}/git"
 
 inherit setuptools
-- 
2.7.4




