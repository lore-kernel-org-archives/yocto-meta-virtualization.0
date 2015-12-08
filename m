Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6CA8FE00BB5; Tue,  8 Dec 2015 09:34:06 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id D2A90E00B3F
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:02 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:01 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:15 +0100
Message-ID: <1449596034-8308-4-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 03/42] python-nova: add missing dependency on sqlparse
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:06 -0000
Content-Type: text/plain

From: Mark Asselstine <mark.asselstine@windriver.com>

Attempting to use nova-manage, for example to perform 'service list',
will result in a python trace indicating that the sqlparse module was
not found. Add the python-sqlparse recipe and include it in the
RDEPENDS list for nova.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>

Conflicts:
	meta-openstack/recipes-devtools/python/python-nova_git.bb
---
 .../recipes-devtools/python/python-nova_git.bb     |  1 +
 .../python/python-sqlparse_0.1.16.bb               | 27 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb

diff --git a/meta-openstack/recipes-devtools/python/python-nova_git.bb b/meta-openstack/recipes-devtools/python/python-nova_git.bb
index 79fad92..8bfcbea 100644
--- a/meta-openstack/recipes-devtools/python/python-nova_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-nova_git.bb
@@ -323,6 +323,7 @@ RDEPENDS_${PN} = " libvirt \
 		   python-rfc3986 \
 		   python-oslo.i18n \
 		   python-psutil \
+		   python-sqlparse \
     "
 
 RDEPENDS_${SRCNAME}-common = "${PN} openssl openssl-misc libxml2 libxslt \
diff --git a/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb b/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
new file mode 100644
index 0000000..8ea99d7
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Non-validating SQL parser module"
+HOMEPAGE = "http://pypi.python.org/pypi/sqlparse"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=13ec2f893997ca1f516b55496e019a81"
+
+SRCNAME = "sqlparse"
+SRC_URI = "http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "370962a307ebaaa70a28b6b0ccb53980"
+SRC_URI[sha256sum] = "678c6c36ca4b01405177da8b84eecf92ec92c9f6c762396c965bb5d305f20f81"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+export BUILD_SYS
+export HOST_SYS
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


