Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 424DAE00655
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:43:38 -0800 (PST)
Received: by mail-pa0-f46.google.com with SMTP id bh2so586207pad.33
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=flFPDP2tW6HDKWP/9GarGrPNwts/wqYQg/DtH4/3wxA=;
	b=DGCA9Nj62Eo4ZAlbG4DLL6gM83RIEUlBDmSJ5agywOt2hxRg66RIpqo8xLgUWDce7U
	S0BLQxrPvO28zPR5UPJuB73UZmIpqP+Er9GVlvrs3GEtjshKLccGH5J7lZmy5TmmdPor
	FPo6fLmt8UhWxUgJghZmr6tcQgZzm6MiHUtLNXlsYQqqkxVWLgVPn6d7KqlPU5QEBIS6
	3sLZFGo29g0rjCwKbLWKqlMu6wf3w6/yHMFS0dqYNiai2m5ZaJEyHghPP3kBmJmgfCvu
	tNSQte68HWqA39hSfKmHdVh7ewpeUM+pmu8GmNhiees53unAGDE/+MJD/2vsRWrxIV4z
	59Tw==
MIME-Version: 1.0
Received: by 10.68.138.195 with SMTP id qs3mr7607683pbb.62.1355841818042; Tue,
	18 Dec 2012 06:43:38 -0800 (PST)
Received: by 10.68.1.68 with HTTP; Tue, 18 Dec 2012 06:43:38 -0800 (PST)
In-Reply-To: <1355841118-22361-2-git-send-email-david.nystrom@enea.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
	<1355841118-22361-2-git-send-email-david.nystrom@enea.com>
Date: Tue, 18 Dec 2012 09:43:38 -0500
Message-ID: <CADkTA4OApE+iZarUp6au+FGKyT_XKAi2bka+Em=Nf9pKKTQZoA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: meta-virtualization@yoctoproject.org, raymond.danks@se-eng.com
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
X-List-Received-Date: Tue, 18 Dec 2012 14:43:38 -0000
Content-Type: multipart/alternative; boundary=047d7b15a58befa10104d121856a

--047d7b15a58befa10104d121856a
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Can you clarify "upstream" in the long log of this patch ? It may not be
obvious to all readers which upstream you are referencing, oe-core, yocto,
python, etc.

Cheers,

Bruce


On Tue, Dec 18, 2012 at 9:31 AM, David Nystr=F6m <david.c.nystrom@gmail.com=
>wrote:

> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
> ---
>  .../01-use-proper-tools-for-cross-build.patch      |  138
> --------------------
>  recipes-devtools/python/python_2.7.3.bbappend      |    9 --
>  2 files changed, 147 deletions(-)
>  delete mode 100644
> recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
>  delete mode 100644 recipes-devtools/python/python_2.7.3.bbappend
>
> diff --git
> a/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patc=
h
> b/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patc=
h
> deleted file mode 100644
> index 2589bde..0000000
> ---
> a/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patc=
h
> +++ /dev/null
> @@ -1,138 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -# We need to ensure our host tools get run during build, not the freshly
> -# built cross-tools (this will not work), so we introduce HOSTPYTHON and
> HOSTPGEN.
> -# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> -
> -Index: Python-2.7.2/Makefile.pre.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.2.orig/Makefile.pre.in
> -+++ Python-2.7.2/Makefile.pre.in
> -@@ -182,6 +182,7 @@ UNICODE_OBJS=3D   @UNICODE_OBJS@
> -
> - PYTHON=3D               python$(EXE)
> - BUILDPYTHON=3D  python$(BUILDEXE)
> -+HOSTPYTHON=3D   $(BUILDPYTHON)
> -
> - # The task to run while instrument when building the profile-opt target
> - PROFILE_TASK=3D $(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc
> --with-syscheck
> -@@ -214,7 +215,7 @@ LIBFFI_INCLUDEDIR=3D @LIBFFI_INCLUDEDIR@
> -
> #########################################################################=
#
> - # Parser
> - PGEN=3D         Parser/pgen$(EXE)
> --
> -+HOSTPGEN=3D     $(PGEN)$(EXE)
> - POBJS=3D                \
> -               Parser/acceler.o \
> -               Parser/grammar1.o \
> -@@ -401,14 +402,14 @@ $(BUILDPYTHON):  Modules/python.o $(LIBRA
> -                       $(BLDLIBRARY) $(LIBS) $(MODLIBS) $(SYSLIBS)
> $(LDLAST)
> -
> - platform: $(BUILDPYTHON)
> --      $(RUNSHARED) ./$(BUILDPYTHON) -E -c 'import sys ; from sysconfig
> import get_platform ; print get_platform()+"-"+sys.version[0:3]' >platfor=
m
> -+      $(RUNSHARED) ./$(BUILDPYTHON) -E -c 'import sys ; from
> distutils.util import get_platform ; print
> get_platform()+"-"+sys.version[0:3]' >platform
> -
> -
> - # Build the shared modules
> - sharedmods: $(BUILDPYTHON)
> -       @case $$MAKEFLAGS in \
> --      *s*) $(RUNSHARED) CC=3D'$(CC)' LDSHARED=3D'$(BLDSHARED)' OPT=3D'$=
(OPT)'
> ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
> --      *) $(RUNSHARED) CC=3D'$(CC)' LDSHARED=3D'$(BLDSHARED)' OPT=3D'$(O=
PT)'
> ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
> -+      *s*) $(RUNSHARED) CC=3D'$(CC)' LDSHARED=3D'$(BLDSHARED)' OPT=3D'$=
(OPT)'
> $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
> -+      *) $(RUNSHARED) CC=3D'$(CC)' LDSHARED=3D'$(BLDSHARED)' OPT=3D'$(O=
PT)'
> $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
> -       esac
> -
> - # Build static library
> -@@ -542,7 +543,7 @@ Modules/python.o: $(srcdir)/Modules/pyth
> - $(GRAMMAR_H) $(GRAMMAR_C): Parser/pgen.stamp
> - Parser/pgen.stamp: $(PGEN) $(GRAMMAR_INPUT)
> -               -@$(INSTALL) -d Include
> --              $(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
> -+              $(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
> -               -touch Parser/pgen.stamp
> -
> - $(PGEN):      $(PGENOBJS)
> -@@ -926,25 +927,25 @@ libinstall:      build_all $(srcdir)/Lib/$(PL
> -       done
> -       $(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.tx=
t
> -       PYTHONPATH=3D$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
> --              ./$(BUILDPYTHON) -Wi -tt
> $(DESTDIR)$(LIBDEST)/compileall.py \
> -+              $(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py =
\
> -               -d $(LIBDEST) -f \
> -               -x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data=
'
> \
> -               $(DESTDIR)$(LIBDEST)
> -       PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> --              ./$(BUILDPYTHON) -Wi -tt -O
> $(DESTDIR)$(LIBDEST)/compileall.py \
> -+              $(HOSTPYTHON) -Wi -tt -O
> $(DESTDIR)$(LIBDEST)/compileall.py \
> -               -d $(LIBDEST) -f \
> -               -x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data=
'
> \
> -               $(DESTDIR)$(LIBDEST)
> -       -PYTHONPATH=3D$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
> --              ./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.p=
y
> \
> -+              $(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
> -               -d $(LIBDEST)/site-packages -f \
> -               -x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
> -       -PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> --              ./$(BUILDPYTHON) -Wi -t -O
> $(DESTDIR)$(LIBDEST)/compileall.py \
> -+              $(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.p=
y
> \
> -               -d $(LIBDEST)/site-packages -f \
> -               -x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
> -       -PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> --              ./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram,
> lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
> -+              $(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram,
> lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
> -
> - # Create the PLATDIR source directory, if one wasn't distributed..
> - $(srcdir)/Lib/$(PLATDIR):
> -@@ -1049,7 +1050,7 @@ libainstall:     all python-config
> - # Install the dynamically loadable modules
> - # This goes into $(exec_prefix)
> - sharedinstall: sharedmods
> --      $(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
> -+      $(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
> -               --prefix=3D$(prefix) \
> -               --install-scripts=3D$(BINDIR) \
> -               --install-platlib=3D$(DESTSHARED) \
> -Index: Python-2.7.2/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-2.7.2.orig/setup.py
> -+++ Python-2.7.2/setup.py
> -@@ -313,6 +313,7 @@ class PyBuildExt(build_ext):
> -             self.failed.append(ext.name)
> -             self.announce('*** WARNING: renaming "%s" since importing i=
t'
> -                           ' failed: %s' % (ext.name, why), level=3D3)
> -+            return
> -             assert not self.inplace
> -             basename, tail =3D os.path.splitext(ext_filename)
> -             newname =3D basename + "_failed" + tail
> -@@ -369,8 +370,8 @@ class PyBuildExt(build_ext):
> -
> -     def detect_modules(self):
> -         # Ensure that /usr/local is always used
> --        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
> --        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include=
')
> -+        #add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
> -+        #add_dir_to_list(self.compiler.include_dirs,
> '/usr/local/include')
> -         self.add_multiarch_paths()
> -
> -         # Add paths specified in the environment variables LDFLAGS and
> -@@ -475,6 +476,9 @@ class PyBuildExt(build_ext):
> -
> -         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
> -
> -+        lib_dirs =3D [ os.getenv( "STAGING_LIBDIR" ) ]
> -+        inc_dirs =3D [ os.getenv( "STAGING_INCDIR" ) ]
> -+        lib_dirs +=3D os.getenv('LIBRARY_PATH', '').split(os.pathsep)
> -         #
> -         # The following modules are all pretty straightforward, and
> compile
> -         # on pretty much any POSIXish platform.
> -@@ -677,8 +681,8 @@ class PyBuildExt(build_ext):
> -             elif curses_library:
> -                 readline_libs.append(curses_library)
> -             elif self.compiler.find_library_file(lib_dirs +
> --
> ['/usr/lib/termcap'],
> --                                                     'termcap'):
> -+                                               ['/usr/lib/termcap'],
> -+                                               'termcap'):
> -                 readline_libs.append('termcap')
> -             exts.append( Extension('readline', ['readline.c'],
> -                                    library_dirs=3D['/usr/lib/termcap'],
> diff --git a/recipes-devtools/python/python_2.7.3.bbappend
> b/recipes-devtools/python/python_2.7.3.bbappend
> deleted file mode 100644
> index e39deba..0000000
> --- a/recipes-devtools/python/python_2.7.3.bbappend
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -THISDIR :=3D "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
> -FILESPATH =3D. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
> -
> -DEPENDS +=3D " ncurses"
> -
> -do_compile_prepend() {
> -       export LIBRARY_PATH=3D${STAGING_DIR_TARGET}/lib
> -}
> -
> --
> 1.7.9.5
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--047d7b15a58befa10104d121856a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Can you clarify &quot;upstream&quot; in the long log of this patch ? It may=
 not be<div>obvious to all readers which upstream you are referencing, oe-c=
ore, yocto,</div><div>python, etc.</div><div><br></div><div>Cheers,</div>
<div><br></div><div>Bruce<br><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">On Tue, Dec 18, 2012 at 9:31 AM, David Nystr=F6m <span dir=
=3D"ltr">&lt;<a href=3D"mailto:david.c.nystrom@gmail.com" target=3D"_blank"=
>david.c.nystrom@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Signed-off-by: David Nystr=F6m &lt;<a href=
=3D"mailto:david.nystrom@enea.com">david.nystrom@enea.com</a>&gt;<br>
---<br>
=A0.../01-use-proper-tools-for-cross-build.patch =A0 =A0 =A0| =A0138 ------=
--------------<br>
=A0recipes-devtools/python/python_2.7.3.bbappend =A0 =A0 =A0| =A0 =A09 --<b=
r>
=A02 files changed, 147 deletions(-)<br>
=A0delete mode 100644 recipes-devtools/python/python/01-use-proper-tools-fo=
r-cross-build.patch<br>
=A0delete mode 100644 recipes-devtools/python/python_2.7.3.bbappend<br>
<br>
diff --git a/recipes-devtools/python/python/01-use-proper-tools-for-cross-b=
uild.patch b/recipes-devtools/python/python/01-use-proper-tools-for-cross-b=
uild.patch<br>
deleted file mode 100644<br>
index 2589bde..0000000<br>
--- a/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.pa=
tch<br>
+++ /dev/null<br>
@@ -1,138 +0,0 @@<br>
-Upstream-Status: Inappropriate [embedded specific]<br>
-<br>
-# We need to ensure our host tools get run during build, not the freshly<b=
r>
-# built cross-tools (this will not work), so we introduce HOSTPYTHON and H=
OSTPGEN.<br>
-# Signed-Off: Michael &#39;Mickey&#39; Lauer &lt;<a href=3D"mailto:mickey@=
vanille-media.de">mickey@vanille-media.de</a>&gt;<br>
-<br>
-Index: Python-2.7.2/<a href=3D"http://Makefile.pre.in" target=3D"_blank">M=
akefile.pre.in</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-2.7.2.orig/<a href=3D"http://Makefile.pre.in" target=3D"_blank"=
>Makefile.pre.in</a><br>
-+++ Python-2.7.2/<a href=3D"http://Makefile.pre.in" target=3D"_blank">Make=
file.pre.in</a><br>
-@@ -182,6 +182,7 @@ UNICODE_OBJS=3D =A0 @UNICODE_OBJS@<br>
-<br>
- PYTHON=3D =A0 =A0 =A0 =A0 =A0 =A0 =A0 python$(EXE)<br>
- BUILDPYTHON=3D =A0python$(BUILDEXE)<br>
-+HOSTPYTHON=3D =A0 $(BUILDPYTHON)<br>
-<br>
- # The task to run while instrument when building the profile-opt target<b=
r>
- PROFILE_TASK=3D $(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --with-=
syscheck<br>
-@@ -214,7 +215,7 @@ LIBFFI_INCLUDEDIR=3D @LIBFFI_INCLUDEDIR@<br>
- #########################################################################=
#<br>
- # Parser<br>
- PGEN=3D =A0 =A0 =A0 =A0 Parser/pgen$(EXE)<br>
--<br>
-+HOSTPGEN=3D =A0 =A0 $(PGEN)$(EXE)<br>
- POBJS=3D =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 Parser/acceler.o \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 Parser/grammar1.o \<br>
-@@ -401,14 +402,14 @@ $(BUILDPYTHON): =A0Modules/python.o $(LIBRA<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(BLDLIBRARY) $(LIBS) $(MODLI=
BS) $(SYSLIBS) $(LDLAST)<br>
-<br>
- platform: $(BUILDPYTHON)<br>
-- =A0 =A0 =A0$(RUNSHARED) ./$(BUILDPYTHON) -E -c &#39;import sys ; from sy=
sconfig import get_platform ; print get_platform()+&quot;-&quot;+sys.versio=
n[0:3]&#39; &gt;platform<br>
-+ =A0 =A0 =A0$(RUNSHARED) ./$(BUILDPYTHON) -E -c &#39;import sys ; from di=
stutils.util import get_platform ; print get_platform()+&quot;-&quot;+sys.v=
ersion[0:3]&#39; &gt;platform<br>
-<br>
-<br>
- # Build the shared modules<br>
- sharedmods: $(BUILDPYTHON)<br>
- =A0 =A0 =A0 @case $$MAKEFLAGS in \<br>
-- =A0 =A0 =A0*s*) $(RUNSHARED) CC=3D&#39;$(CC)&#39; LDSHARED=3D&#39;$(BLDS=
HARED)&#39; OPT=3D&#39;$(OPT)&#39; ./$(BUILDPYTHON) -E $(srcdir)/setup.py -=
q build;; \<br>
-- =A0 =A0 =A0*) $(RUNSHARED) CC=3D&#39;$(CC)&#39; LDSHARED=3D&#39;$(BLDSHA=
RED)&#39; OPT=3D&#39;$(OPT)&#39; ./$(BUILDPYTHON) -E $(srcdir)/setup.py bui=
ld;; \<br>
-+ =A0 =A0 =A0*s*) $(RUNSHARED) CC=3D&#39;$(CC)&#39; LDSHARED=3D&#39;$(BLDS=
HARED)&#39; OPT=3D&#39;$(OPT)&#39; $(HOSTPYTHON) -E $(srcdir)/setup.py -q b=
uild;; \<br>
-+ =A0 =A0 =A0*) $(RUNSHARED) CC=3D&#39;$(CC)&#39; LDSHARED=3D&#39;$(BLDSHA=
RED)&#39; OPT=3D&#39;$(OPT)&#39; $(HOSTPYTHON) -E $(srcdir)/setup.py build;=
; \<br>
- =A0 =A0 =A0 esac<br>
-<br>
- # Build static library<br>
-@@ -542,7 +543,7 @@ Modules/python.o: $(srcdir)/Modules/pyth<br>
- $(GRAMMAR_H) $(GRAMMAR_C): Parser/pgen.stamp<br>
- Parser/pgen.stamp: $(PGEN) $(GRAMMAR_INPUT)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 -@$(INSTALL) -d Include<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMM=
AR_C)<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(G=
RAMMAR_C)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 -touch Parser/pgen.stamp<br>
-<br>
- $(PGEN): =A0 =A0 =A0$(PGENOBJS)<br>
-@@ -926,25 +927,25 @@ libinstall: =A0 =A0 =A0build_all $(srcdir)/Lib/$(PL<=
br>
- =A0 =A0 =A0 done<br>
- =A0 =A0 =A0 $(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENS=
E.txt<br>
- =A0 =A0 =A0 PYTHONPATH=3D$(DESTDIR)$(LIBDEST) =A0$(RUNSHARED) \<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)=
/compileall.py \<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/co=
mpileall.py \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 -d $(LIBDEST) -f \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 -x &#39;bad_coding|badsyntax|site-packages|li=
b2to3/tests/data&#39; \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(DESTDIR)$(LIBDEST)<br>
- =A0 =A0 =A0 PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDE=
ST)/compileall.py \<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)=
/compileall.py \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 -d $(LIBDEST) -f \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 -x &#39;bad_coding|badsyntax|site-packages|li=
b2to3/tests/data&#39; \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(DESTDIR)$(LIBDEST)<br>
- =A0 =A0 =A0 -PYTHONPATH=3D$(DESTDIR)$(LIBDEST) =A0$(RUNSHARED) \<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/=
compileall.py \<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/com=
pileall.py \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 -d $(LIBDEST)/site-packages -f \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 -x badsyntax $(DESTDIR)$(LIBDEST)/site-packag=
es<br>
- =A0 =A0 =A0 -PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDES=
T)/compileall.py \<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/=
compileall.py \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 -d $(LIBDEST)/site-packages -f \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 -x badsyntax $(DESTDIR)$(LIBDEST)/site-packag=
es<br>
- =A0 =A0 =A0 -PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0./$(BUILDPYTHON) -Wi -t -c &quot;import lib2t=
o3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()&quot;<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0$(HOSTPYTHON) -Wi -t -c &quot;import lib2to3.=
pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()&quot;<br>
-<br>
- # Create the PLATDIR source directory, if one wasn&#39;t distributed..<br=
>
- $(srcdir)/Lib/$(PLATDIR):<br>
-@@ -1049,7 +1050,7 @@ libainstall: =A0 =A0 all python-config<br>
- # Install the dynamically loadable modules<br>
- # This goes into $(exec_prefix)<br>
- sharedinstall: sharedmods<br>
-- =A0 =A0 =A0$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \=
<br>
-+ =A0 =A0 =A0$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \<br=
>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 --prefix=3D$(prefix) \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 --install-scripts=3D$(BINDIR) \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 --install-platlib=3D$(DESTSHARED) \<br>
-Index: Python-2.7.2/setup.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- Python-2.7.2.orig/setup.py<br>
-+++ Python-2.7.2/setup.py<br>
-@@ -313,6 +313,7 @@ class PyBuildExt(build_ext):<br>
- =A0 =A0 =A0 =A0 =A0 =A0 self.failed.append(<a href=3D"http://ext.name" ta=
rget=3D"_blank">ext.name</a>)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 self.announce(&#39;*** WARNING: renaming &quot;%s=
&quot; since importing it&#39;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &#39; failed: %s&#39;=
 % (<a href=3D"http://ext.name" target=3D"_blank">ext.name</a>, why), level=
=3D3)<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0return<br>
- =A0 =A0 =A0 =A0 =A0 =A0 assert not self.inplace<br>
- =A0 =A0 =A0 =A0 =A0 =A0 basename, tail =3D os.path.splitext(ext_filename)=
<br>
- =A0 =A0 =A0 =A0 =A0 =A0 newname =3D basename + &quot;_failed&quot; + tail=
<br>
-@@ -369,8 +370,8 @@ class PyBuildExt(build_ext):<br>
-<br>
- =A0 =A0 def detect_modules(self):<br>
- =A0 =A0 =A0 =A0 # Ensure that /usr/local is always used<br>
-- =A0 =A0 =A0 =A0add_dir_to_list(self.compiler.library_dirs, &#39;/usr/loc=
al/lib&#39;)<br>
-- =A0 =A0 =A0 =A0add_dir_to_list(self.compiler.include_dirs, &#39;/usr/loc=
al/include&#39;)<br>
-+ =A0 =A0 =A0 =A0#add_dir_to_list(self.compiler.library_dirs, &#39;/usr/lo=
cal/lib&#39;)<br>
-+ =A0 =A0 =A0 =A0#add_dir_to_list(self.compiler.include_dirs, &#39;/usr/lo=
cal/include&#39;)<br>
- =A0 =A0 =A0 =A0 self.add_multiarch_paths()<br>
-<br>
- =A0 =A0 =A0 =A0 # Add paths specified in the environment variables LDFLAG=
S and<br>
-@@ -475,6 +476,9 @@ class PyBuildExt(build_ext):<br>
-<br>
- =A0 =A0 =A0 =A0 # XXX Omitted modules: gl, pure, dl, SGI-specific modules=
<br>
-<br>
-+ =A0 =A0 =A0 =A0lib_dirs =3D [ os.getenv( &quot;STAGING_LIBDIR&quot; ) ]<=
br>
-+ =A0 =A0 =A0 =A0inc_dirs =3D [ os.getenv( &quot;STAGING_INCDIR&quot; ) ]<=
br>
-+ =A0 =A0 =A0 =A0lib_dirs +=3D os.getenv(&#39;LIBRARY_PATH&#39;, &#39;&#39=
;).split(os.pathsep)<br>
- =A0 =A0 =A0 =A0 #<br>
- =A0 =A0 =A0 =A0 # The following modules are all pretty straightforward, a=
nd compile<br>
- =A0 =A0 =A0 =A0 # on pretty much any POSIXish platform.<br>
-@@ -677,8 +681,8 @@ class PyBuildExt(build_ext):<br>
- =A0 =A0 =A0 =A0 =A0 =A0 elif curses_library:<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 readline_libs.append(curses_library)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 elif self.compiler.find_library_file(lib_dirs +<b=
r>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [&#39;/usr/lib/termcap&#39;],<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &#39;termcap&#39;):<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 [&#39;/usr/lib/termcap&#39;],<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 &#39;termcap&#39;):<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 readline_libs.append(&#39;termcap&#39;)<b=
r>
- =A0 =A0 =A0 =A0 =A0 =A0 exts.append( Extension(&#39;readline&#39;, [&#39;=
readline.c&#39;],<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0li=
brary_dirs=3D[&#39;/usr/lib/termcap&#39;],<br>
diff --git a/recipes-devtools/python/python_2.7.3.bbappend b/recipes-devtoo=
ls/python/python_2.7.3.bbappend<br>
deleted file mode 100644<br>
index e39deba..0000000<br>
--- a/recipes-devtools/python/python_2.7.3.bbappend<br>
+++ /dev/null<br>
@@ -1,9 +0,0 @@<br>
-THISDIR :=3D &quot;${@os.path.dirname(bb.data.getVar(&#39;FILE&#39;, d, Tr=
ue))}&quot;<br>
-FILESPATH =3D. &quot;${@base_set_filespath([&quot;${THISDIR}/${PN}&quot;],=
 d)}:&quot;<br>
-<br>
-DEPENDS +=3D &quot; ncurses&quot;<br>
-<br>
-do_compile_prepend() {<br>
- =A0 =A0 =A0 export LIBRARY_PATH=3D${STAGING_DIR_TARGET}/lib<br>
-}<br>
-<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;<br>
</div></div>

--047d7b15a58befa10104d121856a--
