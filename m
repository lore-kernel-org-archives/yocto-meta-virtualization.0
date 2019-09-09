Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 752BAE00DAA; Sun,  8 Sep 2019 23:39:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A926E003C1
	for <meta-virtualization@yoctoproject.org>;
	Sun,  8 Sep 2019 23:39:18 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x896dGXc000325
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 8 Sep 2019 23:39:17 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 8 Sep 2019 23:39:15 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 9 Sep 2019 14:39:13 +0800
Message-ID: <1568011154-291249-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-openstack][PATCH 1/2] layer.conf: remove preferred version for python-futures
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
X-List-Received-Date: Mon, 09 Sep 2019 06:39:19 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

preferred version 3.0.3 is not aligned with current version
under meta-openstack 3.3.0

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-openstack/conf/layer.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index d8a4db8..903b408 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -25,7 +25,6 @@ LAYERDEPENDS_openstack-layer = " \
 PREFERRED_VERSION_python-greenlet = "0.4.5"
 PREFERRED_VERSION_python-sqlalchemy = "1.0.8"
 PREFERRED_VERSION_python-pexpect = "3.3"
-PREFERRED_VERSION_python-futures = "3.0.3%"
 PREFERRED_VERSION_python-django = "1.8.6"
 PREFERRED_VERSION_python-netaddr = "0.7.19"
 PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
-- 
2.7.4


