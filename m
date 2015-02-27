Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E9342E00712; Fri, 27 Feb 2015 13:42:06 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB27BE00321
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Feb 2015 13:41:50 -0800 (PST)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1RLfnmL021708
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Feb 2015 13:41:50 -0800 (PST)
Received: from afong by yow-dellw-af with local (Exim 4.84)
	(envelope-from <amy.fong@windriver.com>) id 1YRSfD-0000cE-9n
	for meta-virtualization@yoctoproject.org;
	Fri, 27 Feb 2015 16:41:39 -0500
Date: Fri, 27 Feb 2015 16:41:39 -0500
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Message-ID: <20150227214139.GE2255@windriver.com>
References: <20150227214013.GA2160@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20150227214013.GA2160@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH 5/5] Add python packages needed for docker-registry
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: amy.fong@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Feb 2015 21:42:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

From 3b4ff3a96aaaa673589bd13727d9500e79db880b Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Fri, 27 Feb 2015 16:01:22 -0500
Subject: [PATCH 5/5] Add python packages needed for docker-registry

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-support/gunicorn/gunicorn_19.1.1.bb        | 15 ++++++
 .../python-backports-lzma/fix_paths.patch          | 17 ++++++
 .../python-backports-lzma_0.0.3.bb                 | 32 ++++++++++++
 .../python-blinker/python-blinker_1.3.bb           | 22 ++++++++
 recipes-support/python-boto/python-boto_2.34.0.bb  | 25 +++++++++
 .../python-bugsnag/python-bugsnag_2.0.2.bb         | 26 ++++++++++
 .../python-docker-registry-core_2.0.3.bb           | 29 +++++++++++
 .../python-flask-cors/python-flask-cors_1.10.3.bb  | 22 ++++++++
 .../python-gevent/files/libev-conf.patch           | 19 +++++++
 .../python-gevent/python-gevent_1.0.1.bb           | 24 +++++++++
 .../python-m2crypto/python-m2crypto_0.22.3.bb      | 60 ++++++++++++++++++++++
 .../python-newrelic/python-newrelic_2.22.0.19.bb   | 26 ++++++++++
 .../python-pyyaml/python-pyyaml_3.11.bb            | 30 +++++++++++
 .../python-redis/python-redis_2.10.3.bb            | 20 ++++++++
 .../python-requests/python-requests_2.3.0.bb       | 29 +++++++++++
 .../python-simplejson/python-simplejson_3.6.2.bb   | 31 +++++++++++
 16 files changed, 427 insertions(+)
 create mode 100644 recipes-support/gunicorn/gunicorn_19.1.1.bb
 create mode 100644 recipes-support/python-backports-lzma/python-backports-lzma/fix_paths.patch
 create mode 100644 recipes-support/python-backports-lzma/python-backports-lzma_0.0.3.bb
 create mode 100644 recipes-support/python-blinker/python-blinker_1.3.bb
 create mode 100644 recipes-support/python-boto/python-boto_2.34.0.bb
 create mode 100644 recipes-support/python-bugsnag/python-bugsnag_2.0.2.bb
 create mode 100644 recipes-support/python-docker-registry-core/python-docker-registry-core_2.0.3.bb
 create mode 100644 recipes-support/python-flask-cors/python-flask-cors_1.10.3.bb
 create mode 100644 recipes-support/python-gevent/files/libev-conf.patch
 create mode 100644 recipes-support/python-gevent/python-gevent_1.0.1.bb
 create mode 100644 recipes-support/python-m2crypto/python-m2crypto_0.22.3.bb
 create mode 100644 recipes-support/python-newrelic/python-newrelic_2.22.0.19.bb
 create mode 100644 recipes-support/python-pyyaml/python-pyyaml_3.11.bb
 create mode 100644 recipes-support/python-redis/python-redis_2.10.3.bb
 create mode 100644 recipes-support/python-requests/python-requests_2.3.0.bb
 create mode 100644 recipes-support/python-simplejson/python-simplejson_3.6.2.bb

