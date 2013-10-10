Return-Path: <cjp256@gmail.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5C5FE0160E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Oct 2013 19:23:26 -0700 (PDT)
Received: by mail-qa0-f49.google.com with SMTP id f11so113870qae.8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 09 Oct 2013 19:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2LWhVpChSqo4DTkt19yheaF6Wg0+JSdbdWk5q+D2DLI=;
	b=KO0Xc5ZtoX6Glc68nmiP/amvSiBNSF5+rWvvFnmix7CX+S1nrdCfM6BrFhigY5vHY+
	GlFjHJ8ybgrwnTfxAoWiPAySPC006M8mCfDKiB3VziwbDjEDe3CBE7NED6Lw6nJPQ4jX
	Olugm5suQ9fVUz6ei/kaCDJQ3DySOnWPAg0OdAnEClAD+KFX8gwOADl8ahcjCYCItuoJ
	dsF7E076RubGEKlwNV4j/MIDKi1FpF1avJUaDgGqxXFpqMNgFPGjijFp879EOl7NyDNP
	qdwVQej62a+lBAQhAaxMp2gQWl6ZB3romBmyhsqtVuTiROC424x+cu/0RojQspDZJbYq
	NxZA==
X-Received: by 10.229.116.197 with SMTP id n5mr4230291qcq.22.1381371805983;
	Wed, 09 Oct 2013 19:23:25 -0700 (PDT)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id h6sm82159945qej.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 19:23:25 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Wed,  9 Oct 2013 22:22:50 -0400
Message-Id: <1381371771-12021-3-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381371771-12021-1-git-send-email-cjp256@gmail.com>
References: <1381371771-12021-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH v2 2/3] xen-image-minimal: update image installed modules to reflect xen fragment changes.
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
X-List-Received-Date: Thu, 10 Oct 2013 02:23:27 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/images/xen-image-minimal.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index c582f57..00146f7 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -7,16 +7,10 @@ IMAGE_INSTALL += " \
     packagegroup-core-ssh-openssh \
     kernel-module-xen-acpi-processor \
     kernel-module-xen-blkback \
-    kernel-module-xen-blkfront \
-    kernel-module-xen-evtchn \
-    kernel-module-xenfs \
     kernel-module-xen-gntalloc \
     kernel-module-xen-gntdev \
     kernel-module-xen-netback \
-    kernel-module-xen-netfront \
     kernel-module-xen-pciback \
-    kernel-module-xen-pcifront \
-    kernel-module-xen-privcmd \
     kernel-module-xen-wdt \
     xen-base \
     xen-qemu \
-- 
1.8.4.rc3


