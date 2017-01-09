Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DB43E0096D; Mon,  9 Jan 2017 07:04:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 470EBE0094C
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Jan 2017 07:04:56 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v09F4tJM013901
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 9 Jan 2017 07:04:56 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 9 Jan 2017 07:04:55 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 9 Jan 2017 10:04:50 -0500
Message-ID: <1483974290-17688-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [mcs][PATCH] mod-wsgi: uprev to use git and latest release
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
X-List-Received-Date: Mon, 09 Jan 2017 15:04:59 -0000
Content-Type: text/plain

Apache2 was just uprev'd to the latest release in meta-oe so we should
really matching this. Additionally the version we are replacing had
build issue with the latest gcc, so the uprev solves these as well.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...c-allow-PYTHON-values-to-be-passed-via-en.patch | 125 +++++++++++++++++++++
 .../recipes-support/mod-wsgi/mod-wsgi_3.4.bb       |  58 ----------
 .../recipes-support/mod-wsgi/mod-wsgi_git.bb       |  57 ++++++++++
 3 files changed, 182 insertions(+), 58 deletions(-)
 create mode 100644 meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
 delete mode 100644 meta-openstack/recipes-support/mod-wsgi/mod-wsgi_3.4.bb
 create mode 100644 meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb

diff --git a/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch b/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
new file mode 100644
index 0000000..4683db0
--- /dev/null
+++ b/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
@@ -0,0 +1,125 @@
+From a2b1b01045f908815090904239f24eb696d9dbd2 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 5 Jan 2017 16:51:02 -0500
+Subject: [PATCH] configure.ac: allow PYTHON values to be passed via env
+
+This allows the recipe to specify specific values instead of them
+being 'discovered' which may lead to host contamination or similar
+issues.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ configure.ac | 41 +++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 41 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 25afe44..b5a9e03 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -100,26 +100,38 @@ fi
+ 
+ AC_SUBST(PYTHON)
+ 
++if test -z "${PYTHON_VERSION}"; then
+ PYTHON_VERSION=`${PYTHON} -c 'from sys import stdout; \
+     from distutils import sysconfig; \
+     stdout.write(sysconfig.get_config_var("VERSION"))'`
++fi
+ 
++if test -z "${PYTHON_LDVERSION}"; then
+ PYTHON_LDVERSION=`${PYTHON} -c 'from sys import stdout; \
+     from distutils import sysconfig; \
+     stdout.write(sysconfig.get_config_var("LDVERSION") or "")'`
++fi
+ 
+ if test x"${PYTHON_LDVERSION}" = x""; then
+     PYTHON_LDVERSION=${PYTHON_VERSION}
+ fi
+ 
++if test -z "${PYTHON_INCLUDEPY}"; then
+ CPPFLAGS1=`${PYTHON} -c 'from sys import stdout; \
+     from distutils import sysconfig; \
+     stdout.write("-I" + sysconfig.get_config_var("INCLUDEPY"))'`
++else
++CPPFLAGS1="${PYTHON_INCLUDEPY}"
++fi
+ 
++if test -z "${PYTHON_CFLAGS}"; then
+ CPPFLAGS2=`${PYTHON} -c 'from sys import stdout; \
+     from distutils import sysconfig; \
+     stdout.write(" ".join(filter(lambda x: x.startswith("-D"), \
+     sysconfig.get_config_var("CFLAGS").split())))'`
++else
++CPPFLAGS2="${PYTHON_CFLAGS}"
++fi
+ 
+ if test "${ENABLE_EMBEDDED}" != "yes"; then
+ CPPFLAGS3="-DMOD_WSGI_DISABLE_EMBEDDED"
+@@ -131,22 +143,43 @@ CPPFLAGS="${CPPFLAGS} ${CPPFLAGS1} ${CPPFLAGS2} ${CPPFLAGS3}"
+ 
+ AC_SUBST(CPPFLAGS)
+ 
++if test -z "${PYTHON_LIBDIR}"; then
+ PYTHONLIBDIR=`${PYTHON} -c 'from sys import stdout; \
+     from distutils import sysconfig; \
+     stdout.write(sysconfig.get_config_var("LIBDIR"))'`
++else
++PYTHONLIBDIR="${PYTHON_LIBDIR}"
++fi
++if test -z "${PYTHON_CFGDIR}"; then
+ PYTHONCFGDIR=`${PYTHON} -c 'from sys import stdout; \
+     import distutils.sysconfig; \
+     stdout.write(distutils.sysconfig.get_python_lib(plat_specific=1, \
+     standard_lib=1) +"/config")'`
++else
++PYTHONCFGDIR="${PYTHON_CFGDIR}"
++fi
++if test -z "${PYTHON_FRAMEWORKDIR}"; then
+ PYTHONFRAMEWORKDIR=`${PYTHON} -c 'from sys import stdout; \
+     from distutils import sysconfig; \
+     stdout.write(sysconfig.get_config_var("PYTHONFRAMEWORKDIR"))'`
++else
++PYTHONFRAMEWORKDIR="${PYTHON_FRAMEWORKDIR}"
++fi
++
++if test -z "${PYTHON_FRAMEWORKPREFIX}"; then
+ PYTHONFRAMEWORKPREFIX=`${PYTHON} -c 'from sys import stdout; \
+     from distutils import sysconfig; \
+     stdout.write(sysconfig.get_config_var("PYTHONFRAMEWORKPREFIX"))'`
++else
++PYTHONFRAMEWORKPREFIX="${PYTHON_FRAMEWORKPREFIX}"
++fi
++if test -z "${PYTHON_FRAMEWORK}"; then
+ PYTHONFRAMEWORK=`${PYTHON} -c 'from sys import stdout; \
+     from distutils import sysconfig; \
+     stdout.write(sysconfig.get_config_var("PYTHONFRAMEWORK"))'`
++else
++PYTHONFRAMEWORK="${PYTHON_FRAMEWORK}"
++fi
+ 
+ if test "${PYTHON_LDVERSION}" != "${PYTHON_VERSION}"; then
+     PYTHONCFGDIR="${PYTHONCFGDIR}-${PYTHON_LDVERSION}"
+@@ -170,12 +203,20 @@ if test "${PYTHONFRAMEWORKDIR}" = "no-framework" -o \
+         LDLIBS1="-lpython${PYTHON_VERSION}"
+     fi
+ 
++    if test -z "${PYTHON_LIBS}"; then
+     LDLIBS2=`${PYTHON} -c 'from sys import stdout; \
+         from distutils import sysconfig; \
+         stdout.write(sysconfig.get_config_var("LIBS"))'`
++    else
++    LDLIBS2="${PYTHON_LIBS}"
++    fi
++    if test -z "${PYTHON_SYSLIBS}"; then
+     LDLIBS3=`${PYTHON} -c 'from sys import stdout; \
+         from distutils import sysconfig; \
+         stdout.write(sysconfig.get_config_var("SYSLIBS"))'`
++    else
++    LDLIBS3="${PYTHON_SYSLIBS}"
++    fi
+ else
+     LDFLAGS1="-Wl,-F${PYTHONFRAMEWORKPREFIX} -framework ${PYTHONFRAMEWORK}"
+ 
+-- 
+2.7.4
+
diff --git a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_3.4.bb b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_3.4.bb
deleted file mode 100644
index c221b6b..0000000
--- a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_3.4.bb
+++ /dev/null
@@ -1,58 +0,0 @@
-SUMMARY = "Supports the Python WSGI interface"
-DESCRIPTION = "\
-  The aim of mod_wsgi is to implement a simple to use Apache module which can host \
-  any Python application which supports the Python WSGI interface. The module would \
-  be suitable for use in hosting high performance production web sites, as well as \
-  your average self managed personal sites running on web hosting services."
-
-HOMEPAGE = "http://code.google.com/p/modwsgi/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-SRCNAME = "mod_wsgi"
-SRC_URI = "\
-	http://modwsgi.googlecode.com/files/${SRCNAME}-${PV}.tar.gz \
-	file://configure_var.patch \
-	file://build-fix-builds-that-have-separated-build-dir.patch \
-	"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-SRC_URI[md5sum] = "f42d69190ea0c337ef259cbe8d94d985"
-SRC_URI[sha256sum] = "ae85c98e9e146840ab3c3e4490e6774f9bef0f99b9f679fca786b2adb5b4b6e8"
-
-inherit autotools distutils-base
-
-DEPENDS += "apache2-native apache2 python-native"
-RDEPENDS_${PN} = "python"
-
-EXTRA_OECONF = "\
-	--with-apxs=${STAGING_BINDIR_CROSS}/apxs \
-	--disable-framework \
-	PYTHON_VERSION=${PYTHON_BASEVERSION} \
-	PYTHON_INCLUDEPY=-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
-	PYTHON_CFLAGS='-DNDEBUG' \
-	PYTHON_LIBDIR=${STAGING_LIBDIR} \
-	PYTHON_CFGDIR=${STAGING_LIBDIR}/python${PYTHON_BASEVERSION}/config \
-	PYTHON_FRAMEWORKDIR='no-framework' \
-	PYTHON_FRAMEWORKPREFIX=' ' \
-	PYTHON_FRAMEWORK=' ' \
-	PYTHON_LIBS='-lpthread -ldl  -lpthread -lutil' \
-	PYTHON_SYSLIBS='-lm' \
-	"
-
-CFLAGS += " -I${STAGING_INCDIR}/apache2"
-
-FILES_${PN} += "/etc/apache2/"
-FILES_${PN}-dbg += "${libdir}/apache2/modules/.debug"
-
-do_install_append() {
-	mkdir -p ${D}/etc/apache2/modules.d/
-	echo "LoadModule wsgi_module ${libdir}/apache2/modules/mod_wsgi.so" > \
-	  ${D}/etc/apache2/modules.d/wsgi.load
-}
-
-# to load:
-# LoadModule wsgi_module modules/mod_wsgi.so
-
-# Apache/2.2.2 (Unix) mod_wsgi/1.0 Python/2.3 configured
diff --git a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
new file mode 100644
index 0000000..eab28b0
--- /dev/null
+++ b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
@@ -0,0 +1,57 @@
+SUMMARY = "Supports the Python WSGI interface"
+DESCRIPTION = "\
+  The aim of mod_wsgi is to implement a simple to use Apache module which can host \
+  any Python application which supports the Python WSGI interface. The module would \
+  be suitable for use in hosting high performance production web sites, as well as \
+  your average self managed personal sites running on web hosting services."
+
+HOMEPAGE = "http://code.google.com/p/modwsgi/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRCREV = "f22376f5141e8505f183b1b48f276c31168e2b6a"
+PV = "4.5.13+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+SRCNAME = "mod_wsgi"
+SRC_URI = "\
+	git://github.com/GrahamDumpleton/mod_wsgi.git \
+	file://configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch \        
+	"
+
+inherit autotools-brokensep distutils-base
+
+DEPENDS += "apache2-native apache2 python"
+RDEPENDS_${PN} = "python"
+
+EXTRA_OECONF = "\
+	--with-apxs=${STAGING_BINDIR_CROSS}/apxs \
+	--disable-framework \
+	PYTHON_VERSION=${PYTHON_BASEVERSION} \
+	PYTHON_INCLUDEPY=-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
+	PYTHON_CFLAGS='-DNDEBUG' \
+	PYTHON_LIBDIR=${STAGING_LIBDIR} \
+	PYTHON_CFGDIR=${STAGING_LIBDIR}/python${PYTHON_BASEVERSION}/config \
+	PYTHON_FRAMEWORKDIR='no-framework' \
+	PYTHON_FRAMEWORKPREFIX=' ' \
+	PYTHON_FRAMEWORK=' ' \
+	PYTHON_LIBS='-lpthread -ldl  -lpthread -lutil' \
+	PYTHON_SYSLIBS='-lm' \
+	"
+
+CFLAGS += " -I${STAGING_INCDIR}/apache2"
+
+FILES_${PN} += "/etc/apache2/"
+FILES_${PN}-dbg += "${libdir}/apache2/modules/.debug"
+
+do_install_append() {
+	mkdir -p ${D}/etc/apache2/modules.d/
+	echo "LoadModule wsgi_module ${libdir}/apache2/modules/mod_wsgi.so" > \
+	  ${D}/etc/apache2/modules.d/wsgi.load
+}
+
+# to load:
+# LoadModule wsgi_module modules/mod_wsgi.so
+
+# Apache/2.2.2 (Unix) mod_wsgi/1.0 Python/2.3 configured
-- 
2.7.4


