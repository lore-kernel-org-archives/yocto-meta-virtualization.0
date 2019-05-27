Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3A81E008F2; Sun, 26 May 2019 22:23:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1BE02E006D2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 May 2019 22:23:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.60,517,1549900800"; d="scan'208";a="64758047"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 May 2019 13:23:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8E18B4CDBF48
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 May 2019 13:23:42 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 27 May 2019 13:23:47 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 May 2019 13:24:42 +0800
Message-ID: <20190527052442.28162-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 8E18B4CDBF48.ABAAB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-posix-ipc:upgrade 1.0.0 -> 1.0.4
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
X-List-Received-Date: Mon, 27 May 2019 05:23:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-posix-ipc_1.0.0.bb to python-posix-ipc_1.0.4.bb.

-License-Update: Copyright year updated to 2018.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...{python-posix-ipc_1.0.0.bb => python-posix-ipc_1.0.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-posix-ipc_1.0.0.bb => python-posix-ipc_1.0.4.bb} (72%)

diff --git a/meta-openstack/recipes-devtools/python/python-posix-ipc_1.0.0.bb b/meta-openstack/recipes-devtools/python/python-posix-ipc_1.0.4.bb
similarity index 72%
rename from meta-openstack/recipes-devtools/python/python-posix-ipc_1.0.0.bb
rename to meta-openstack/recipes-devtools/python/python-posix-ipc_1.0.4.bb
index 0b344c1..f1494d1 100644
--- a/meta-openstack/recipes-devtools/python/python-posix-ipc_1.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-posix-ipc_1.0.4.bb
@@ -2,15 +2,15 @@ DESCRIPTION = "POSIX IPC primitives (semaphores, shared memory and message queue
 HOMEPAGE = "http://semanchuk.com/philip/posix_ipc/"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d92bb5439aee694c0a87bfb51579e37b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dc089fb2f37e90799a54c19a20c9880f"
 
 PYPI_PACKAGE = "posix_ipc"
 
 # Archived version so we need to overwrite what the pypi class will derive
 PYPI_SRC_URI = "https://pypi.python.org/packages/source/p/${PYPI_PACKAGE}/${PYPI_PACKAGE}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "85607a392087715ac3a3c7ded2492d06"
-SRC_URI[sha256sum] = "9c93070374ca672725575e5c9874930c8cde69367fb90378b2255e048e31efcb"
+SRC_URI[md5sum] = "c4fd0065244ccb2f59cb8ceedf287cf6"
+SRC_URI[sha256sum] = "ff6c9077633fc62a491d6997c43b094d885bb45a7ca1f36c9a0d647c54b74b14"
 
 inherit setuptools pypi
 
-- 
2.20.1




