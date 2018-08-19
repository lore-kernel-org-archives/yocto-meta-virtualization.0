Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6FC05E00BC2; Sat, 18 Aug 2018 18:37:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55364E00BDC
	for <meta-virtualization@yoctoproject.org>;
	Sat, 18 Aug 2018 18:37:36 -0700 (PDT)
Received: by mail-it0-f67.google.com with SMTP id v71-v6so16380839itb.3
	for <meta-virtualization@yoctoproject.org>;
	Sat, 18 Aug 2018 18:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BuvXFvIWG/vCIDbjGWS/wEbdt9KFZAOPH4eSnKLeKFI=;
	b=YFwDCXeVxKma/dz6iRtcC6dCeqdufy7wa2ezibE9aHBp4p+KHwtXmRjxATgeTQOmzf
	e+7HyuACEbB9Sb4nLJWMx6/sFFEFX56XWjfodfaLVBsuyH05avqR1I6CPwpF2/1KGWxe
	HrSAhFIHxrgwLlnnpnkXTXMxtgK/aUfP4hYOYCF2iPwAg0vi1DLOrxLBXKEyxN+755v9
	PwJiJUpLVtON++TXi8GI6W4EBTydqglprlSDxhcXxzwYJ/LlOIlJSt1mCFYMlcNThcO+
	HaUHTLL6RXHC4FBnPioLvIx8OOIwjv+AA6pdQNrKI+pfD0NZynpYvg8XA0d9UrSrvcy/
	UU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BuvXFvIWG/vCIDbjGWS/wEbdt9KFZAOPH4eSnKLeKFI=;
	b=mwk6qL7wLYV3421Uk4/TbsnO6QAazeVTeVxhw0gdjvxSlQnpBk/phGFpDdE9tPBTcs
	9oQ/dFT4D15KsmWb36t+VxpWP1A7dt4ZkmhCp6tfE+issRPjpnruNh0HveWGD7tWRqHk
	dwuSEqazhF07zqMvRMspN9ErtUrDUEW+VtyQYrNpMfEls2s5Ds+evbTMfHeRD8RCuhi5
	rtlUc8IIPj8ULEwq/Jgw0Q38+vf2a7Rf/P7CeNT8QNvZdZAAZAvNzFB6scpBqNytuJrI
	myBRwwZgfF1HYcFin5l/dhrfInvn+wXkFzKw+NjwpGGr4h9LeFz8QNqnypg43sJDgOV1
	N/Uw==
X-Gm-Message-State: AOUpUlHOxEzG7HUaG9sfXUiu/yYP9MRfJN+CcRHCr1d8QVK93thNdBBV
	DnQFV4BD/yF52+yAcQpDi45Hf2+1
X-Google-Smtp-Source: AA+uWPzKVmDxd8/PKB6GJpYsQT2efeoNmb4DabWaJgczK3HioOgurEupFBBlDLzPG86OGFNKyQlcAA==
X-Received: by 2002:a24:4118:: with SMTP id
	x24-v6mr31140342ita.71.1534642655335; 
	Sat, 18 Aug 2018 18:37:35 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	i2-v6sm2198418ioh.80.2018.08.18.18.37.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 Aug 2018 18:37:34 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Sat, 18 Aug 2018 18:37:15 -0700
Message-Id: <1534642635-18305-4-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534642635-18305-1-git-send-email-christopher.w.clark@gmail.com>
References: <1534642635-18305-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH 3/3] xen: enable 32-bit ARM builds
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
X-List-Received-Date: Sun, 19 Aug 2018 01:37:37 -0000

Enable recipe for COMPATIBLE_HOST = 'arm-.*-linux-gnueabi'
Tested with a cubietruck, upstream's reference device for this class.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 38cecd1..bf4b3c2 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -5,7 +5,7 @@ SECTION = "console/tools"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbb4b1bdc2c3b6743da3c39d03249095"
 
-COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux'
+COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
 
 inherit autotools-brokensep setuptools update-rc.d systemd deploy
 
@@ -918,6 +918,11 @@ do_post_patch() {
     fi
 }
 
+do_post_patch_append_arm()  {
+    # The hypervisor binary must not be built with the hard floating point ABI.
+    echo "CC := \$(filter-out ${TUNE_CCARGS},\$(CC))" >> ${B}/xen/arch/arm/Rules.mk
+}
+
 addtask post_patch after do_patch before do_configure
 
 do_stubs() {
-- 
2.7.4


