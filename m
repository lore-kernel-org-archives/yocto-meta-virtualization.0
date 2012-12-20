Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id CAFEEE0045D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Dec 2012 03:53:40 -0800 (PST)
Received: from [172.16.140.28] (172.16.140.28) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.2.318.1;
	Thu, 20 Dec 2012 12:53:39 +0100
Message-ID: <50D2FC35.3090008@enea.com>
Date: Thu, 20 Dec 2012 12:53:25 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
	<1355841118-22361-2-git-send-email-david.nystrom@enea.com>
	<CADkTA4OApE+iZarUp6au+FGKyT_XKAi2bka+Em=Nf9pKKTQZoA@mail.gmail.com>
In-Reply-To: <CADkTA4OApE+iZarUp6au+FGKyT_XKAi2bka+Em=Nf9pKKTQZoA@mail.gmail.com>
X-Originating-IP: [172.16.140.28]
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	"raymond.danks@se-eng.com" <raymond.danks@se-eng.com>
Subject: Re: [RFC][PATCH 01/16] Removed meta-virtualization private patch, and using upstream instead
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
X-List-Received-Date: Thu, 20 Dec 2012 11:53:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 12/18/2012 03:43 PM, Bruce Ashfield wrote:
> Can you clarify "upstream" in the long log of this patch ? It may not be
> obvious to all readers which upstream you are referencing, oe-core, yocto=
,
> python, etc.
>
> Cheers,
>
> Bruce

Yes, will do, in this case I meant poky master.

