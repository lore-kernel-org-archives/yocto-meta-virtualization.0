Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C70EBE00BA2; Wed,  9 Aug 2017 18:06:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.194 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8996E00B77
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Aug 2017 18:06:18 -0700 (PDT)
Received: by mail-yw0-f194.google.com with SMTP id u207so5284699ywc.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 09 Aug 2017 18:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=pCjD2VZut1PdiZGiBeTq+enX3HshZLyGfD8D1kG9648=;
	b=OzzaiNnCEgO8D7vazktgkiPTXwlKxCL6tSPTCtU8tVEGG/xnhGn4mwqWIal+n/fWW4
	+y8B99I1XNQQJrf6JdEHUXFqK9SVNxR5Rn/8HGXzAR8vrqMX5kUwhAr4e+Ffb2ZzEahs
	7tgRnjHHYi3W9A+a0UkLOHqlQqawGVp9I4zqL1CqgUj/kwLtZKiVzwbWzHx9U30U4NJU
	oRDzBw+lcSPLBdwA16kEICFN56l0jSOyxUtByjq8lybzBnwVS31gdZfgmFPyvZz2tGq0
	lsCe1QVBnt7bfSjm9tJyRXLRU3BdUHAqgBh/uzPd+ofO05YvGLqxWXQ2GxNFT3xpFBJZ
	Kbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=pCjD2VZut1PdiZGiBeTq+enX3HshZLyGfD8D1kG9648=;
	b=S2w3GK0veMHQ6aaen1eGESkY5OgoUmpW0xLqMKa0Ziaqxa1P7CSKbaqvjCqFBGPw/g
	I8LPtWTFi3ynRgvRgZz5n+zJEr7u6SeZjBpscFSCR2FEFQ96rscglzL5/Puj/ogmpH+C
	yznmJ96RYsaOJ2zQRZnKDwi/DV0Y0RSv+pkl+r7xuc8Txih09BAHjbDyJf2u3wdsN/fQ
	r/Zter7YCgI+7Q/PYhxBjPNPpGP0r+YeN3EoNFZO1UN5rsuSCoIewEW9bc2cMB4WQeFh
	+XnGnecsCQE14HjakLkxjE7L+VRpTqA831H2JLvriINxKzz+G/8+MnYHlB1+Q1G+/q8M
	2hCA==
X-Gm-Message-State: AHYfb5io9O0RtfuIa/ujwGfZGe/jC7vPAX/MkmWAnOfHpSjfHG487ZSR
	7xIYq3Vn5aPUlnsmbkR3RAjw4IYjFOWlJaU=
X-Received: by 10.13.248.2 with SMTP id i2mr7981285ywf.110.1502327178222; Wed,
	09 Aug 2017 18:06:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.172.25 with HTTP; Wed, 9 Aug 2017 18:06:17 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 9 Aug 2017 18:06:17 -0700
Message-ID: <CACMJ4GaS4wgNiCdvPMWfSqCJoj5hWj1nm441WmfMDp7huFhtLQ@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org
Subject: [PATCH] xen: remove STAGING_DIR_HOST from runtime path for bios.bin
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
X-List-Received-Date: Thu, 10 Aug 2017 01:06:22 -0000
Content-Type: text/plain; charset="UTF-8"

Bug fix: this configuration option sets a run-time search path rather
than the location of a build-time dependency.

Tested with Xen 4.9 on OpenXT.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 677ab69..274d0df 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -22,7 +22,7 @@ FLASK_POLICY_FILE ?= "xenpolicy-${PV}"
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] =
"--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
-PACKAGECONFIG[hvm] =
"--with-system-seabios="${STAGING_DIR_HOST}/usr/share/firmware/bios.bin",--disable-seabios,seabios
ipxe vgabios,"
+PACKAGECONFIG[hvm] =
"--with-system-seabios="/usr/share/firmware/bios.bin",--disable-seabios,seabios
ipxe vgabios,"

 DEPENDS = " \
     bison-native \
-- 
2.7.4

