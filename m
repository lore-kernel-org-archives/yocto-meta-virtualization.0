Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 144B0E00C82; Thu, 23 Jun 2016 15:17:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA5CAE00C75
	for <meta-virtualization@yoctoproject.org>;
	Thu, 23 Jun 2016 15:17:16 -0700 (PDT)
Received: by mail-qk0-f195.google.com with SMTP id b136so18180423qkg.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 23 Jun 2016 15:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mCcVGvmEHBPIaWw/273FyAdeV2GKLE2Q0GitVVrCDG4=;
	b=RtE2087+XxjtuiI/NkrXgJb+mmitwqLH1Fmu/3R4NditY2Yi6LxhH7LnB/MszgON2s
	RdTDzayEG/W7OnL2H7IxFd14W9kQiB7Hbxxdal5JnVlR1TnhDaxA4JywduPgR7IhmCRd
	OA2lEyWppdUpMAuh/tDgqg6++J5aIfnO6eW4eFd6qmT0wh1U3sHPwIni4QG0FPcI057k
	1BD9FyW9WiKoK+PkHGcJQfmmHjB79SrnG88WX+yo/JSJAbL8hW7061zl/CH/YrlzpdXo
	9id9VFEkqX84Syd6ci/nipXGl2qtCuEyHZDu9UG0R4CPl5Sb9kY/XWv/y3QSXBgcjKaM
	NJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mCcVGvmEHBPIaWw/273FyAdeV2GKLE2Q0GitVVrCDG4=;
	b=RykZtPLTJEU29hv2v5ml42DzQYwMaMvohFqISbW4Ovy13hfxh7QOiX4W4bsQK8PE2F
	l+YiVs4Q1nc8g+GO0jDnPEiXp9AtNeNAP7HP4tYvYrdBoPp8jqJ1axfN88vb38v0LxyN
	l7/sH28kP8SL4KTZQP0JCX9cIagGOiZYyMNsLI7j3J1Xr5ZL4rwd9fKP+sOnZZqAMRaR
	XSHArHUSCMBzyCG9OC8XoSFXCNcwipVI9iXJgKyhWmS53x1cIrAQPwRKiLNzQ3RCeRMo
	sAb6g9pY4+JhN3Z7298SrY0n3PMbMAuu3oaNlib+Q8r9chzSPnRoCAX0oWaMppv9LXfE
	P3rw==
X-Gm-Message-State: ALyK8tLOOtsREDp0fOQK29jKlPliiBOBCH//NYh/IOywtkAEcjLM2lAyYCZP49AR24fi0w==
X-Received: by 10.55.77.4 with SMTP id a4mr952517qkb.198.1466720235326;
	Thu, 23 Jun 2016 15:17:15 -0700 (PDT)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	t27sm882141qtc.30.2016.06.23.15.17.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jun 2016 15:17:14 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 23 Jun 2016 18:17:01 -0400
Message-Id: <1466720221-32248-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [PATCH] base-files: remove bbappend hacking on fstab
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
X-List-Received-Date: Thu, 23 Jun 2016 22:17:20 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

This approach breaks images which have Xen in DISTRO_FEATURES,
but are not booting under Xen (and mounting /proc/xen fails).

xencommons, xendriverdomain, or proc-xen.mount should take care of
mounting /proc/xen.

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 recipes-core/base-files/base-files_3.%.bbappend | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 recipes-core/base-files/base-files_3.%.bbappend

diff --git a/recipes-core/base-files/base-files_3.%.bbappend b/recipes-core/base-files/base-files_3.%.bbappend
deleted file mode 100644
index eb973ad..0000000
--- a/recipes-core/base-files/base-files_3.%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-do_install_append() {
-	if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
-		echo "xenfs                /proc/xen            xenfs      defaults              0  0" >> ${D}${sysconfdir}/fstab
-	fi
-}
-- 
2.1.4


