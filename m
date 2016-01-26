Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87396E00C1C; Tue, 26 Jan 2016 11:10:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f194.google.com (mail-yk0-f194.google.com
	[209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 474BCE00C00
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:53 -0800 (PST)
Received: by mail-yk0-f194.google.com with SMTP id y10so15711653ykf.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jBFOMOOVCRKfSaicjV1yg+DNl4KweXVP+ONBmQZJnPk=;
	b=UgsbOAzhSZvCsFt27Gd7Kd6nagXGyH+d58I3cfKdzIyFpPjfzaGShoaW4VfkuihH3Z
	5wE6K/rT2Mo0Bfp0oLekI2XX2/T4Fofc7xadVorgus3qdISFzMHjTGkpYvcYwgLaTpJ5
	JjXZ8yA1utZVqVQ+4gEHs5+XP2r95IOqED72P5wepLXic2Y9p/jz/gUDQ6KRl4cxM+14
	C1En3kSXIt3ZRw8aXkFO3/8mE+DGEyA9qOiRkK5cPtJRJ7TOItDPRkP0n4WPi9eUXQwX
	hXhIm0eiHiXP2pj7dLXjg8SoHAwf+rj5rQdhspxuLxZVOPOevZ1hymEvvgrEbtStYmg+
	Y7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jBFOMOOVCRKfSaicjV1yg+DNl4KweXVP+ONBmQZJnPk=;
	b=DDcDTCPTHDZOuWWV/Jq3QwgkJJq3J4CNNJiYdiRZ2QXCP2U7WTMEABrnNuF0u2cQhU
	/4GyPeKHT9/R8KEFcEahp2nq6kHGv51llAaf7Ni+fRXHGMImUW2784M18Y2mA7zUURIx
	S7DVaNdbYZ6dzjIcPXmkGY0PCoU9VJ+V49uRKLQc2KOa0e1o/W1NJasZD/CvOsNhDHUh
	t3/MB0FSpLn3iDcAEbaMyYfeeH83AYDPbgNDxxA+cLK8Uhf9uFaD3xaT5LeqtGgCiRkt
	IOGSDimSNOHbPwI+0p6y/yZIrz0ahc9BlehYES+2mqOPCoZW8FvQS3r4npRfMFaTBTZf
	zLeg==
X-Gm-Message-State: AG10YOQ9ptHuksWw5n81q34ZAEDPUEFbcItOWwem8Q20dDp9886RQ0/dkFbSV7F61+zSNA==
X-Received: by 10.37.93.86 with SMTP id r83mr13179200ybb.72.1453835392940;
	Tue, 26 Jan 2016 11:09:52 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	h187sm1899502ywc.0.2016.01.26.11.09.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 11:09:52 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 26 Jan 2016 13:09:23 -0600
Message-Id: <1453835364-6473-8-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
In-Reply-To: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
References: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH v2 7/8] xen: don't allow the build system to fetch
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
X-List-Received-Date: Tue, 26 Jan 2016 19:10:05 -0000

All dependencies should be reflected in the Yocto dependency and the Xen
build system should not go off fetching things on its own.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index beb255c..f937b05 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -736,6 +736,11 @@ EXTRA_OEMAKE += "CIRRUSVGA_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios-0.
 EXTRA_OEMAKE += "SEABIOS_ROM=${STAGING_DIR_HOST}/usr/share/firmware/bios.bin"
 EXTRA_OEMAKE += "ETHERBOOT_ROMS=${STAGING_DIR_HOST}/usr/share/firmware/rtl8139.rom"
 
+# prevent the Xen build scripts from fetching things during the build
+# all dependencies should be reflected in the Yocto recipe
+EXTRA_OEMAKE += "WGET=/bin/false"
+EXTRA_OEMAKE += "GIT=/bin/false"
+
 # check for XSM in package config to allow XSM_ENABLE to be set
 python () {
     pkgconfig = d.getVar('PACKAGECONFIG', True)
-- 
2.4.10


