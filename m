Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1610C00448
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 03:32:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.19850.1661398329577641202
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Aug 2022 20:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XfesSN2z;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5236132b39=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27P3INlT004374
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Aug 2022 20:32:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=njNWWru0fK8u/NGtSHsH25BJs7k1/jDRMSR4wcnLwQE=;
 b=XfesSN2zErRhEu4jyA8TvgltkJ5U1/4uPOEeXWIJWHQkBl6BWnZa+t3db+diBKA92vU4
 EOATLl+6vVK2UGJQgi/GivAQtSYq/7A6upxOhAsj8bPZLZcRz8SBE6wwHjXOv6HgH2fx
 JitEMRn2DlUGixWJ1R/OxtyZRYGEcTvqkTTotPhh24tVyrhsZ7LSwSCyPJDj5r0pwW54
 sK5Z+XxIv2Br10HnVsfq1WDEvMGUZDGLEmB4tdDzflMCthNoHuYCixChrvCpWzxXjnqR
 os2KpGmaHdrsncm3ynNAcSP3U6snZYMkVSfD/i7DkxcwA4GbcxLYlw6BhV9BYURCk95W pQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j53rv9cd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Aug 2022 20:32:08 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 24 Aug 2022 20:32:08 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 24 Aug 2022 20:32:07 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 24 Aug 2022 20:32:06 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] libvirt: fix build with glibc-2.36
Date: Thu, 25 Aug 2022 11:32:04 +0800
Message-ID: <20220825033204.22165-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: T6kkcclcq7gDkmvl8nFWRJgbjsCj5SkF
X-Proofpoint-GUID: T6kkcclcq7gDkmvl8nFWRJgbjsCj5SkF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_02,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 clxscore=1011 malwarescore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxlogscore=983
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208250012
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Aug 2022 03:32:16 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7560

From: Kai Kang <kai.kang@windriver.com>

add only necessary definitions from linux/fs.h, because including whole
causes conflicts with sys/mount.h:

| In file included from /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/linux/fs.h:19,
|                  from ../libvirt-8.1.0/src/util/virfile.c:74:
| /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/linux/mount.h:95:6: error: redeclaration of 'enum fsconfig_command'
|    95 | enum fsconfig_command {
|       |      ^~~~~~~~~~~~~~~~
| In file included from ../libvirt-8.1.0/src/util/virfile.c:46:
| /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/sys/mount.h:189:6: note: originally defined here
|   189 | enum fsconfig_command
|       |      ^~~~~~~~~~~~~~~~
| /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/linux/mount.h:96:9: error: redeclaration of enumerator 'FSCONFIG_SET_FLAG'
|    96 |         FSCONFIG_SET_FLAG       = 0,    /* Set parameter, supplying no value */
|       |         ^~~~~~~~~~~~~~~~~

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0002-fix-build-with-glibc-2.36.patch      | 61 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_8.1.0.bb     |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/0002-fix-build-with-glibc-2.36.patch

diff --git a/recipes-extended/libvirt/libvirt/0002-fix-build-with-glibc-2.36.patch b/recipes-extended/libvirt/libvirt/0002-fix-build-with-glibc-2.36.patch
new file mode 100644
index 0000000..bd7e59f
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0002-fix-build-with-glibc-2.36.patch
@@ -0,0 +1,61 @@
+libvirt: fix build with glibc-2.36
+
+add only necessary definitions from linux/fs.h, because including whole
+causes conflicts with sys/mount.h:
+
+| In file included from /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/linux/fs.h:19,
+|                  from ../libvirt-8.1.0/src/util/virfile.c:74:
+| /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/linux/mount.h:95:6: error: redeclaration of 'enum fsconfig_command'
+|    95 | enum fsconfig_command {
+|       |      ^~~~~~~~~~~~~~~~
+| In file included from ../libvirt-8.1.0/src/util/virfile.c:46:
+| /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/sys/mount.h:189:6: note: originally defined here
+|   189 | enum fsconfig_command
+|       |      ^~~~~~~~~~~~~~~~
+| /path/to/tmp-glibc/work/core2-32-wrs-linux/libvirt/8.1.0-r0/recipe-sysroot/usr/include/linux/mount.h:96:9: error: redeclaration of enumerator 'FSCONFIG_SET_FLAG'
+|    96 |         FSCONFIG_SET_FLAG       = 0,    /* Set parameter, supplying no value */
+|       |         ^~~~~~~~~~~~~~~~~
+
+...
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/lxc/lxc_container.c |  1 -
+ src/util/virfile.c      | 10 +++++++++-
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/src/lxc/lxc_container.c b/src/lxc/lxc_container.c
+index d5410e9..3f49fb8 100644
+--- a/src/lxc/lxc_container.c
++++ b/src/lxc/lxc_container.c
+@@ -34,7 +34,6 @@
+ #include <linux/unistd.h>
+ 
+ /* For MS_MOVE */
+-#include <linux/fs.h>
+ 
+ #if WITH_CAPNG
+ # include <cap-ng.h>
+diff --git a/src/util/virfile.c b/src/util/virfile.c
+index a04f888..1cf118d 100644
+--- a/src/util/virfile.c
++++ b/src/util/virfile.c
+@@ -71,7 +71,15 @@
+ # endif
+ # include <sys/ioctl.h>
+ # include <linux/cdrom.h>
+-# include <linux/fs.h>
++// #include <linux/fs.h>       /* FIGETBSZ, FIBMAP, FS_IOC_* */
++// linux/fs.h unfortunately causes conflict with sys/mount.h since glibc-2.36
++// https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
++// add the necessary definitions
++
++#define FS_IOC_GETFLAGS                 _IOR('f', 1, long)
++#define FS_IOC_SETFLAGS                 _IOW('f', 2, long)
++#define FS_NOCOW_FL                     0x00800000 /* Do not cow file */
++
+ #endif
+ 
+ #if WITH_LIBATTR
diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
index 89f82bf..20e2e98 100644
--- a/recipes-extended/libvirt/libvirt_8.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://hook_support.py \
            file://gnutls-helper.py \
            file://0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch \
+           file://0002-fix-build-with-glibc-2.36.patch \
           "
 
 SRC_URI[libvirt.sha256sum] = "3c6c43becffeb34a3f397c616206aa69a893ff8bf5e8208393c84e8e75352934"
-- 
2.17.1


