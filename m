Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.15392.1631124148667191884
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Sep 2021 11:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=AsatDOzW;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: festevam@denx.de)
Received: from localhost.localdomain (unknown [IPv6:2804:14c:485:504a:e0ac:bf1c:7025:95c6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3F0E783445;
	Wed,  8 Sep 2021 20:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1631124147;
	bh=DlBffIOa7mvsgilFV2ORouaRKuu6tSfTbwV/Wr6Goos=;
	h=From:To:Cc:Subject:Date:From;
	b=AsatDOzWgDPFm3+CjVrSxNxeka61gXu7OyxPUd8eqSY2A7oIUEjuk6Vsa1IEPwkMx
	 c/nzc3l6fFbyuEK9lCJD1s8wFoXjKd2uB1LGks2A3l6CfpuS1FC3IYfGxXjvLE7ruq
	 ycHO/dAXODlJ6f2yWqZ5dJO4URBobMUjXTP5vU658QS1YLqunbywbMRuUesu5aK6xO
	 zNqn/CmYrVfLawwooXbWNm3jaeQ/l65MakUnxgWBAa2yyQrXZa55hxGjh2mnzVY4Ar
	 jjQ5Z3kqG3uoHKF67UR8a36CGTMm0OtxEH0FlSUDKs2nWZv3trpQTu2Ylk124T1k55
	 yThxvDgNxR9eQ==
From: "Fabio Estevam" <festevam@denx.de>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	otavio@ossystems.com.br,
	marex@denx.de,
	Fabio Estevam <festevam@denx.de>
Subject: [meta-virtualization][PATCH dunfell] containers: Explictly reference a valid branch
Date: Wed,  8 Sep 2021 15:02:14 -0300
Message-Id: <20210908180214.1302459-1-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

These repositories have dropped their master branches,
so the fetcher default no longer works.

Point to an existing branch to fix the fetch failure.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Sorry for the resend.

I was not subscribed to the list in the first time.

 recipes-containers/oci-image-spec/oci-image-spec_git.bb   | 2 +-
 recipes-containers/podman-compose/podman-compose_0.1.5.bb | 2 +-
 recipes-containers/podman/podman_git.bb                   | 2 +-
 recipes-containers/skopeo/skopeo_git.bb                   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/oci-image-spec/oci-image-spec_git.bb b/re=
cipes-containers/oci-image-spec/oci-image-spec_git.bb
index 5805740..a137bc8 100644
--- a/recipes-containers/oci-image-spec/oci-image-spec_git.bb
+++ b/recipes-containers/oci-image-spec/oci-image-spec_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D=
27ef03aa2da6e424307f102e8
 SRCNAME =3D "image-spec"
=20
 PKG_NAME =3D "github.com/opencontainers/${SRCNAME}"
-SRC_URI =3D "git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME}"
+SRC_URI =3D "git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};bran=
ch=3Dmain"
=20
 SRCREV =3D "bd4f8fcb0979a663d8b97a1d4d9b030b3d2ca1fa"
 PV =3D "v1.0.1+git${SRCPV}"
diff --git a/recipes-containers/podman-compose/podman-compose_0.1.5.bb b/=
recipes-containers/podman-compose/podman-compose_0.1.5.bb
index 4015069..b9eb1c8 100644
--- a/recipes-containers/podman-compose/podman-compose_0.1.5.bb
+++ b/recipes-containers/podman-compose/podman-compose_0.1.5.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
=20
 inherit setuptools3 pypi
=20
-SRC_URI =3D "git://github.com/containers/podman-compose.git"
+SRC_URI =3D "git://github.com/containers/podman-compose.git;branch=3Ddev=
el"
=20
 SRCREV =3D "f008986633879acf3f54848dabbf07cef8e9c68f"
=20
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers=
/podman/podman_git.bb
index aa6b25b..a8a6b02 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -26,7 +26,7 @@ python __anonymous() {
=20
 SRCREV =3D "444a19cdd2e6108c75f6c1aadc1a2a9138a8bd73"
 SRC_URI =3D " \
-    git://github.com/containers/libpod.git;branch=3Dmaster \
+    git://github.com/containers/libpod.git;branch=3Dmain \
 "
=20
 LICENSE =3D "Apache-2.0"
diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers=
/skopeo/skopeo_git.bb
index f5a6231..b14c293 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -20,7 +20,7 @@ RDEPENDS_${PN} =3D " \
 "
=20
 SRC_URI =3D " \
-    git://github.com/containers/skopeo \
+    git://github.com/containers/skopeo;branch=3Dmain \
     file://storage.conf \
     file://registries.conf \
 "
--=20
2.25.1

