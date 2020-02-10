Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.17787.1581311295937221392
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FUqWQMxq;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9FD7E016BB; Sun,  9 Feb 2020 21:08:15 -0800 (PST)
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
	*      [209.85.214.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D598CE016B8
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:13 -0800 (PST)
Received: by mail-pl1-f196.google.com with SMTP id c23so2334824plz.4
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZprRGmh0QXL/GciJUUAgv5MvG1yApBHebMxNL13+jqY=;
        b=FUqWQMxq66gSmDFWHQKZkgrjHKr0CGy7C/czEXYvMQzieciZgpodViNHlYMBalILEu
         sDBB3/RtRlfcuuRxU1WDMsxUu29a1/LADx7qJn7iOV3fWt7xjLNf0LfOzQnWoSCu93vR
         kkRbn1eBtMwphcIzMfQIXtXBjnxd2ufJAhuauzhyTqwoACG2DEoOyITiPrPmbOawBgxA
         0myk84SriNR4TVBJjGbwf2OYtzO4AZ7IOOB//TBLoO6GumDYfMI/w95awwL4lthrPwxn
         wSOv+QqOM4uLmuIYJ4LtOo6/yPWgAIv1QOGjRM1V7sTPhLG2fJlWBLXq9dzssN5YkI3K
         Uk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZprRGmh0QXL/GciJUUAgv5MvG1yApBHebMxNL13+jqY=;
        b=ldR8AWlRSRRzXZg9NDe6+P4WQYLV6fX7lyPzzIAnDKOGt/SlfFPoDhaCyj47OGPmlW
         iGPpLKLwSepC1+r+8Hkq8mpmc92903ePLB2lIdwowStNS2/cEg5mIk6qUajjkJDC5Ind
         lw0vG/yg63Bj+PdPiWjzeJTn59yUsivbMc11RAAnxk2XVXtZy3S7y4rmwyrDkkT/1pj+
         Jr7NcfY04GlMfeQ/OPxhfJ2dhv9WtK3Cc+F59uWSsuBGgL1owNQIUwOYvP7qAbVtXilg
         GbeErdBEIcY5ub58HW3hjr6LBHYS3h1vzSAjrQx7esLoyHI7rXA0xKb9XYUwndY6Zr/0
         djAQ==
X-Gm-Message-State: APjAAAVkDY0mWkwnMKATLSqE/l5QSLXO3O+Hw1Q0PCXbCTy3sRE/0Fn2
	OfsZHlK35Lb7TWULov8Ig4o0NQcb
X-Google-Smtp-Source: APXvYqzzLI7nlhGjJJFzUY+/8ajsl0y7wFo5EkicF5OlZlrfR5ZGsFpMfYZu5RYfZQCTvSbE13mFdA==
X-Received: by 2002:a17:90a:23a3:: with SMTP id g32mr18757578pje.134.1581311292802;
        Sun, 09 Feb 2020 21:08:12 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:12 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>,
	cardoe@gentoo.org,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <eric.chanudet@gmail.com>
Subject: [meta-virtualization][PATCH 00/16] Xen: python3, wic, 4.12.2, tools separation
Date: Sun,  9 Feb 2020 21:07:38 -0800
Message-Id: <20200210050754.3534-4-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Update the Xen recipes for python3 compatibility and separate recipes for the
hypervisor, the tools and legacy python2 scripts.

Upgrade Xen to latest point release of the same version and switch to git branch
tracking for easier incorporation of security fixes. Multiple recipe fixes.

Separate recipes for the hypervisor and tools enables targetting different
architectures and build configurations (ref: multiconfig) and improvements
to build efficiency downstream.

Add wic support for building bootable images with Xen and dom0.

Remove the stubs task, which was unfortunately MACHINE-specific, by
moving its work into the tools configure script.

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

Christopher Clark (16):
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
  xen, xen-tools: remove stubs task and generate 32-bit headers if
    needed
  xen, xen-tools: bug fix to post_patch task
  xen: add contact to recipe README file

 .gitignore                                    |   1 +
 recipes-devtools/qemu/qemu_%.bbappend         |   1 +
 recipes-extended/images/xen-image-minimal.bb  |   6 +-
 recipes-extended/xen/README                   |   4 +-
 ...ython-pygrub-pass-DISTUTILS-xen.4.12.patch |   7 +-
 .../xen-tools-generate-32bit-headers.patch    |  99 ++
 .../files/xen-tools-libxl-gentypes-py3.patch  | 140 +++
 ...tools-pygrub-change-tabs-into-spaces.patch |  40 +
 ...-python-scripts-work-with-2.6-and-up.patch | 529 ++++++++++
 .../xen/files/xen-tools-pygrub-py3.patch      | 233 +++++
 ...ls-python-fix-Wsign-compare-warnings.patch | 136 +++
 ...n-tools-update-python-scripts-to-py3.patch | 140 +++
 recipes-extended/xen/xen-blktap.inc           |  76 ++
 recipes-extended/xen/xen-hypervisor.inc       |  97 ++
 recipes-extended/xen/xen-python2.bb           |  55 +
 recipes-extended/xen/xen-tools.inc            | 748 ++++++++++++++
 recipes-extended/xen/xen-tools_git.bb         |   3 +
 recipes-extended/xen/xen-version.inc          |  22 +
 recipes-extended/xen/xen.inc                  | 968 +-----------------
 recipes-extended/xen/xen_4.12.0.bb            |  12 -
 recipes-extended/xen/xen_git.bb               |  19 +-
 .../lib/wic/plugins/source/bootimg-biosxen.py | 212 ++++
 wic/directdisk-bootloader-xen.cfg             |  17 +
 wic/directdisk-bootloader-xen.wks             |  12 +
 wic/directdisk-xen.wks                        |  10 +
 25 files changed, 2622 insertions(+), 965 deletions(-)
 create mode 100644 recipes-devtools/qemu/qemu_%.bbappend
 create mode 100644 recipes-extended/xen/files/xen-tools-generate-32bit-headers.patch
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
 create mode 100644 recipes-extended/xen/xen-version.inc
 delete mode 100644 recipes-extended/xen/xen_4.12.0.bb
 create mode 100644 scripts/lib/wic/plugins/source/bootimg-biosxen.py
 create mode 100644 wic/directdisk-bootloader-xen.cfg
 create mode 100644 wic/directdisk-bootloader-xen.wks
 create mode 100644 wic/directdisk-xen.wks

-- 
2.17.1