>
>
> On Tue, Dec 18, 2012 at 9:31 AM, David Nystr=F6m <david.c.nystrom@gmail.c=
om
> <mailto:david.c.nystrom@gmail.com>> wrote:
>
>      Signed-off-by: David Nystr=F6m <david.nystrom@enea.com
>      <mailto:david.nystrom@enea.com>>
>      ---
>        .../01-use-proper-tools-for-cross-build.patch      |  138 --------=
------------
>        recipes-devtools/python/python_2.7.3.bbappend      |    9 --
>        2 files changed, 147 deletions(-)
>        delete mode 100644
>      recipes-devtools/python/python/01-use-proper-tools-for-cross-build.p=
atch
>        delete mode 100644 recipes-devtools/python/python_2.7.3.bbappend
>
>      diff --git
>      a/recipes-devtools/python/python/01-use-proper-tools-for-cross-build=
.patch
>      b/recipes-devtools/python/python/01-use-proper-tools-for-cross-build=
.patch
>      deleted file mode 100644
>      index 2589bde..0000000
>      --- a/recipes-devtools/python/python/01-use-proper-tools-for-cross-b=
uild.patch
>      +++ /dev/null
>      @@ -1,138 +0,0 @@
>      -Upstream-Status: Inappropriate [embedded specific]
>      -
>      -# We need to ensure our host tools get run during build, not the fr=
eshly
>      -# built cross-tools (this will not work), so we introduce HOSTPYTHO=
N and
>      HOSTPGEN.
>      -# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de
>      <mailto:mickey@vanille-media.de>>
>      -
>      -Index: Python-2.7.2/Makefile.pre.in <http://Makefile.pre.in>
>      -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>      ---- Python-2.7.2.orig/Makefile.pre.in <http://Makefile.pre.in>
>      -+++ Python-2.7.2/Makefile.pre.in <http://Makefile.pre.in>
>      -@@ -182,6 +182,7 @@ UNICODE_OBJS=3D   @UNICODE_OBJS@
>      -
>      - PYTHON=3D               python$(EXE)
>      - BUILDPYTHON=3D  python$(BUILDEXE)
>      -+HOSTPYTHON=3D   $(BUILDPYTHON)
>      -
>      - # The task to run while instrument when building the profile-opt t=
arget
>      - PROFILE_TASK=3D $(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc
>      --with-syscheck
>      -@@ -214,7 +215,7 @@ LIBFFI_INCLUDEDIR=3D @LIBFFI_INCLUDEDIR@
>      - ##################################################################=
########
>      - # Parser
>      - PGEN=3D         Parser/pgen$(EXE)
>      --
>      -+HOSTPGEN=3D     $(PGEN)$(EXE)
>      - POBJS=3D                \
>      -               Parser/acceler.o \
>      -               Parser/grammar1.o \
>      -@@ -401,14 +402,14 @@ $(BUILDPYTHON):  Modules/python.o $(LIBRA
>      -                       $(BLDLIBRARY) $(LIBS) $(MODLIBS) $(SYSLIBS) =
$(LDLAST)
>      -
>      - platform: $(BUILDPYTHON)
>      --      $(RUNSHARED) ./$(BUILDPYTHON) -E -c 'import sys ; from sysco=
nfig
>      import get_platform ; print get_platform()+"-"+sys.version[0:3]' >pl=
atform
>      -+      $(RUNSHARED) ./$(BUILDPYTHON) -E -c 'import sys ; from
>      distutils.util import get_platform ; print
>      get_platform()+"-"+sys.version[0:3]' >platform
>      -
>      -
>      - # Build the shared modules
>      - sharedmods: $(BUILDPYTHON)
>      -       @case $$MAKEFLAGS in \
>      --      *s*) $(RUNSHARED) CC=3D'$(CC)' LDSHARED=3D'$(BLDSHARED)' OPT=
=3D'$(OPT)'
>      ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
>      --      *) $(RUNSHARED) CC=3D'$(CC)' LDSHARED=3D'$(BLDSHARED)' OPT=
=3D'$(OPT)'
>      ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
>      -+      *s*) $(RUNSHARED) CC=3D'$(CC)' LDSHARED=3D'$(BLDSHARED)' OPT=
=3D'$(OPT)'
>      $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
>      -+      *) $(RUNSHARED) CC=3D'$(CC)' LDSHARED=3D'$(BLDSHARED)' OPT=
=3D'$(OPT)'
>      $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
>      -       esac
>      -
>      - # Build static library
>      -@@ -542,7 +543,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
>      - $(GRAMMAR_H) $(GRAMMAR_C): Parser/pgen.stamp
>      - Parser/pgen.stamp: $(PGEN) $(GRAMMAR_INPUT)
>      -               -@$(INSTALL) -d Include
>      --              $(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
>      -+              $(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_=
C)
>      -               -touch Parser/pgen.stamp
>      -
>      - $(PGEN):      $(PGENOBJS)
>      -@@ -926,25 +927,25 @@ libinstall:      build_all $(srcdir)/Lib/$(PL
>      -       done
>      -       $(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICEN=
SE.txt
>      -       PYTHONPATH=3D$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
>      --              ./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compil=
eall.py \
>      -+              $(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileal=
l.py \
>      -               -d $(LIBDEST) -f \
>      -               -x 'bad_coding|badsyntax|site-packages|lib2to3/tests=
/data' \
>      -               $(DESTDIR)$(LIBDEST)
>      -       PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
>      --              ./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/com=
pileall.py \
>      -+              $(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compil=
eall.py \
>      -               -d $(LIBDEST) -f \
>      -               -x 'bad_coding|badsyntax|site-packages|lib2to3/tests=
/data' \
>      -               $(DESTDIR)$(LIBDEST)
>      -       -PYTHONPATH=3D$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
>      --              ./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compile=
all.py \
>      -+              $(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall=
.py \
>      -               -d $(LIBDEST)/site-packages -f \
>      -               -x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
>      -       -PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
>      --              ./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/comp=
ileall.py \
>      -+              $(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compile=
all.py \
>      -               -d $(LIBDEST)/site-packages -f \
>      -               -x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
>      -       -PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
>      --              ./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram,
>      lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
>      -+              $(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram,
>      lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
>      -
>      - # Create the PLATDIR source directory, if one wasn't distributed..
>      - $(srcdir)/Lib/$(PLATDIR):
>      -@@ -1049,7 +1050,7 @@ libainstall:     all python-config
>      - # Install the dynamically loadable modules
>      - # This goes into $(exec_prefix)
>      - sharedinstall: sharedmods
>      --      $(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install =
\
>      -+      $(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
>      -               --prefix=3D$(prefix) \
>      -               --install-scripts=3D$(BINDIR) \
>      -               --install-platlib=3D$(DESTSHARED) \
>      -Index: Python-2.7.2/setup.py
>      -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>      ---- Python-2.7.2.orig/setup.py
>      -+++ Python-2.7.2/setup.py
>      -@@ -313,6 +313,7 @@ class PyBuildExt(build_ext):
>      -             self.failed.append(ext.name <http://ext.name>)
>      -             self.announce('*** WARNING: renaming "%s" since import=
ing it'
>      -                           ' failed: %s' % (ext.name <http://ext.na=
me>,
>      why), level=3D3)
>      -+            return
>      -             assert not self.inplace
>      -             basename, tail =3D os.path.splitext(ext_filename)
>      -             newname =3D basename + "_failed" + tail
>      -@@ -369,8 +370,8 @@ class PyBuildExt(build_ext):
>      -
>      -     def detect_modules(self):
>      -         # Ensure that /usr/local is always used
>      --        add_dir_to_list(self.compiler.library_dirs, '/usr/local/li=
b')
>      --        add_dir_to_list(self.compiler.include_dirs, '/usr/local/in=
clude')
>      -+        #add_dir_to_list(self.compiler.library_dirs, '/usr/local/l=
ib')
>      -+        #add_dir_to_list(self.compiler.include_dirs, '/usr/local/i=
nclude')
>      -         self.add_multiarch_paths()
>      -
>      -         # Add paths specified in the environment variables LDFLAGS=
 and
>      -@@ -475,6 +476,9 @@ class PyBuildExt(build_ext):
>      -
>      -         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
>      -
>      -+        lib_dirs =3D [ os.getenv( "STAGING_LIBDIR" ) ]
>      -+        inc_dirs =3D [ os.getenv( "STAGING_INCDIR" ) ]
>      -+        lib_dirs +=3D os.getenv('LIBRARY_PATH', '').split(os.paths=
ep)
>      -         #
>      -         # The following modules are all pretty straightforward, an=
d compile
>      -         # on pretty much any POSIXish platform.
>      -@@ -677,8 +681,8 @@ class PyBuildExt(build_ext):
>      -             elif curses_library:
>      -                 readline_libs.append(curses_library)
>      -             elif self.compiler.find_library_file(lib_dirs +
>      --                                                     ['/usr/lib/te=
rmcap'],
>      --                                                     'termcap'):
>      -+                                               ['/usr/lib/termcap'=
],
>      -+                                               'termcap'):
>      -                 readline_libs.append('termcap')
>      -             exts.append( Extension('readline', ['readline.c'],
>      -                                    library_dirs=3D['/usr/lib/termc=
ap'],
>      diff --git a/recipes-devtools/python/python_2.7.3.bbappend
>      b/recipes-devtools/python/python_2.7.3.bbappend
>      deleted file mode 100644
>      index e39deba..0000000
>      --- a/recipes-devtools/python/python_2.7.3.bbappend
>      +++ /dev/null
>      @@ -1,9 +0,0 @@
>      -THISDIR :=3D "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
>      -FILESPATH =3D. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
>      -
>      -DEPENDS +=3D " ncurses"
>      -
>      -do_compile_prepend() {
>      -       export LIBRARY_PATH=3D${STAGING_DIR_TARGET}/lib
>      -}
>      -
>      --
>      1.7.9.5
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its
> end"
>

