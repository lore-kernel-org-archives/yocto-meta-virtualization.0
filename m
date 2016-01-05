Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4575E00CFE; Mon,  4 Jan 2016 18:09:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D13A2E00805
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 Jan 2016 18:09:16 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2213349"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jan 2016 10:09:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id BB53C41887FB
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Jan 2016 10:08:59 +0800 (CST)
Received: from localhost.localdomain (10.167.226.98) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 5 Jan 2016 10:12:31 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 5 Jan 2016 05:08:50 +0300
Message-ID: <1451959730-3485-2-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1451959730-3485-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <CAPuovEJA6me_M0qtm1EeN=WnzrcOZ-GwfNtHBsEym-gAKRkYng@mail.gmail.com>
	<1451959730-3485-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.98]
X-yoursite-MailScanner-ID: BB53C41887FB.A0B74
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
Subject: [m-c-s][PATCH 2/2] python-jsonschema: Error Fix
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
X-List-Received-Date: Tue, 05 Jan 2016 02:09:18 -0000
Content-Type: text/plain

python-jsonschema depends on python-vcversioner,
And will download modules vcversioner in the step of do_compile.
If your network is not very well,errors will occur as following:
  Download error on https://pypi.python.org/simple/vcversioner/:
  [Errno -5] No address associated with hostname -- Some packages may not be found!
  Couldn't find index page for 'vcversioner' (maybe misspelled?)
  No local packages or download links found for vcversioner

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb b/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
index a3a7ec0..c0b342e 100644
--- a/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
@@ -17,3 +17,10 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 inherit setuptools
 
 DEPENDS += "python-vcversioner"
+
+do_compile_prepend() {
+    install -d ${S}/.eggs
+    if [ -f ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/vcversioner*.egg ]; then
+        install -m 0644 ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/vcversioner*.egg ${S}/.eggs/
+    fi
+}
-- 
1.8.4.2




