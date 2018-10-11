Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71163E0090C; Thu, 11 Oct 2018 08:17:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (cjp256[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.222.177 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3998CE00519
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 08:17:13 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id 84-v6so5674646qkf.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 08:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DgTnffu2UMWSoKJwiau3PrpdEKrKeZW9tDwTxKSZKaw=;
	b=S3jrPSEJrVOI0dbY78TNKZtkyvpYnYU2wYGHvkNX+0pajrqZ8d80T7sMhIKTnXduNx
	YqpofsFrRukk8PXtftwNuH3SBTUWxLSw15oK8Yu2domI65/IZj22m0sitT+uGJPB/G0C
	UzogLwB+uNZm1nY4ShWXkAAANjQdZWNprLz7zNu90UbuGSD5lj/KoFEcOSj5qx4Je8m8
	E2BeAbdxngZ2sSDN3dGmPt2RoynEPRpouowmy8KdJzNug9k0rDF6W1T5NCmvpV4Qo0V4
	jqsWZqWzBGrVAjOzGUkjF/sZR2N9lUtqdYEwIdHbzesPv+ROZXo8J0heU4V86HguQnd7
	5LZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DgTnffu2UMWSoKJwiau3PrpdEKrKeZW9tDwTxKSZKaw=;
	b=ggZVPPiuIRHl0GzozOFCmABpSXH+WEb1Mu09fNu4Hsl5KFDB2pNCoG+jW1vB16ZfpQ
	OVC8BtLnucVecBxFBL+BXLV7DjAybOIq3ldVqKlxJqp+wbZxhuGfvltHGC9+v0C0rZqq
	e1rUbrwwnzJlI+pKmtfvHcSCkVc3EgvZSi8GduiJ3aeDhMVY4DjREExCOWdqyOwtQFNn
	5RHGEP0bYpZ+WzvaUPCTW2zc5vwYU1BzN3HxKSn4wGc7v3GkziA2IjtMjVgG/YPVFjFN
	ig7HHCuNk8cp1NfvA5fDR3Ds1DNAO1w5uc5jQPmF8aZTb9tlPJsN6/Nqj4p4mazOp4xY
	lsHw==
X-Gm-Message-State: ABuFfojJm9bTW0TvjKa2zRPQaXl3eMg+OQMghMcFmC5EobfbWxChUwry
	xCHoWZRbTdMgufVjewVBkKDtdqZC
X-Google-Smtp-Source: ACcGV63rWvg9Vv86c7FFU5/99rSRdC901Th7MNydVbL+EXHDRHugIRd+Kh7Tj9Gb+h4em3RJR5VOiQ==
X-Received: by 2002:a37:34c8:: with SMTP id
	b191-v6mr1913403qka.311.1539271032208; 
	Thu, 11 Oct 2018 08:17:12 -0700 (PDT)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	c43-v6sm15289764qte.12.2018.10.11.08.17.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Oct 2018 08:17:11 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 11 Oct 2018 11:17:06 -0400
Message-Id: <1539271026-18249-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [PATCH] ipxe: recipe cleanup and uprev to current
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
X-List-Received-Date: Thu, 11 Oct 2018 15:17:14 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

- Use OE's cross compiler (was building with host's).
- Uprev to latest git (no releases)
- Update LICENSE file path and checksum
- Remove configure sed and set isolinux bin variable used in Makefile
- Scrub LDFLAGS and use LD
- Add xz depends

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 recipes-extended/ipxe/ipxe_git.bb | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
index c0c8a7b..18c92d2 100644
--- a/recipes-extended/ipxe/ipxe_git.bb
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Open source network boot firmware"
 HOMEPAGE = "http://ipxe.org"
 LICENSE = "GPLv2"
-DEPENDS = "binutils-native perl-native syslinux mtools-native cdrtools-native"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+DEPENDS = "binutils-native perl-native syslinux mtools-native cdrtools-native xz"
+LIC_FILES_CHKSUM = "file://../COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "8c43891db4eb131d019360ccfb619f235b17eb58"
+SRCREV = "133f4c47baef6002b2ccb4904a035cda2303c6e5"
 PV = "gitr${SRCPV}"
 PR = "r0"
 
@@ -12,15 +12,10 @@ SRC_URI = "git://git.ipxe.org/ipxe.git;protocol=https"
 
 FILES_${PN} = "/usr/share/firmware/*.rom"
 
-EXTRA_OEMAKE = "NO_WERROR=1"
-#PARALLEL_MAKE=""
+EXTRA_OEMAKE = "NO_WERROR=1 ISOLINUX_BIN="${STAGING_DIR_TARGET}/usr/share/syslinux/isolinux.bin" CROSS_COMPILE="${TARGET_PREFIX}""
 
 S = "${WORKDIR}/git/src"
 
-do_configure() {
-   sed -i s#^ISOLINUX_BIN[\ \\t]*=.*#ISOLINUX_BIN\ =\ ${STAGING_DIR_TARGET}/usr/lib/syslinux/isolinux.bin# arch/i386/Makefile
-}
-
 do_compile() {
    oe_runmake
 }
-- 
2.1.4


