Return-Path: <Fupan.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7A73E00A53; Mon, 13 Mar 2017 00:39:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F9B1E00655
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Mar 2017 00:39:19 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2D7dIRC026265
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Mar 2017 00:39:18 -0700
Received: from ala-lpd-susbld2.wrs.com (147.11.105.122) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 13 Mar 2017 00:39:17 -0700
From: <fupan.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 13 Mar 2017 00:39:16 -0700
Message-ID: <20170313073917.348626-1-fupan.li@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] qpid: fix the wrong python dir issue
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
X-List-Received-Date: Mon, 13 Mar 2017 07:39:22 -0000
Content-Type: text/plain

From: fli <fupan.li@windriver.com>

qpid used the wrong python path and thus cannot
package the files installed. This commit will fix
the following warning issue:

WARNING: QA Issue: qpid: Files/directories were installed but not shipped in any package:
  /usr/lib/python2.7/site-packages/qmfengine.py
  /usr/lib/python2.7/site-packages/qmf.py
  /usr/lib/python2.7/site-packages/_qmfengine.so
  /usr/lib/python2.7/site-packages/_qmfengine.la
  /usr/lib/python2.7/site-packages/qmfengine.pyo
  /usr/lib/python2.7/site-packages/qmf.pyo
  /usr/lib/python2.7/site-packages/cqpid.py
  /usr/lib/python2.7/site-packages/_cqpid.so
  /usr/lib/python2.7/site-packages/_cqpid.la
  /usr/lib/python2.7/site-packages/cqpid.pyo
  /usr/lib/python2.7/site-packages/qmf2.py
  /usr/lib/python2.7/site-packages/cqmf2.py
  /usr/lib/python2.7/site-packages/_cqmf2.so
  /usr/lib/python2.7/site-packages/_cqmf2.la
  /usr/lib/python2.7/site-packages/qmf2.pyo
  /usr/lib/python2.7/site-packages/cqmf2.pyo
  /usr/lib/python2.7/site-packages/qmfgen
  /usr/lib/python2.7/site-packages/qmfgen/__init__.py
  /usr/lib/python2.7/site-packages/qmfgen/generate.py
  /usr/lib/python2.7/site-packages/qmfgen/schema.py
  /usr/lib/python2.7/site-packages/qmfgen/management-types.xml
  /usr/lib/python2.7/site-packages/qmfgen/__init__.pyo
  /usr/lib/python2.7/site-packages/qmfgen/generate.pyo
  /usr/lib/python2.7/site-packages/qmfgen/schema.pyo
  /usr/lib/python2.7/site-packages/qmfgen/templates
  /usr/lib/python2.7/site-packages/qmfgen/templates/Args.h
  /usr/lib/python2.7/site-packages/qmfgen/templates/Class.cpp
  /usr/lib/python2.7/site-packages/qmfgen/templates/Class.h
  /usr/lib/python2.7/site-packages/qmfgen/templates/CMakeLists.cmake
  /usr/lib/python2.7/site-packages/qmfgen/templates/Event.cpp
  /usr/lib/python2.7/site-packages/qmfgen/templates/Event.h
  /usr/lib/python2.7/site-packages/qmfgen/templates/Makefile.mk
  /usr/lib/python2.7/site-packages/qmfgen/templates/Package.cpp
  /usr/lib/python2.7/site-packages/qmfgen/templates/Package.h
  /usr/lib/python2.7/site-packages/qmfgen/templates/V2Package.cpp
  /usr/lib/python2.7/site-packages/qmfgen/templates/V2Package.h
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
qpid: 36 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: fli <fupan.li@windriver.com>
---
 meta-openstack/recipes-extended/qpid/qpid_0.20.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-extended/qpid/qpid_0.20.bb b/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
index 5e6ae2d..b76f76d 100644
--- a/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
+++ b/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
@@ -27,7 +27,10 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
 export PERL="${STAGING_BINDIR}/perl"
 
 EXTRA_OECONF += " --without-help2man SASL_PASSWD=/usr/sbin/saslpasswd2"
-EXTRA_OEMAKE += " CPPFLAGS=-Wno-unused-function "
+EXTRA_OEMAKE += " CPPFLAGS=-Wno-unused-function \
+        pyexecdir=${PYTHON_SITEPACKAGES_DIR} \
+        pythondir=${PYTHON_SITEPACKAGES_DIR} \
+"
 
 do_install_append() {
      install -d ${D}${sysconfdir}/init.d
-- 
2.11.0


