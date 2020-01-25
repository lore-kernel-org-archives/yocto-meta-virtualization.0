Received: from muon.bsdio.com (muon.bsdio.com [65.103.231.193])
 by mx.groups.io with SMTP id smtpd.web12.1289.1579937359800426394
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Jan 2020 23:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bsdio.com, ip: 65.103.231.193, mailfrom: rebecca@bsdio.com)
Received: from muon.bsdio.com (localhost [127.0.0.1])
	by muon.bsdio.com (Postfix) with ESMTP id DBF2266B2C;
	Sat, 25 Jan 2020 00:31:57 -0700 (MST)
Received: from muon.bsdio.com ([127.0.0.1])
	by muon.bsdio.com (muon.bsdio.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id amdfSrdM24dg; Sat, 25 Jan 2020 00:31:57 -0700 (MST)
Received: from photon.int.bluestop.org (unknown [10.0.10.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by muon.bsdio.com (Postfix) with ESMTPSA;
	Sat, 25 Jan 2020 00:31:57 -0700 (MST)
From: "Rebecca Cran" <rebecca@bsdio.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Rebecca Cran <rebecca@bsdio.com>
Subject: [PATCH] Fix mod-wsgi recipe
Date: Sat, 25 Jan 2020 00:29:09 -0700
Message-Id: <20200125072909.26482-1-rebecca@bsdio.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

mod-wsgi version 4.5.13 doesn't build against python 3.8: update
it to 4.6.8 which does build.

Update the homepage URL: the Google Code project has been archived.

Fix the LoadModule line: mod_wsgi.so is installed in ${libexecdir},
not ${libdir}.

Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
---
 meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb b/me=
ta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
index 4a1048e..73dab13 100644
--- a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
+++ b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
@@ -5,12 +5,12 @@ DESCRIPTION =3D "\
   be suitable for use in hosting high performance production web sites, =
as well as \
   your average self managed personal sites running on web hosting servic=
es."
=20
-HOMEPAGE =3D "http://code.google.com/p/modwsgi/"
+HOMEPAGE =3D "https://github.com/GrahamDumpleton/mod_wsgi"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
=20
-SRCREV =3D "f22376f5141e8505f183b1b48f276c31168e2b6a"
-PV =3D "4.5.13+git${SRCPV}"
+SRCREV =3D "217e80b7436035723b80ff02ee349365e8553dfc"
+PV =3D "4.6.8+git${SRCPV}"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -47,7 +47,7 @@ FILES_${PN}-dbg +=3D "${libdir}/apache2/modules/.debug"
=20
 do_install_append() {
 	mkdir -p ${D}/etc/apache2/modules.d/
-	echo "LoadModule wsgi_module ${libdir}/apache2/modules/mod_wsgi.so" > \
+	echo "LoadModule wsgi_module ${libexecdir}/apache2/modules/mod_wsgi.so"=
 > \
 	  ${D}/etc/apache2/modules.d/wsgi.load
 }
=20
--=20
2.20.1

