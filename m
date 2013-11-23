Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0560BE0071C
	for <meta-virtualization@yoctoproject.org>;
	Sat, 23 Nov 2013 12:18:25 -0800 (PST)
Received: by mail-ie0-f174.google.com with SMTP id at1so4365432iec.5
	for <meta-virtualization@yoctoproject.org>;
	Sat, 23 Nov 2013 12:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=c0DTfjGnkAmlOPByAShSqTdGHSPU0mvlYwLjuOvt5F8=;
	b=tud27p5Xh9IscTr54Pbrir7gGSniRWBywvUnSclBEw5b+p/QVKXroVBv1SHF4qRlqF
	R92zecpbZocRWQVQE3BFuGjJwPIpLS66EJyjMT1GejVnqqrLgmyijYJVzHE1iI7PC0Id
	Ac4Pdd0Y6VE4A1JhZ2wfQ492lR3bLZSztADPYEQQVNry65+bsAwFixOTFjLN//W1oiC8
	hyP54ehG9Ug66W/rDcypdD6PBKhxlRxOh9z4Sx6NJKSBotpsBqPaLF9PEWcdyT7VI8fD
	MOrBQn83q6VhJX59L3X1opZOvnoNH3e5DEUNjg04HTVEzB4zItD9T/McMRDC0v5IMPaH
	ZN6A==
X-Received: by 10.50.118.41 with SMTP id kj9mr7382759igb.9.1385237905028;
	Sat, 23 Nov 2013 12:18:25 -0800 (PST)
Received: from localhost.localdomain (cpe-74-79-15-11.twcny.res.rr.com.
	[74.79.15.11])
	by mx.google.com with ESMTPSA id u1sm16168358ige.1.2013.11.23.12.18.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Nov 2013 12:18:23 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Sat, 23 Nov 2013 15:17:28 -0500
Message-Id: <1385237848-30558-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [PATCH] xen-image-minimal: fix syslinux dependency
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
X-List-Received-Date: Sat, 23 Nov 2013 20:18:26 -0000

Install libcom32.c32 when populating syslinux-based images.

When syslinux upgraded to v6, libcom32.c32 became a dependency
for mboot.c32.

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/images/xen-image-minimal.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index 00146f7..13917c5 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -21,10 +21,12 @@ LICENSE = "MIT"
 inherit core-image
 
 syslinux_iso_populate_append() {
+	install -m 0444 ${STAGING_DATADIR}/syslinux/libcom32.c32 ${ISODIR}${ISOLINUXDIR}
 	install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32 ${ISODIR}${ISOLINUXDIR}
 }
 
 syslinux_hddimg_populate_append() {
+	install -m 0444 ${STAGING_DATADIR}/syslinux/libcom32.c32 ${HDDDIR}${SYSLINUXDIR}
 	install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32 ${HDDDIR}${SYSLINUXDIR}
 }
 
-- 
1.8.4.rc3


