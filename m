Return-Path: <maciej.pijanowski@3mdeb.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D3E1E00C9B; Tue, 22 Oct 2019 07:24:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [46.105.53.132 listed in list.dnswl.org]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
X-Greylist: delayed 356 seconds by postgrey-1.32 at yocto-www;
	Tue, 22 Oct 2019 07:24:15 PDT
Received: from 6.mo178.mail-out.ovh.net (6.mo178.mail-out.ovh.net
	[46.105.53.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A840E00A93
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Oct 2019 07:24:15 -0700 (PDT)
Received: from player690.ha.ovh.net (unknown [10.109.143.24])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id DFF077CE43
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Oct 2019 16:18:17 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player690.ha.ovh.net (Postfix) with ESMTPSA id 3ED9BB277102;
	Tue, 22 Oct 2019 14:18:15 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 22 Oct 2019 16:17:52 +0200
Message-Id: <1571753872-13999-1-git-send-email-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.7.4
X-Ovh-Tracer-Id: 1128433185286598164
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgdejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Cc: piotr.krol@3mdeb.com
Subject: [m-c-s][PATCH] python-rsa: add python3 version
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
X-List-Received-Date: Tue, 22 Oct 2019 14:24:17 -0000

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 meta-openstack/recipes-devtools/python/python-rsa.inc     | 13 +++++++++++++
 .../recipes-devtools/python/python-rsa_3.4.2.bb           | 15 ++-------------
 .../recipes-devtools/python/python3-rsa_3.4.2.bb          |  2 ++
 3 files changed, 17 insertions(+), 13 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-rsa.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-rsa_3.4.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-rsa.inc b/meta-openstack/recipes-devtools/python/python-rsa.inc
new file mode 100644
index 000000000000..ccb65d5a4e89
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-rsa.inc
@@ -0,0 +1,13 @@
+SUMMARY = "Pure-Python RSA implementation"
+AUTHOR = "Sybren A. Stuvel"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
+
+inherit pypi
+
+SRC_URI[md5sum] = "b315f47882c24030ee6b5aad628cccdb"
+SRC_URI[sha256sum] = "25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5"
+
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-pyasn1 \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-rsa_3.4.2.bb b/meta-openstack/recipes-devtools/python/python-rsa_3.4.2.bb
index c7df0a8b644e..349e7cd97727 100644
--- a/meta-openstack/recipes-devtools/python/python-rsa_3.4.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-rsa_3.4.2.bb
@@ -1,13 +1,2 @@
-SUMMARY = "Pure-Python RSA implementation"
-AUTHOR = "Sybren A. Stuvel"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
-
-inherit setuptools pypi
-
-SRC_URI[md5sum] = "b315f47882c24030ee6b5aad628cccdb"
-SRC_URI[sha256sum] = "25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5"
-
-RDEPENDS_${PN} += " \
-        python-pyasn1 \
-        "
+inherit setuptools
+require python-rsa.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-rsa_3.4.2.bb b/meta-openstack/recipes-devtools/python/python3-rsa_3.4.2.bb
new file mode 100644
index 000000000000..2d6c93cee2dd
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-rsa_3.4.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-rsa.inc
-- 
2.7.4


