Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53B55E00BEF; Fri, 30 Mar 2018 02:28:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3F04E00BE9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Mar 2018 02:28:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38348153"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Mar 2018 17:28:49 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A6795486A78C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Mar 2018 17:28:47 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 30 Mar 2018 17:28:46 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 30 Mar 2018 17:28:40 +0800
Message-ID: <1522402120-7482-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522402120-7482-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1522402120-7482-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: A6795486A78C.A3D7F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH] python-wsme: 0.9.1 -> 0.9.2
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
X-List-Received-Date: Fri, 30 Mar 2018 09:28:54 -0000
Content-Type: text/plain

Upgrade python-wsme from 0.9.1 to 0.9.2.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-wsme_0.9.1.bb => python-wsme_0.9.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-wsme_0.9.1.bb => python-wsme_0.9.2.bb} (78%)

diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb b/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
similarity index 78%
rename from meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb
rename to meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
index 0016e63..59e1ddb 100644
--- a/meta-openstack/recipes-devtools/python/python-wsme_0.9.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
 
 PYPI_PACKAGE = "WSME"
 
-SRC_URI[md5sum] = "23b0269af3f4c1db8cfa35054703f0db"
-SRC_URI[sha256sum] = "afdd3ba14f815837239d6dead652de460bd61a869e39430b459be77d1a928197"
+SRC_URI[md5sum] = "f7ab1fecd5fa64f579d6ef3aabf38f60"
+SRC_URI[sha256sum] = "e790ac755a7e36eaa796d3966d3878677896dbc7d1c2685cb85c06b744c21976"
 
 inherit setuptools pypi
 
-- 
2.7.4




