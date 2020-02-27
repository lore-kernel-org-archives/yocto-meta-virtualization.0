Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1304.1582840901017752531
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2020 14:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NXNfDqII;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD2DAE0170D; Thu, 27 Feb 2020 14:01:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.210.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7DBAE008D9
	for <meta-virtualization@yoctoproject.org>; Thu, 27 Feb 2020 14:01:39 -0800 (PST)
Received: by mail-pf1-f193.google.com with SMTP id i13so552496pfe.3
        for <meta-virtualization@yoctoproject.org>; Thu, 27 Feb 2020 14:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Mw8FtHmNJLd8mwu20/GvpC+7BpisUAP4WZkzZjt17yQ=;
        b=NXNfDqIIk9NAMzz0x8HYR9eozRApFODGwBQ0Je4DlQTDidSlofvG139azCo/hMeA6K
         akgDHFRlStGL+sPEH+kBgo8715Lmpsqw+plNTJALyjIMiGK1n+xMjlaJilLshD80yZuP
         fcIDz2+XoDEvmCY2NbxoHSgXS6AY1a9XViP69bmPc5kAf8xnXAn9v+O9f+NRO5gMKpAE
         zBC++3GmSr/uee/eu9qrxFvDghnA9qMEN+l9x8qV0FfgFY5E2uO7BPsRK8eQky1yuUTb
         GwNlwCNniSYa13ZGYhmjhQb5JbwyfLvdJ+0gKeKed5GsQi7vzO9m+DJzIsh7wixiVubG
         BsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Mw8FtHmNJLd8mwu20/GvpC+7BpisUAP4WZkzZjt17yQ=;
        b=qMD/pn/M/wwifMjnGiIzDJxjEMBBACjyTo4vROJGj8aKBLy5BJDSTs5kTaU4wfHtJQ
         rWoFqwY0k8LQvs3bVkj6+uVL6KNnFGf+9CuR9COC0DbHDSex1xOWU18zzkJSS9zbVQI+
         E2M6YBOS6dIFZfQk6swRh4TUH9rhhw+NhtUvPFRIUmEJCEOwGTKTzVFvAD/nTtMFoPG0
         vZ6mlusKwVxfq9ea+3gvllD+qMIemVk0T31lNXe1ZiY1dJSox5AtS6MgIaH/9pTxOgK5
         cwEqL/MCCRQQIQpMcqI9BF7LNYrkzbbrks6aSCABZT1scC2oJRC+AF1flTrTFgEuWhp3
         6yyQ==
X-Gm-Message-State: APjAAAVPwHHGtR1c/dPpnTNeLP9lO5yD4ZyHAylBFdq/K3QfSk/cXa7/
	cCiJvLSC4kB60pfJzZo9EgAFdXdg
X-Google-Smtp-Source: APXvYqyCtvnXzCHLUuzajebXnndF/u7s1Zu0dYuyMqD6lMQ+hb/3UW8DVwppOfrmjEBo6hy+6RZkkQ==
X-Received: by 2002:a62:7c13:: with SMTP id x19mr1085994pfc.65.1582840898667;
        Thu, 27 Feb 2020 14:01:38 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id l37sm7244592pjb.15.2020.02.27.14.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 14:01:37 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH] xen-image-minimal: enable runqemu for x86-64
Date: Thu, 27 Feb 2020 14:01:24 -0800
Message-Id: <20200227220124.13167-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Christopher Clark <christopher.w.clark@gmail.com>

Booting this Xen image with QEMU works when launching from the
wic-generated pcbios disk image with the directdisk-xen.wks kickstart
file, so add the variable settings to make doing it simple -- eg:

    runqemu xen-image-minimal nographic slirp

Tested with MACHINEs: qemux86-64 and genericx86-64

Memory allocated to qemu is increased slightly over the default to allow
for running Xen and the Linux dom0 and guest VMs.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---

This patch requires the recently-submitted Xen patch series to be applied first.
( https://lists.yoctoproject.org/g/meta-virtualization/message/5133 )


 recipes-extended/images/xen-image-minimal.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index dcdc864..c965f22 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -72,3 +72,16 @@ build_syslinux_cfg () {
 	echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} --- /vmlinuz ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUX_CFG}
 }
 
+# Enable runqemu. eg: runqemu xen-image-minimal nographic slirp
+WKS_FILE_x86-64 = "directdisk-xen.wks"
+QB_MEM = "-m 400"
+QB_DEFAULT_KERNEL = ""
+QB_DEFAULT_FSTYPE = "wic"
+QB_FSINFO = "wic:kernel-in-fs"
+# qemux86-64 machine does not include 'wic' in IMAGE_FSTYPES, which is needed
+# to boot this image, so add it here:
+IMAGE_FSTYPES_qemux86-64 += "wic"
+# Networking: the qemuboot.bbclass default virtio network device works ok
+# and so does the emulated e1000 -- choose according to the network device
+# drivers that are present in your dom0 Linux kernel. To switch to e1000:
+# QB_NETWORK_DEVICE = "-device e1000,netdev=net0,mac=@MAC@"
-- 
2.17.1

