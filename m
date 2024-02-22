Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C501C54791
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 17:17:09 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.18656.1708622222583297548
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Feb 2024 09:17:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L83aXp+5;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-42c7a7596d0so54987141cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 09:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708622221; x=1709227021; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CxNCl+dHOatYYsQeZxDjtkCZhXtyFDy9AKAT9UeiaLI=;
        b=L83aXp+55psCiZuqMFQVJduzgKgQbQ7S88NQ0Qgg6dlZP8KxkeJT0GwIkQ75RjXlho
         JPWPr4VHu67LRy6RiG/WrRUSe3B9ZnKOAyw03lAACgIN4J5c1u4tQJFA533DoxLWt1ji
         smTKbRdT4gxWDG7/HXTacdWC+BlvWBCYahm+uk8vamxJSo/9/E7v1xhsq1v4XRICs1gG
         DsG60+GGa8T9pE11wIpvMh/FmphZTthCUOP3SnVjukamO6dLZfjc/n8hkn/VA1/z3oGp
         ydjDaZDtZtH42C/usedsVPSh+YDgcVCdQV/cFqVFjZugwuZMdco6cN3BokoNM0Wt5t7T
         ILnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708622221; x=1709227021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxNCl+dHOatYYsQeZxDjtkCZhXtyFDy9AKAT9UeiaLI=;
        b=ej6VmB5dVOecod1Autofp70OJwjiEZMUoDhCcDzFKZ79akmLx8PuZ6qKaKOwCPrHGd
         BYiFML3LPdAQExkOSPx3Ljv6PMJip5FrXeb33IxVxSHvm8uIsEn5TSLJO0FJEhthltFG
         gjKf8+2lXPVnrUu+GjZzhJ3sSE1lGDA/FzR7Mk9/uX5QkzHkIN3TSlbzylH+wV5tYkC4
         KF1TUvOFFmIbaDW37E40hkcT89BooLPG/p8daiRBEgDikEFAE0SSMKbNpCNpitA6KKt5
         tx++mmiO8nRHeZbH2zzFY4wE0WwlhBLuP5+PeKmNoBZAmJtX91LWEoa/VDEstzhtgSSZ
         fBHw==
X-Gm-Message-State: AOJu0YwE3L44FM4trEarJzzTEn0jYHyjLAyEuKmrlcxTg9/FhbsYoWXl
	FhJizPAW2LgaTtK1Eb+jI2NXVrTvGsEtyRunlJhvlngMRZVN17w3
X-Google-Smtp-Source: AGHT+IEvUo4UhBYQ5/TViALA+GrDg4jIECD7PPONNUPt3DRFxn2ftYfA9Lx7dkjJeKlqqd1J+AvAsg==
X-Received: by 2002:a05:622a:489:b0:42d:a88f:1ce6 with SMTP id p9-20020a05622a048900b0042da88f1ce6mr27623556qtx.20.1708622221429;
        Thu, 22 Feb 2024 09:17:01 -0800 (PST)
Received: from gmail.com ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id g6-20020a05620a40c600b00787340f749bsm5531521qko.10.2024.02.22.09.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:17:01 -0800 (PST)
Date: Thu, 22 Feb 2024 17:16:59 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH] upx: bump to 4.2.2
 release - fixes various CVEs
Message-ID: <ZdeBi3ppuAtTb8vr@gmail.com>
References: <20240222123346.1928883-1-fathi.boudra@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222123346.1928883-1-fathi.boudra@linaro.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 17:17:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8576

for anyone following and wondering, I've decided to take this patch to
kirstone, even though it is doing more than just a minor version update.

There are enough CVEs fixed, and few enough users of upx, that the risk
is low.

I've also scanned the changelog, and don't see anything that looks to
be incompatble with existing uses.

Bruce

In message: [meta-virtualization][kirkstone][PATCH] upx: bump to 4.2.2 release - fixes various CVEs
on 22/02/2024 Fathi Boudra wrote:

