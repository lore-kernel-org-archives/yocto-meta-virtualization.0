Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7176.1615288925926734290
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 03:22:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bertrand.marquis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B33F1042;
	Tue,  9 Mar 2021 03:22:03 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4A8A3F70D;
	Tue,  9 Mar 2021 03:22:02 -0800 (PST)
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	nd@arm.com
Subject: [PATCH] seabios: upgrade to version 1.14.0
Date: Tue,  9 Mar 2021 11:21:53 +0000
Message-Id: <798105b0371a04f3cbfec14966a336b68fcad5e6.1615287248.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

Upgrade version of seabios to the latest one.
This is solving compilation errors happening with newer version of gcc
introduced in poky which in the following error after some warnings:
"x86_64-poky-linux-ld: cannot use executable file 'out/rom16.strip.o' as
input to a link"

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
This change has only be tested to compile properly by building an x86_64
image for qemu x86_64 with Xen activated.
I could not check that the generated binaries by seabios are properly
working.
---
 .../seabios/{seabios_1.13.0.bb => seabios_1.14.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-extended/seabios/{seabios_1.13.0.bb => seabios_1.14.0.bb} (87%)

diff --git a/recipes-extended/seabios/seabios_1.13.0.bb b/recipes-extended/seabios/seabios_1.14.0.bb
similarity index 87%
rename from recipes-extended/seabios/seabios_1.13.0.bb
rename to recipes-extended/seabios/seabios_1.14.0.bb
index 4cf4420..1591cb6 100644
--- a/recipes-extended/seabios/seabios_1.13.0.bb
+++ b/recipes-extended/seabios/seabios_1.14.0.bb
@@ -16,8 +16,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504
                     file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6  \
                     "
 
-SRC_URI[md5sum] = "1dc1725bac1d230bfd6b3204eed4f2f7"
-SRC_URI[sha256sum] = "37673dc2d6308591b15bdb94e5bcc3e99bdb40198d2247733c43f50b55dbe703"
+SRC_URI[md5sum] = "9df3b7de6376850d09161137e7a9b61f"
+SRC_URI[sha256sum] = "eb70cc62b29aa83e10a653233acebf4bb154d00d0c87dc2a2c6e2da75e5e81fd"
 
 FILES_${PN} = "/usr/share/firmware"
 
-- 
2.17.1

