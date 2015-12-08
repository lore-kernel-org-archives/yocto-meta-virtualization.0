Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 701ACE00BCC; Tue,  8 Dec 2015 09:34:53 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 58A82E00B9C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:32 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:31 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:34 +0100
Message-ID: <1449596034-8308-23-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 22/42] glance: add new dependencies
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:53 -0000
Content-Type: text/plain

From: Mark Asselstine <mark.asselstine@windriver.com>

Attempting to run glance-api several python traces are
encountered. The following packages were identified in the traces and
as such are added as dependencies which allows glance-api to launch
successfully.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Removing python-oslo.vmware_1.19.0 since the latest version of
Kilo is 0.11.2, and was already present in the repo.

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>

Conflicts:
	meta-openstack/recipes-devtools/python/python-glance_git.bb
---
 .../recipes-devtools/python/python-glance_git.bb   |  3 +++
 .../python/python-semantic-version_2.4.2.bb        | 27 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-semantic-version_2.4.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-glance_git.bb b/meta-openstack/recipes-devtools/python/python-glance_git.bb
index 389385c..a4e07d1 100644
--- a/meta-openstack/recipes-devtools/python/python-glance_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glance_git.bb
@@ -199,6 +199,9 @@ RDEPENDS_${PN} += "python-greenlet \
 	python-retrying \
         python-glancestore \
         python-oslo.vmware \
+	python-glancestore \
+	python-enum34 \
+	python-semantic-version \
 	"
 
 RDEPENDS_${SRCNAME} = "${PN} \
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
2.5.0


