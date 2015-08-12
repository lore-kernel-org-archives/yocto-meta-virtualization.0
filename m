Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24AC7E007B1; Wed, 12 Aug 2015 12:48:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B868AE007B1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Aug 2015 12:48:05 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7CJm4nR000685
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Aug 2015 12:48:04 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 12 Aug 2015 12:48:04 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 12 Aug 2015 15:47:58 -0400
Message-ID: <1439408879-8203-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439408879-8203-1-git-send-email-mark.asselstine@windriver.com>
References: <1439408879-8203-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org, mark.asselstine@windriver.com
Subject: [m-c-s][PATCH 2/3] glance: add new dependencies
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
X-List-Received-Date: Wed, 12 Aug 2015 19:48:09 -0000
Content-Type: text/plain

Attempting to run glance-api several python traces are
encountered. The following packages were identified in the traces and
as such are added as dependencies which allows glance-api to launch
successfully.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-glance_git.bb   |  5 +++-
 .../python/python-oslo.vmware_1.19.0.bb            | 24 +++++++++++++++++++
 .../python/python-semantic-version_2.4.2.bb        | 27 ++++++++++++++++++++++
 3 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.vmware_1.19.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-semantic-version_2.4.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-glance_git.bb b/meta-openstack/recipes-devtools/python/python-glance_git.bb
index ea189ef..79235af 100644
--- a/meta-openstack/recipes-devtools/python/python-glance_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glance_git.bb
@@ -197,7 +197,10 @@ RDEPENDS_${PN} += "python-greenlet \
 	python-oslo.i18n \
 	python-osprofiler \
 	python-retrying \
-        python-glancestore \
+	python-glancestore \
+	python-enum34 \
+	python-semantic-version \
+	python-oslo.vmware \
 	"
 
 RDEPENDS_${SRCNAME} = "${PN} \
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.vmware_1.19.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.vmware_1.19.0.bb
new file mode 100644
index 0000000..ace65ba
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-oslo.vmware_1.19.0.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "oslo.vmware library"
+HOMEPAGE = "http://launchpad.net/oslo"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
+
+
+SRCNAME = "oslo.vmware"
+SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "3115d6922ed7119cf3737af708a7984d"
+SRC_URI[sha256sum] = "d342420fa272bd80ac9c39e876ee1a518b975d21cff1c179a91da48305c9b3b4"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+        python-pbr \
+        "
+
+RDEPENDS_${PN} += " \
+        "
diff --git a/meta-openstack/recipes-devtools/python/python-semantic-version_2.4.2.bb b/meta-openstack/recipes-devtools/python/python-semantic-version_2.4.2.bb
new file mode 100644
index 0000000..746d646
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-semantic-version_2.4.2.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "A library which provides a few tools to handle SemVer in Python."
+HOMEPAGE = "http://pypi.python.org/pypi/semantic_version"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a7dcaa0740d59f8f13ef05a3d0ed7313"
+
+SRCNAME = "semantic_version"
+SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "fd7d5ade76e78d8540b9a4044496a57c"
+SRC_URI[sha256sum] = "7e8b7fa74a3bc9b6e90b15b83b9bc2377c78eaeae3447516425f475d5d6932d2"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+#export BUILD_SYS
+#export HOST_SYS
+
+inherit setuptools
+
+# DEPENDS_default: python-pip
+
+DEPENDS += " \
+        "
+
+# RDEPENDS_default: 
+RDEPENDS_${PN} += " \
+        "
-- 
2.1.4


