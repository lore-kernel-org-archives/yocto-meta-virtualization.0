Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B40AC43219
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:06 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.1649.1649817183801536664
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Apr 2022 19:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23D2X2uX001317
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Apr 2022 19:33:02 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Apr 2022 19:33:02 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Apr 2022 19:33:01 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 12 Apr 2022 19:33:00 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [hardknott][PATCH] libvirt: fix CVE-2022-0897
Date: Wed, 13 Apr 2022 10:32:59 +0800
Message-ID: <20220413023259.894439-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 23D2X2uX001317
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Apr 2022 15:48:06 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7164

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libvirt/libvirt/CVE-2022-0897.patch       | 57 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_6.3.0.bb     |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2022-0897.patch

diff --git a/recipes-extended/libvirt/libvirt/CVE-2022-0897.patch b/recip=
es-extended/libvirt/libvirt/CVE-2022-0897.patch
new file mode 100644
index 0000000..e98f40b
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2022-0897.patch
@@ -0,0 +1,57 @@
+From d470667167fa585d2bc3b996fb3bf2786d44be9a Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange@=
redhat.com>
+Date: Tue, 8 Mar 2022 17:28:38 +0000
+Subject: [PATCH] nwfilter: fix crash when counting number of network fil=
ters
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The virNWFilterObjListNumOfNWFilters method iterates over the
+driver->nwfilters, accessing virNWFilterObj instances. As such
+it needs to be protected against concurrent modification of
+the driver->nwfilters object.
+
+This API allows unprivileged users to connect, so users with
+read-only access to libvirt can cause a denial of service
+crash if they are able to race with a call of virNWFilterUndefine.
+Since network filters are usually statically defined, this is
+considered a low severity problem.
+
+This is assigned CVE-2022-0897.
+
+Reviewed-by: Eric Blake <eblake@redhat.com>
+Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/a=
4947e8f63c3e6b7b067b444f3d6cf674c0d7f36]
+CVE: CVE-2022-0897
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/nwfilter/nwfilter_driver.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/nwfilter/nwfilter_driver.c b/src/nwfilter/nwfilter_driv=
er.c
+index 1c40772..27500d1 100644
+--- a/src/nwfilter/nwfilter_driver.c
++++ b/src/nwfilter/nwfilter_driver.c
+@@ -514,11 +514,15 @@ nwfilterLookupByName(virConnectPtr conn,
+ static int
+ nwfilterConnectNumOfNWFilters(virConnectPtr conn)
+ {
++    int ret;
+     if (virConnectNumOfNWFiltersEnsureACL(conn) < 0)
+         return -1;
+=20
+-    return virNWFilterObjListNumOfNWFilters(driver->nwfilters, conn,
+-                                        virConnectNumOfNWFiltersCheckAC=
L);
++    nwfilterDriverLock();
++    ret =3D virNWFilterObjListNumOfNWFilters(driver->nwfilters, conn,
++                                           virConnectNumOfNWFiltersChec=
kACL);
++    nwfilterDriverUnlock();
++    return ret;
+ }
+=20
+=20
+--=20
+2.25.1
+
diff --git a/recipes-extended/libvirt/libvirt_6.3.0.bb b/recipes-extended=
/libvirt/libvirt_6.3.0.bb
index 8e95ad6..48e5b58 100644
--- a/recipes-extended/libvirt/libvirt_6.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.3.0.bb
@@ -47,6 +47,7 @@ SRC_URI =3D "http://libvirt.org/sources/libvirt-${PV}.t=
ar.xz;name=3Dlibvirt \
            file://CVE-2021-3631.patch \
            file://0001-storage_driver-Unlock-object-on-ACL-fail-in-stora=
geP.patch \
            file://CVE-2021-3975.patch \
+           file://CVE-2022-0897.patch \
           "
=20
 SRC_URI[libvirt.md5sum] =3D "1bd4435f77924f5ec9928b538daf4a02"
--=20
2.25.1


