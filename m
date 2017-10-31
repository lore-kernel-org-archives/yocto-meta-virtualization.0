Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 76AC7E00CA6; Mon, 30 Oct 2017 22:43:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B57A9E00C62
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Oct 2017 22:43:31 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="29762107"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Oct 2017 13:43:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4D4494818482
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Oct 2017 13:43:29 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 31 Oct 2017 13:43:26 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 31 Oct 2017 13:43:25 +0800
Message-ID: <1509428605-885-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 4D4494818482.A4AD0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH]python-happybase: upgrade to 1.1.0
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
X-List-Received-Date: Tue, 31 Oct 2017 05:43:32 -0000
Content-Type: text/plain

Upgrade python-happybase 1.0.0 to 1.1.0.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../python/{python-happybase_1.0.0.bb => python-happybase_1.1.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-happybase_1.0.0.bb => python-happybase_1.1.0.bb} (64%)

diff --git a/meta-openstack/recipes-devtools/python/python-happybase_1.0.0.bb b/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
similarity index 64%
rename from meta-openstack/recipes-devtools/python/python-happybase_1.0.0.bb
rename to meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
index 669a9cf..03ebd14 100644
--- a/meta-openstack/recipes-devtools/python/python-happybase_1.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-happybase_1.1.0.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=41f55ae3d7000e4323e84c468d8b42ee"
 PR = "r0"
 SRCNAME = "happybase"
 
-SRC_URI = "https://pypi.python.org/packages/e8/6e/21ec2ff3f14084b2247e59dba89aecf115d1093a5256a343a7b158984b7f/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/8d/a4/9c1202ad4276d4e845594d534397c07082b90aee68c67f378fac38629e6f/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1274e74df553bbf800989578b7dfbe59"
-SRC_URI[sha256sum] = "cee5f62735c6ba95c8f842decfd23bab5a07bc16cd0c5374f7461c975d4c608c"
+SRC_URI[md5sum] = "62a09c784a65161e9f5f01129d115457"
+SRC_URI[sha256sum] = "e20376e2e32291798d2226502994134c1c4e175136d8375b3c517a234fa22481"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4




