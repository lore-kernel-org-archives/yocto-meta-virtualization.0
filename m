Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B762C48BEB
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 12:33:57 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.11657.1708605233538148715
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Feb 2024 04:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cX0DSGBg;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: fathi.boudra@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-512d5744290so1683446e87.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 04:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708605231; x=1709210031; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AaApOaIDbKSuPEoDI/3fhLEukzqERbFb9wa7XdIF9m8=;
        b=cX0DSGBgnrrGx5mvuBkrvc5LVOvMpVW9WXE0yACrvFCmswSjD7/9ZVnPigVZEfAw7Z
         XsbZ4gobsE1r2YwLjXuQDKK6LaOQtuPpMG+ZSueT2ZjTxtqBNB0XdZhSJgZuF5KlNsJS
         Q2zXFz6/fFbP2Y0nsVz7rMATchHLAXeRWfYwLPAq2FukRUxqGFikAIvqxryMbDvniIz2
         /BBMDI79/5+o133K/Xea8MBiG6qQPPCAXHJkU5j223JmOk+l7z5k2w6WrVEIa6Zl7tgi
         uNJMzKhcXHtmNSSzzhVTWZMWtYHTR19Cl4IVHEwlPrNg50as/OCNboqW3TWhGBxZNfnx
         j5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708605231; x=1709210031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaApOaIDbKSuPEoDI/3fhLEukzqERbFb9wa7XdIF9m8=;
        b=wRpffSHX/ny/KL9GVVr7ahXSFww7jKD/Nz6MgqMfaq6vMrWqHkmpLu58zDCe9LTCzk
         AhgpXqAaK7pK24k7ajximtslfaAlMC/+clm7osKeQ/HCyG9ntFlYEiONWkVBVxZ/TJyF
         hVGdQc9wMeXIQHxwmpCppCRI3VEUotep6fOMj3LhnTIXh9dubAAswEFJXs2/oD1xy9T3
         OqVNURCHGzxj0HsM8zveFaBxhCsCv9G07BTb/6f5SC3r+5RpARJM4gFMvJEORuNnJ1Es
         qy5lc3hoVh750zUFpYkCrftUlr0fZLf7Xp767MmYQI/uR1m14hkR+IWcEUxNGlzMiJAT
         rLLA==
X-Gm-Message-State: AOJu0Yzhu3cxciWKW57XEplUS5IMxkb8Pnuvx+XEHE6xN+AmVwqUt2d2
	os7Y7G5f1hp+2t6Akya/r1eFfVPA6rLGnRcAITVX7fkMmWWh1Cmxn28YBPN9kUoBh3A0VSnra91
	1fL4=
X-Google-Smtp-Source: AGHT+IEpShdGfITqn0BL0Q3l+EZ8gStvOc3LVH3voUT8NxbpRAO0tMBKSTngo1sd1UJEfAAcbTI70w==
X-Received: by 2002:a05:6512:1287:b0:512:c4b4:bfc9 with SMTP id u7-20020a056512128700b00512c4b4bfc9mr7716658lfs.8.1708605230872;
        Thu, 22 Feb 2024 04:33:50 -0800 (PST)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id l12-20020a05600c4f0c00b004122b7a680dsm21671983wmq.21.2024.02.22.04.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 04:33:50 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-virtualization][kirkstone][PATCH] upx: bump to 4.2.2 release - fixes various CVEs
Date: Thu, 22 Feb 2024 13:33:46 +0100
Message-ID: <20240222123346.1928883-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 12:33:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8570

Update upx recipe from 3.96 to 4.2.2 release:
 * Use the gitsm fetcher to get the source code.
 * Add a note to keep using the git repository.
 * Update the homepage.
 * Drop the build dependencies as they're useless. UPX builds using the
   vendor subdirectory, statically linking the libraries.

