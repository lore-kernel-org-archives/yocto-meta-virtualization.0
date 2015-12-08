Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35559E00BB9; Tue,  8 Dec 2015 09:34:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id C20C2E00BB7
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:07 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:06 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:18 +0100
Message-ID: <1449596034-8308-7-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 06/42] python-repoze.lru: add new recipe
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

It's required by python-routes.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../recipes-devtools/python/python-repoze.lru_0.6.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb

diff --git a/meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb b/meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb
new file mode 100644
index 0000000..60a749f
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A tiny LRU cache implementation and decorator"
+DESCRIPTION = "repoze.lru is a LRU (least recently used) cache implementation. \
+Keys and values that are not used frequently will be evicted from the cache faster \
+than keys and values that are used frequently. \
+"
+HOMEPAGE = "https://pypi.python.org/pypi/repoze.lru"
+SECTION = "devel/python"
+LICENSE = "BSD-derived"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c33cdbc6bc9ae6e5d64152fdb754292"
+
+SRCNAME = "repoze.lru"
+
+SRC_URI = "http://pypi.python.org/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "2c3b64b17a8e18b405f55d46173e14dd"
+SRC_URI[sha256sum] = "0f7a323bf716d3cb6cb3910cd4fccbee0b3d3793322738566ecce163b01bbd31"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
-- 
2.5.0


