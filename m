Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.1306.1582840799255455362
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2020 13:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bNl0ZflT;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDF46E0170D; Thu, 27 Feb 2020 13:59:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,FSL_HELO_FAKE,RCVD_IN_DNSWL_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  3.0 FSL_HELO_FAKE FSL_HELO_FAKE
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.219.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2068E008D9
	for <meta-virtualization@yoctoproject.org>; Thu, 27 Feb 2020 13:59:57 -0800 (PST)
Received: by mail-qv1-f66.google.com with SMTP id g16so409377qvz.5
        for <meta-virtualization@yoctoproject.org>; Thu, 27 Feb 2020 13:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ixmG3C1aK+8B18m4rPc8DogyCh/4niJ8WzTA83TL7gE=;
        b=bNl0ZflTXiZ87pQqQNsY3CbST7SyurgEGV8EZWIYBTBca+2g92zTpddtRfsiJZlYoi
         o4qRMG+86JdWFJJ/Zv06VzLNSrE9rw0spmePQdSoKmA9YXs5MO4L50Af9x2kcXM0dNu3
         MRgI1E+5cDUoPN1R9ptT5ssXCWwu7mdfPdCvkkX26GJjAcKkFy96UhIHtJCeeFu4lYvb
         1jX2NzpVulrwcKCh0gpK7qpOohe1LQObuWe0ybldwB/IJMadPLvSChLOyJlVLbu4Yxwv
         Atsa2x6M3rwWVlzPsO/KtuLHzsWV3KkUvZke/0B86Uti/SWJdw2dwi8zGqJ/5u+1aXkG
         ZGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ixmG3C1aK+8B18m4rPc8DogyCh/4niJ8WzTA83TL7gE=;
        b=pfAFkg0x3cZ7OGU4nHrreYk/XC93t78GVSIy+3u4YuqZO/EE5c7Bj7AYTRI4gHuUFe
         U8GZzEz+maYLoWb5mAnxaRNYGGxjEMl2hwYx5R0iG+2SrY+3HohGxdT6OehXKlx6we6O
         WMiV2wpBlc4dNOM6ylRPXPKl4ABWXJuwnUhze614n0CKN+VmGoAq0XCFobxmhPyPm0q6
         SvDqrzad1vn3vdmf1JP5eZneawpAqHvFg4pByRhHAodUO+yTtu7/SxMxkTFL0eNTnek/
         HDtOhYhUwYx5q46ONJYtyYIa7udsdvJQ2/YxeWvdEOAxoWsiVSydNJq5Aa47LJJTiy4k
         Pc7g==
X-Gm-Message-State: APjAAAUXJWK19P/5+txiCrFPdYRR2j3ooUlmkC4g5mgr1HNEuqOQBvyZ
	ZHCtnwR93vyqhcNnPHRbnb8=
X-Google-Smtp-Source: APXvYqy+V71NVq1AzvZ1g4lqUYCQG5GjZzAtno+sffA91TSONgEqBznLZS6gypW6p2kAZHYshk4rTg==
X-Received: by 2002:a0c:e8c7:: with SMTP id m7mr1203838qvo.128.1582840796801;
        Thu, 27 Feb 2020 13:59:56 -0800 (PST)
Received: from gmail.com (CPE98dac44fc29f-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.255.134])
        by smtp.gmail.com with ESMTPSA id u13sm3790971qtg.64.2020.02.27.13.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 13:59:56 -0800 (PST)
Date: Thu, 27 Feb 2020 16:59:54 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: christopher.w.clark@gmail.com
Cc: meta-virtualization@yoctoproject.org, cardoe@gentoo.org
Subject: Re: [meta-virtualization][PATCH v3 00/22] Xen: python3, wic, 4.12.2, tools separation
Message-ID: <20200227215953.GD36079@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH v3 00/22] Xen: python3, wic, 4.12.2, tools separation
on 25/02/2020 christopher.w.clark@gmail.com wrote:

> From: Christopher Clark <christopher.w.clark@gmail.com>
> 
> Update the Xen recipes for python3 compatibility and separate recipes
> for the hypervisor, the tools and legacy python2 scripts. Refresh ipxe
> and seabios.
> 
> Changes since v2 of this series:
> - update the deploy tasks to ensure that the hypervisor and tools binaries
>   are staged (addtask after do_populate_sysroot) prior to being deployed
> - set executable permissions on the installed python2 scripts

v3 is merged. Thanks for the updates!

Bruce