Fixes CVEs:
* https://www.cve.org/CVERecord?id=CVE-2023-23456 A heap-based buffer overflow
issue was discovered in UPX in PackTmt::pack() in p_tmt.cpp file. The flow
allows an attacker to cause a denial of service (abort) via a crafted file.
* https://www.cve.org/CVERecord?id=CVE-2023-23457 A Segmentation fault was found
in UPX in PackLinuxElf64::invert_pt_dynamic() in p_lx_elf.cpp. An attacker with
a crafted input file allows invalid memory address access that could lead to a
denial of service.
* https://www.cve.org/CVERecord?id=CVE-2021-46179 Reachable Assertion
vulnerability in upx before 4.0.0 allows attackers to cause a denial of service
via crafted file passed to the the readx function.
* https://www.cve.org/CVERecord?id=CVE-2021-43317 A heap-based buffer overflows
was discovered in upx, during the generic pointer 'p' points to an inaccessible
address in func get_le32(). The problem is essentially caused in
PackLinuxElf64::elf_lookup() at p_lx_elf.cpp:5404
* https://www.cve.org/CVERecord?id=CVE-2021-43316 A heap-based buffer overflow
was discovered in upx, during the generic pointer 'p' points to an inaccessible
address in func get_le64().
* https://www.cve.org/CVERecord?id=CVE-2021-43315 A heap-based buffer overflows
was discovered in upx, during the generic pointer 'p' points to an inaccessible
address in func get_le32(). The problem is essentially caused in
PackLinuxElf32::elf_lookup() at p_lx_elf.cpp:5349
* https://www.cve.org/CVERecord?id=CVE-2021-43314 A heap-based buffer overflows
was discovered in upx, during the generic pointer 'p' points to an inaccessible
address in func get_le32(). The problem is essentially caused in
PackLinuxElf32::elf_lookup() at p_lx_elf.cpp:5368
* https://www.cve.org/CVERecord?id=CVE-2021-43313 A heap-based buffer overflow
was discovered in upx, during the variable 'bucket' points to an inaccessible
address. The issue is being triggered in the function
PackLinuxElf32::invert_pt_dynamic at p_lx_elf.cpp:1688.
* https://www.cve.org/CVERecord?id=CVE-2021-43312 A heap-based buffer overflow
was discovered in upx, during the variable 'bucket' points to an inaccessible
address. The issue is being triggered in the function
PackLinuxElf64::invert_pt_dynamic at p_lx_elf.cpp:5239.
* https://www.cve.org/CVERecord?id=CVE-2021-43311 A heap-based buffer overflow
was discovered in upx, during the generic pointer 'p' points to an inaccessible
address in func get_le32(). The problem is essentially caused in
PackLinuxElf32::elf_lookup() at p_lx_elf.cpp:5382.
* https://www.cve.org/CVERecord?id=CVE-2021-30501 An assertion abort was found
in upx MemBuffer::alloc() in mem.cpp, in version UPX 4.0.0. The flow allows
attackers to cause a denial of service (abort) via a crafted file.
* https://www.cve.org/CVERecord?id=CVE-2021-30500 Null pointer dereference was
found in upx PackLinuxElf::canUnpack() in p_lx_elf.cpp,in version UPX 4.0.0.
That allow attackers to execute arbitrary code and cause a denial of service
via a crafted file.
* https://www.cve.org/CVERecord?id=CVE-2021-20285 A flaw was found in upx
canPack in p_lx_elf.cpp in UPX 3.96. This flaw allows attackers to cause a
denial of service (SEGV or buffer overflow and application crash) or possibly
have unspecified other impacts via a crafted ELF. The highest threat from this
vulnerability is to system availability.
* https://www.cve.org/CVERecord?id=CVE-2020-27802 An floating point exception
was discovered in the elf_lookup function in p_lx_elf.cpp in UPX 4.0.0 via a
crafted Mach-O file.
* https://www.cve.org/CVERecord?id=CVE-2020-27801 A heap-based buffer over-read
was discovered in the get_le64 function in bele.h in UPX 4.0.0 via a crafted
Mach-O file.
* https://www.cve.org/CVERecord?id=CVE-2020-27800 A heap-based buffer over-read
was discovered in the get_le32 function in bele.h in UPX 4.0.0 via a crafted
Mach-O file.
* https://www.cve.org/CVERecord?id=CVE-2020-27799 A heap-based buffer over-read
was discovered in the acc_ua_get_be32 function in miniacc.h in UPX 4.0.0 via a
crafted Mach-O file.
* https://www.cve.org/CVERecord?id=CVE-2020-27798 An invalid memory address
reference was discovered in the adjABS function in p_lx_elf.cpp in UPX 4.0.0
via a crafted Mach-O file.
* https://www.cve.org/CVERecord?id=CVE-2020-27797 An invalid memory address
reference was discovered in the elf_lookup function in p_lx_elf.cpp in UPX
4.0.0 via a crafted Mach-O file.
* https://www.cve.org/CVERecord?id=CVE-2020-27796 A heap-based buffer over-read
was discovered in the invert_pt_dynamic function in p_lx_elf.cpp in UPX 4.0.0
via a crafted Mach-O file.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-extended/upx/upx_git.bb | 43 ++++++---------------------------
 1 file changed, 7 insertions(+), 36 deletions(-)

