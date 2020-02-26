Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.175.1582676219534145200
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@gmail.com header.s=20161025 header.b=gWssCxrU;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 648BEE016E9; Tue, 25 Feb 2020 16:16:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.210.175 listed in list.dnswl.org]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DA69E016B6
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:55 -0800 (PST)
Received: by mail-pf1-f175.google.com with SMTP id b185so450668pfb.7
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FHuisCnNwsTxF4kNkTrZfhBnbO29URdwc7WztyaiAUw=;
        b=gWssCxrUC7Z8T2Q8ov1a7MWm8Pc9uuLCLgCEHj75pzgauidpXvqHX4AqzlMqswGTu1
         3eTHGgCxIeq1jA8+rOod3baVXPHjRhZmv5VbM0ULhmB9b+SlmrGGnBqusxsN6JoIijUR
         +mlITcP6Q1FtdhNP1Bzn9OVmPCVe3c0ljXULQOyo99MaoDvwnmybY1thVj9mstZ1fbpE
         MsZijK2mc/5dlQJiiY1n4LYtLhzcQmR/zZ/eo869ye+hRCo9TvwjC0+o/rq6yZfPINtz
         NJk0szACugLbK+Ki1A7EaI3JwwoXUxUh+hiT0VzcG8ESSJQCSh7rBXPpbefiBrkn3ey/
         4LQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FHuisCnNwsTxF4kNkTrZfhBnbO29URdwc7WztyaiAUw=;
        b=pFBKmkfck0zDLmub8K8yUXlavummBpou8JmeXpV/T1KeC0The1P3joLKHTqdtpjPHl
         YIzmyWvTtNx1mfbyLpsZLfVByZKcfW/Qgx1fZBtAscnA9tm4dUSNKd0+HMN6DhUHdyVY
         SWLjcwTxwxDpSbPqaoVvrAlqHH8+tw4Hb+ASYqiNv9rdNdNXldhi8bYc8ep8kdAt6yFF
         wfr95fxfKU//9A9HDDPwKIiTQIHhujt6GB8/8+rbyDnr0P9EnlnZvlFXCHydRr/m6oGK
         mn4I/+1ui3YlqSBV3DAXEsbYpFF+lW44SIh896DazJ7QJeoBWhfo59z90ggZXGKOYj/I
         imDg==
X-Gm-Message-State: APjAAAXjECmfKGcI3IymYXaknhsjcewpAIQTAg8ZEAZLAkiBPMP9GCVe
	98BqiYprHL20Go5JON6qFPfto5LA
X-Google-Smtp-Source: APXvYqxTdTdVcXPMGImCjkulpmGBhUrIPmHtjvGvJM+CnUBZYoLlWu8eDYxoMAW24H1jtxH+80M8Dw==
X-Received: by 2002:a63:c00a:: with SMTP id h10mr1004144pgg.31.1582676212657;
        Tue, 25 Feb 2020 16:16:52 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:51 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 15/22] xen, xen-tools: update recipes for python3
Date: Tue, 25 Feb 2020 16:15:59 -0800
Message-Id: <20200226001606.14750-16-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Christopher Clark <christopher.w.clark@gmail.com>

Adds patches for packaged scripts to enable deployment with python3
where they have been ported to python 3 upstream.

setuptools3 inherits distutils3 which modifies ${B}, so cd ${S} is
needed in the do_configure, do_compile and do_install steps.

Remove python 2 dependency from the Xen recipes by adding a new
separate recipe, xen-python2, for packaging the remaining optional
scripts which are yet to be ported to python 3. Package naming in
the separate recipe is chosen to support transition back into the
xen-tools recipe if the scripts are ported later.

Use RSUGGESTS to support inclusion of the xen-python2 scripts in
images that include python 2.

Drop the remus package python dependency since the script was removed
in 2014: commit 5b66f84e37a45038f9e5dae7a5768a5525d1e6ba

Add python3 RDEPENDS needed to run xenmon.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 ...ython-pygrub-pass-DISTUTILS-xen.4.12.patch |   7 +-
 .../files/xen-tools-libxl-gentypes-py3.patch  | 140 +++++
 ...tools-pygrub-change-tabs-into-spaces.patch |  40 ++
 ...-python-scripts-work-with-2.6-and-up.patch | 529 ++++++++++++++++++
 .../xen/files/xen-tools-pygrub-py3.patch      | 233 ++++++++
 ...ls-python-fix-Wsign-compare-warnings.patch | 136 +++++
 ...n-tools-update-python-scripts-to-py3.patch | 140 +++++
 recipes-extended/xen/xen-hypervisor.inc       |   4 +-
 recipes-extended/xen/xen-python2.bb           |  68 +++
 recipes-extended/xen/xen-tools.inc            |  57 +-
 recipes-extended/xen/xen-tools_git.bb         |   6 +
 recipes-extended/xen/xen.inc                  |  11 +-
 12 files changed, 1344 insertions(+), 27 deletions(-)
 create mode 100644 recipes-extended/xen/files/xen-tools-libxl-gentypes-p=
y3.patch
 create mode 100644 recipes-extended/xen/files/xen-tools-pygrub-change-ta=
bs-into-spaces.patch
 create mode 100644 recipes-extended/xen/files/xen-tools-pygrub-make-pyth=
on-scripts-work-with-2.6-and-up.patch
 create mode 100644 recipes-extended/xen/files/xen-tools-pygrub-py3.patch
 create mode 100644 recipes-extended/xen/files/xen-tools-python-fix-Wsign=
-compare-warnings.patch
 create mode 100644 recipes-extended/xen/files/xen-tools-update-python-sc=
ripts-to-py3.patch
 create mode 100644 recipes-extended/xen/xen-python2.bb

diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS=
-xen.4.12.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DIST=
UTILS-xen.4.12.patch
index 6504d86..96e907d 100644
--- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.=
12.patch
+++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.=
12.patch
@@ -13,11 +13,14 @@ Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3=
mdeb.com>
 Forward-ported to Xen 4.12.0
 Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
=20
+Modified to support pygrub installation with python 3
+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+
 diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
 index 3063c49..513314b 100644
 --- a/tools/pygrub/Makefile
 +++ b/tools/pygrub/Makefile
-@@ -10,14 +10,15 @@ INSTALL_LOG =3D build/installed_files.txt
+@@ -10,14 +10,17 @@ INSTALL_LOG =3D build/installed_files.txt
  all: build
  .PHONY: build
  build:
@@ -32,6 +35,8 @@ index 3063c49..513314b 100644
 -		 --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force
 +		 --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force \
 +		 $(DISTUTILS_INSTALL_ARGS)
++	rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
++	$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
  	set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
  	             "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
  	             "`readlink -f $(LIBEXEC_BIN)`" ]; then \
diff --git a/recipes-extended/xen/files/xen-tools-libxl-gentypes-py3.patc=
h b/recipes-extended/xen/files/xen-tools-libxl-gentypes-py3.patch
new file mode 100644
index 0000000..2399786
--- /dev/null
+++ b/recipes-extended/xen/files/xen-tools-libxl-gentypes-py3.patch
@@ -0,0 +1,140 @@
+From 660d2dd863802ef464c90b32f187cb65861f8185 Mon Sep 17 00:00:00 2001
+From: Wei Liu <wei.liu2@citrix.com>
+Date: Thu, 7 Mar 2019 12:33:38 +0000
+Subject: [PATCH] libxl: make python scripts work with python 2.6 and up
+
+Go through transformations suggested by 2to3 and pick the necessary
+ones.
+
+Signed-off-by: Wei Liu <wei.liu2@citrix.com>
+Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
+---
+ tools/libxl/gentest.py  |  4 +++-
+ tools/libxl/gentypes.py | 12 +++++++-----
+ tools/libxl/idl.py      | 15 ++++++++-------
+ 3 files changed, 18 insertions(+), 13 deletions(-)
+
+diff --git a/tools/libxl/gentest.py b/tools/libxl/gentest.py
+index 989959fc68..1cc7eebc82 100644
+--- a/tools/libxl/gentest.py
++++ b/tools/libxl/gentest.py
+@@ -1,5 +1,7 @@
+ #!/usr/bin/python
+=20
++from __future__ import print_function
++
+ import os
+ import sys
+ import re
+@@ -86,7 +88,7 @@ def gen_rand_init(ty, v, indent =3D "    ", parent =3D=
 None):
+=20
+ if __name__ =3D=3D '__main__':
+     if len(sys.argv) < 3:
+-        print >>sys.stderr, "Usage: gentest.py <idl> <implementation>"
++        print("Usage: gentest.py <idl> <implementation>", file=3Dsys.st=
derr)
+         sys.exit(1)
+=20
+     random.seed(os.getenv('LIBXL_TESTIDL_SEED'))
+diff --git a/tools/libxl/gentypes.py b/tools/libxl/gentypes.py
+index 88e5c5f30e..6417c9dd8c 100644
+--- a/tools/libxl/gentypes.py
++++ b/tools/libxl/gentypes.py
+@@ -1,5 +1,7 @@
+ #!/usr/bin/python
+=20
++from __future__ import print_function
++
+ import sys
+ import re
+=20
+@@ -576,14 +578,14 @@ def libxl_C_enum_from_string(ty, str, e, indent =3D=
 "    "):
