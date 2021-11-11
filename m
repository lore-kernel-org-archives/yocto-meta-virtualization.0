Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10774.1636639066601448384
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 05:57:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2BD6ED1
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Nov 2021 05:57:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C9CD3F70D
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Nov 2021 05:57:39 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] python3-dtc: port to Python 3.10
Date: Thu, 11 Nov 2021 13:57:19 +0000
Message-Id: <20211111135719.2503140-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 recipes-kernel/dtc/files/ssize.patch    | 35 +++++++++++++++++++++++++
 recipes-kernel/dtc/python3-dtc_1.6.1.bb |  3 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/dtc/files/ssize.patch

diff --git a/recipes-kernel/dtc/files/ssize.patch b/recipes-kernel/dtc/fi=
les/ssize.patch
new file mode 100644
index 0000000..3156896
--- /dev/null
+++ b/recipes-kernel/dtc/files/ssize.patch
@@ -0,0 +1,35 @@
+Python 3.10 has made it mandatory that the 'string+length` formats use s=
size_t
+instead of int, so define the magic symbol and upcast the ints from the =
libfdt
+API to ssize_t.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
+index 51ee801..075ef70 100644
+--- a/pylibfdt/libfdt.i
++++ b/pylibfdt/libfdt.i
+@@ -1044,9 +1044,9 @@ typedef uint32_t fdt32_t;
+ 		$result =3D Py_None;
+ 	else
+         %#if PY_VERSION_HEX >=3D 0x03000000
+-            $result =3D Py_BuildValue("y#", $1, *arg4);
++            $result =3D Py_BuildValue("y#", $1, (Py_ssize_t)*arg4);
+         %#else
+-            $result =3D Py_BuildValue("s#", $1, *arg4);
++            $result =3D Py_BuildValue("s#", $1, (Py_ssize_t)*arg4);
+         %#endif
+ }
+=20
+diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
+index ef40f15..88ff7d1 100755
+--- a/pylibfdt/setup.py
++++ b/pylibfdt/setup.py
+@@ -42,6 +42,7 @@ def get_version():
+ libfdt_module =3D Extension(
+     '_libfdt',
+     sources=3D[os.path.join(srcdir, 'libfdt.i')],
++    define_macros=3D[('PY_SSIZE_T_CLEAN', None)],
+     include_dirs=3D[os.path.join(srcdir, '../libfdt')],
+     libraries=3D['fdt'],
+     library_dirs=3D[os.path.join(top_builddir, 'libfdt')],
diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dtc=
/python3-dtc_1.6.1.bb
index 293c8d3..d7d45a4 100644
--- a/recipes-kernel/dtc/python3-dtc_1.6.1.bb
+++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
@@ -6,7 +6,8 @@ LICENSE =3D "GPLv2 | BSD-2-Clause"
=20
 DEPENDS =3D "flex-native bison-native swig-native libyaml dtc"
=20
-SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmas=
ter"
+SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmas=
ter \
+           file://ssize.patch"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
--=20
2.25.1

