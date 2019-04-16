Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28807E00D3A; Tue, 16 Apr 2019 15:23:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.67 listed in list.dnswl.org]
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7DC1E00CDD
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Apr 2019 15:23:38 -0700 (PDT)
Received: by mail-io1-f67.google.com with SMTP id x3so18956465iol.10
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Apr 2019 15:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1vOeCTLoQrwffJGTbzQsy3y05TwHIcnbKDnitRjTAac=;
	b=QpFc1dHBe6Qqw/AloMaDr+8h6yl/n8vRSZzgJUwGj/M7CDErSfASKs8JQCmuexaY2G
	wvL7kV4uGMUo9K+9vQaVN1/Y38maXLIn3wjlpA9j+BRwC7DpMKCUqak+Zw0j/tNcV4Yn
	9M53jTHJIZrFvAu92QK2wwh7jikbK5k+2RAGuZ99mUYewN+lCoistdnf2KOJzekgUDvA
	85QgveRWpI653G9ThL2+jYASvIbmJ6vV9ZVRLghrA3CA6ZkuN0Y56CLmWz1tMEPrTP7Y
	5jdNVuXfUU5amj1xvYQ69+JVlgI0d7kaj2Rp+EbmdjKDKl60XYL06IoacP4r3diq7Mz8
	nyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1vOeCTLoQrwffJGTbzQsy3y05TwHIcnbKDnitRjTAac=;
	b=rCmL8Y1USQvuFz30vPJzANzrCUVl6GUXySq+O9Ns0o6xIQQFRaxkDIwO1uzEN5Z28k
	hsqfN84AuxaCg+2thwdZDaj0dsOksFcgBD90Ub7JnkHFBIcvYaEyeNtuc/dyDKsNHAL2
	Ad/biMiCo0blEF+23C8N9Gc7LWdWhPeH6NByDSBhJuJr25dgZL2JMuOonMHZcStr2tLV
	h0gCw3tLxiF/S3sHNCSBgES/QT/I1UNNnD3QnoG9i+FwBagoyc5VYAMzC2XfuQQ2fmKH
	kwzuKEvzPBB42xI2YvEAIl+NkHRMwWIex8yz/yGk2cdFt8pjIE/+Lm7U/s4x1qSnF4j5
	Sjng==
X-Gm-Message-State: APjAAAWfFyphYIK+kMR3c8ykuTicjwNn4dc3gZRGCAdPDD2coHn6YoYZ
	RBZpwfnJDRs5n8cNc3cHYkUtFwKw
X-Google-Smtp-Source: APXvYqwZExH0ACiG1XOydPDrkDljS5uohzVFYqA1EHjwoS6UWQCsnpNICJhyTpTM9Uc+RmxxiKxw+g==
X-Received: by 2002:a6b:b285:: with SMTP id
	b127mr50504475iof.179.1555453417587; 
	Tue, 16 Apr 2019 15:23:37 -0700 (PDT)
Received: from desktop.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id v64sm391153ita.4.2019.04.16.15.23.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 15:23:36 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Tue, 16 Apr 2019 15:23:30 -0700
Message-Id: <20190416222330.3480-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] xen: make the dev86-native dependency specific to x86-64 target
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
X-List-Received-Date: Tue, 16 Apr 2019 22:23:39 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Remove the requirement for x86 tools when building for ARM platforms.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index b357824..52780d6 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -25,8 +25,8 @@ PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
 PACKAGECONFIG[hvm] = "--with-system-seabios="/usr/share/firmware/bios.bin",--disable-seabios,seabios ipxe vgabios,"
 
 DEPENDS = " \
+    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'dev86-native', '', d)} \
     bison-native \
-    dev86-native \
     flex-native \
     file-native \
     gettext-native \
-- 
2.17.1


