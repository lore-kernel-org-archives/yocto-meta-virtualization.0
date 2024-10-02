Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBF4CF8545
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 22:39:00 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.7086.1727908739361117559
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 15:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 492Mcv4m022343
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 2 Oct 2024 17:38:58 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][PATCH] linux-yocto_virtualization.inc: If using externalsrc adjust dependency
Date: Wed,  2 Oct 2024 17:38:56 -0500
Message-Id: <1727908736-22275-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Oct 2024 22:39:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8911

From: Mark Hatle <mark.hatle@amd.com>

When using externalsrc, the system will disable a number of tasks such as
do_validate_branches, do_unpack and do_patch.  The do_kernel_metadata task
is configured to run after do_validate_branches do_unpack and before
do_patch.  Since all of these have been removed, the task will never
run.

The do_kernel_metadata task is responsible for populating the
recipe-sysroot-native/kcfg directory via it's own dependency to
yocto-cfg-fragments-native:do_populate_sysroot.

Without do_kernel_metadata running, do_kernel_configme will fail to run
with errors like:
  ERROR: linux-xlnx-6.6.40+git-r0 do_kernel_configme: Feature '../recipe-sysroot-native/kcfg/cfg/virtio.scc' not found, this will cause configuration failures.
  ERROR: linux-xlnx-6.6.40+git-r0 do_kernel_configme: Check the SRC_URI for meta-data repositories or directories that may be missing
  ERROR: linux-xlnx-6.6.40+git-r0 do_kernel_configme: Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue

Fix this issue by detecting if we're running with externalsrc, and then
adding the task do_kernel_metadata (from the current recipe) as a
dependency of do_kernel_configme.

To reproduce th original issue:

  $ . ./oe-initbuild-env
  $ bitbake linux-yocto -c patch
  $ cp -r tmp/work-shared/<machine>/kernel-source linux-yocto

  edit the conf/local.conf adding:
  DISTRO_FEATURES:append = " virtualization"
  INHERIT += "externalsrc"
  EXTERNALSRC:pn-linux-yocto = "${TOPDIR}/linux-yocto"

  $ rm -rf tmp
  $ bitbake linux-yocto -c menuconfig

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 recipes-kernel/linux/linux-yocto_virtualization.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
index e729c3b2..d678021b 100644
--- a/recipes-kernel/linux/linux-yocto_virtualization.inc
+++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
@@ -59,6 +59,12 @@ KERNEL_FEATURES:append = " ${KERNEL_CACHE_FEATURES}"
 # features can be enabled via the fragments
 do_kernel_metadata[depends] += "${KERNEL_CFG_DEPENDS}"
 
+# if externalsrc is enabled, do_kernel_metadata dependency on
+# yocto-cfg-fragments-native won't be run to populate
+# recipe-sysroot-native/kcfg because do_patch is not run.  Manully add
+# the dependency to do_kernel_configme for this special case
+do_kernel_configme[depends] += "${@['', d.getVar('PN') + ':do_kernel_metadata'][(bb.data.inherits_class('externalsrc', d))]}"
+
 # xen kernel support
 # SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
 KERNEL_FEATURES:append = "${@distro_cond_feature('cfg/xen.scc', 'xen', d )}"
-- 
2.34.1


