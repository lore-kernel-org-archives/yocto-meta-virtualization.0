Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.164.1582676190785556822
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pJ05em81;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D137E016E9; Tue, 25 Feb 2020 16:16:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.216.45 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6840DE016B5
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:29 -0800 (PST)
Received: by mail-pj1-f45.google.com with SMTP id f2so1539912pjq.1
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=QtbLveljHCD5WyqccX61yX5mmUmgutmbISfD8tjxm98=;
        b=pJ05em81q/uFwSG9+j5xnhCDpL1/U6S/lzRnXKPfjTzBMuNOYytMr9A01BCCznMnd0
         CPAtPg1HFwm1uZaBtPESYg5DJlM+R/kRtp82OcG1S8suiRoB0ysburgsMpZhaaHBFVSd
         F9c4DAzR3r+i3jDvl2c+ZtrxEcS5XpGPurq2bqvj0t9DcV3ha8LmfIYxzX9VN4WerV+m
         jjT96/Xg6mHGzoXGULleopfIq9j26xcDRiXhm/cNRt5qliT/a6anoT7sQNMBOH+WScBi
         l8BvafZ7o5vzIKcHYwjoyVhGOBn8/5bT5fnyFL7H+z1rysn5ndS6dZubva89XCyXDYCa
         b4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QtbLveljHCD5WyqccX61yX5mmUmgutmbISfD8tjxm98=;
        b=IGZJ2lJv75x0KbGGDqZyYgQcx3Mzbmkejqv56KbrBAZRV4QZ4Z8vCfqKohcqtSWkSR
         QAFQo8VnA2U8D/Gf5/K1bSOKuDtMpreumo66Kklec3o33+RmkszutlkfgA47rmcXjdOT
         EG+51PxGN4wL20Sv2dtjG0uFl3uEjKz9717Gdd0Rdu/MJ11YocJg4gIoGEf0z/pkPldj
         dGMX9b4Z6gh7vS8y7RNOg2ofVTG7t2okkPFZdryQI2k0WtIvR6gdGVlhax6COy4F4VIi
         Qy1bLHiKHtVRdqPF3LZ9vEZhTOMhecMZOy+GDpG3lT8i2OAKalcvcq0mIrZUfYq3jEIl
         69rQ==
X-Gm-Message-State: APjAAAVerXxEfQgqSAgCkDpaDMtXOFlnLOR7SMEP0reTjIClBWwsuakV
	ZZiG4HK0ZFUqtgD/6kHM7hpgHuQT
X-Google-Smtp-Source: APXvYqw3Ga1mt05I34jtJEEWS+RnLTs0Y8MPDR9WW09vVpRmCfY9DMh2YpQDO8X8HmucLIG1un0PqA==
X-Received: by 2002:a17:902:864a:: with SMTP id y10mr1187898plt.2.1582676188277;
        Tue, 25 Feb 2020 16:16:28 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:27 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 00/22] Xen: python3, wic, 4.12.2, tools separation
Date: Tue, 25 Feb 2020 16:15:44 -0800
Message-Id: <20200226001606.14750-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Christopher Clark <christopher.w.clark@gmail.com>

Update the Xen recipes for python3 compatibility and separate recipes
for the hypervisor, the tools and legacy python2 scripts. Refresh ipxe
and seabios.

Changes since v2 of this series:
- update the deploy tasks to ensure that the hypervisor and tools binaries
  are staged (addtask after do_populate_sysroot) prior to being deployed
- set executable permissions on the installed python2 scripts

Upgrade Xen to latest point release of the same version and switch to
git branch tracking for easier incorporation of security fixes. Multiple
recipe fixes.

Separate recipes for the hypervisor and tools enables targetting
different architectures and build configurations (ref: multiconfig) and
improvements to build efficiency downstream.

Add wic support for building bootable images with Xen and dom0.

Remove the stubs task by satisfying the 32-bit dependencies when
necessary using multilib.

This change renames many of the packages produced: most packages that had a
"xen-" prefix now have a "xen-tools-" prefix instead, indicating the recipe
that now produces them, so dependent recipes will need to update package
references:
    eg. xen-tools-hvmloader replaces xen-hvmloader
    eg. xen-tools replaces xen-base
and recipe DEPENDS statements:
    eg. DEPENDS="xen" changes to DEPENDS="xen-tools"
A temporary append is provided for qemu to handle the renaming while its
recipe is updated in openembedded-core.

