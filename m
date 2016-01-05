Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ECA20E00CFD; Mon,  4 Jan 2016 18:01:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E011E00805
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 Jan 2016 18:01:57 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2212927"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jan 2016 10:01:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0F31641887FB
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Jan 2016 10:01:31 +0800 (CST)
Received: from localhost.localdomain (10.167.226.98) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 5 Jan 2016 10:05:03 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 5 Jan 2016 05:01:00 +0300
Message-ID: <1451959280-3349-2-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1451959280-3349-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <CAPuovEJA6me_M0qtm1EeN=WnzrcOZ-GwfNtHBsEym-gAKRkYng@mail.gmail.com>
	<1451959280-3349-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.98]
X-yoursite-MailScanner-ID: 0F31641887FB.AE12D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
Subject: [m-c-s][PATCH 01/21] python-pbr: Error fix for recipes depend on python-pbr
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
X-List-Received-Date: Tue, 05 Jan 2016 02:02:00 -0000
Content-Type: text/plain

If you bitbake recipes which depends on python-pbr such as
python-cryptography. And also your network is not very well.
Error will occur as following:
  Download error on https://pypi.python.org/simple/pbr/:
  [Errno -5] No address associated with hostname -- Some packages may not be found!
  Couldn't find index page for 'pbr' (maybe misspelled?)
  No local packages or download links found for pbr

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-pbr_1.4.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-pbr_1.4.0.bb b/meta-openstack/recipes-devtools/python/python-pbr_1.4.0.bb
index 273fdd4..98c76e6 100644
--- a/meta-openstack/recipes-devtools/python/python-pbr_1.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-pbr_1.4.0.bb
@@ -25,3 +25,13 @@ DEPENDS += " \
 # RDEPENDS_default:
 RDEPENDS_${PN} += " \
         "
+
+do_compile_append() {
+    export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS}
+    ${PYTHON} setup.py -q bdist_egg --dist-dir ./
+}
+
+do_install_append() {
+    install -m 0644 ${S}/*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
+}
+
-- 
1.8.4.2




