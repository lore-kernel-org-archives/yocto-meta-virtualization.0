Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6558.1624963867683786625
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 03:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC4DE31B
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Jun 2021 03:51:06 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 872DD3F694
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Jun 2021 03:51:06 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 1/2] dev86: work on all hosts, other cleanups
Date: Tue, 29 Jun 2021 11:51:03 +0100
Message-Id: <20210629105104.3692000-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Remove COMPATIBLE_HOST, whilst this is an x86 assembler there's nothing t=
o stop
you building it on or for arm64 and assembling x86 code.

Override INEXE so that binaries are not stripped and remove INSANE_SKIP.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 recipes-extended/dev86/dev86_git.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86=
/dev86_git.bb
index 9488d90..ad7a0df 100644
--- a/recipes-extended/dev86/dev86_git.bb
+++ b/recipes-extended/dev86/dev86_git.bb
@@ -21,7 +21,7 @@ S =3D "${WORKDIR}/git"
 DEPENDS =3D "gperf-native dev86-native"
=20
 BBCLASSEXTEND =3D "native"
-EXTRA_OEMAKE =3D "VERSION=3D${BASE_PV} PREFIX=3D${prefix} DIST=3D${D} LD=
FLAGS=3D'${LDFLAGS}'"
+EXTRA_OEMAKE =3D "VERSION=3D${BASE_PV} PREFIX=3D${prefix} DIST=3D${D} LD=
FLAGS=3D'${LDFLAGS}' INEXE=3D''"
=20
 do_compile() {
 	# always regenerate token1.h, token2.h for deterministic behavior
@@ -45,7 +45,4 @@ do_install_append_class-native() {
         install -v -m 755 ${B}/ifdefg ${D}${bindir}
 }
=20
-COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
 FILES_${PN} +=3D "${libdir}/bcc"
-
-INSANE_SKIP_${PN} =3D "already-stripped"
--=20
2.25.1

