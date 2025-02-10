Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BFCC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 07:47:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.45866.1739173624191143108
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 23:47:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=413644b4c0=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A6nnvV018875
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 9 Feb 2025 23:47:04 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44p7ns19hm-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 09 Feb 2025 23:47:03 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 9 Feb 2025 23:47:03 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 9 Feb 2025 23:47:02 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH V2 3/3] libvirt: fix installed-vs-shipped QA error
Date: Mon, 10 Feb 2025 15:47:00 +0800
Message-ID: <20250210074700.1751058-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210074700.1751058-1-hongxu.jia@windriver.com>
References: <20250210074700.1751058-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: F_wg-kNUEdK2BNe3mq0HPRGDZAs46OkC
X-Proofpoint-ORIG-GUID: F_wg-kNUEdK2BNe3mq0HPRGDZAs46OkC
X-Authority-Analysis: v=2.4 cv=ULwnHDfy c=1 sm=1 tr=0 ts=67a9aef7 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=fDUcGE6v1uWtqZ5HLPYA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502100064
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2025 07:47:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9133

In commit [1], it created an empty file libvirt-qemu.conf to solve the issue
of gid mismatch. In commit [2], upstream add sysusers config file for qemu
& kvm user/groups

Remove the one of upstream to fix conflict and QA error while usrmerge not in
DISTRO_FEATURES
...
ERROR: QA Issue: libvirt: Files/directories were installed but not shipped in any package:
  /usr/lib/sysusers.d
  /usr/lib/sysusers.d/libvirt-qemu.conf
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libvirt: 2 installed and not shipped files. [installed-vs-shipped]
...

[1] https://git.yoctoproject.org/meta-virtualization/commit/?id=8138d9cc7e0c31171230110db0cfa881c46a821b
[2] https://github.com/libvirt/libvirt/commit/a2c3e390f7bedf36f4ddc544d09fe3b8772c5c6f

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ysusers-config-file-for-qemu-kvm-use.patch | 37 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_git.bb       |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/0001-do-not-install-sysusers-config-file-for-qemu-kvm-use.patch

diff --git a/recipes-extended/libvirt/libvirt/0001-do-not-install-sysusers-config-file-for-qemu-kvm-use.patch b/recipes-extended/libvirt/libvirt/0001-do-not-install-sysusers-config-file-for-qemu-kvm-use.patch
new file mode 100644
index 00000000..8f771d5a
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-do-not-install-sysusers-config-file-for-qemu-kvm-use.patch
@@ -0,0 +1,37 @@
+From 077d8bbb7e6697121179bdfaf9499d45cd2a8c6d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 10 Feb 2025 15:23:58 +0800
+Subject: [PATCH] do not install sysusers config file for qemu & kvm
+ user/groups
+
+Yocto has define its own sysusers config file for qemu & kvm user/groups,
+remove the one from upstream to avoid conflict
+
+Upstream-Status: Inappropriate [Yocto specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/qemu/meson.build | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/src/qemu/meson.build b/src/qemu/meson.build
+index 43a8ad7c3b..97d988881f 100644
+--- a/src/qemu/meson.build
++++ b/src/qemu/meson.build
+@@ -161,13 +161,6 @@ if conf.has('WITH_QEMU')
+     configuration: qemu_user_group_hack_conf,
+   )
+ 
+-  # Install the sysuser config for the qemu driver
+-  install_data(
+-    'libvirt-qemu.sysusers.conf',
+-    install_dir: sysusersdir,
+-    rename: [ 'libvirt-qemu.conf' ],
+-  )
+-
+   virt_conf_files += qemu_conf
+   virt_aug_files += files('libvirtd_qemu.aug')
+   virt_test_aug_files += {
+-- 
+2.34.1
+
diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 6a524977..a1ae7f69 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -41,6 +41,7 @@ SRC_URI = "gitsm://github.com/libvirt/libvirt.git;name=libvirt;protocol=https;br
            file://0001-meson.build-clear-abs_top_builddir-to-avoid-QA-warni.patch \
            file://0001-tests-meson-clear-absolute-directory-paths.patch \
            file://0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch \
+           file://0001-do-not-install-sysusers-config-file-for-qemu-kvm-use.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


