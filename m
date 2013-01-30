Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EE42E01423
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Jan 2013 01:38:09 -0800 (PST)
Received: by mail-la0-f43.google.com with SMTP id ek20so947917lab.30
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Jan 2013 01:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=jPARNX+oyFO/EdjibADyln+J2mrP83o7PU8x9SP43iI=;
	b=aOCXOMbl1UsgtmxHdIYPrBIMdrcNoKHc52QFg8wv995CDYwDq7xXA40OLk6WMt8c/t
	fN75pmj5LP6HXuBdz/IrCZgYgob27FV8A3YkPzD+rrgsSZIdhrQjghhfd+970GfPWMKH
	Sgb9ei1XBxRWezofx53fOOzbYOduPI7tfPhlZ9P9sLT56ozCZlIYJ3C/nvQlAEE/vXqs
	+TJ6yOlHFEgUUmUYv+LIy3dM+3e28a4G7MlR1UGgcLRZTN59KYYIYlnD3TCh5w8KDYfN
	b/n37KUpl3ZgHruwzvk7h36qaZ6/bEDH3V7vETD+pyjnKI5fRaXCghcpdDQ9f2wgBSsv
	4O5Q==
X-Received: by 10.152.136.20 with SMTP id pw20mr3908841lab.16.1359538688773;
	Wed, 30 Jan 2013 01:38:08 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id e9sm351287lbz.1.2013.01.30.01.38.06
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 01:38:07 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id C00B44001F4; Wed, 30 Jan 2013 10:38:00 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 30 Jan 2013 10:37:59 +0100
Message-Id: <1359538679-7548-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] Removed meta-virtualization private patch, using poky default instead.
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
X-List-Received-Date: Wed, 30 Jan 2013 09:38:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../01-use-proper-tools-for-cross-build.patch      |  138 --------------------
 recipes-devtools/python/python_2.7.3.bbappend      |    9 --
 2 files changed, 147 deletions(-)
 delete mode 100644 recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
 delete mode 100644 recipes-devtools/python/python_2.7.3.bbappend

diff --git a/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch b/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
deleted file mode 100644
index 2589bde..0000000
--- a/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-# We need to ensure our host tools get run during build, not the freshly
-# built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-Index: Python-2.7.2/Makefile.pre.in
-===================================================================
---- Python-2.7.2.orig/Makefile.pre.in
-+++ Python-2.7.2/Makefile.pre.in
-@@ -182,6 +182,7 @@ UNICODE_OBJS=   @UNICODE_OBJS@
- 
- PYTHON=		python$(EXE)
- BUILDPYTHON=	python$(BUILDEXE)
-+HOSTPYTHON=	$(BUILDPYTHON)
- 
- # The task to run while instrument when building the profile-opt target
- PROFILE_TASK=	$(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck
-@@ -214,7 +215,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
- ##########################################################################
- # Parser
- PGEN=		Parser/pgen$(EXE)
--
-+HOSTPGEN=	$(PGEN)$(EXE)
- POBJS=		\
- 		Parser/acceler.o \
- 		Parser/grammar1.o \
-@@ -401,14 +402,14 @@ $(BUILDPYTHON):	Modules/python.o $(LIBRA
- 			$(BLDLIBRARY) $(LIBS) $(MODLIBS) $(SYSLIBS) $(LDLAST)
- 
- platform: $(BUILDPYTHON)
--	$(RUNSHARED) ./$(BUILDPYTHON) -E -c 'import sys ; from sysconfig import get_platform ; print get_platform()+"-"+sys.version[0:3]' >platform
-+	$(RUNSHARED) ./$(BUILDPYTHON) -E -c 'import sys ; from distutils.util import get_platform ; print get_platform()+"-"+sys.version[0:3]' >platform
- 
- 
- # Build the shared modules
- sharedmods: $(BUILDPYTHON)
- 	@case $$MAKEFLAGS in \
--	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
--	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
-+	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
-+	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
- 	esac
- 
- # Build static library
-@@ -542,7 +543,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
- $(GRAMMAR_H) $(GRAMMAR_C): Parser/pgen.stamp
- Parser/pgen.stamp: $(PGEN) $(GRAMMAR_INPUT)
- 		-@$(INSTALL) -d Include
--		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+		$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
- 		-touch Parser/pgen.stamp
- 
- $(PGEN):	$(PGENOBJS)
-@@ -926,25 +927,25 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
- 	done
- 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
-+		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
--		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
-+		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
- 
- # Create the PLATDIR source directory, if one wasn't distributed..
- $(srcdir)/Lib/$(PLATDIR):
-@@ -1049,7 +1050,7 @@ libainstall:	all python-config
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall: sharedmods
--	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
-+	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-Index: Python-2.7.2/setup.py
-===================================================================
---- Python-2.7.2.orig/setup.py
-+++ Python-2.7.2/setup.py
-@@ -313,6 +313,7 @@ class PyBuildExt(build_ext):
-             self.failed.append(ext.name)
-             self.announce('*** WARNING: renaming "%s" since importing it'
-                           ' failed: %s' % (ext.name, why), level=3)
-+            return
-             assert not self.inplace
-             basename, tail = os.path.splitext(ext_filename)
-             newname = basename + "_failed" + tail
-@@ -369,8 +370,8 @@ class PyBuildExt(build_ext):
- 
-     def detect_modules(self):
-         # Ensure that /usr/local is always used
--        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
--        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-+        #add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
-+        #add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-         self.add_multiarch_paths()
- 
-         # Add paths specified in the environment variables LDFLAGS and
-@@ -475,6 +476,9 @@ class PyBuildExt(build_ext):
- 
-         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
- 
-+        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
-+        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
-+        lib_dirs += os.getenv('LIBRARY_PATH', '').split(os.pathsep)
-         #
-         # The following modules are all pretty straightforward, and compile
-         # on pretty much any POSIXish platform.
-@@ -677,8 +681,8 @@ class PyBuildExt(build_ext):
-             elif curses_library:
-                 readline_libs.append(curses_library)
-             elif self.compiler.find_library_file(lib_dirs +
--                                                     ['/usr/lib/termcap'],
--                                                     'termcap'):
-+                                               ['/usr/lib/termcap'],
-+                                               'termcap'):
-                 readline_libs.append('termcap')
-             exts.append( Extension('readline', ['readline.c'],
-                                    library_dirs=['/usr/lib/termcap'],
diff --git a/recipes-devtools/python/python_2.7.3.bbappend b/recipes-devtools/python/python_2.7.3.bbappend
deleted file mode 100644
index e39deba..0000000
--- a/recipes-devtools/python/python_2.7.3.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
-FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
-
-DEPENDS += " ncurses"
-
-do_compile_prepend() {
-	export LIBRARY_PATH=${STAGING_DIR_TARGET}/lib
-}
-
-- 
1.7.9.5