diff --git a/recipes-extended/upx/upx_git.bb b/recipes-extended/upx/upx_git.bb
index bb8004c6..02e70ffe 100644
--- a/recipes-extended/upx/upx_git.bb
+++ b/recipes-extended/upx/upx_git.bb
@@ -1,45 +1,16 @@
-HOMEPAGE = "http://upx.sourceforge.net"
 SUMMARY = "Ultimate executable compressor."
-
-SRCREV_upx = "8d1a98e03bf281b2cee459b6c27347e56d13c6a8"
-SRCREV_vendor_doctest = "666e648b68fda2deb141a1fe93e3fd1e2795dd0f"
-SRCREV_vendor_lzma_sdk = "9ebf8f468c689d83504e6c08c6bc26c4a1cf180f"
-SRCREV_vendor_ucl = "4b58d592199dc1e5db691e1a54fb0e5e9af0ecaf"
-SRCREV_vendor_zlib = "2a5b338eb173a701ed179e951d4c390e75e8d4c7"
-SRCREV_FORMAT = "upx"
-SRC_URI = "git://github.com/upx/upx;name=upx;branch=devel;protocol=https \
-           git://github.com/upx/upx-vendor-doctest;name=vendor_doctest;subdir=git/vendor/doctest;branch=upx-vendor;protocol=https \
-           git://github.com/upx/upx-vendor-lzma-sdk;name=vendor_lzma_sdk;subdir=git/vendor/lzma-sdk;branch=upx-vendor;protocol=https \
-           git://github.com/upx/upx-vendor-ucl;name=vendor_ucl;subdir=git/vendor/ucl;branch=upx-vendor;protocol=https \
-           git://github.com/upx/upx-vendor-zlib;name=vendor_zlib;subdir=git/vendor/zlib;branch=upx-vendor;protocol=https \
-"
-
+HOMEPAGE = "* https://upx.github.io/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=353753597aa110e0ded3508408c6374a"
+SRCREV_upx = "099c3d829e80488af7395a4242b318877e980da4"
+PV = "4.2.2+git${SRCPV}"
 
-DEPENDS = "zlib libucl xz cmake-native"
-
-# inherit cmake
+# Note: DO NOT use released tarball in favor of the git repository with submodules.
+# it makes maintenance easier for CVEs or other issues.
+SRC_URI = "gitsm://github.com/upx/upx;protocol=https;;name=upx;branch=devel"
 
 S = "${WORKDIR}/git"
 
-PV = "3.96+${SRCPV}"
-
-EXTRA_OEMAKE += " \
-    UPX_UCLDIR=${STAGING_DIR_TARGET} \
-    UPX_LZMADIR=${STAGING_DIR_TARGET} \
-"
-
-# FIXME: The build fails if security flags are enabled
-SECURITY_CFLAGS = ""
-
-do_compile() {
-    oe_runmake -C src all
-}
-
-do_install:append() {
-    install -d ${D}${bindir}
-    install -m 755 ${B}/build/release/upx ${D}${bindir}/upx
-}
+inherit pkgconfig cmake
 
 BBCLASSEXTEND = "native"
-- 
2.43.0


