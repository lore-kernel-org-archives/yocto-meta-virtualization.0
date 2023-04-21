Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F56CC77B76
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 12:57:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10796.1682081840542366361
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 05:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: diego.sueiro@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 997434B3;
	Fri, 21 Apr 2023 05:58:03 -0700 (PDT)
Received: from e125394.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F303C3F587;
	Fri, 21 Apr 2023 05:57:18 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-virtualization][kirkstone,langdale][PATCH v2] k3s: Fix go-api repo fetch
Date: Fri, 21 Apr 2023 13:57:10 +0100
Message-Id: <4bba85da8980f7150fc622e3f4d66c8b0aa27f90.1682081786.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Apr 2023 12:57:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8007

Currently, k3s do_fetch fails with:
ERROR: k3s-v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2-r0 do=
_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any s=
ource.', 'git://github.com/storageos/go-api;name=3Dgo-api;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D/<snip>/build/tmp/work/armv8a-poky-linux/k3s/=
v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2-r0/k3s-v1.22.6+k=
3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2/src/import/vendor.fetch/g=
ithub.com/storageos/go-api')

The https://github.com/storageos/go-api repository is currently being mig=
rated.
It's locked while the migration is in progress.

To workaround this issue, download the release tarball from
https://proxy.golang.org instead.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-containers/k3s/src_uri.inc | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/k3s/src_uri.inc b/recipes-containers/k3s/=
src_uri.inc
index 4c0c283..3af48a8 100644
--- a/recipes-containers/k3s/src_uri.inc
+++ b/recipes-containers/k3s/src_uri.inc
@@ -1950,8 +1950,13 @@ SRC_URI +=3D "git://github.com/stoewer/go-strcase;=
name=3Dgo-strcase;protocol=3Dhttps;n
=20
 # github.com/storageos/go-api v2.2.0+incompatible
 # [1] git ls-remote https://github.com/storageos/go-api d6e6bab2519238b8=
a582cabd2f4a71cca81963aa=20
-SRCREV_go-api=3D"d6e6bab2519238b8a582cabd2f4a71cca81963aa"
-SRC_URI +=3D "git://github.com/storageos/go-api;name=3Dgo-api;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/storageos/go-api"
+# The following needs to be changed because the https://github.com/stora=
geos/go-api
+# repository is currently being migrated. It's locked while the migratio=
n is in progress.
+# To workaround this issue, download the release tarball from https://pr=
oxy.golang.org instead.
+#SRCREV_go-api=3D"d6e6bab2519238b8a582cabd2f4a71cca81963aa"
+#SRC_URI +=3D "git://github.com/storageos/go-api;name=3Dgo-api;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/=
github.com/storageos/go-api"
+SRC_URI[go-api.sha256sum] =3D "2a23ff05a9ad02084e31afa7ffaf4fd97757af927=
7a5fe8001e5335a6db1ddea"
+SRC_URI +=3D "https://proxy.golang.org/github.com/storageos/go-api/v2/@v=
/v2.2.0.zip;downloadfilename=3Dgo-api_v2.2.0.zip;name=3Dgo-api;subdir=3D$=
{WORKDIR}/${BP}/src/import/vendor.fetch/github.com/storageos/go-api"
=20
 # github.com/stretchr/objx v0.2.0
 # [1] git ls-remote https://github.com/stretchr/objx ea4fe68685ee0d3cee7=
032121851b57e7494e8ea=20
--=20
2.25.1