diff --git a/recipes-support/gunicorn/gunicorn_19.1.1.bb b/recipes-support/gunicorn/gunicorn_19.1.1.bb
new file mode 100644
index 0000000..bbe03ea
--- /dev/null
+++ b/recipes-support/gunicorn/gunicorn_19.1.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "WSGI HTTP Server for UNIX"
+DESCRIPTION = "\
+  Gunicorn ‘Green Unicorn’ is a Python WSGI HTTP Server for UNIX. It’s \
+  a pre-fork worker model ported from Ruby’s Unicorn project. The \
+  Gunicorn server is broadly compatible with various web frameworks, \
+  simply implemented, light on server resource usage, and fairly speedy. \
+  " 
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=19a2e253a273e390cd1b91d19b6ee236"
+
+SRC_URI = "https://pypi.python.org/packages/source/g/gunicorn/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "eaa72bff5341c05169b76ce3dcbb8140"
+SRC_URI[sha256sum] = "82715511fb6246fad4ba66d812eb93416ae8371b464fa88bf3867c9c177daa14"
+
+inherit setuptools
diff --git a/recipes-support/python-backports-lzma/python-backports-lzma/fix_paths.patch b/recipes-support/python-backports-lzma/python-backports-lzma/fix_paths.patch
new file mode 100644
index 0000000..c2b374f
--- /dev/null
+++ b/recipes-support/python-backports-lzma/python-backports-lzma/fix_paths.patch
@@ -0,0 +1,17 @@
+---
+ setup.py |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/setup.py
++++ b/setup.py
+@@ -32,8 +32,8 @@
+ extens = [Extension('backports/lzma/_lzma',
+                     ['backports/lzma/_lzmamodule.c'],
+                     libraries = ['lzma'],
+-                    include_dirs = [os.path.join(home, 'include'), '/opt/local/include', '/usr/local/include'],
+-                    library_dirs = [os.path.join(home, 'lib'), '/opt/local/lib', '/usr/local/lib']
++                    include_dirs = [],
++                    library_dirs = []
+                     )]
+ 
+ descr = "Backport of Python 3.3's 'lzma' module for XZ/LZMA compressed files."
diff --git a/recipes-support/python-backports-lzma/python-backports-lzma_0.0.3.bb b/recipes-support/python-backports-lzma/python-backports-lzma_0.0.3.bb
new file mode 100644
index 0000000..a3586c0
--- /dev/null
+++ b/recipes-support/python-backports-lzma/python-backports-lzma_0.0.3.bb
@@ -0,0 +1,32 @@
+HOMEPAGE = "https://github.com/peterjc/backports.lzma"
+SUMMARY = "\
+  Backport of Python 3.3's 'lzma' module for XZ/LZMA compressed files."
+DESCRIPTION = "\
+  This is a backport of the 'lzma' module included in Python 3.3 or later \
+  by Nadeem Vawda and Per Oyvind Karlsen, which provides a Python wrapper \
+  for XZ Utils (aka LZMA Utils v2) by Igor Pavlov. \
+  . \
+  In order to compile this, you will need to install XZ Utils from \
+  http://tukaani.org/xz/ \
+  "
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=db4345b3b9524aabc8fe8c65f235c6b2"
+
+SRC_URI[md5sum] = "c3d109746aefa86268e500c07d7e8e0f"
+SRC_URI[sha256sum] = "bac58aec8d39ac3d22250840fb24830d0e4a0ef05ad8f3f09172dc0cc80cdbca"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += "xz"
+
+SRCNAME = "backports.lzma"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI = "\
+	https://pypi.python.org/packages/source/b/backports.lzma/${SRCNAME}-${PV}.tar.gz \
+	file://fix_paths.patch \
+	"
diff --git a/recipes-support/python-blinker/python-blinker_1.3.bb b/recipes-support/python-blinker/python-blinker_1.3.bb
new file mode 100644
index 0000000..24e19b5
--- /dev/null
+++ b/recipes-support/python-blinker/python-blinker_1.3.bb
@@ -0,0 +1,22 @@
+HOMEPAGE = "https://pypi.python.org/pypi/blinker"
+SUMMARY = "Fast, simple object-to-object and broadcast signaling"
+DESCRIPTION = " \
+  Blinker provides a fast dispatching system that allows any number of \
+  interested parties to subscribe to events, or “signals”. \
+  . \
+  Signal receivers can subscribe to specific senders or receive signals \
+  sent by any sender. \
+  "
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8baf1d53a00de619f60052e4752a89af"
+
+SRCNAME = "blinker"
+SRC_URI = "https://pypi.python.org/packages/source/b/blinker/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "66e9688f2d287593a0e698cd8a5fbc57"
+SRC_URI[sha256sum] = "6811010809262261e41ab7b92f3f6d23f35cf816fbec2bc05077992eebec6e2f"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
diff --git a/recipes-support/python-boto/python-boto_2.34.0.bb b/recipes-support/python-boto/python-boto_2.34.0.bb
new file mode 100644
index 0000000..f94f324
--- /dev/null
+++ b/recipes-support/python-boto/python-boto_2.34.0.bb
@@ -0,0 +1,25 @@
+HOMEPAGE = "https://github.com/boto/boto"
+SUMMARY = "Amazon Web Services API"
+DESCRIPTION = "\
+  Boto is a Python package that provides interfaces to Amazon Web Services. \
+  Currently, all features work with Python 2.6 and 2.7. Work is under way to \
+  support Python 3.3+ in the same codebase. Modules are being ported one at \
+  a time with the help of the open source community, so please check below \
+  for compatibility with Python 3.3+. \
+  "
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://setup.py;md5=182ef81236d3fac2c6ed8e8d3c988ec8"
+
+PR = "r0"
+SRCNAME = "boto"
+
+SRC_URI = "https://pypi.python.org/packages/source/b/boto/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "5556223d2d0cc4d06dd4829e671dcecd"
+SRC_URI[sha256sum] = "33baab022ecb803414ad0d6cf4041d010cfc2755ff8acc3bea7b32e77ba98be0"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
diff --git a/recipes-support/python-bugsnag/python-bugsnag_2.0.2.bb b/recipes-support/python-bugsnag/python-bugsnag_2.0.2.bb
new file mode 100644
index 0000000..edf880f
--- /dev/null
+++ b/recipes-support/python-bugsnag/python-bugsnag_2.0.2.bb
@@ -0,0 +1,26 @@
+HOMEPAGE = "https://bugsnag.com/"
+SUMMARY = "Automatic error monitoring for django, flask, etc."
+DESCRIPTION = "\
+  The official Python notifier for `Bugsnag <https://bugsnag.com/>`_. \
+  Provides support for automatically capturing and sending exceptions \
+  in your Django and other Python apps to Bugsnag, to help you find \
+  and solve your bugs as fast as possible. \
+  "
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f6df6ab9f1b615a140ebb2a48f61bddc"
+
+PR = "r0"
+SRCNAME = "bugsnag"
+
+SRC_URI = "https://pypi.python.org/packages/source/b/bugsnag/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "e16360d86979890892cd388635f213e7"
+SRC_URI[sha256sum] = "093934b3cd1d36ba2b89cfe1673b14ba59043417fe500a02dbf6de0df43ea962"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += "python-webob python-flask python-blinker"
+
diff --git a/recipes-support/python-docker-registry-core/python-docker-registry-core_2.0.3.bb b/recipes-support/python-docker-registry-core/python-docker-registry-core_2.0.3.bb
new file mode 100644
index 0000000..7aa6825
--- /dev/null
+++ b/recipes-support/python-docker-registry-core/python-docker-registry-core_2.0.3.bb
@@ -0,0 +1,29 @@
+HOMEPAGE = "https://pypi.python.org/pypi/docker-registry-core"
+SUMMARY = "Docker registry core package"
+DESCRIPTION = "core package for docker-registry (drivers) developers"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRCNAME = "docker-registry-core"
+
+SRC_URI = "https://pypi.python.org/packages/source/d/docker-registry-core/${SRCNAME}-${PV}.tar.gz"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI[md5sum] = "610ef9395f2e9a2f91c68d13325fce7b"
+SRC_URI[sha256sum] = "347e804f1f35b28dbe27bf8d7a0b630fca29d684032139bf26e3940572360360"
+
+inherit setuptools
+
+DEPENDS += "\
+	python-distribute \
+	python-boto (= 2.34.0) \
+	python-redis (= 2.10.3) \
+	python-simplejson (= 3.6.2) \
+	"
+
+# boto 2.34.0
+# redis 2.10.3
+# simplejson 3.6.2
+# setuptools 5.8
diff --git a/recipes-support/python-flask-cors/python-flask-cors_1.10.3.bb b/recipes-support/python-flask-cors/python-flask-cors_1.10.3.bb
new file mode 100644
index 0000000..c39e9b2
--- /dev/null
+++ b/recipes-support/python-flask-cors/python-flask-cors_1.10.3.bb
@@ -0,0 +1,22 @@
+HOMEPAGE = "https://pypi.python.org/pypi/Flask-Cors/1.10.3"
+SUMMARY = "A Flask extension adding a decorator for CORS support"
+DESCRIPTION = "\
+  A Flask extension for handling Cross Origin Resource Sharing (CORS), making cross-origin AJAX possible \
+  "
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4784781a5ee9fed9c50272e733e07685"
+
+DEPENDS += "python-six python-flask"
+
+PR = "r0"
+SRCNAME = "Flask-Cors"
+
+SRC_URI = "https://pypi.python.org/packages/source/F/Flask-Cors/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "4f3c75ace0f724d1de167bd73745c965"
+SRC_URI[sha256sum] = "9e6927aa0a46f314bca0ec63eb871cee898a162adfdd5b65224db7a008287423"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
diff --git a/recipes-support/python-gevent/files/libev-conf.patch b/recipes-support/python-gevent/files/libev-conf.patch
new file mode 100644
index 0000000..283705f
--- /dev/null
+++ b/recipes-support/python-gevent/files/libev-conf.patch
@@ -0,0 +1,19 @@
+Due to differences in library locations, the cross compile test can fail because it can't run
+the conftest binary (dynamically linked). Building it statically instead.
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+---
+ libev/configure |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/libev/configure
++++ b/libev/configure
+@@ -2730,7 +2730,7 @@
+ ac_ext=c
+ ac_cpp='$CPP $CPPFLAGS'
+ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+-ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
++ac_link='$CC -static -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ ac_compiler_gnu=$ac_cv_c_compiler_gnu
+ if test -n "$ac_tool_prefix"; then
+   # Extract the first word of "${ac_tool_prefix}gcc", so it can be a program name with args.
diff --git a/recipes-support/python-gevent/python-gevent_1.0.1.bb b/recipes-support/python-gevent/python-gevent_1.0.1.bb
new file mode 100644
index 0000000..9c559bc
--- /dev/null
+++ b/recipes-support/python-gevent/python-gevent_1.0.1.bb
@@ -0,0 +1,24 @@
+HOMEPAGE = "http://www.gevent.org"
+SUMMARY = "A coroutine-based Python networking library"
+DESCRIPTION = "\
+  gevent is a coroutine-based Python networking library that uses greenlet \
+  to provide a high-level synchronous API on top of the libevent event \
+  loop. \
+  " 
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2dbb33d00e1fd31c7041460a81ac0bd2"
+DEPENDS += "python-greenlet libevent"
+RDEPENDS_${PN} += "python-greenlet python-mime python-pprint python-re"
+
+SRCNAME = "gevent"
+
+SRC_URI = "http://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "7b952591d1a0174d6eb6ac47bd975ab6"
+SRC_URI[sha256sum] = "4627e215d058f71d95e6b26d9e7be4c263788a4756bd2858a93775f6c072df43"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+SRC_URI += "file://libev-conf.patch"
diff --git a/recipes-support/python-m2crypto/python-m2crypto_0.22.3.bb b/recipes-support/python-m2crypto/python-m2crypto_0.22.3.bb
new file mode 100644
index 0000000..3325455
--- /dev/null
+++ b/recipes-support/python-m2crypto/python-m2crypto_0.22.3.bb
@@ -0,0 +1,60 @@
+HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
+SUMMARY = "A Python crypto and SSL toolkit"
+DESCRIPTION = "\
+  M2Crypto is the most complete Python wrapper for OpenSSL featuring RSA, \
+  DSA, DH, EC, HMACs, message digests, symmetric ciphers (including \
+  AES); SSL functionality to implement clients and servers; HTTPS \
+  extensions to Python's httplib, urllib, and xmlrpclib; unforgeable \
+  HMAC'ing AuthCookies for web session management; FTP/TLS client and \
+  server; S/MIME; ZServerSSL: A HTTPS server for Zope and ZSmime: An \
+  S/MIME messenger for Zope. M2Crypto can also be used to provide SSL \
+  for Twisted. \
+  "
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0ccca7097c1d29fa42e75e9c15c6ff2e"
+
+SRCNAME = "M2Crypto"
+SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "573f21aaac7d5c9549798e72ffcefedd"
+SRC_URI[sha256sum] = "6071bfc817d94723e9b458a010d565365104f84aa73f7fe11919871f7562ff72"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += "openssl swig-native"
+
+DISTUTILS_BUILD_ARGS += "build_ext -I${STAGING_INCDIR}"
+
+inherit setuptools
+
+SWIG_FEATURES_x86-64 = "-D__x86_64__"
+SWIG_FEATURES ?= ""
+export SWIG_FEATURES
+
+# Get around a problem with swig, but only if the
+# multilib header file exists.
+#
+do_compile_prepend() {
+	sed -i -e 's/self.add_multiarch_paths.*$/# &/;'  ${S}/setup.py
+	sed -i -e 's/opensslIncludeDir = .*$/opensslIncludeDir = os.getenv("STAGING_INCDIR")/;'  ${S}/setup.py
+	sed -i -e 's/opensslLibraryDir = .*$/opensslLibraryDir = os.getenv("STAGING_LIBDIR")/;'  ${S}/setup.py
+
+	if [ "${SITEINFO_BITS}" = "64" ];then
+		bit="64"
+	else
+		bit="32"
+	fi
+
+	if [ -e ${STAGING_INCDIR}/openssl/opensslconf-${bit}.h ]; then
+		for i in SWIG/_ec.i SWIG/_evp.i; do
+			sed -i -e "s/opensslconf.*\./opensslconf-${bit}\./" "$i"
+		done
+	elif [ -e ${STAGING_INCDIR}/openssl/opensslconf-n${bit}.h ] ;then
+		for i in SWIG/_ec.i SWIG/_evp.i; do
+			sed -i -e "s/opensslconf.*\./opensslconf-n${bit}\./" "$i"
+		done
+	fi
+}
+
diff --git a/recipes-support/python-newrelic/python-newrelic_2.22.0.19.bb b/recipes-support/python-newrelic/python-newrelic_2.22.0.19.bb
new file mode 100644
index 0000000..3891824
--- /dev/null
+++ b/recipes-support/python-newrelic/python-newrelic_2.22.0.19.bb
@@ -0,0 +1,26 @@
+HOMEPAGE = "http://www.newrelic.com"
+SUMMARY = "New Relic Python Agent"
+DESCRIPTION = "\
+  Python agent for the New Relic web application performance monitoring \
+  service. Check the release notes for what has changed in this version. \
+  "
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause & MIT & Python-2.0 & BSD-2-Clause & NewRelic"
+LIC_FILES_CHKSUM = "file://newrelic/LICENSE;md5=0f6cc160a8ed6759faa408a30b6ac978"
+
+PR = "r0"
+SRCNAME = "newrelic"
+
+SRC_URI = "https://pypi.python.org/packages/source/n/newrelic/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "f8c9bf996d040a11847d14682b290eff"
+SRC_URI[sha256sum] = "aa8869413c21aff441a77582df1e0fdc0f67342760eb7560d33ed3bbed7edf7b"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+FILES_${PN}-dbg += "\
+  ${PYTHON_SITEPACKAGES_DIR}/newrelic-${PV}/newrelic/*/.debug \
+  ${PYTHON_SITEPACKAGES_DIR}/newrelic-${PV}/newrelic/packages/*/.debug/ \
+  "
diff --git a/recipes-support/python-pyyaml/python-pyyaml_3.11.bb b/recipes-support/python-pyyaml/python-pyyaml_3.11.bb
new file mode 100644
index 0000000..cb1db8c
--- /dev/null
+++ b/recipes-support/python-pyyaml/python-pyyaml_3.11.bb
@@ -0,0 +1,30 @@
+HOMEPAGE = "http://www.pyyaml.org"
+SUMMARY = "Python support for YAML"
+DESCRIPTION = "\
+  YAML is a data serialization format designed for human readability \
+  and interaction with scripting languages.  PyYAML is a YAML parser \
+  and emitter for Python. \
+  .       \
+  PyYAML features a complete YAML 1.1 parser, Unicode support, pickle \
+  support, capable extension API, and sensible error messages.  PyYAML \
+  supports standard YAML tags and provides Python-specific tags that \
+  allow to represent an arbitrary Python object. \
+  .       \
+  PyYAML is applicable for a broad range of tasks from complex \
+  configuration files to object serialization and persistance. \
+  "
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
+
+SRCNAME = "PyYAML"
+SRC_URI = "http://pyyaml.org/download/pyyaml/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "f50e08ef0fe55178479d3a618efe21db"
+SRC_URI[sha256sum] = "c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += "libyaml python-cython-native"
diff --git a/recipes-support/python-redis/python-redis_2.10.3.bb b/recipes-support/python-redis/python-redis_2.10.3.bb
new file mode 100644
index 0000000..9eda8a5
--- /dev/null
+++ b/recipes-support/python-redis/python-redis_2.10.3.bb
@@ -0,0 +1,20 @@
+HOMEPAGE = "https://pypi.python.org/pypi/redis/"
+SUMMARY = "Python client for Redis key-value store"
+DESCRIPTION = "The Python interface to the Redis key-value store."
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
+
+PR = "r0"
+SRCNAME = "redis"
+
+SRC_URI = "https://pypi.python.org/packages/source/r/redis/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "7619221ad0cbd124a5687458ea3f5289"
+SRC_URI[sha256sum] = "a4fb37b02860f6b1617f6469487471fd086dd2d38bbce640c2055862b9c4019c"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} = "redis"
diff --git a/recipes-support/python-requests/python-requests_2.3.0.bb b/recipes-support/python-requests/python-requests_2.3.0.bb
new file mode 100644
index 0000000..6f38bf1
--- /dev/null
+++ b/recipes-support/python-requests/python-requests_2.3.0.bb
@@ -0,0 +1,29 @@
+HOMEPAGE = "http://python-requests.org"
+SUMMARY = "Python HTTP for Humans."
+DESCRIPTION = "\
+  Requests is an Apache2 Licensed HTTP library, written in Python, \
+  for human beings. \
+  .      \
+  Most existing Python modules for sending HTTP requests are extremely \
+  verbose and cumbersome. Python's builtin urllib2 module provides most \
+  of the HTTP capabilities you should need, but the api is thoroughly \
+  broken.  It requires an enormous amount of work (even method overrides) \
+  to perform the simplest of tasks. \
+  .      \
+  Things shouldn't be this way. Not in Python \
+  "
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7869e52c8275537186de35e3cd5f9ec"
+
+PR = "r0"
+SRCNAME = "requests"
+
+SRC_URI = "http://pypi.python.org/packages/source/r/requests/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "7449ffdc8ec9ac37bbcd286003c80f00"
+SRC_URI[sha256sum] = "1c1473875d846fe563d70868acf05b1953a4472f4695b7b3566d1d978957b8fc"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
diff --git a/recipes-support/python-simplejson/python-simplejson_3.6.2.bb b/recipes-support/python-simplejson/python-simplejson_3.6.2.bb
new file mode 100644
index 0000000..f13f1f3
--- /dev/null
+++ b/recipes-support/python-simplejson/python-simplejson_3.6.2.bb
@@ -0,0 +1,31 @@
+HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
+SUMMARY = "Simple, fast, extensible JSON encoder/decoder for Python"
+DESCRIPTION = "\
+  JSON <http://json.org> encoder and decoder for Python 2.5+ \
+  and Python 3.3+.  It is pure Python code with no dependencies, \
+  but includes an optional C extension for a serious speed boost \
+  "
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
+PR = "r0"
+
+SRCNAME = "simplejson"
+
+SRC_URI = "https://pypi.python.org/packages/source/s/simplejson/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "deca871b9bfa4b76ea360756b2a22710"
+SRC_URI[sha256sum] = "99c092209f88d411858f01b14a97a4fcf8c4f438a685e23d733a3d65de52a35d"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
+
+RDEPENDS_${PN} = "\
+    python-core \
+    python-re \
+    python-io \
+    python-netserver \
+    python-numbers \
+"
+
+
-- 
2.1.4