> Update upx recipe from 3.96 to 4.2.2 release:
>  * Use the gitsm fetcher to get the source code.
>  * Add a note to keep using the git repository.
>  * Update the homepage.
>  * Drop the build dependencies as they're useless. UPX builds using the
>    vendor subdirectory, statically linking the libraries.
> 
> Fixes CVEs:
> * https://www.cve.org/CVERecord?id=CVE-2023-23456 A heap-based buffer overflow
> issue was discovered in UPX in PackTmt::pack() in p_tmt.cpp file. The flow
> allows an attacker to cause a denial of service (abort) via a crafted file.
> * https://www.cve.org/CVERecord?id=CVE-2023-23457 A Segmentation fault was found
> in UPX in PackLinuxElf64::invert_pt_dynamic() in p_lx_elf.cpp. An attacker with
> a crafted input file allows invalid memory address access that could lead to a
> denial of service.
> * https://www.cve.org/CVERecord?id=CVE-2021-46179 Reachable Assertion
> vulnerability in upx before 4.0.0 allows attackers to cause a denial of service
> via crafted file passed to the the readx function.
> * https://www.cve.org/CVERecord?id=CVE-2021-43317 A heap-based buffer overflows
> was discovered in upx, during the generic pointer 'p' points to an inaccessible
> address in func get_le32(). The problem is essentially caused in
> PackLinuxElf64::elf_lookup() at p_lx_elf.cpp:5404
> * https://www.cve.org/CVERecord?id=CVE-2021-43316 A heap-based buffer overflow
> was discovered in upx, during the generic pointer 'p' points to an inaccessible
> address in func get_le64().
> * https://www.cve.org/CVERecord?id=CVE-2021-43315 A heap-based buffer overflows
> was discovered in upx, during the generic pointer 'p' points to an inaccessible
> address in func get_le32(). The problem is essentially caused in
> PackLinuxElf32::elf_lookup() at p_lx_elf.cpp:5349
> * https://www.cve.org/CVERecord?id=CVE-2021-43314 A heap-based buffer overflows
> was discovered in upx, during the generic pointer 'p' points to an inaccessible
> address in func get_le32(). The problem is essentially caused in
> PackLinuxElf32::elf_lookup() at p_lx_elf.cpp:5368
> * https://www.cve.org/CVERecord?id=CVE-2021-43313 A heap-based buffer overflow
> was discovered in upx, during the variable 'bucket' points to an inaccessible
> address. The issue is being triggered in the function
> PackLinuxElf32::invert_pt_dynamic at p_lx_elf.cpp:1688.
> * https://www.cve.org/CVERecord?id=CVE-2021-43312 A heap-based buffer overflow
> was discovered in upx, during the variable 'bucket' points to an inaccessible
> address. The issue is being triggered in the function
> PackLinuxElf64::invert_pt_dynamic at p_lx_elf.cpp:5239.
> * https://www.cve.org/CVERecord?id=CVE-2021-43311 A heap-based buffer overflow
> was discovered in upx, during the generic pointer 'p' points to an inaccessible
> address in func get_le32(). The problem is essentially caused in
> PackLinuxElf32::elf_lookup() at p_lx_elf.cpp:5382.
> * https://www.cve.org/CVERecord?id=CVE-2021-30501 An assertion abort was found
> in upx MemBuffer::alloc() in mem.cpp, in version UPX 4.0.0. The flow allows
> attackers to cause a denial of service (abort) via a crafted file.
> * https://www.cve.org/CVERecord?id=CVE-2021-30500 Null pointer dereference was
> found in upx PackLinuxElf::canUnpack() in p_lx_elf.cpp,in version UPX 4.0.0.
> That allow attackers to execute arbitrary code and cause a denial of service
> via a crafted file.
> * https://www.cve.org/CVERecord?id=CVE-2021-20285 A flaw was found in upx
> canPack in p_lx_elf.cpp in UPX 3.96. This flaw allows attackers to cause a
> denial of service (SEGV or buffer overflow and application crash) or possibly
> have unspecified other impacts via a crafted ELF. The highest threat from this
> vulnerability is to system availability.
> * https://www.cve.org/CVERecord?id=CVE-2020-27802 An floating point exception
> was discovered in the elf_lookup function in p_lx_elf.cpp in UPX 4.0.0 via a
> crafted Mach-O file.
> * https://www.cve.org/CVERecord?id=CVE-2020-27801 A heap-based buffer over-read
> was discovered in the get_le64 function in bele.h in UPX 4.0.0 via a crafted
> Mach-O file.
> * https://www.cve.org/CVERecord?id=CVE-2020-27800 A heap-based buffer over-read
> was discovered in the get_le32 function in bele.h in UPX 4.0.0 via a crafted
> Mach-O file.
> * https://www.cve.org/CVERecord?id=CVE-2020-27799 A heap-based buffer over-read
> was discovered in the acc_ua_get_be32 function in miniacc.h in UPX 4.0.0 via a
> crafted Mach-O file.
> * https://www.cve.org/CVERecord?id=CVE-2020-27798 An invalid memory address
> reference was discovered in the adjABS function in p_lx_elf.cpp in UPX 4.0.0
> via a crafted Mach-O file.
> * https://www.cve.org/CVERecord?id=CVE-2020-27797 An invalid memory address
> reference was discovered in the elf_lookup function in p_lx_elf.cpp in UPX
> 4.0.0 via a crafted Mach-O file.
> * https://www.cve.org/CVERecord?id=CVE-2020-27796 A heap-based buffer over-read
> was discovered in the invert_pt_dynamic function in p_lx_elf.cpp in UPX 4.0.0
> via a crafted Mach-O file.
> 
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  recipes-extended/upx/upx_git.bb | 43 ++++++---------------------------
>  1 file changed, 7 insertions(+), 36 deletions(-)
> 
> diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/upx_git.bb
> index bb8004c6..02e70ffe 100644
> --- a/recipes-extended/upx/upx_git.bb
> +++ b/recipes-extended/upx/upx_git.bb
> @@ -1,45 +1,16 @@
> -HOMEPAGE = "http://upx.sourceforge.net"
>  SUMMARY = "Ultimate executable compressor."
> -
> -SRCREV_upx = "8d1a98e03bf281b2cee459b6c27347e56d13c6a8"
> -SRCREV_vendor_doctest = "666e648b68fda2deb141a1fe93e3fd1e2795dd0f"
> -SRCREV_vendor_lzma_sdk = "9ebf8f468c689d83504e6c08c6bc26c4a1cf180f"
> -SRCREV_vendor_ucl = "4b58d592199dc1e5db691e1a54fb0e5e9af0ecaf"
> -SRCREV_vendor_zlib = "2a5b338eb173a701ed179e951d4c390e75e8d4c7"
> -SRCREV_FORMAT = "upx"
> -SRC_URI = "git://github.com/upx/upx;name=upx;branch=devel;protocol=https \
> -           git://github.com/upx/upx-vendor-doctest;name=vendor_doctest;subdir=git/vendor/doctest;branch=upx-vendor;protocol=https \
> -           git://github.com/upx/upx-vendor-lzma-sdk;name=vendor_lzma_sdk;subdir=git/vendor/lzma-sdk;branch=upx-vendor;protocol=https \
> -           git://github.com/upx/upx-vendor-ucl;name=vendor_ucl;subdir=git/vendor/ucl;branch=upx-vendor;protocol=https \
> -           git://github.com/upx/upx-vendor-zlib;name=vendor_zlib;subdir=git/vendor/zlib;branch=upx-vendor;protocol=https \
> -"
> -
> +HOMEPAGE = "* https://upx.github.io/"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=353753597aa110e0ded3508408c6374a"
> +SRCREV_upx = "099c3d829e80488af7395a4242b318877e980da4"
> +PV = "4.2.2+git${SRCPV}"
>  
> -DEPENDS = "zlib libucl xz cmake-native"
> -
> -# inherit cmake
> +# Note: DO NOT use released tarball in favor of the git repository with submodules.
> +# it makes maintenance easier for CVEs or other issues.
> +SRC_URI = "gitsm://github.com/upx/upx;protocol=https;;name=upx;branch=devel"
>  
>  S = "${WORKDIR}/git"
>  
> -PV = "3.96+${SRCPV}"
> -
> -EXTRA_OEMAKE += " \
> -    UPX_UCLDIR=${STAGING_DIR_TARGET} \
> -    UPX_LZMADIR=${STAGING_DIR_TARGET} \
> -"
> -
> -# FIXME: The build fails if security flags are enabled
> -SECURITY_CFLAGS = ""
> -
> -do_compile() {
> -    oe_runmake -C src all
> -}
> -
> -do_install:append() {
> -    install -d ${D}${bindir}
> -    install -m 755 ${B}/build/release/upx ${D}${bindir}/upx
> -}
> +inherit pkgconfig cmake
>  
>  BBCLASSEXTEND = "native"
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8570): https://lists.yoctoproject.org/g/meta-virtualization/message/8570
> Mute This Topic: https://lists.yoctoproject.org/mt/104507203/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


