Return-Path: <jkrishnanjanappa@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2DADE00EE3; Wed,  7 Mar 2018 09:02:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_WEB autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.5 RCVD_IN_SORBS_WEB RBL: SORBS: sender is an abusable
	web server *      [111.93.218.67 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74B51E00A61
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Mar 2018 09:02:54 -0800 (PST)
Received: by mail-pg0-f66.google.com with SMTP id l4so1096445pgp.11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 07 Mar 2018 09:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=vEpGcay/zNon6EV4+PLw9RHC42DO1NIKj5vuPPXp+18=;
	b=vK2CjSUqKmrnxfKakrlAOyBbdw3+BuGpb9kmlXVSvTQQ/cxvrLRY8jNDg2Dp5c0dMO
	tqSfVq5xM2HQj31ssVNBF5hQ/vrqfmOMaWdPIL5ihwfOBpd8LeVquaQWPbr+amZFn3D6
	TBDT6MjdQsppmicUtSNBWiucKe6iR9e684SyP0DwQOCXQiCiIfA4J2YTlbthrWeiXGRH
	yCM9VChacBWa/f6WwUrfTenwG3p1oQMKu27EYMOptFlEYvuNKDzW3LujomR+a8q5421e
	Sb8nemI2bUIzf09PZk6rfx29iHNZUWlcsv8k3/SjbwICEkbNxjtVb9VWmL5k3sdODONa
	5ZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vEpGcay/zNon6EV4+PLw9RHC42DO1NIKj5vuPPXp+18=;
	b=FL+f+feZGroB4X/SSjVqkVfwW1s9IqATBCX4uLjkH9MCQziM37WqwLCw+YOy1yw2h+
	GFbjKJK6kC3UyQ321YmzZPDTHN4K/EbqXB40dwHW7Ms273cwEWtycRBV8NhAvIuF8yA6
	kk13qUuILRz6xB07JS54uKcGHn2DTpWIU/R5RCO+er7HVezOaf00v89NX1mF1z0dq5oh
	YJUEM/EatYmo8K7cY06KyVvZ2A/CklKaLkOpRAiMXri0NMHwIfZIla/W7serRJHPKbHU
	+u4X7kGTX9INngx/bKhg/cdoPZKAGu0WisS7u6u3IlgZ1qwNNVNoMbUJ4tSF7PD3GGLz
	DA/A==
X-Gm-Message-State: APf1xPADejvqm2J0MdJ8eGVZzl2k8a9Ddr8qtJlgXjgXwHhNQKDQK/Ei
	kMCQujsmmJNxKcOzWPiE9IW0kSPy
X-Google-Smtp-Source: AG47ELtsuYDjXLh/tJUBGSbGWM3bINyd/8j9MYjIpdGcFRjZGTwWEXcwoF34cnPRXc9jnqcck6HKAg==
X-Received: by 10.98.80.15 with SMTP id e15mr22828850pfb.90.1520442173654;
	Wed, 07 Mar 2018 09:02:53 -0800 (PST)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	x4sm31675139pfb.46.2018.03.07.09.02.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 09:02:52 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Wed,  7 Mar 2018 22:32:42 +0530
Message-Id: <20180307170243.8155-1-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.11.1
Subject: [master][rocko][PATCH 1/2] vgabios: replace PN with BPN, to solve fetch failure while building for multilib
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
X-List-Received-Date: Wed, 07 Mar 2018 17:02:55 -0000

The multilib vgabios (for example lib32-vgabios) fetch fails with
below error:
-- snip --
Location: http://nongnu.askapache.com/vgabios/lib32-vgabios-0.7a.tgz [following]
--2018-03-07 16:45:22-- http://nongnu.askapache.com/vgabios/lib32-vgabios-0.7a.tgz
Resolving nongnu.askapache.com... 192.185.42.228
Connecting to nongnu.askapache.com|192.185.42.228|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-03-07 16:45:22 ERROR 404: Not Found.
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 recipes-extended/vgabios/vgabios_0.7a.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/vgabios/vgabios_0.7a.bb b/recipes-extended/vgabios/vgabios_0.7a.bb
index 8c89041..3394173 100644
--- a/recipes-extended/vgabios/vgabios_0.7a.bb
+++ b/recipes-extended/vgabios/vgabios_0.7a.bb
@@ -7,7 +7,7 @@ DEPENDS = "dev86-native biossums-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
 
-SRC_URI =  "http://savannah.gnu.org/download/vgabios/${PN}-${PV}.tgz"
+SRC_URI =  "http://savannah.gnu.org/download/vgabios/${BPN}-${PV}.tgz"
 
 SRC_URI[md5sum] = "2c0fe5c0ca08082a9293e3a7b23dc900"
 SRC_URI[sha256sum] = "9d24c33d4bfb7831e2069cf3644936a53ef3de21d467872b54ce2ea30881b865"
-- 
2.11.1