Christopher Clark (22):
  seabios: upgrade to version 1.13.0 at official URI and switch to
    python3
  ipxe: fix build with uprev to the latest git revision
  linux-yocto/xen.cfg: update Xen KConfig fragment entries
  xen: pass compiler flags via Xen-provided variables
  xen: upgrade to 4.12.2
  wic: add support for bootable pcbios partition with Xen hypervisor
  xen: package the EFI hypervisor binary /boot/xen.efi
  xen: add RDEPENDS for xen-pygrub and xen-python packages
  xen: retire Qemu packaging from the Xen recipe
  xen: separate recipes for hypervisor and tools; switch to git as
    source
  xen-tools: move xentrace_setmask into the xentrace package
  xen: add seabios to RRECOMMENDS of xen-tools when HVM-enabled
  xen-image-minimal: add kernel-module-tun for HVM guest networking
  xen-tools: change globbing to fix syntax highlighting
  xen, xen-tools: update recipes for python3
  xen, xen-tools: separate COMPATIBLE_HOST for hypervisor and tools
  xen, xen-tools: remove stubs task and use multilib when necessary
  xen, xen-tools: bug fix to post_patch task
  xen: add contact to recipe README file
  xen-image-minimal: add a build dependency on the xen hypervisor
  xen: add menuconfig instructions to the README
  xen, xen-tools: updates to the deploy task

 .gitignore                                    |   1 +
 recipes-devtools/qemu/qemu_%.bbappend         |   1 +
 recipes-extended/images/xen-image-minimal.bb  |  10 +-
 .../files/ipxe-fix-hostcc-nopie-cflags.patch  |  58 +-
 recipes-extended/ipxe/ipxe_git.bb             |   2 +-
 .../seabios/seabios/python3.patch             |  13 +
 .../{seabios_1.11.2.bb => seabios_1.13.0.bb}  |  13 +-
 recipes-extended/xen/README                   |  13 +-
 ...ython-pygrub-pass-DISTUTILS-xen.4.12.patch |   7 +-
 .../files/xen-tools-libxl-gentypes-py3.patch  | 140 +++
 ...tools-pygrub-change-tabs-into-spaces.patch |  40 +
 ...-python-scripts-work-with-2.6-and-up.patch | 529 ++++++++++
 .../xen/files/xen-tools-pygrub-py3.patch      | 233 +++++
 ...ls-python-fix-Wsign-compare-warnings.patch | 136 +++
 ...n-tools-update-python-scripts-to-py3.patch | 140 +++
 recipes-extended/xen/xen-blktap.inc           |  76 ++
 recipes-extended/xen/xen-hypervisor.inc       | 111 ++
 recipes-extended/xen/xen-python2.bb           |  68 ++
 recipes-extended/xen/xen-tools.inc            | 792 ++++++++++++++
 recipes-extended/xen/xen-tools_git.bb         |  24 +
 recipes-extended/xen/xen.inc                  | 970 +-----------------
 recipes-extended/xen/xen_4.12.0.bb            |  12 -
 recipes-extended/xen/xen_git.bb               |  19 +-
 recipes-kernel/linux/linux-yocto/xen.cfg      |   3 +-
 .../lib/wic/plugins/source/bootimg-biosxen.py | 212 ++++
 wic/directdisk-bootloader-xen.cfg             |  17 +
 wic/directdisk-bootloader-xen.wks             |  12 +
 wic/directdisk-xen.wks                        |  10 +
 28 files changed, 2642 insertions(+), 1020 deletions(-)
 create mode 100644 recipes-devtools/qemu/qemu_%.bbappend
 create mode 100644 recipes-extended/seabios/seabios/python3.patch
 rename recipes-extended/seabios/{seabios_1.11.2.bb => seabios_1.13.0.bb} (67%)
 create mode 100644 recipes-extended/xen/files/xen-tools-libxl-gentypes-py3.patch
 create mode 100644 recipes-extended/xen/files/xen-tools-pygrub-change-tabs-into-spaces.patch
 create mode 100644 recipes-extended/xen/files/xen-tools-pygrub-make-python-scripts-work-with-2.6-and-up.patch
 create mode 100644 recipes-extended/xen/files/xen-tools-pygrub-py3.patch
 create mode 100644 recipes-extended/xen/files/xen-tools-python-fix-Wsign-compare-warnings.patch
 create mode 100644 recipes-extended/xen/files/xen-tools-update-python-scripts-to-py3.patch
 create mode 100644 recipes-extended/xen/xen-blktap.inc
 create mode 100644 recipes-extended/xen/xen-hypervisor.inc
 create mode 100644 recipes-extended/xen/xen-python2.bb
 create mode 100644 recipes-extended/xen/xen-tools.inc
 create mode 100644 recipes-extended/xen/xen-tools_git.bb
 delete mode 100644 recipes-extended/xen/xen_4.12.0.bb
 create mode 100644 scripts/lib/wic/plugins/source/bootimg-biosxen.py
 create mode 100644 wic/directdisk-bootloader-xen.cfg
 create mode 100644 wic/directdisk-bootloader-xen.wks
 create mode 100644 wic/directdisk-xen.wks

-- 
2.17.1

