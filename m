Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7DAB1E00992; Tue, 17 Jan 2017 21:13:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9859E0098A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 21:13:17 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14865778"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jan 2017 13:13:09 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3828947B0CB2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jan 2017 13:13:10 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 18 Jan 2017 13:13:10 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 18 Jan 2017 13:13:02 +0800
Message-ID: <1484716382-28313-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 3828947B0CB2.A573D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services] [PATCH] python-happybase: 0.9 -> 1.0.0
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
X-List-Received-Date: Wed, 18 Jan 2017 05:13:20 -0000
Content-Type: text/plain

Upgrade python-happybase from 0.9 to 1.0.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-happybase_0.9.bb => python-happybase_1.0.0.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-happybase_0.9.bb => python-happybase_1.0.0.bb} (63%)

diff --git a/meta-openstack/recipes-devtools/python/python-happybase_0.9.bb b/meta-openstack/recipes-devtools/python/python-happybase_1.0.0.bb
similarity index 63%
rename from meta-openstack/recipes-devtools/python/python-happybase_0.9.bb
rename to meta-openstack/recipes-devtools/python/python-happybase_1.0.0.bb
index b37907c..669a9cf 100644
--- a/meta-openstack/recipes-devtools/python/python-happybase_0.9.bb
+++ b/meta-openstack/recipes-devtools/python/python-happybase_1.0.0.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=41f55ae3d7000e4323e84c468d8b42ee"
 PR = "r0"
 SRCNAME = "happybase"
 
-SRC_URI = "https://pypi.python.org/packages/source/h/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/e8/6e/21ec2ff3f14084b2247e59dba89aecf115d1093a5256a343a7b158984b7f/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0d9ca6e22a7edb03ccd75e99d0acf1ea"
-SRC_URI[sha256sum] = "744e342936f6c9e384b203435c38ff21a339626a0d7c11aa177988b5e164ef2a"
+SRC_URI[md5sum] = "1274e74df553bbf800989578b7dfbe59"
+SRC_URI[sha256sum] = "cee5f62735c6ba95c8f842decfd23bab5a07bc16cd0c5374f7461c975d4c608c"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