+=20
+ if __name__ =3D=3D '__main__':
+     if len(sys.argv) !=3D 6:
+-        print >>sys.stderr, "Usage: gentypes.py <idl> <header> <header-=
private> <header-json> <implementation>"
++        print("Usage: gentypes.py <idl> <header> <header-private> <head=
er-json> <implementation>", file=3Dsys.stderr)
+         sys.exit(1)
+=20
+     (_, idlname, header, header_private, header_json, impl) =3D sys.arg=
v
+=20
+     (builtins,types) =3D idl.parse(idlname)
+=20
+-    print "outputting libxl type definitions to %s" % header
++    print("outputting libxl type definitions to %s" % header)
+=20
+     f =3D open(header, "w")
+=20
+@@ -633,7 +635,7 @@ if __name__ =3D=3D '__main__':
+     f.write("""#endif /* %s */\n""" % (header_define))
+     f.close()
+=20
+-    print "outputting libxl JSON definitions to %s" % header_json
++    print("outputting libxl JSON definitions to %s" % header_json)
+=20
+     f =3D open(header_json, "w")
+=20
+@@ -657,7 +659,7 @@ if __name__ =3D=3D '__main__':
+     f.write("""#endif /* %s */\n""" % header_json_define)
+     f.close()
+=20
+-    print "outputting libxl type internal definitions to %s" % header_p=
rivate
++    print("outputting libxl type internal definitions to %s" % header_p=
rivate)
+=20
+     f =3D open(header_private, "w")
+=20
+@@ -683,7 +685,7 @@ if __name__ =3D=3D '__main__':
+     f.write("""#endif /* %s */\n""" % header_json_define)
+     f.close()
+=20
+-    print "outputting libxl type implementations to %s" % impl
++    print("outputting libxl type implementations to %s" % impl)
+=20
+     f =3D open(impl, "w")
+     f.write("""
+diff --git a/tools/libxl/idl.py b/tools/libxl/idl.py
+index 2a7f3c44fe..d7367503b4 100644
+--- a/tools/libxl/idl.py
++++ b/tools/libxl/idl.py
+@@ -1,3 +1,5 @@
++from __future__ import print_function
++
+ import sys
+=20
+ PASS_BY_VALUE =3D 1
+@@ -11,7 +13,7 @@ DIR_BOTH =3D 3
+ _default_namespace =3D ""
+ def namespace(s):
+     if type(s) !=3D str:
+-        raise TypeError, "Require a string for the default namespace."
++        raise TypeError("Require a string for the default namespace.")
+     global _default_namespace
+     _default_namespace =3D s
+=20
+@@ -346,7 +348,7 @@ class OrderedDict(dict):
+         return [(x,self[x]) for x in self.__ordered]
+=20
+ def parse(f):
+-    print >>sys.stderr, "Parsing %s" % f
++    print("Parsing %s" % f, file=3Dsys.stderr)
+=20
+     globs =3D {}
+     locs =3D OrderedDict()
+@@ -362,11 +364,10 @@ def parse(f):
+             globs[n] =3D t
+=20
+     try:
+-        execfile(f, globs, locs)
+-    except SyntaxError,e:
+-        raise SyntaxError, \
+-              "Errors were found at line %d while processing %s:\n\t%s"=
\
+-              %(e.lineno,f,e.text)
++        exec(compile(open(f).read(), f, 'exec'), globs, locs)
++    except SyntaxError as e:
++        raise SyntaxError("Errors were found at line %d while processin=
g %s:\n\t%s"
++                          % (e.lineno, f, e.text))
+=20
+     types =3D [t for t in locs.ordered_values() if isinstance(t,Type)]
+=20
+--=20
+2.17.1
+
diff --git a/recipes-extended/xen/files/xen-tools-pygrub-change-tabs-into=
-spaces.patch b/recipes-extended/xen/files/xen-tools-pygrub-change-tabs-i=
nto-spaces.patch
new file mode 100644
index 0000000..d913be2
--- /dev/null
+++ b/recipes-extended/xen/files/xen-tools-pygrub-change-tabs-into-spaces=
.patch
@@ -0,0 +1,40 @@
+From b9e1368af14ded6aee3bdf64e8329628b16291ff Mon Sep 17 00:00:00 2001
+From: Wei Liu <wei.liu2@citrix.com>
+Date: Mon, 11 Mar 2019 12:55:29 +0000
+Subject: [PATCH] pygrub: change tabs into spaces
+
+Not sure why Python 2 never complained, but Python 3 does.
+
+Change tabs to spaces.
+
+Signed-off-by: Wei Liu <wei.liu2@citrix.com>
+Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
+---
+ tools/pygrub/src/pygrub | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
+index 52a8965ad9..1189b1ca48 100755
+--- a/tools/pygrub/src/pygrub
++++ b/tools/pygrub/src/pygrub
+@@ -858,7 +858,7 @@ if __name__ =3D=3D "__main__":
+             output_directory =3D a
+=20
+     if debug:
+-	logging.basicConfig(level=3Dlogging.DEBUG)
++        logging.basicConfig(level=3Dlogging.DEBUG)
+=20
+=20
+     try:
+@@ -917,7 +917,7 @@ if __name__ =3D=3D "__main__":
+             # IOErrors raised by fsimage.open
+             # RuntimeErrors raised by run_grub if no menu.lst present
+             if debug:
+-		traceback.print_exc()
++                traceback.print_exc()
+             fs =3D None
+             continue
+=20
+--=20
+2.17.1
+
diff --git a/recipes-extended/xen/files/xen-tools-pygrub-make-python-scri=
pts-work-with-2.6-and-up.patch b/recipes-extended/xen/files/xen-tools-pyg=
rub-make-python-scripts-work-with-2.6-and-up.patch
new file mode 100644
index 0000000..f4cbb67
--- /dev/null
+++ b/recipes-extended/xen/files/xen-tools-pygrub-make-python-scripts-wor=
k-with-2.6-and-up.patch
@@ -0,0 +1,529 @@
+From 0aabd89dcfee9ee2a6caaa2ec7a475daf5cada53 Mon Sep 17 00:00:00 2001
+From: Wei Liu <wei.liu2@citrix.com>
+Date: Thu, 7 Mar 2019 12:45:47 +0000
+Subject: [PATCH] pygrub: make python scripts work with 2.6 and up
+
+Run 2to3 and pick the sensible suggestions.
+
+Import print_function and absolute_import so 2.6 can work.
+
+There has never been a curses.wrapper module according to 2.x and 3.x
+doc, only a function, so "import curses.wrapper" is not correct. It
+happened to work because 2.x implemented a (undocumented) module.
+
+We only need to import curses to make curses.wrapper available to
+pygrub.
+
+Signed-off-by: Wei Liu <wei.liu2@citrix.com>
+Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
+---
+ tools/pygrub/src/ExtLinuxConf.py | 19 +++++----
+ tools/pygrub/src/GrubConf.py     | 39 ++++++++++--------
+ tools/pygrub/src/LiloConf.py     | 19 +++++----
+ tools/pygrub/src/pygrub          | 71 ++++++++++++++++----------------
+ 4 files changed, 78 insertions(+), 70 deletions(-)
+
+diff --git a/tools/pygrub/src/ExtLinuxConf.py b/tools/pygrub/src/ExtLinu=
xConf.py
+index d1789bf020..9fd635b9cf 100644
+--- a/tools/pygrub/src/ExtLinuxConf.py
++++ b/tools/pygrub/src/ExtLinuxConf.py
+@@ -10,9 +10,11 @@
+ # along with this program; If not, see <http://www.gnu.org/licenses/>.
+ #
+=20
++from __future__ import print_function, absolute_import
++
+ import sys, re, os
+ import logging
+-import GrubConf
++from . import GrubConf
+=20
+ class ExtLinuxImage(object):
+     def __init__(self, lines, path):
+@@ -32,7 +34,8 @@ class ExtLinuxImage(object):
+         self.lines =3D []
+         self.path =3D path
+         self.root =3D ""
+-        map(self.set_from_line, lines)
++        for line in lines:
++            self.set_from_line(line)
+=20
+     def set_from_line(self, line, replace =3D None):
+         (com, arg) =3D GrubConf.grub_exact_split(line, 2)
+@@ -67,7 +70,7 @@ class ExtLinuxImage(object):
+                         setattr(self, "initrd", a.replace("initrd=3D", =
""))
+                         arg =3D arg.replace(a, "")
+=20
+-        if com is not None and self.commands.has_key(com):
++        if com is not None and com in self.commands:
+             if self.commands[com] is not None:
+                 setattr(self, self.commands[com], re.sub('^"(.+)"$', r"=
\1", arg.strip()))
+             else:
+@@ -136,7 +139,7 @@ class ExtLinuxConfigFile(object):
+     def parse(self, buf =3D None):
+         if buf is None:
+             if self.filename is None:
+-                raise ValueError, "No config file defined to parse!"
++                raise ValueError("No config file defined to parse!")
+=20
+             f =3D open(self.filename, 'r')
+             lines =3D f.readlines()
+@@ -167,7 +170,7 @@ class ExtLinuxConfigFile(object):
+=20
+             (com, arg) =3D GrubConf.grub_exact_split(l, 2)
+             com =3D com.lower()
+-            if self.commands.has_key(com):
++            if com in self.commands:
+                 if self.commands[com] is not None:
+                     setattr(self, self.commands[com], arg.strip())
+                 else:
+@@ -207,8 +210,8 @@ class ExtLinuxConfigFile(object):
+        =20
+ if __name__ =3D=3D "__main__":
+     if len(sys.argv) < 2:
+-        raise RuntimeError, "Need a configuration file to read"
++        raise RuntimeError("Need a configuration file to read")
+     g =3D ExtLinuxConfigFile(sys.argv[1])
+     for i in g.images:
+-        print i
+-    print g.default
++        print(i)
++    print(g.default)
+diff --git a/tools/pygrub/src/GrubConf.py b/tools/pygrub/src/GrubConf.py
+index dc810d55cb..f8d3799dc0 100644
+--- a/tools/pygrub/src/GrubConf.py
++++ b/tools/pygrub/src/GrubConf.py
+@@ -12,6 +12,8 @@
+ # along with this program; If not, see <http://www.gnu.org/licenses/>.
+ #
+=20
++from __future__ import print_function, absolute_import
++
+ import os, sys
+ import logging
+ import re
+@@ -44,7 +46,7 @@ def get_path(s):
+         return (None, s)
+     idx =3D s.find(')')
+     if idx =3D=3D -1:
+-        raise ValueError, "Unable to find matching ')'"
++        raise ValueError("Unable to find matching ')'")
+     d =3D s[:idx]
+     return (GrubDiskPart(d), s[idx + 1:])
+=20
+@@ -100,7 +102,8 @@ class _GrubImage(object):
+                 "  initrd: %s\n" %(self.title, self.root, self.kernel,
+                                    self.args, self.initrd))
+     def _parse(self, lines):
+-        map(self.set_from_line, lines)
++        for line in lines:
++            self.set_from_line(line)
+=20
+     def reset(self, lines):
+         self._root =3D self._initrd =3D self._kernel =3D self._args =3D=
 None
+@@ -141,7 +144,7 @@ class GrubImage(_GrubImage):
+     def set_from_line(self, line, replace =3D None):
+         (com, arg) =3D grub_exact_split(line, 2)
+=20
+-        if self.commands.has_key(com):
++        if com in self.commands:
+             if self.commands[com] is not None:
+                 setattr(self, self.commands[com], arg.strip())
+             else:
+@@ -177,7 +180,7 @@ class _GrubConfigFile(object):
+             self.parse()
+=20
+     def parse(self, buf =3D None):
+-        raise RuntimeError, "unimplemented parse function"  =20
++        raise RuntimeError("unimplemented parse function")
+=20
+     def hasPasswordAccess(self):
+         return self.passwordAccess
+@@ -201,7 +204,7 @@ class _GrubConfigFile(object):
+                 import crypt
+                 if crypt.crypt(password, pwd[1]) =3D=3D pwd[1]:
+                     return True
+-            except Exception, e:
++            except Exception as e:
+                 self.passExc =3D "Can't verify password: %s" % str(e)
+                 return False
+=20
+@@ -213,7 +216,7 @@ class _GrubConfigFile(object):
+=20
+     def set(self, line):
+         (com, arg) =3D grub_exact_split(line, 2)
+-        if self.commands.has_key(com):
++        if com in self.commands:
+             if self.commands[com] is not None:
+                 setattr(self, self.commands[com], arg.strip())
+             else:
+@@ -233,7 +236,7 @@ class _GrubConfigFile(object):
+             self._default =3D val
+=20
+         if self._default < 0:
+-            raise ValueError, "default must be positive number"
++            raise ValueError("default must be positive number")
+     default =3D property(_get_default, _set_default)
+=20
+     def set_splash(self, val):
+@@ -265,7 +268,7 @@ class GrubConfigFile(_GrubConfigFile):
+     def parse(self, buf =3D None):
+         if buf is None:
+             if self.filename is None:
+-                raise ValueError, "No config file defined to parse!"
++                raise ValueError("No config file defined to parse!")
+=20
+             f =3D open(self.filename, 'r')
+             lines =3D f.readlines()
+@@ -296,7 +299,7 @@ class GrubConfigFile(_GrubConfigFile):
+                 continue
+=20
+             (com, arg) =3D grub_exact_split(l, 2)
+-            if self.commands.has_key(com):
++            if com in self.commands:
+                 if self.commands[com] is not None:
+                     setattr(self, self.commands[com], arg.strip())
+                 else:
+@@ -328,7 +331,7 @@ class Grub2Image(_GrubImage):
+         if com =3D=3D "set":
+             (com,arg) =3D grub2_handle_set(arg)
+            =20
+-        if self.commands.has_key(com):
++        if com in self.commands:
+             if self.commands[com] is not None:
+                 setattr(self, self.commands[com], arg.strip())
+             else:
+@@ -364,7 +367,7 @@ class Grub2ConfigFile(_GrubConfigFile):
+     def parse(self, buf =3D None):
+         if buf is None:
+             if self.filename is None:
+-                raise ValueError, "No config file defined to parse!"
++                raise ValueError("No config file defined to parse!")
+=20
+             f =3D open(self.filename, 'r')
+             lines =3D f.readlines()
+@@ -398,7 +401,7 @@ class Grub2ConfigFile(_GrubConfigFile):
+             title_match =3D re.match('^menuentry ["\'](.*?)["\'] (.*){'=
, l)
+             if title_match:
+                 if img is not None:
+-                    raise RuntimeError, "syntax error: cannot nest menu=
entry (%d %s)" % (len(img),img)
++                    raise RuntimeError("syntax error: cannot nest menue=
ntry (%d %s)" % (len(img),img))
+                 img =3D []
+                 title =3D title_match.group(1)
+                 continue
+@@ -413,7 +416,7 @@ class Grub2ConfigFile(_GrubConfigFile):
+                         menu_level -=3D 1
+                         continue
+                     else:
+-                        raise RuntimeError, "syntax error: closing brac=
e without menuentry"
++                        raise RuntimeError("syntax error: closing brace=
 without menuentry")
+=20
+                 self.add_image(Grub2Image(title, img))
+                 img =3D None
+@@ -428,7 +431,7 @@ class Grub2ConfigFile(_GrubConfigFile):
+             if com =3D=3D "set":
+                 (com,arg) =3D grub2_handle_set(arg)
+                =20
+-            if self.commands.has_key(com):
++            if com in self.commands:
+                 if self.commands[com] is not None:
+                     arg_strip =3D arg.strip()
+                     if arg_strip =3D=3D "${saved_entry}" or arg_strip =3D=
=3D "${next_entry}":
+@@ -443,7 +446,7 @@ class Grub2ConfigFile(_GrubConfigFile):
+                 logging.warning("Unknown directive %s" %(com,))
+            =20
+         if img is not None:
+-            raise RuntimeError, "syntax error: end of file with open me=
nuentry(%d %s)" % (len(img),img)
++            raise RuntimeError("syntax error: end of file with open men=
uentry(%d %s)" % (len(img),img))
+=20
+         if self.hasPassword():
+             self.setPasswordAccess(False)
+@@ -462,12 +465,12 @@ class Grub2ConfigFile(_GrubConfigFile):
+        =20
+ if __name__ =3D=3D "__main__":
+     if len(sys.argv) < 3:
+-        raise RuntimeError, "Need a grub version (\"grub\" or \"grub2\"=
) and a grub.conf or grub.cfg to read"
++        raise RuntimeError('Need a grub version ("grub" or "grub2") and=
 a grub.conf or grub.cfg to read')
+     if sys.argv[1] =3D=3D "grub":
+         g =3D GrubConfigFile(sys.argv[2])
+     elif sys.argv[1] =3D=3D "grub2":
+         g =3D Grub2ConfigFile(sys.argv[2])
+     else:
+-        raise RuntimeError, "Unknown config type %s" % sys.argv[1]
++        raise RuntimeError("Unknown config type %s" % sys.argv[1])
+     for i in g.images:
+-        print i #, i.title, i.root, i.kernel, i.args, i.initrd
++        print(i) #, i.title, i.root, i.kernel, i.args, i.initrd
+diff --git a/tools/pygrub/src/LiloConf.py b/tools/pygrub/src/LiloConf.py
+index 2cb649f115..e3bfcb5244 100644
+--- a/tools/pygrub/src/LiloConf.py
++++ b/tools/pygrub/src/LiloConf.py
+@@ -2,9 +2,11 @@
+ #LiloConf.py
+ #
+=20
++from __future__ import print_function, absolute_import
++
+ import sys, re, os
+ import logging
+-import GrubConf
++from . import GrubConf
+=20
+ class LiloImage(object):
+     def __init__(self, lines, path):
+@@ -24,12 +26,13 @@ class LiloImage(object):
+         self.lines =3D []
+         self.path =3D path
+         self.root =3D ""
+-        map(self.set_from_line, lines)
++        for line in lines:
++            self.set_from_line(line)
+=20
+     def set_from_line(self, line, replace =3D None):
+         (com, arg) =3D GrubConf.grub_exact_split(line, 2)
+=20
+-        if self.commands.has_key(com):
++        if com in self.commands:
+             if self.commands[com] is not None:
+                 setattr(self, self.commands[com], re.sub('^"(.+)"$', r"=
\1", arg.strip()))
+             else:
+@@ -97,7 +100,7 @@ class LiloConfigFile(object):
+     def parse(self, buf =3D None):
+         if buf is None:
+             if self.filename is None:
+-                raise ValueError, "No config file defined to parse!"
++                raise ValueError("No config file defined to parse!")
+=20
+             f =3D open(self.filename, 'r')
+             lines =3D f.readlines()
+@@ -127,7 +130,7 @@ class LiloConfigFile(object):
+                 continue
+=20
+             (com, arg) =3D GrubConf.grub_exact_split(l, 2)
+-            if self.commands.has_key(com):
++            if com in self.commands:
+                 if self.commands[com] is not None:
+                     setattr(self, self.commands[com], arg.strip())
+                 else:
+@@ -170,8 +173,8 @@ class LiloConfigFile(object):
+=20
+ if __name__ =3D=3D "__main__":
+     if len(sys.argv) < 2:
+-        raise RuntimeError, "Need a lilo.conf to read"
++        raise RuntimeError("Need a lilo.conf to read")
+     g =3D LiloConfigFile(sys.argv[1])
+     for i in g.images:
+-        print i #, i.title, i.root, i.kernel, i.args, i.initrd
+-    print g.default
++        print(i) #, i.title, i.root, i.kernel, i.args, i.initrd
++    print(g.default)
+diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
+index 1189b1ca48..dbdce315c6 100755
+--- a/tools/pygrub/src/pygrub
++++ b/tools/pygrub/src/pygrub
+@@ -12,13 +12,15 @@
+ # along with this program; If not, see <http://www.gnu.org/licenses/>.
+ #
+=20
++from __future__ import print_function
++
+ import os, sys, string, struct, tempfile, re, traceback, stat, errno
+ import copy
+ import logging
+ import platform
+ import xen.lowlevel.xc
+=20
+-import curses, _curses, curses.wrapper, curses.textpad, curses.ascii
++import curses, _curses, curses.textpad, curses.ascii
+ import getopt
+=20
+ import xenfsimage
+@@ -77,7 +79,7 @@ def get_solaris_slice(file, offset):
+     buf =3D os.read(fd, 512)
+     os.close(fd)
+     if struct.unpack("<H", buf[508:510])[0] !=3D DKL_MAGIC:
+-        raise RuntimeError, "Invalid disklabel magic"
++        raise RuntimeError("Invalid disklabel magic")
+=20
+     nslices =3D struct.unpack("<H", buf[30:32])[0]
+=20
+@@ -88,7 +90,7 @@ def get_solaris_slice(file, offset):
+         if slicetag =3D=3D V_ROOT:
+             return slicesect * SECTOR_SIZE
+=20
+-    raise RuntimeError, "No root slice found"     =20
++    raise RuntimeError("No root slice found")
+=20
+ def get_fs_offset_gpt(file):
+     fd =3D os.open(file, os.O_RDONLY)
+@@ -423,20 +425,17 @@ class Grub:
+         we're being given a raw config file rather than a disk image.""=
"
+        =20
+         if not os.access(fn, os.R_OK):
+-            raise RuntimeError, "Unable to access %s" %(fn,)
++            raise RuntimeError("Unable to access %s" %(fn,))
+=20
+-        cfg_list =3D map(lambda x: (x,grub.GrubConf.Grub2ConfigFile),
+-                       ["/boot/grub/grub.cfg", "/grub/grub.cfg",
+-                        "/boot/grub2/grub.cfg", "/grub2/grub.cfg"]) + \
+-                   map(lambda x: (x,grub.ExtLinuxConf.ExtLinuxConfigFil=
e),
+-                       ["/boot/isolinux/isolinux.cfg",
++        cfg_list =3D [(x,grub.GrubConf.Grub2ConfigFile) for x in ["/boo=
t/grub/grub.cfg", "/grub/grub.cfg",
++                        "/boot/grub2/grub.cfg", "/grub2/grub.cfg"]] + \
++                   [(x,grub.ExtLinuxConf.ExtLinuxConfigFile) for x in [=
"/boot/isolinux/isolinux.cfg",
+                         "/boot/extlinux/extlinux.conf",
+                         "/boot/extlinux.conf",
+                         "/extlinux/extlinux.conf",
+-                        "/extlinux.conf"]) + \
+-                   map(lambda x: (x,grub.GrubConf.GrubConfigFile),
+-                       ["/boot/grub/menu.lst", "/boot/grub/grub.conf",
+-                        "/grub/menu.lst", "/grub/grub.conf"])
++                        "/extlinux.conf"]] + \
++                   [(x,grub.GrubConf.GrubConfigFile) for x in ["/boot/g=
rub/menu.lst", "/boot/grub/grub.conf",
++                        "/grub/menu.lst", "/grub/grub.conf"]]
+=20
+         if not fs:
+             # set the config file and parse it
+@@ -448,12 +447,12 @@ class Grub:
+=20
+         for f,parser in cfg_list:
+             if fs.file_exists(f):
+-                print >>sys.stderr, "Using %s to parse %s" % (parser,f)
++                print("Using %s to parse %s" % (parser,f), file=3Dsys.s=
tderr)
+                 self.cf =3D parser()
+                 self.cf.filename =3D f
+                 break
+         if self.__dict__.get('cf', None) is None:
+-            raise RuntimeError, "couldn't find bootloader config file i=
n the image provided."
++            raise RuntimeError("couldn't find bootloader config file in=
 the image provided.")
+         f =3D fs.open_file(self.cf.filename)
+         # limit read size to avoid pathological cases
+         buf =3D f.read(FS_READ_MAX)
+@@ -628,11 +627,11 @@ def run_grub(file, entry, fs, cfg_args):
+     if list_entries:
+         for i in range(len(g.cf.images)):
+             img =3D g.cf.images[i]
+-            print "title: %s" % img.title
+-            print "  root: %s" % img.root
+-            print "  kernel: %s" % img.kernel[1]
+-            print "  args: %s" % img.args
+-            print "  initrd: %s" % img.initrd[1]
++            print("title: %s" % img.title)
++            print("  root: %s" % img.root)
++            print("  kernel: %s" % img.kernel[1])
++            print("  args: %s" % img.args)
++            print("  initrd: %s" % img.initrd[1])
+=20
+     if interactive and not list_entries:
+         curses.wrapper(run_main)
+@@ -646,7 +645,7 @@ def run_grub(file, entry, fs, cfg_args):
+            sel =3D idx
+=20
+     if sel =3D=3D -1:
+-        print "No kernel image selected!"
++        print("No kernel image selected!")
+         sys.exit(1)
+=20
+     try:
+@@ -731,7 +730,7 @@ def format_sxp(kernel, ramdisk, args):
+ def format_simple(kernel, ramdisk, args, sep):
+     for check in (kernel, ramdisk, args):
+         if check is not None and sep in check:
+-            raise RuntimeError, "simple format cannot represent delimit=
er-containing value"
++            raise RuntimeError("simple format cannot represent delimite=
r-containing value")
+     s =3D ("kernel %s" % kernel) + sep
+     if ramdisk:
+         s +=3D ("ramdisk %s" % ramdisk) + sep
+@@ -744,7 +743,7 @@ if __name__ =3D=3D "__main__":
+     sel =3D None
+    =20
+     def usage():
+-        print >> sys.stderr, "Usage: %s [-q|--quiet] [-i|--interactive]=
 [-l|--list-entries] [-n|--not-really] [--output=3D] [--kernel=3D] [--ram=
disk=3D] [--args=3D] [--entry=3D] [--output-directory=3D] [--output-forma=
t=3Dsxp|simple|simple0] [--offset=3D] <image>" %(sys.argv[0],)
++        print("Usage: %s [-q|--quiet] [-i|--interactive] [-l|--list-ent=
ries] [-n|--not-really] [--output=3D] [--kernel=3D] [--ramdisk=3D] [--arg=
s=3D] [--entry=3D] [--output-directory=3D] [--output-format=3Dsxp|simple|=
simple0] [--offset=3D] <image>" %(sys.argv[0],), file=3Dsys.stderr)
+=20
+     def copy_from_image(fs, file_to_read, file_type, output_directory,
+                         not_really):
+@@ -755,8 +754,8 @@ if __name__ =3D=3D "__main__":
+                 sys.exit("The requested %s file does not exist" % file_=
type)
+         try:
+             datafile =3D fs.open_file(file_to_read)
+-        except Exception, e:
+-            print >>sys.stderr, e
++        except Exception as e:
++            print(e, file=3Dsys.stderr)
+             sys.exit("Error opening %s in guest" % file_to_read)
+         (tfd, ret) =3D tempfile.mkstemp(prefix=3D"boot_"+file_type+".",
+                                       dir=3Doutput_directory)
+@@ -769,8 +768,8 @@ if __name__ =3D=3D "__main__":
+                 return ret
+             try:
+                 os.write(tfd, data)
+-            except Exception, e:
+-                print >>sys.stderr, e
++            except Exception as e:
++                print(e, file=3Dsys.stderr)
+                 os.close(tfd)
+                 os.unlink(ret)
+                 del datafile
+@@ -834,7 +833,7 @@ if __name__ =3D=3D "__main__":
+             try:
+                 part_offs =3D [ int(a) ]
+             except ValueError:
+-                print "offset value must be an integer"
++                print("offset value must be an integer")
+                 usage()
+                 sys.exit(1)
+         elif o in ("--entry",):
+@@ -847,13 +846,13 @@ if __name__ =3D=3D "__main__":
+             debug =3D True
+         elif o in ("--output-format",):
+             if a not in ["sxp", "simple", "simple0"]:
+-                print "unknown output format %s" % a
++                print("unknown output format %s" % a)
+                 usage()
+                 sys.exit(1)
+             output_format =3D a
+         elif o in ("--output-directory",):
+             if not os.path.isdir(a):
+-                print "%s is not an existing directory" % a
++                print("%s is not an existing directory" % a)
+                 sys.exit(1)
+             output_directory =3D a
+=20
+@@ -862,8 +861,8 @@ if __name__ =3D=3D "__main__":
+=20
+=20
+     try:
+-        os.makedirs(output_directory, 0700)
+-    except OSError,e:
++        os.makedirs(output_directory, 0o700)
++    except OSError as e:
+         if (e.errno =3D=3D errno.EEXIST) and os.path.isdir(output_direc=
tory):
+             pass
+         else:
+@@ -877,10 +876,10 @@ if __name__ =3D=3D "__main__":
+     # debug
+     if isconfig:
+         chosencfg =3D run_grub(file, entry, fs, incfg["args"])
+-        print "  kernel: %s" % chosencfg["kernel"]
++        print("  kernel: %s" % chosencfg["kernel"])
+         if chosencfg["ramdisk"]:
+-            print "  initrd: %s" % chosencfg["ramdisk"]
+-        print "  args: %s" % chosencfg["args"]
++            print("  initrd: %s" % chosencfg["ramdisk"])
++        print("  args: %s" % chosencfg["args"])
+         sys.exit(0)
+=20
+     # if boot filesystem is set then pass to fsimage.open
+@@ -926,7 +925,7 @@ if __name__ =3D=3D "__main__":
+=20
+     # Did looping through partitions find us a kernel?
+     if fs is None:
+-        raise RuntimeError, "Unable to find partition containing kernel=
"
++        raise RuntimeError("Unable to find partition containing kernel"=
)
+=20
+     bootcfg["kernel"] =3D copy_from_image(fs, chosencfg["kernel"], "ker=
nel",
+                                         output_directory, not_really)
+--=20
+2.17.1
+
diff --git a/recipes-extended/xen/files/xen-tools-pygrub-py3.patch b/reci=
pes-extended/xen/files/xen-tools-pygrub-py3.patch
new file mode 100644
index 0000000..e486646
--- /dev/null
+++ b/recipes-extended/xen/files/xen-tools-pygrub-py3.patch
@@ -0,0 +1,233 @@
+From 83a204e6951c6358f995da3b60dd61224e9d41ac Mon Sep 17 00:00:00 2001
+From: Wei Liu <wei.liu2@citrix.com>
+Date: Tue, 5 Mar 2019 14:13:17 +0000
+Subject: [PATCH] pygrub/fsimage: make it work with python 3
+
+With the help of two porting guides and cpython source code:
+
+1. Use PyBytes to replace PyString counterparts.
+2. Use PyVarObject_HEAD_INIT.
+3. Remove usage of Py_FindMethod.
+4. Use new module initialisation routine.
+
+For #3, Py_FindMethod was removed, yet an alternative wasn't
+documented.  The code is the result of reverse-engineering cpython
+commit 6116d4a1d1
+
+https://docs.python.org/3/howto/cporting.html
+http://python3porting.com/cextensions.html
+
+Signed-off-by: Wei Liu <wei.liu2@citrix.com>
+Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
+---
+ tools/pygrub/src/fsimage/fsimage.c | 123 ++++++++++++++++-------------
+ 1 file changed, 69 insertions(+), 54 deletions(-)
+
+diff --git a/tools/pygrub/src/fsimage/fsimage.c b/tools/pygrub/src/fsima=
ge/fsimage.c
+index 780207791c..2ebbbe35df 100644
+--- a/tools/pygrub/src/fsimage/fsimage.c
++++ b/tools/pygrub/src/fsimage/fsimage.c
+@@ -26,12 +26,6 @@
+ #include <xenfsimage.h>
+ #include <stdlib.h>
+=20
+-#if (PYTHON_API_VERSION >=3D 1011)
+-#define PY_PAD 0L,0L,0L,0L,0L,0L,0L,0L,0L,0L,0L,0L,0L,0L,0L,0L,0L,0L,0L=
,0L,0L,0L,0L,0L
+-#else
+-#define PY_PAD 0L,0L,0L,0L
+-#endif
+-
+ typedef struct fsimage_fs {
+ 	PyObject_HEAD
+ 	fsi_t *fs;
+@@ -59,12 +53,24 @@ fsimage_file_read(fsimage_file_t *file, PyObject *ar=
gs, PyObject *kwargs)
+=20
+ 	bufsize =3D size ? size : 4096;
+=20
+-	if ((buffer =3D PyString_FromStringAndSize(NULL, bufsize)) =3D=3D NULL=
)
++	buffer =3D
++#if PY_MAJOR_VERSION < 3
++		PyString_FromStringAndSize(NULL, bufsize);
++#else
++		PyBytes_FromStringAndSize(NULL, bufsize);
++#endif
++
++	if (buffer =3D=3D NULL)
+ 		return (NULL);
+ =20
+ 	while (1) {
+ 		int err;
+-		void *buf =3D PyString_AS_STRING(buffer) + bytesread;
++		void *buf =3D
++#if PY_MAJOR_VERSION < 3
++			PyString_AS_STRING(buffer) + bytesread;
++#else
++			PyBytes_AS_STRING(buffer) + bytesread;
++#endif
+=20
+ 		err =3D fsi_pread_file(file->file, buf, bufsize,
+ 		    bytesread + offset);
+@@ -84,12 +90,20 @@ fsimage_file_read(fsimage_file_t *file, PyObject *ar=
gs, PyObject *kwargs)
+ 			if (bufsize =3D=3D 0)
+ 				break;
+ 		} else {
++#if PY_MAJOR_VERSION < 3
+ 			if (_PyString_Resize(&buffer, bytesread + bufsize) < 0)
++#else
++			if (_PyBytes_Resize(&buffer, bytesread + bufsize) < 0)
++#endif
+ 				return (NULL);
+ 		}
+ 	}
+=20
++#if PY_MAJOR_VERSION < 3
+ 	_PyString_Resize(&buffer, bytesread);
++#else
++	_PyBytes_Resize(&buffer, bytesread);
++#endif
+ 	return (buffer);
+ }
+=20
+@@ -106,11 +120,13 @@ static struct PyMethodDef fsimage_file_methods[] =3D=
 {
+ 	{ NULL, NULL, 0, NULL }=09
+ };
+=20
++#if PY_MAJOR_VERSION < 3
+ static PyObject *
+ fsimage_file_getattr(fsimage_file_t *file, char *name)
+ {
+ 	return (Py_FindMethod(fsimage_file_methods, (PyObject *)file, name));
+ }
++#endif
+=20
+ static void
+ fsimage_file_dealloc(fsimage_file_t *file)
+@@ -123,29 +139,18 @@ fsimage_file_dealloc(fsimage_file_t *file)
+=20
+ static char fsimage_file_type__doc__[] =3D "Filesystem image file";
+ PyTypeObject fsimage_file_type =3D {
+-	PyObject_HEAD_INIT(&PyType_Type)
+-	0,					/* ob_size */
+-	"xenfsimage.file",			/* tp_name */
+-	sizeof(fsimage_file_t),			/* tp_size */
+-	0,					/* tp_itemsize */
+-	(destructor) fsimage_file_dealloc, 	/* tp_dealloc */
+-	0,					/* tp_print */
+-	(getattrfunc) fsimage_file_getattr, 	/* tp_getattr */
+-	0,					/* tp_setattr */
+-	0,					/* tp_compare */
+-	0,					/* tp_repr */
+-	0,					/* tp_as_number */
+-	0,	 				/* tp_as_sequence */
+-	0,					/* tp_as_mapping */
+-	0,	   				/* tp_hash */
+-	0,					/* tp_call */
+-	0,					/* tp_str */
+-	0,					/* tp_getattro */
+-	0,					/* tp_setattro */
+-	0,					/* tp_as_buffer */
+-	Py_TPFLAGS_DEFAULT,			/* tp_flags */
+-	fsimage_file_type__doc__,
+-	PY_PAD
++	PyVarObject_HEAD_INIT(&PyType_Type, 0)
++	.tp_name =3D "xenfsimage.file",
++	.tp_basicsize =3D sizeof(fsimage_file_t),
++	.tp_dealloc =3D (destructor) fsimage_file_dealloc,
++#if PY_MAJOR_VERSION < 3
++	.tp_getattr =3D (getattrfunc) fsimage_file_getattr,
++#endif
++	.tp_flags =3D Py_TPFLAGS_DEFAULT,
++	.tp_doc =3D fsimage_file_type__doc__,
++#if PY_MAJOR_VERSION >=3D 3
++	.tp_methods =3D fsimage_file_methods,
++#endif
+ };
+=20
+ static PyObject *
+@@ -208,11 +213,13 @@ static struct PyMethodDef fsimage_fs_methods[] =3D=
 {
+ 	{ NULL, NULL, 0, NULL }=09
+ };
+=20
++#if PY_MAJOR_VERSION < 3
+ static PyObject *
+ fsimage_fs_getattr(fsimage_fs_t *fs, char *name)
+ {
+ 	return (Py_FindMethod(fsimage_fs_methods, (PyObject *)fs, name));
+ }
++#endif
+=20
+ static void
+ fsimage_fs_dealloc (fsimage_fs_t *fs)
+@@ -225,29 +232,18 @@ fsimage_fs_dealloc (fsimage_fs_t *fs)
+ PyDoc_STRVAR(fsimage_fs_type__doc__, "Filesystem image");
+=20
+ PyTypeObject fsimage_fs_type =3D {
+-	PyObject_HEAD_INIT(&PyType_Type)
+-	0,					/* ob_size */
+-	"xenfsimage.fs",			/* tp_name */
+-	sizeof(fsimage_fs_t),			/* tp_size */
+-	0,					/* tp_itemsize */
+-	(destructor) fsimage_fs_dealloc, 	/* tp_dealloc */
+-	0,					/* tp_print */
+-	(getattrfunc) fsimage_fs_getattr, 	/* tp_getattr */
+-	0,					/* tp_setattr */
+-	0,					/* tp_compare */
+-	0,					/* tp_repr */
+-	0,					/* tp_as_number */
+-	0,	 				/* tp_as_sequence */
+-	0,					/* tp_as_mapping */
+-	0,	   				/* tp_hash */
+-	0,					/* tp_call */
+-	0,					/* tp_str */
+-	0,					/* tp_getattro */
+-	0,					/* tp_setattro */
+-	0,					/* tp_as_buffer */
+-	Py_TPFLAGS_DEFAULT,			/* tp_flags */
+-	fsimage_fs_type__doc__,
+-	PY_PAD
++	PyVarObject_HEAD_INIT(&PyType_Type, 0)
++	.tp_name =3D "xenfsimage.fs",
++	.tp_basicsize =3D sizeof(fsimage_fs_t),
++	.tp_dealloc =3D (destructor) fsimage_fs_dealloc,
++#if PY_MAJOR_VERSION < 3
++	.tp_getattr =3D (getattrfunc) fsimage_fs_getattr,
++#endif
++	.tp_flags =3D Py_TPFLAGS_DEFAULT,
++	.tp_doc =3D fsimage_fs_type__doc__,
++#if PY_MAJOR_VERSION >=3D 3
++	.tp_methods =3D fsimage_fs_methods,
++#endif
+ };
+=20
+ static PyObject *
+@@ -309,8 +305,27 @@ static struct PyMethodDef fsimage_module_methods[] =
=3D {
+ 	{ NULL, NULL, 0, NULL }
+ };
+=20
++#if PY_MAJOR_VERSION >=3D 3
++static struct PyModuleDef fsimage_module_def =3D {
++	PyModuleDef_HEAD_INIT,
++	.m_name =3D "xenfsimage",
++	.m_size =3D -1,
++	.m_methods =3D fsimage_module_methods,
++};
++#endif
++
+ PyMODINIT_FUNC
++#if PY_MAJOR_VERSION >=3D 3
++PyInit_xenfsimage(void)
++#else
+ initxenfsimage(void)
++#endif
+ {
++#if PY_MAJOR_VERSION < 3
+ 	Py_InitModule("xenfsimage", fsimage_module_methods);
++#else
++	if (PyType_Ready(&fsimage_fs_type) < 0 || PyType_Ready(&fsimage_file_t=
ype) < 0)
++		return NULL;
++	return PyModule_Create(&fsimage_module_def);
++#endif
+ }
+--=20
+2.17.1
+
diff --git a/recipes-extended/xen/files/xen-tools-python-fix-Wsign-compar=
e-warnings.patch b/recipes-extended/xen/files/xen-tools-python-fix-Wsign-=
compare-warnings.patch
new file mode 100644
index 0000000..b32c5d0
--- /dev/null
+++ b/recipes-extended/xen/files/xen-tools-python-fix-Wsign-compare-warni=
ngs.patch
@@ -0,0 +1,136 @@
+From 88d703a361d34d75f81fc6d30b31d0abc8aa17eb Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marek=3D20Marczykowski-G=3DC3=3DB3recki?=3D
+ <marmarek@invisiblethingslab.com>
+Date: Fri, 9 Aug 2019 03:01:36 +0100
+Subject: [PATCH] python: fix -Wsign-compare warnings
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Specifically:
+xen/lowlevel/xc/xc.c: In function =E2=80=98pyxc_domain_create=E2=80=99:
+xen/lowlevel/xc/xc.c:147:24: error: comparison of integer expressions of=
 different signedness: =E2=80=98int=E2=80=99 and =E2=80=98long unsigned i=
nt=E2=80=99 [-Werror=3Dsign-compare]
+  147 |         for ( i =3D 0; i < sizeof(xen_domain_handle_t); i++ )
+      |                        ^
+xen/lowlevel/xc/xc.c: In function =E2=80=98pyxc_domain_sethandle=E2=80=99=
:
+xen/lowlevel/xc/xc.c:312:20: error: comparison of integer expressions of=
 different signedness: =E2=80=98int=E2=80=99 and =E2=80=98long unsigned i=
nt=E2=80=99 [-Werror=3Dsign-compare]
+  312 |     for ( i =3D 0; i < sizeof(xen_domain_handle_t); i++ )
+      |                    ^
+xen/lowlevel/xc/xc.c: In function =E2=80=98pyxc_domain_getinfo=E2=80=99:
+xen/lowlevel/xc/xc.c:391:24: error: comparison of integer expressions of=
 different signedness: =E2=80=98int=E2=80=99 and =E2=80=98long unsigned i=
nt=E2=80=99 [-Werror=3Dsign-compare]
+  391 |         for ( j =3D 0; j < sizeof(xen_domain_handle_t); j++ )
+      |                        ^
+xen/lowlevel/xc/xc.c: In function =E2=80=98pyxc_get_device_group=E2=80=99=
:
+xen/lowlevel/xc/xc.c:677:20: error: comparison of integer expressions of=
 different signedness: =E2=80=98int=E2=80=99 and =E2=80=98uint32_t=E2=80=99=
 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dsign-compare]
+  677 |     for ( i =3D 0; i < num_sdevs; i++ )
+      |                    ^
+xen/lowlevel/xc/xc.c: In function =E2=80=98pyxc_physinfo=E2=80=99:
+xen/lowlevel/xc/xc.c:988:20: error: comparison of integer expressions of=
 different signedness: =E2=80=98int=E2=80=99 and =E2=80=98long unsigned i=
nt=E2=80=99 [-Werror=3Dsign-compare]
+  988 |     for ( i =3D 0; i < sizeof(pinfo.hw_cap)/4; i++ )
+      |                    ^
+xen/lowlevel/xc/xc.c:994:20: error: comparison of integer expressions of=
 different signedness: =E2=80=98int=E2=80=99 and =E2=80=98long unsigned i=
nt=E2=80=99 [-Werror=3Dsign-compare]
+  994 |     for ( i =3D 0; i < ARRAY_SIZE(virtcaps_bits); i++ )
+      |                    ^
+xen/lowlevel/xc/xc.c:998:24: error: comparison of integer expressions of=
 different signedness: =E2=80=98int=E2=80=99 and =E2=80=98long unsigned i=
nt=E2=80=99 [-Werror=3Dsign-compare]
+  998 |         for ( i =3D 0; i < ARRAY_SIZE(virtcaps_bits); i++ )
+      |                        ^
+xen/lowlevel/xs/xs.c: In function =E2=80=98xspy_ls=E2=80=99:
+xen/lowlevel/xs/xs.c:191:23: error: comparison of integer expressions of=
 different signedness: =E2=80=98int=E2=80=99 and =E2=80=98unsigned int=E2=
=80=99 [-Werror=3Dsign-compare]
+  191 |         for (i =3D 0; i < xsval_n; i++)
+      |                       ^
+xen/lowlevel/xs/xs.c: In function =E2=80=98xspy_get_permissions=E2=80=99=
:
+xen/lowlevel/xs/xs.c:297:23: error: comparison of integer expressions of=
 different signedness: =E2=80=98int=E2=80=99 and =E2=80=98unsigned int=E2=
=80=99 [-Werror=3Dsign-compare]
+  297 |         for (i =3D 0; i < perms_n; i++) {
+      |                       ^
+cc1: all warnings being treated as errors
+
+Use size_t for loop iterators where it's compared with sizeof() or
+similar construct.
+
+Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethings=
lab.com>
+Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
+
+Modified to apply to Xen 4.12.2 by Christopher Clark
+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+---
+ tools/python/xen/lowlevel/xc/xc.c | 13 ++++++++-----
+ tools/python/xen/lowlevel/xs/xs.c |  4 ++--
+ 2 files changed, 10 insertions(+), 7 deletions(-)
+
+diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlev=
el/xc/xc.c
+index 522cbe3b9c..188bfa34da 100644
+--- a/tools/python/xen/lowlevel/xc/xc.c
++++ b/tools/python/xen/lowlevel/xc/xc.c
+@@ -117,7 +117,8 @@ static PyObject *pyxc_domain_create(XcObject *self,
+                                     PyObject *kwds)
+ {
+     uint32_t dom =3D 0, target =3D 0;
+-    int      ret, i;
++    int      ret;
++    size_t   i;
+     PyObject *pyhandle =3D NULL;
+     struct xen_domctl_createdomain config =3D {
+         .handle =3D {
+@@ -295,7 +296,7 @@ static PyObject *pyxc_vcpu_setaffinity(XcObject *sel=
f,
+=20
+ static PyObject *pyxc_domain_sethandle(XcObject *self, PyObject *args)
+ {
+-    int i;
++    size_t i;
+     uint32_t dom;
+     PyObject *pyhandle;
+     xen_domain_handle_t handle;
+@@ -336,7 +337,8 @@ static PyObject *pyxc_domain_getinfo(XcObject *self,
+     PyObject *list, *info_dict, *pyhandle;
+=20
+     uint32_t first_dom =3D 0;
+-    int max_doms =3D 1024, nr_doms, i, j;
++    int max_doms =3D 1024, nr_doms, i;
++    size_t j;
+     xc_dominfo_t *info;
+=20
+     static char *kwd_list[] =3D { "first_dom", "max_doms", NULL };
+@@ -631,7 +633,8 @@ static PyObject *pyxc_get_device_group(XcObject *sel=
f,
+ {
+     uint32_t sbdf;
+     uint32_t max_sdevs, num_sdevs;
+-    int domid, seg, bus, dev, func, rc, i;
++    int domid, seg, bus, dev, func, rc;
++    size_t i;
+     PyObject *Pystr;
+     char *group_str;
+     char dev_str[9];
+@@ -971,7 +974,7 @@ static PyObject *pyxc_physinfo(XcObject *self)
+ {
+     xc_physinfo_t pinfo;
+     char cpu_cap[128], virt_caps[128], *p;
+-    int i;
++    size_t i;
+     const char *virtcap_names[] =3D { "hvm", "hvm_directio" };
+=20
+     if ( xc_physinfo(self->xc_handle, &pinfo) !=3D 0 )
+diff --git a/tools/python/xen/lowlevel/xs/xs.c b/tools/python/xen/lowlev=
el/xs/xs.c
+index 9a0acfc25c..ea50f86bc3 100644
+--- a/tools/python/xen/lowlevel/xs/xs.c
++++ b/tools/python/xen/lowlevel/xs/xs.c
+@@ -186,7 +186,7 @@ static PyObject *xspy_ls(XsHandle *self, PyObject *a=
rgs)
+     Py_END_ALLOW_THREADS
+=20
+     if (xsval) {
+-        int i;
++        size_t i;
+         PyObject *val =3D PyList_New(xsval_n);
+         for (i =3D 0; i < xsval_n; i++)
+ #if PY_MAJOR_VERSION >=3D 3
+@@ -276,7 +276,7 @@ static PyObject *xspy_get_permissions(XsHandle *self=
, PyObject *args)
+     struct xs_handle *xh =3D xshandle(self);
+     struct xs_permissions *perms;
+     unsigned int perms_n =3D 0;
+-    int i;
++    size_t i;
+=20
+     xs_transaction_t th;
+     char *thstr;
+--=20
+2.17.1
+
diff --git a/recipes-extended/xen/files/xen-tools-update-python-scripts-t=
o-py3.patch b/recipes-extended/xen/files/xen-tools-update-python-scripts-=
to-py3.patch
new file mode 100644
index 0000000..455072b
--- /dev/null
+++ b/recipes-extended/xen/files/xen-tools-update-python-scripts-to-py3.p=
atch
@@ -0,0 +1,140 @@
+From a9047a722ba5de38e7c1d762ffcfb74c36725fe2 Mon Sep 17 00:00:00 2001
+From: Andrew Cooper <andrew.cooper3@citrix.com>
+Date: Mon, 11 Mar 2019 19:18:40 +0000
+Subject: [PATCH] tools/xen-foreign: Update python scripts to be Py3 comp=
atible
+
+The issues are:
+ * dict.has_key() was completely removed in Py3
+ * dict.keys() is an iterable rather than list in Py3, so .sort() doesn'=
t work.
+ * list.sort(cmp=3D) was deprecated in Py2.4 and removed in Py3.
+
+The has_key() issue is trivially fixed by switching to using the in keyw=
ord.
+The sorting issue could be trivially fixed, but take the opportunity to
+improve the code.
+
+The reason for the sorting is to ensure that "unsigned long" gets replac=
ed
+before "long", and the only reason sorting is necessary is because
+inttypes[arch] is needlessly a dictionary.  Update inttypes[arch] to be =
a list
+of tuples rather than a dictionary, and process them in list order.
+
+Reported-by: George Dunlap <george.dunlap@eu.citrix.com>
+Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
+Acked-by: Wei Liu <wei.liu2@citrix.com>
+---
+ tools/include/xen-foreign/mkchecker.py |  2 +-
+ tools/include/xen-foreign/mkheader.py  | 58 +++++++++++++-------------
+ 2 files changed, 29 insertions(+), 31 deletions(-)
+
+diff --git a/tools/include/xen-foreign/mkchecker.py b/tools/include/xen-=
foreign/mkchecker.py
+index fdad869a91..199b0eebbc 100644
+--- a/tools/include/xen-foreign/mkchecker.py
++++ b/tools/include/xen-foreign/mkchecker.py
+@@ -37,7 +37,7 @@ for struct in structs:
+     f.write('\tprintf("%%-25s |", "%s");\n' % struct);
+     for a in archs:
+         s =3D struct + "_" + a;
+-        if compat_arches.has_key(a):
++        if a in compat_arches:
+             compat =3D compat_arches[a]
+             c =3D struct + "_" + compat;
+         else:
+diff --git a/tools/include/xen-foreign/mkheader.py b/tools/include/xen-f=
oreign/mkheader.py
+index 97e0c7a984..fb268f0dce 100644
+--- a/tools/include/xen-foreign/mkheader.py
++++ b/tools/include/xen-foreign/mkheader.py
+@@ -17,13 +17,13 @@ header =3D {};
+ footer =3D {};
+=20
+ #arm
+-inttypes["arm32"] =3D {
+-    "unsigned long" : "__danger_unsigned_long_on_arm32",
+-    "long"          : "__danger_long_on_arm32",
+-    "xen_pfn_t"     : "uint64_t",
+-    "xen_ulong_t"   : "uint64_t",
+-    "uint64_t"      : "__align8__ uint64_t",
+-};
++inttypes["arm32"] =3D [
++    ("unsigned long", "__danger_unsigned_long_on_arm32"),
++    ("long",          "__danger_long_on_arm32"),
++    ("xen_pfn_t",     "uint64_t"),
++    ("xen_ulong_t",   "uint64_t"),
++    ("uint64_t",      "__align8__ uint64_t"),
++]
+ header["arm32"] =3D """
+ #define __arm___ARM32 1
+ #if defined(__GNUC__) && !defined(__STRICT_ANSI__)
+@@ -38,13 +38,13 @@ footer["arm32"] =3D """
+ #undef __DECL_REG
+ """
+=20
+-inttypes["arm64"] =3D {
+-    "unsigned long" : "__danger_unsigned_long_on_arm64",
+-    "long"          : "__danger_long_on_arm64",
+-    "xen_pfn_t"     : "uint64_t",
+-    "xen_ulong_t"   : "uint64_t",
+-    "uint64_t"      : "__align8__ uint64_t",
+-};
++inttypes["arm64"] =3D [
++    ("unsigned long", "__danger_unsigned_long_on_arm64"),
++    ("long",          "__danger_long_on_arm64"),
++    ("xen_pfn_t",     "uint64_t"),
++    ("xen_ulong_t",   "uint64_t"),
++    ("uint64_t",      "__align8__ uint64_t"),
++]
+ header["arm64"] =3D """
+ #define __aarch64___ARM64 1
+ #if defined(__GNUC__) && !defined(__STRICT_ANSI__)
+@@ -60,12 +60,12 @@ footer["arm64"] =3D """
+ """
+=20
+ # x86_32
+-inttypes["x86_32"] =3D {
+-    "unsigned long" : "uint32_t",
+-    "long"          : "uint32_t",
+-    "xen_pfn_t"     : "uint32_t",
+-    "xen_ulong_t"   : "uint32_t",
+-};
++inttypes["x86_32"] =3D [
++    ("unsigned long", "uint32_t"),
++    ("long",          "uint32_t"),
++    ("xen_pfn_t",     "uint32_t"),
++    ("xen_ulong_t",   "uint32_t"),
++]
+ header["x86_32"] =3D """
+ #define __DECL_REG_LO8(which) uint32_t e ## which ## x
+ #define __DECL_REG_LO16(name) uint32_t e ## name
+@@ -79,12 +79,12 @@ footer["x86_32"] =3D """
+ """;
+=20
+ # x86_64
+-inttypes["x86_64"] =3D {
+-    "unsigned long" : "__align8__ uint64_t",
+-    "long"          : "__align8__ uint64_t",
+-    "xen_pfn_t"     : "__align8__ uint64_t",
+-    "xen_ulong_t"   : "__align8__ uint64_t",
+-};
++inttypes["x86_64"] =3D [
++    ("unsigned long", "__align8__ uint64_t"),
++    ("long",          "__align8__ uint64_t"),
++    ("xen_pfn_t",     "__align8__ uint64_t"),
++    ("xen_ulong_t",   "__align8__ uint64_t"),
++]
+ header["x86_64"] =3D """
+ #if defined(__GNUC__) && !defined(__STRICT_ANSI__)
+ # define __DECL_REG(name) union { uint64_t r ## name, e ## name; }
+@@ -205,10 +205,8 @@ for struct in structs:
+     output =3D re.sub("\\b(%s)_t\\b" % struct, "\\1_%s_t" % arch, outpu=
t);
+=20
+ # replace: integer types
+-integers =3D inttypes[arch].keys();
+-integers.sort(lambda a, b: cmp(len(b),len(a)));
+-for type in integers:
+-    output =3D re.sub("\\b%s\\b" % type, inttypes[arch][type], output);
++for old, new in inttypes[arch]:
++    output =3D re.sub("\\b%s\\b" % old, new, output)
+=20
+ # print results
+ f =3D open(outfile, "w");
+--=20
+2.17.1
+
diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/x=
en/xen-hypervisor.inc
index c0df158..79fafd2 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -6,7 +6,7 @@ DESCRIPTION =3D "The Xen hypervisor"
 # this allows for varying the target architecture or toolchain used
 # to build the different components. eg. 32-bit tools and a 64-bit hyper=
visor.
=20
-inherit deploy
+inherit deploy python3native
=20
 PACKAGES =3D " \
     ${PN} \
@@ -34,7 +34,7 @@ do_configure() {
 }
=20
 do_compile() {
-    oe_runmake xen
+    oe_runmake xen PYTHON=3D"${PYTHON}"
 }
=20
 do_install() {
diff --git a/recipes-extended/xen/xen-python2.bb b/recipes-extended/xen/x=
en-python2.bb
new file mode 100644
index 0000000..08d8e92
--- /dev/null
+++ b/recipes-extended/xen/xen-python2.bb
@@ -0,0 +1,68 @@
+SUMMARY =3D "Xen hypervisor tools written in python 2"
+DESCRIPTION =3D "Unported utility scripts for the Xen hypervisor"
+HOMEPAGE =3D "http://xen.org"
+LICENSE =3D "GPLv2"
+SECTION =3D "console/tools"
+
+SRCREV ?=3D "a5fcafbfbee55261853fba07149c1c795f2baf58"
+
+XEN_REL ?=3D "4.12"
+XEN_BRANCH ?=3D "stable-4.12"
+
+SRC_URI =3D "git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH}"
+
+LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3Dbbb4b1bdc2c3b6743da3c39d0324=
9095"
+
+PV =3D "${XEN_REL}+git${SRCPV}"
+
+S =3D "${WORKDIR}/git"
+
+# Packages in this recipe do not use ${PN} to allow for simpler
+# movement of the package back into the xen-tools recipe if/when
+# the scripts are ported to python 3.
+
+RDEPENDS_xen-tools-xencov-split =3D"python"
+RDEPENDS_xen-tools-xencons =3D "python"
+RDEPENDS_xen-tools-xenpvnetboot =3D "python"
+RDEPENDS_xen-tools-xentrace-format =3D "python"
+
+RRECOMMENDS_xen-tools-xencov-trace =3D "xen-tools-xencov"
+RRECOMMENDS_xen-tools-xentrace-format =3D "xen-tools-xentrace"
+
+PACKAGES =3D " \
+    xen-tools-xencons \
+    xen-tools-xencov-split \
+    xen-tools-xenpvnetboot \
+    xen-tools-xentrace-format \
+    "
+
+FILES_xen-tools-xencons =3D " \
+    ${bindir}/xencons \
+    "
+
+FILES_xen-tools-xencov-split =3D " \
+    ${bindir}/xencov_split \
+    "
+
+FILES_xen-tools-xenpvnetboot =3D " \
+    ${libdir}/xen/bin/xenpvnetboot \
+    "
+
+FILES_xen-tools-xentrace-format =3D " \
+    ${bindir}/xentrace_format \
+    "
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/tools/xentrace/xentrace_format \
+                    ${D}${bindir}/xentrace_format
+    install -m 0755 ${S}/tools/misc/xencons ${D}${bindir}/xencons
+    install -m 0755 ${S}/tools/misc/xencov_split ${D}${bindir}/xencov_sp=
lit
+
+    install -d ${D}${libdir}/xen/bin
+    install -m 0755 ${S}/tools/misc/xenpvnetboot \
+                    ${D}${libdir}/xen/bin/xenpvnetboot
+}
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xe=
n-tools.inc
index e166c74..a6f1209 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -1,7 +1,7 @@
 SUMMARY =3D "Xen hypervisor tools"
 DESCRIPTION =3D "Tools and utility software for the Xen hypervisor"
=20
-inherit setuptools update-rc.d systemd deploy
+inherit setuptools3 update-rc.d systemd deploy
 require xen-blktap.inc
=20
 RDEPENDS_${PN} =3D "\
@@ -47,21 +47,25 @@ RDEPENDS_${PN}-fsimage =3D " \
=20
 RDEPENDS_${PN}-misc =3D " \
     perl \
-    python \
+    python3 \
+    ${PN}-xencov \
+    "
+
+RSUGGESTS_${PN}-misc =3D " \
+    ${PN}-xencons \
+    ${PN}-xenpvnetboot \
     "
=20
 RDEPENDS_${PN}-python =3D " \
-    python \
+    python3 \
     "
=20
 RDEPENDS_${PN}-pygrub =3D " \
+    python3 \
     ${PN}-python \
     "
=20
-RDEPENDS_${PN}-remus =3D " \
-    bash \
-    python \
-    "
+RDEPENDS_${PN}-remus =3D "bash"
=20
 RDEPENDS_${PN}-scripts-block =3D "\
     bash \
@@ -78,6 +82,8 @@ RDEPENDS_${PN}-scripts-network =3D "\
     ${PN}-volatiles \
     "
=20
+RSUGGESTS_${PN}-xencov =3D "${PN}-xencov-split"
+
 RDEPENDS_${PN}-xencommons =3D "\
     bash \
     ${PN}-console \
@@ -97,7 +103,11 @@ RDEPENDS_${PN}-xendomains =3D "\
=20
 RDEPENDS_${PN}-xl =3D "libgcc"
=20
-RDEPENDS_${PN}-xentrace =3D "python"
+RDEPENDS_${PN}-xenmon =3D " \
+    python3 \
+    "
+
+RSUGGESTS_${PN}-xentrace =3D "${PN}-xentrace-format"
=20
 RDEPENDS_${PN}-xen-watchdog =3D "bash"
=20
@@ -160,6 +170,7 @@ PACKAGES =3D " \
     ${PN}-volatiles \
     ${PN}-xcutils \
     ${PN}-xencommons \
+    ${PN}-xencov \
     ${PN}-xend \
     ${PN}-xend-examples \
     ${PN}-xendomains \
@@ -188,8 +199,8 @@ RPROVIDES_${PN}-xenstored =3D "virtual/xenstored"
=20
 FILES_${PN}-dbg +=3D "\
     ${libdir}/xen/bin/.debug \
-    ${libdir}/python2.7/site-packages/.debug \
-    ${libdir}/python2.7/site-packages/xen/lowlevel/.debug \
+    ${libdir}/${PYTHON_DIR}/site-packages/.debug \
+    ${libdir}/${PYTHON_DIR}/site-packages/xen/lowlevel/.debug \
     ${libdir}/fs/xfs/.debug \
     ${libdir}/fs/ufs/.debug \
     ${libdir}/fs/ext2fs-lib/.debug \
@@ -202,8 +213,8 @@ FILES_${PN}-dbg +=3D "\
     ${libdir}exec/.debug \
     ${libdir}/xen/libexec/.debug \
     ${bindir}/.debug \
-    ${libdir}/python2.7/dist-packages/.debug \
-    ${libdir}/python2.7/dist-packages/xen/lowlevel/.debug \
+    ${libdir}/${PYTHON_DIR}/dist-packages/.debug \
+    ${libdir}/${PYTHON_DIR}/dist-packages/xen/lowlevel/.debug \
     "
=20
 FILES_${PN}-dev =3D "\
@@ -404,15 +415,11 @@ FILES_${PN}-livepatch +=3D " \
     "
=20
 FILES_${PN}-misc =3D "\
-    ${bindir}/xencons \
-    ${bindir}/xencov_split \
     ${bindir}/xen-detect \
-    ${libdir}/xen/bin/xenpvnetboot \
     ${libdir}/xen/bin/depriv-fd-checker \
     ${sbindir}/gtracestat \
     ${sbindir}/gtraceview \
     ${sbindir}/xen-bugtool \
-    ${sbindir}/xencov \
     ${sbindir}/xenperf \
     ${sbindir}/xenpm \
     ${sbindir}/xsview \
@@ -436,11 +443,10 @@ FILES_${PN}-pygrub =3D "\
     "
=20
 FILES_${PN}-python =3D "\
-    ${libdir}/python2.7 \
+    ${libdir}/${PYTHON_DIR} \
     "
=20
 FILES_${PN}-remus =3D "\
-    ${bindir}/remus \
     ${sysconfdir}/xen/scripts/remus-netbuf-setup \
     "
=20
@@ -500,6 +506,10 @@ FILES_${PN}-xcutils =3D "\
     ${libdir}/xen/bin/xc_save \
     "
=20
+FILES_${PN}-xencov =3D "\
+    ${sbindir}/xencov \
+    "
+
 FILES_${PN}-xend-examples =3D "\
     ${sysconfdir}/xen/xend-config.sxp \
     ${sysconfdir}/xen/xend-pci-permissive.sxp \
@@ -539,7 +549,6 @@ FILES_${PN}-xenstored =3D "\
=20
 FILES_${PN}-xentrace =3D "\
     ${bindir}/xentrace \
-    ${bindir}/xentrace_format \
     ${bindir}/xentrace_setsize \
     ${libdir}/xen/bin/xenctx \
     ${bindir}/xenalyze \
@@ -665,12 +674,20 @@ do_stubs() {
 addtask stubs after do_configure before do_compile
=20
 do_compile() {
-    oe_runmake tools
+    cd ${S}
+    oe_runmake tools PYTHON=3D"${PYTHON}"
 }
=20
 do_install() {
+    cd ${S}
     oe_runmake DESTDIR=3D"${D}" install-tools
=20
+    # Remove unported python 2 scripts -- see the separate xen-python2 r=
ecipe
+    rm -f ${D}${bindir}/xentrace_format \
+          ${D}${bindir}/xencons \
+          ${D}${bindir}/xencov_split \
+          ${D}${libdir}/xen/bin/xenpvnetboot
+
     # remove installed volatiles
     rm -rf ${D}${base_prefix}/run \
         ${D}${localstatedir}/run \
diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen=
/xen-tools_git.bb
index 7042c53..00060df 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -6,6 +6,12 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
 SRC_URI =3D " \
     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
     file://0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch \
+    file://xen-tools-update-python-scripts-to-py3.patch \
+    file://xen-tools-libxl-gentypes-py3.patch \
+    file://xen-tools-python-fix-Wsign-compare-warnings.patch \
+    file://xen-tools-pygrub-change-tabs-into-spaces.patch \
+    file://xen-tools-pygrub-make-python-scripts-work-with-2.6-and-up.pat=
ch \
+    file://xen-tools-pygrub-py3.patch \
     "
=20
 LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3Dbbb4b1bdc2c3b6743da3c39d0324=
9095"
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index b2af8aa..0bfe72d 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -43,7 +43,7 @@ DEPENDS =3D " \
     pciutils \
     pixman \
     procps \
-    python \
+    python3 \
     libaio \
     lzo \
     util-linux \
@@ -77,8 +77,8 @@ libexecdir =3D "${libdir}"
 export XEN_OS =3D "Linux"
=20
 # this is used for the header (#!${bindir}/python) of the install python=
 scripts
-export PYTHONPATH=3D"${bindir}/python"
-export ac_cv_path_PYTHONPATH=3D"${bindir}/python"
+export PYTHONPATH=3D"${bindir}/env python3"
+export ac_cv_path_PYTHONPATH=3D"${bindir}/env python3"
 export DISTUTILS_BUILD_ARGS
 export DISTUTILS_INSTALL_ARGS
=20
@@ -207,6 +207,7 @@ EXTRA_OEMAKE +=3D "XEN_CONFIG_EXPERT=3Dy"
 EXTRA_OEMAKE +=3D "debug=3Dn"
=20
 do_configure_common() {
+    cd ${S}
=20
     #./configure --enable-xsmpolicy does not set XSM_ENABLE must be done=
 manually
     if [ "${XSM_ENABLED}" =3D "1" ]; then
@@ -222,7 +223,9 @@ do_configure_common() {
=20
     # do configure
     oe_runconf EXTRA_CFLAGS_XEN_CORE=3D"${EXTRA_CFLAGS_XEN_CORE}" \
-               EXTRA_CFLAGS_XEN_TOOLS=3D"${EXTRA_CFLAGS_XEN_TOOLS}"
+               EXTRA_CFLAGS_XEN_TOOLS=3D"${EXTRA_CFLAGS_XEN_TOOLS}" \
+               PYTHON=3D"${PYTHON}"
+
     if [ ! -e ${STAGING_INCDIR}/bits/long-double-32.h ]; then
         cp ${STAGING_INCDIR}/bits/long-double-64.h ${STAGING_INCDIR}/bit=
s/long-double-32.h
     fi
--=20
2.17.1

