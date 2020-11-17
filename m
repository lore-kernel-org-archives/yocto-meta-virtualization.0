Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.7160.1605616803762623000
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 04:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=obQ4bWex;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 1D21A38C04BB
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 12:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1498; q=dns/txt; s=axis-central1;
  t=1605616803; x=1637152803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ydkoTEAp2cJA2qZo1nGATZGEbfIoZOD0zPtBGilkRyo=;
  b=obQ4bWexF+usb9rHbJ7pnRl3Z0ZI1Vz7gFXrDiNb9dy4ma9XWObGyiNB
   1seVYi4YVraaLyF1kCMKI/tFPe01p0tdNIQ1b6YssR6GkFWAd262nzg9a
   W4xlDOTdVoffOiafA95/Nfc2PXYTJuT0ghtSL5tUyRpQyAtpp8J14m8h4
   JDaGu3ztASqVwN5+XYukOWmDILYnKD7N9xUeeIdl/kq6qyan5bfV9NQLR
   SAR4yD1LTjIw6lMxALmm4sY8PxYgYKwJtao559lvT+FkttGOubGAkKs/v
   qyrQBtMWLw+4zROwPPIlclHk0bVGRPrNSqEZ0EcWu41N3yGKXJLVCEOvi
   g==;
IronPort-SDR: GT6uB7QcC2XcWRygvpLXBgLh6qXz0pOCxRt6WS5pBciqnc+TvsnxoutlillIk0WeAmh2oZL8DO
 mQLNXRiCc3piCfY4nR9LH2vdRr1BmiK/zhpQF09P0dLCcDHNln/MRg/cI9uANr1TrTq4BO5AQm
 vrjrLYKC4OZk101aPBMTNCdpUwGeeSOqTGpGyDMF9gE+vKCMBUSQ2yEVD2hBxMVA2Jc+1JDPfP
 x4+ICMVV9xHhM4XuQCtzotZ/SKfm5T9XAcJNh9N8xDGYIs3gVeKo/R+bn+0+u8M/GvvNAvfU92
 WzE=
X-IronPort-AV: E=Sophos;i="5.77,485,1596492000"; 
   d="scan'208";a="14594936"
From: "Joakim Roubert" <joakim.roubert@axis.com>
To: <meta-virtualization@yoctoproject.org>
CC: Joakim Roubert <joakimr@axis.com>
Subject: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
Date: Tue, 17 Nov 2020 13:39:57 +0100
Message-ID: <20201117123957.12607-1-joakimr@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The current stable release installed when running the regular k3s
install script is now v1.19.3+k3s3. Using that version in our recipe
also mitigates the fixes for

https://github.com/rancher/kine/issues/61

Change-Id: I4c53d777d4d837628a6c7f8a9234da9d71eb45ae
Signed-off-by: Joakim Roubert <joakimr@axis.com>
---
 recipes-containers/k3s/k3s_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k=
3s_git.bb
index ea5ed75..28ce66b 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "https://k3s.io/"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://${S}/src/import/LICENSE;md5=3D2ee41112a44fe=
7014dce33e26468ba93"
=20
-SRC_URI =3D "git://github.com/rancher/k3s.git;branch=3Drelease-1.18;name=
=3Dk3s \
+SRC_URI =3D "git://github.com/rancher/k3s.git;branch=3Drelease-1.19;name=
=3Dk3s \
            file://k3s.service \
            file://k3s-agent.service \
            file://k3s-agent \
@@ -13,9 +13,9 @@ SRC_URI =3D "git://github.com/rancher/k3s.git;branch=3D=
release-1.18;name=3Dk3s \
            file://0001-Finding-host-local-in-usr-libexec.patch;patchdir=3D=
src/import \
           "
 SRC_URI[k3s.md5sum] =3D "363d3a08dc0b72ba6e6577964f6e94a5"
-SRCREV_k3s =3D "630bebf94b9dce6b8cd3d402644ed023b3af8f90"
+SRCREV_k3s =3D "0e4fbfefe1dd8734756dfa4f9ab4fc89665cece4"
=20
-PV =3D "v1.18.9+git${SRCPV}"
+PV =3D "v1.19.3+git${SRCPV}"
=20
 CNI_NETWORKING_FILES ?=3D "${WORKDIR}/cni-containerd-net.conf"
=20
--=20
2.20.1

