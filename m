Received: from muon.bsdio.com (muon.bsdio.com [65.103.231.193])
 by mx.groups.io with SMTP id smtpd.web11.3149.1579564496985972088
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jan 2020 15:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bsdio.com, ip: 65.103.231.193, mailfrom: rebecca@bsdio.com)
Received: from muon.bsdio.com (localhost [127.0.0.1])
	by muon.bsdio.com (Postfix) with ESMTP id D618BCFB5A;
	Mon, 20 Jan 2020 16:57:34 -0700 (MST)
Received: from muon.bsdio.com ([127.0.0.1])
	by muon.bsdio.com (muon.bsdio.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MIf6o7GbVOdc; Mon, 20 Jan 2020 16:57:34 -0700 (MST)
Received: from photon.int.bluestop.org (unknown [10.0.10.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by muon.bsdio.com (Postfix) with ESMTPSA;
	Mon, 20 Jan 2020 16:57:34 -0700 (MST)
From: "Rebecca Cran" <rebecca@bsdio.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Rebecca Cran <rebecca@bsdio.com>
Subject: [PATCH] Update uwsgi to version 2.0.18
Date: Mon, 20 Jan 2020 16:54:53 -0700
Message-Id: <20200120235453.11518-1-rebecca@bsdio.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

uwsgi 2.0.14 doesn't compile with gcc 9. Update to version 2.0.18, which =
does
build with gcc 9 and which no longer needs the two patches.

Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
---
 ...breaks-to-avoid-implicit-passthrough.patch | 50 -------------------
 ...breaks-to-avoid-implicit-passthrough.patch | 50 -------------------
 .../recipes-extended/uwsgi/uwsgi_git.bb       | 13 +----
 3 files changed, 2 insertions(+), 111 deletions(-)
 delete mode 100644 meta-openstack/recipes-extended/uwsgi/files/Add-expli=
cit-breaks-to-avoid-implicit-passthrough.patch
 delete mode 100644 meta-openstack/recipes-extended/uwsgi/files/more-Add-=
explicit-breaks-to-avoid-implicit-passthrough.patch

diff --git a/meta-openstack/recipes-extended/uwsgi/files/Add-explicit-bre=
aks-to-avoid-implicit-passthrough.patch b/meta-openstack/recipes-extended=
/uwsgi/files/Add-explicit-breaks-to-avoid-implicit-passthrough.patch
deleted file mode 100644
index 4b9c015..0000000
--- a/meta-openstack/recipes-extended/uwsgi/files/Add-explicit-breaks-to-=
avoid-implicit-passthrough.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 0a14d0f0425f00421a69f0ca8e09a92cfdfc6a36 Mon Sep 17 00:00:00 2001
-From: Paul Tagliamonte <paultag@gmail.com>
-Date: Mon, 7 Aug 2017 11:18:56 -0400
-Subject: [PATCH] Add explicit breaks to avoid implicit passthrough.
-
-commit 0a14d0f0425f00421a69f0ca8e09a92cfdfc6a36 from upstream
-git://github.com/unbit/uwsgi.git
-
--Werror=3Dimplicit-fallthrough was added in gcc 7.1, which will
-throw a compile error if a switch has an implicit passthrough.
-
-Seeing as how this switch doesn't appear to depend on passthrough to
-function correctly, I've added explicit breaks to the switch.
-
-From https://gcc.gnu.org/gcc-7/changes.html:
-
--Wimplicit-fallthrough warns when a switch case falls through. This
-warning has five different levels. The compiler is able to parse a wide
-range of fallthrough comments, depending on the level. It also handles
-control-flow statements, such as ifs. It's possible to suppress the
-warning by either adding a fallthrough comment, or by using a null
-statement: __attribute__ ((fallthrough)); (C, C++), or [[fallthrough]];
-(C++17), or [[gnu::fallthrough]]; (C++11/C++14). This warning is enabled
-by -Wextra.
----
- core/hash.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/core/hash.c b/core/hash.c
-index a1288fa..9ae6bd2 100644
---- a/core/hash.c
-+++ b/core/hash.c
-@@ -42,11 +42,14 @@ static uint32_t murmur2_hash(char *key, uint64_t key=
len) {
- 	switch (keylen) {
- 		case 3:
-         		h ^=3D key[2] << 16;
-+        		break;
-     		case 2:
-         		h ^=3D key[1] << 8;
-+        		break;
-     		case 1:
-         		h ^=3D key[0];
-         		h *=3D 0x5bd1e995;
-+        		break;
-     	}
-=20
- 	h ^=3D h >> 13;
---=20
-2.7.4
-
diff --git a/meta-openstack/recipes-extended/uwsgi/files/more-Add-explici=
t-breaks-to-avoid-implicit-passthrough.patch b/meta-openstack/recipes-ext=
ended/uwsgi/files/more-Add-explicit-breaks-to-avoid-implicit-passthrough.=
patch
deleted file mode 100644
index 5a885ed..0000000
--- a/meta-openstack/recipes-extended/uwsgi/files/more-Add-explicit-break=
s-to-avoid-implicit-passthrough.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 54666237455273e147eadb1904d261ed7624a8b6 Mon Sep 17 00:00:00 2001
-From: Paul Tagliamonte <tag@pault.ag>
-Date: Mon, 14 Aug 2017 15:42:15 -0400
-Subject: [PATCH] Add explicit breaks to avoid implicit passthrough.
-
-commit 54666237455273e147eadb1904d261ed7624a8b6 from upstream
-git://github.com/unbit/uwsgi.git
-
--Werror=3Dimplicit-fallthrough was added in gcc 7.1, which will
-throw a compile error if a switch has an implicit passthrough.
-
-Seeing as how this switch doesn't appear to depend on passthrough to
-function correctly, I've added explicit breaks to the switch.
-
-From https://gcc.gnu.org/gcc-7/changes.html:
-
--Wimplicit-fallthrough warns when a switch case falls through. This
-warning has five different levels. The compiler is able to parse a wide
-range of fallthrough comments, depending on the level. It also handles
-control-flow statements, such as ifs. It's possible to suppress the
-warning by either adding a fallthrough comment, or by using a null
-statement: __attribute__ ((fallthrough)); (C, C++), or [[fallthrough]];
-(C++17), or [[gnu::fallthrough]]; (C++11/C++14). This warning is enabled
-by -Wextra.
----
- core/routing.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/core/routing.c b/core/routing.c
-index 5887ec3..0cd6ea6 100644
---- a/core/routing.c
-+++ b/core/routing.c
-@@ -1792,10 +1792,10 @@ static int uwsgi_route_condition_ipv6in(struct w=
sgi_request *wsgi_req, struct uw
-=20
- 	int i =3D (pfxlen / 32);
- 	switch (i) {
--	case 0: mask[0] =3D 0;
--	case 1: mask[1] =3D 0;
--	case 2: mask[2] =3D 0;
--	case 3: mask[3] =3D 0;
-+	case 0: mask[0] =3D 0; break;
-+	case 1: mask[1] =3D 0; break;
-+	case 2: mask[2] =3D 0; break;
-+	case 3: mask[3] =3D 0; break;
- 	}
-=20
- 	if (pfxlen % 32)
---=20
-2.7.4
-
diff --git a/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb b/meta-op=
enstack/recipes-extended/uwsgi/uwsgi_git.bb
index f0c535f..68af5a6 100644
--- a/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
+++ b/meta-openstack/recipes-extended/uwsgi/uwsgi_git.bb
@@ -6,12 +6,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D33ab1ce13e23=
12dddfad07f97f66321f"
=20
 SRCNAME =3D "uwsgi"
 SRC_URI =3D "git://github.com/unbit/uwsgi.git;branch=3Duwsgi-2.0 \
-    file://Add-explicit-breaks-to-avoid-implicit-passthrough.patch \
-    file://more-Add-explicit-breaks-to-avoid-implicit-passthrough.patch =
\
 "
=20
-SRCREV=3D"af44211739136e22471a2897383f34586284bf86"
-PV=3D"2.0.14+git${SRCPV}"
+SRCREV=3D"d1338dfefe3d9a2de466a9a695cb61fdd055a295"
+PV=3D"2.0.18+git${SRCPV}"
 S =3D "${WORKDIR}/git"
=20
 inherit setuptools pkgconfig
@@ -25,10 +23,3 @@ DEPENDS +=3D " \
         python-six \
         yajl \
         "
-
-# RDEPENDS_default:=20
-RDEPENDS_${PN} +=3D " \
-        "
-
-CLEANBROKEN =3D "1"
-
--=20
2.20.1

