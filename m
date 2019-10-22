Return-Path: <maciej.pijanowski@3mdeb.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2FE3E00C4F; Tue, 22 Oct 2019 08:38:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [46.105.41.146 listed in list.dnswl.org]
X-Greylist: delayed 2399 seconds by postgrey-1.32 at yocto-www;
	Tue, 22 Oct 2019 08:38:21 PDT
Received: from 1.mo68.mail-out.ovh.net (1.mo68.mail-out.ovh.net
	[46.105.41.146])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCA78E00571
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Oct 2019 08:38:21 -0700 (PDT)
Received: from player750.ha.ovh.net (unknown [10.108.42.174])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id A15A01440FF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Oct 2019 16:18:49 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player750.ha.ovh.net (Postfix) with ESMTPSA id 0FF08B3EF1EC;
	Tue, 22 Oct 2019 14:18:46 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 22 Oct 2019 16:18:32 +0200
Message-Id: <1571753912-14150-1-git-send-email-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.7.4
X-Ovh-Tracer-Id: 1137440382408994324
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgdejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Cc: piotr.krol@3mdeb.com
Subject: [m-c-s][PATCH] python-oauth2client: add python3 version
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
X-List-Received-Date: Tue, 22 Oct 2019 15:38:23 -0000

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 .../recipes-devtools/python/python-oauth2client.inc  | 18 ++++++++++++++++++
 .../python/python-oauth2client_4.1.2.bb              | 20 ++------------------
 .../python/python3-oauth2client_4.1.2.bb             |  2 ++
 3 files changed, 22 insertions(+), 18 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-oauth2client.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-oauth2client_4.1.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-oauth2client.inc b/meta-openstack/recipes-devtools/python/python-oauth2client.inc
new file mode 100644
index 000000000000..d91fc463a6d1
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-oauth2client.inc
@@ -0,0 +1,18 @@
+DESCRIPTION = "OAuth 2.0 client library"
+AUTHOR = "Google Inc."
+HOMEPAGE = "http://github.com/google/oauth2client/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=038e1390e94fe637991fa5569daa62bc"
+
+inherit pypi
+
+SRC_URI[md5sum] = "bc30976cd1e859cd6199264a50c5ba72"
+SRC_URI[sha256sum] = "bd3062c06f8b10c6ef7a890b22c2740e5f87d61b6e1f4b1c90d069cdfc9dadb5"
+
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-httplib2 \
+        ${PYTHON_PN}-pyasn1 \
+        ${PYTHON_PN}-pyasn1-modules \
+        ${PYTHON_PN}-rsa \
+        ${PYTHON_PN}-six \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-oauth2client_4.1.2.bb b/meta-openstack/recipes-devtools/python/python-oauth2client_4.1.2.bb
index db0452fe4c87..5622422c4c30 100644
--- a/meta-openstack/recipes-devtools/python/python-oauth2client_4.1.2.bb
+++ b/meta-openstack/recipes-devtools/python/python-oauth2client_4.1.2.bb
@@ -1,18 +1,2 @@
-DESCRIPTION = "OAuth 2.0 client library"
-AUTHOR = "Google Inc."
-HOMEPAGE = "http://github.com/google/oauth2client/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=038e1390e94fe637991fa5569daa62bc"
-
-inherit setuptools pypi
-
-SRC_URI[md5sum] = "bc30976cd1e859cd6199264a50c5ba72"
-SRC_URI[sha256sum] = "bd3062c06f8b10c6ef7a890b22c2740e5f87d61b6e1f4b1c90d069cdfc9dadb5"
-
-RDEPENDS_${PN} += " \
-        python-httplib2 \
-        python-pyasn1 \
-        python-pyasn1-modules \
-        python-rsa \
-        python-six \
-        "
+inherit setuptools
+require python-oauth2client.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-oauth2client_4.1.2.bb b/meta-openstack/recipes-devtools/python/python3-oauth2client_4.1.2.bb
new file mode 100644
index 000000000000..96508007b2f3
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-oauth2client_4.1.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-oauth2client.inc
-- 
2.7.4


