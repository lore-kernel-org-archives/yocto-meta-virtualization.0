Return-Path: <ml@calgera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57DAEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 14:41:10 +0000 (UTC)
Received: from t4v1.calgera.eu (t4v1.calgera.eu [80.208.226.141])
 by mx.groups.io with SMTP id smtpd.web10.25690.1688654469526896843
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 07:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@calgera.com header.s=mail header.b=Vp1fSpDf;
 spf=pass (domain: calgera.com, ip: 80.208.226.141, mailfrom: renato@calgera.com)
Received: (nullmailer pid 2644727 invoked by uid 1000);
	Thu, 06 Jul 2023 14:41:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=calgera.com; s=mail;
	t=1688654467; bh=1gwJ8lYhUTP/ea8VZCWa2bQ34SmQ6LMWE7cGY6m+TvU=;
	h=From:To:Cc:Subject:Date:From;
	b=Vp1fSpDfbilUEulxcDdKZPqmWwazVy3ravB7PIX6OKc/ldS2MFe/XvxakAqBX/+C8
	 5IWYsFJn+grwAcrL8W6v1kDq064hTqNELeXJurGa/5uUTxHjmj7IBKePYG6/dXIhwa
	 FJIc91Oyte2aHplJhlM9GIs3teeqIJcNsZRpboK5gdlI44/oYmDDYmXh0s8UmwuMo5
	 ShnqObDW2sPpW+vewuWmAC2ZghUH9Z2VGpAe1NHE+iERhIRpILVs0EJtZ8e34G828R
	 Ud0Ru+XF2/U8j7v7dPFPhqrzdIoH/N6t1td4rxjsEivpRfJZF83N9HWKgDDY7G5ZTl
	 0jlXrAh2Aoxrg==
From: ml@calgera.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Renato Caldas <renato@calgera.com>
Subject: [meta-virtualization][PATCH] crun: fix compilation with musl
Date: Thu,  6 Jul 2023 15:40:47 +0100
Message-ID: <20230706144047.2644707-1-ml@calgera.com>
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Jul 2023 14:41:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8121

From: Renato Caldas <renato@calgera.com>

Requires either libargp or argp-standalone.

Signed-off-by: Renato Caldas <renato@calgera.com>
---
 recipes-containers/crun/crun_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/cru=
n/crun_git.bb
index 2ff8586..a26de16 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -26,12 +26,12 @@ inherit autotools-brokensep pkgconfig features_check
=20
 PACKAGECONFIG ??=3D ""
=20
-
 DEPENDS =3D "yajl libcap go-md2man-native m4-native"
 # TODO: is there a packageconfig to turn this off ?
 DEPENDS +=3D "libseccomp"
 DEPENDS +=3D "systemd"
 DEPENDS +=3D "oci-image-spec oci-runtime-spec"
+DEPENDS:append:libc-musl =3D " argp-standalone"
=20
 do_configure:prepend () {
     # extracted from autogen.sh in crun source. This avoids
--=20
2.41.0


