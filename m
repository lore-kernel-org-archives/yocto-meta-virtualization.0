Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4256E01828
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Nov 2013 20:02:11 -0800 (PST)
Received: by mail-ie0-f178.google.com with SMTP id to1so654044ieb.23
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Nov 2013 20:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KpTQDAj96yvCG+UJKaScGak9Ru1r5ADcrKFB/jRz1t0=;
	b=JgMyd3lLCWNeac4eqfcWQUQ4jSYPM846BaqKxsfHwTm0mhgcXOmloRdd9aOsovEOeu
	8WphHv8Pr4iLL15XXZyj3OorRk/IrwrosPGbq7vS3wz6qz9/1lPlLtiJAqc0WrP8O7L4
	4Dmymt3qDzfe2RoNVmJZbGo4IB646N9zax1hTbvjwswRVfVk1CDTOjqxJ8HxGtpVlnmX
	o6h+Rcd2z1g6KtkPrw+t/ZHq3rdYBvPSNwkRE4nfr/ae7WVfinyS7hoqsvPCY8pKdZV4
	BaJJcOezrqqSSUwZJKe1jtSNuu09KRrDMcMhfJCKcKVprwK7St0uv0qiT4ju+EBSeJN/
	0GWg==
X-Received: by 10.50.20.99 with SMTP id m3mr649240ige.54.1383883330428;
	Thu, 07 Nov 2013 20:02:10 -0800 (PST)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id hv5sm1230089igb.9.2013.11.07.20.02.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 20:02:09 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  7 Nov 2013 23:00:57 -0500
Message-Id: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [PATCH v2 00/10] xen cleanup and upgrades
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Nov 2013 04:02:11 -0000

Cleaned out old xen bits, upgraded to 4.3.1, moved to common xen.inc, 
and added git recipe pointing to xen-unstable.

I broke out the cleanup into smaller patches in hopes that it will make it through.

If not, you can find these patches in branch=xen-upgrades-and-cleanup-v2 at:
https://github.com/cjp256/meta-virtualization.git

Chris Patterson (10):
  xen: remove xsm from default PACKAGECONFIG options.
  xen: remove 4.1.2 recipe and patches
  xen: remove xen-hg recipe and patches
  xen: remove xen-rt recipe and patches
  xen: remove old xen.inc and xen-python.inc
  xen: remove old patches
  xen: rename xen patches directory from xen-4.3.0 to files.
  xen: upgrade to 4.3.1
  xen: improve organization with new xen.inc
  xen: add xen_git recipe.

 .../xen/files/allow_disable_xend.patch             |   75 -
 ...lask-avoid-installing-policy-file-as-boot.patch |   26 +
 .../xen/files/ioemu-cross-gl-check.patch           |   29 -
 recipes-extended/xen/files/xend-config.sxp         |  304 -
 recipes-extended/xen/files/xenminiinit.sh          |   59 -
 .../xen/xen-4.1.2/allow_disable_xend.patch         |   75 -
 ...lask-avoid-installing-policy-file-as-boot.patch |   26 -
 recipes-extended/xen/xen-hg.bb                     |   29 -
 .../xen/xen-hg/ioemu-cross-gl-check.patch          |   29 -
 .../xen/xen-hg/tools_qemu_xen_remove_CFLAGS.patch  |   48 -
 recipes-extended/xen/xen-python.inc                |   49 -
 recipes-extended/xen/xen-rt/rt-xen_0.3_4.0.1.patch | 6785 --------------------
 recipes-extended/xen/xen-rt_4.0.1.bb               |   25 -
 recipes-extended/xen/xen.inc                       |  902 ++-
 recipes-extended/xen/xen_4.1.2.bb                  |   24 -
 recipes-extended/xen/xen_4.3.0.bb                  |  650 --
 recipes-extended/xen/xen_4.3.1.bb                  |   24 +
 recipes-extended/xen/xen_git.bb                    |   18 +
 18 files changed, 677 insertions(+), 8500 deletions(-)
 delete mode 100644 recipes-extended/xen/files/allow_disable_xend.patch
 create mode 100644 recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
 delete mode 100644 recipes-extended/xen/files/ioemu-cross-gl-check.patch
 delete mode 100644 recipes-extended/xen/files/xend-config.sxp
 delete mode 100755 recipes-extended/xen/files/xenminiinit.sh
 delete mode 100644 recipes-extended/xen/xen-4.1.2/allow_disable_xend.patch
 delete mode 100644 recipes-extended/xen/xen-4.3.0/flask-avoid-installing-policy-file-as-boot.patch
 delete mode 100644 recipes-extended/xen/xen-hg.bb
 delete mode 100644 recipes-extended/xen/xen-hg/ioemu-cross-gl-check.patch
 delete mode 100644 recipes-extended/xen/xen-hg/tools_qemu_xen_remove_CFLAGS.patch
 delete mode 100644 recipes-extended/xen/xen-python.inc
 delete mode 100644 recipes-extended/xen/xen-rt/rt-xen_0.3_4.0.1.patch
 delete mode 100644 recipes-extended/xen/xen-rt_4.0.1.bb
 delete mode 100644 recipes-extended/xen/xen_4.1.2.bb
 delete mode 100644 recipes-extended/xen/xen_4.3.0.bb
 create mode 100644 recipes-extended/xen/xen_4.3.1.bb
 create mode 100644 recipes-extended/xen/xen_git.bb

-- 
1.8.4.rc3