> 
> Upgrade Xen to latest point release of the same version and switch to
> git branch tracking for easier incorporation of security fixes. Multiple
> recipe fixes.
> 
> Separate recipes for the hypervisor and tools enables targetting
> different architectures and build configurations (ref: multiconfig) and
> improvements to build efficiency downstream.
> 
> Add wic support for building bootable images with Xen and dom0.
> 
> Remove the stubs task by satisfying the 32-bit dependencies when
> necessary using multilib.
> 
> This change renames many of the packages produced: most packages that had a
> "xen-" prefix now have a "xen-tools-" prefix instead, indicating the recipe
> that now produces them, so dependent recipes will need to update package
> references:
>     eg. xen-tools-hvmloader replaces xen-hvmloader
>     eg. xen-tools replaces xen-base
> and recipe DEPENDS statements:
>     eg. DEPENDS="xen" changes to DEPENDS="xen-tools"
> A temporary append is provided for qemu to handle the renaming while its
> recipe is updated in openembedded-core.
> 
> Christopher Clark (22):
>   seabios: upgrade to version 1.13.0 at official URI and switch to
>     python3
>   ipxe: fix build with uprev to the latest git revision
>   linux-yocto/xen.cfg: update Xen KConfig fragment entries
>   xen: pass compiler flags via Xen-provided variables
>   xen: upgrade to 4.12.2
>   wic: add support for bootable pcbios partition with Xen hypervisor
>   xen: package the EFI hypervisor binary /boot/xen.efi
>   xen: add RDEPENDS for xen-pygrub and xen-python packages
>   xen: retire Qemu packaging from the Xen recipe
>   xen: separate recipes for hypervisor and tools; switch to git as
>     source
>   xen-tools: move xentrace_setmask into the xentrace package
>   xen: add seabios to RRECOMMENDS of xen-tools when HVM-enabled
>   xen-image-minimal: add kernel-module-tun for HVM guest networking
>   xen-tools: change globbing to fix syntax highlighting
>   xen, xen-tools: update recipes for python3
>   xen, xen-tools: separate COMPATIBLE_HOST for hypervisor and tools
>   xen, xen-tools: remove stubs task and use multilib when necessary
>   xen, xen-tools: bug fix to post_patch task
>   xen: add contact to recipe README file
>   xen-image-minimal: add a build dependency on the xen hypervisor
>   xen: add menuconfig instructions to the README
>   xen, xen-tools: updates to the deploy task
> 
>  .gitignore                                    |   1 +
>  recipes-devtools/qemu/qemu_%.bbappend         |   1 +
>  recipes-extended/images/xen-image-minimal.bb  |  10 +-
>  .../files/ipxe-fix-hostcc-nopie-cflags.patch  |  58 +-
>  recipes-extended/ipxe/ipxe_git.bb             |   2 +-
>  .../seabios/seabios/python3.patch             |  13 +
>  .../{seabios_1.11.2.bb => seabios_1.13.0.bb}  |  13 +-
>  recipes-extended/xen/README                   |  13 +-
>  ...ython-pygrub-pass-DISTUTILS-xen.4.12.patch |   7 +-
>  .../files/xen-tools-libxl-gentypes-py3.patch  | 140 +++
>  ...tools-pygrub-change-tabs-into-spaces.patch |  40 +
>  ...-python-scripts-work-with-2.6-and-up.patch | 529 ++++++++++
>  .../xen/files/xen-tools-pygrub-py3.patch      | 233 +++++
>  ...ls-python-fix-Wsign-compare-warnings.patch | 136 +++
>  ...n-tools-update-python-scripts-to-py3.patch | 140 +++
>  recipes-extended/xen/xen-blktap.inc           |  76 ++
>  recipes-extended/xen/xen-hypervisor.inc       | 111 ++
>  recipes-extended/xen/xen-python2.bb           |  68 ++
>  recipes-extended/xen/xen-tools.inc            | 792 ++++++++++++++
>  recipes-extended/xen/xen-tools_git.bb         |  24 +
>  recipes-extended/xen/xen.inc                  | 970 +-----------------
>  recipes-extended/xen/xen_4.12.0.bb            |  12 -
>  recipes-extended/xen/xen_git.bb               |  19 +-
>  recipes-kernel/linux/linux-yocto/xen.cfg      |   3 +-
>  .../lib/wic/plugins/source/bootimg-biosxen.py | 212 ++++
>  wic/directdisk-bootloader-xen.cfg             |  17 +
>  wic/directdisk-bootloader-xen.wks             |  12 +
>  wic/directdisk-xen.wks                        |  10 +
>  28 files changed, 2642 insertions(+), 1020 deletions(-)
>  create mode 100644 recipes-devtools/qemu/qemu_%.bbappend
>  create mode 100644 recipes-extended/seabios/seabios/python3.patch
>  rename recipes-extended/seabios/{seabios_1.11.2.bb => seabios_1.13.0.bb} (67%)
>  create mode 100644 recipes-extended/xen/files/xen-tools-libxl-gentypes-py3.patch
>  create mode 100644 recipes-extended/xen/files/xen-tools-pygrub-change-tabs-into-spaces.patch
>  create mode 100644 recipes-extended/xen/files/xen-tools-pygrub-make-python-scripts-work-with-2.6-and-up.patch
>  create mode 100644 recipes-extended/xen/files/xen-tools-pygrub-py3.patch
>  create mode 100644 recipes-extended/xen/files/xen-tools-python-fix-Wsign-compare-warnings.patch
>  create mode 100644 recipes-extended/xen/files/xen-tools-update-python-scripts-to-py3.patch
>  create mode 100644 recipes-extended/xen/xen-blktap.inc
>  create mode 100644 recipes-extended/xen/xen-hypervisor.inc
>  create mode 100644 recipes-extended/xen/xen-python2.bb
>  create mode 100644 recipes-extended/xen/xen-tools.inc
>  create mode 100644 recipes-extended/xen/xen-tools_git.bb
>  delete mode 100644 recipes-extended/xen/xen_4.12.0.bb
>  create mode 100644 scripts/lib/wic/plugins/source/bootimg-biosxen.py
>  create mode 100644 wic/directdisk-bootloader-xen.cfg
>  create mode 100644 wic/directdisk-bootloader-xen.wks
>  create mode 100644 wic/directdisk-xen.wks
> 
> -- 
> 2.17.1
> 
