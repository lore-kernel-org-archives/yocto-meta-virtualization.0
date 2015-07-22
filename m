Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D4F9E00A38; Wed, 22 Jul 2015 13:12:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0B5BE009EB
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Jul 2015 13:12:05 -0700 (PDT)
Received: by ykdu72 with SMTP id u72so202380349ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Jul 2015 13:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ybDCHr3rCWO2MsFhH1R72mMtsXuhPV6l50kNC5RsHM4=;
	b=U6Y8IJ5fRnCjhAlvfMd5h56A4gVeOXDlU8gwFkZwtdwkpXlM/IQ1KtzHCZmknFqxyZ
	HYQ02fluC1++Mhp8pbA16uxGKugJNllHNbx4KTl8YVPLm56mftt5Xe6WkcfuJp4nbzN4
	9NcDqWoDDeeJzwhyA7RRGbRiefSgAvVtyobe9F7LGBKDkLFE2nLRt092U7dl7DWUdYjA
	B62hlybqYC6szPGVx2vgleiCS8U8S/e5/KiEOkjcaEh+sk5XEIROxb+4E4I8mMmTJ2nB
	Duum71yWUN3ZAVlGa+WGN46dMtmCZO+MSNUmLLCAio43Ur1H4PSL8F3IXO8zqVGOg7r5
	AerA==
MIME-Version: 1.0
X-Received: by 10.170.84.215 with SMTP id b206mr4361357yka.21.1437595925073;
	Wed, 22 Jul 2015 13:12:05 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 22 Jul 2015 13:12:05 -0700 (PDT)
In-Reply-To: <1437490805-8733-1-git-send-email-adrian.ratiu@ni.com>
References: <1437490805-8733-1-git-send-email-adrian.ratiu@ni.com>
Date: Wed, 22 Jul 2015 16:12:05 -0400
Message-ID: <CADkTA4Mx6_GDQ6treXwV0jGdmFZwjz_it1FVLU7ycG-rQZ3SHA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] meta-openstack: gptfdisk: Remove recipe
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
X-List-Received-Date: Wed, 22 Jul 2015 20:12:09 -0000
Content-Type: text/plain; charset=UTF-8

merged:

   8fd56666ece0..d483af7aaffb  dizzy-juno -> dizzy-juno
   a05f2e523002..2cb09aa8f2f6  fido-kilo -> fido-kilo
   0b3232f74aa4..cb835dd47a75  master -> master

On Tue, Jul 21, 2015 at 11:00 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> A gptfdisk recipe has been added to openembedded-core by commit 8c219e
> making this one unecessary.
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  .../gptfdsik/files/fix-host-contamination.patch    | 18 -------------
>  .../recipes-extended/gptfdsik/gptfdisk_0.8.10.bb   | 31 ----------------------
>  2 files changed, 49 deletions(-)
>  delete mode 100644 meta-openstack/recipes-extended/gptfdsik/files/fix-host-contamination.patch
>  delete mode 100644 meta-openstack/recipes-extended/gptfdsik/gptfdisk_0.8.10.bb
>
> diff --git a/meta-openstack/recipes-extended/gptfdsik/files/fix-host-contamination.patch b/meta-openstack/recipes-extended/gptfdsik/files/fix-host-contamination.patch
> deleted file mode 100644
> index 8939cc1..0000000
> --- a/meta-openstack/recipes-extended/gptfdsik/files/fix-host-contamination.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -fix host contamination
> -
> -Make sure that the Makefile uses gcc cross
> -compiler from build system, but not use
> -the host gcc
> -
> -Signed-off-by: Vu Tran <vu.tran@windriver.com>
> -
> -diff --git a/Makefile b/Makefile
> -index 1ae018e..4c23b45 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -1,5 +1,3 @@
> --CC=gcc
> --CXX=g++
> - CFLAGS+=-D_FILE_OFFSET_BITS=64
> - #CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64 -D USE_UTF16
> - CXXFLAGS+=-Wall -D_FILE_OFFSET_BITS=64
> diff --git a/meta-openstack/recipes-extended/gptfdsik/gptfdisk_0.8.10.bb b/meta-openstack/recipes-extended/gptfdsik/gptfdisk_0.8.10.bb
> deleted file mode 100644
> index 67e3c14..0000000
> --- a/meta-openstack/recipes-extended/gptfdsik/gptfdisk_0.8.10.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -SUMMARY = "Disk partitioning tool for GUID Partition Table"
> -DESCRIPTION = "\
> -  GPT fdisk is a disk partitioning tool loosely modeled on \
> -  Linux fdisk, but used for modifying GUID Partition Table (GPT) disks. \
> -  The related FixParts utility fixes some common problems on Master Boot \
> -  Record (MBR) disks."
> -SECTION = "console/utils"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> -
> -PR = "r0"
> -
> -SRC_URI = "http://sourceforge.net/projects/${PN}/files/${PN}/${PV}/${PN}-${PV}.tar.gz \
> -           file://fix-host-contamination.patch \
> -"
> -
> -SRC_URI[md5sum] = "9cf4246c181c324bdbd553fe9b348373"
> -SRC_URI[sha256sum] = "73e64151203ae0c347c488358e71ca582bb7fb7f0d66df86b71c42050390eb9b"
> -
> -do_install () {
> -    install -d ${D}${sbindir}
> -    install -m 755 ${S}/gdisk ${D}${sbindir}/
> -    install -m 755 ${S}/cgdisk ${D}${sbindir}/
> -    install -m 755 ${S}/sgdisk ${D}${sbindir}/
> -    install -m 755 ${S}/fixparts ${D}${sbindir}/
> -}
> -
> -FILES_${PN} += "${sbindir}/* \
> -"
> -
> -DEPENDS += "util-linux"
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

