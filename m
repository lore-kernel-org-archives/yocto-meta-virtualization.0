Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD16CE017BF
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Nov 2013 19:10:00 -0800 (PST)
Received: by mail-ie0-f174.google.com with SMTP id qd12so16555144ieb.33
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Nov 2013 19:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=t8nDdsliLUvd2PHY+pCe603tJrQepcrVx3nabMkfQYc=;
	b=PaKbaD2f3P4QqfmRxvujyeTh7SCaUwqYN3OTt0ujyXgZVRzDrwQENE2DElw8HwvKCQ
	hKQxJdvOCmCyhJQyuEfXzJI31Q7PUmvUWgKx6j1ODNq83Cnj/L0H1TqvWTBnMhxF6Qpg
	2PSPRb09rxifxkBA6uJ82P80rWU0uYwdOS1Q03V8ypgXAQBdkGd4FhqJvsPsf0s/y2PH
	WDLcsswg3Wrn4gIemRislGzomCQasMcJeTW5bllI0WaxShgUNYXI9ppId8TbX4sh7BCc
	C97d+t+92+q22c+sRw4SBCbrD+bZC2SfcQ7xm+zdTq7Wk8wZyam5rlAyfkgJBKYMuo5P
	DQUg==
X-Received: by 10.50.8.102 with SMTP id q6mr585763iga.57.1383707399585;
	Tue, 05 Nov 2013 19:09:59 -0800 (PST)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id v2sm5533825igz.3.2013.11.05.19.09.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Nov 2013 19:09:58 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  5 Nov 2013 22:08:59 -0500
Message-Id: <1383707342-3827-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [PATCH 1/4] xen: remove xsm from default PACKAGECONFIG options.
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
X-List-Received-Date: Wed, 06 Nov 2013 03:10:06 -0000

The 'xsm' option adds a dependency for checkpolicy, which
requires an additional layer (meta-selinux).

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/xen_4.3.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.0.bb
index 1fad48d..f1067bc 100644
--- a/recipes-extended/xen/xen_4.3.0.bb
+++ b/recipes-extended/xen/xen_4.3.0.bb
@@ -22,7 +22,6 @@ inherit autotools gettext setuptools update-rc.d
 
 PACKAGECONFIG ??= " \
     sdl \
-    xsm \
 "
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
-- 
1.8.4.rc3


