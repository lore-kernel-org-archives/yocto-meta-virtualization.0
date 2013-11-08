Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29178E0182F
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Nov 2013 20:02:12 -0800 (PST)
Received: by mail-ie0-f174.google.com with SMTP id qd12so2436336ieb.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Nov 2013 20:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ulCfDysl/xcDFugIk/Ce30W+MNjNRLM+t2FIpgr/alY=;
	b=nTMffTrRUlzYYrx/Ej8FoS6BurWrrI90A3HNt4ys2una90sFp32X2eK0Vj82QV67gd
	k8OJmJEa7hk26/ILsJUz+MM0LzAW+rBZGMRQFM4zJKvc4Ch9/NXzO7diY3TcUNzNLYz8
	tHcdD1SL+wQTuB8Cs98oZuqZaeXDgfF9wjwu6Pk+EEfhn7E5pMGdprxoqusF0PMzpk6+
	X5asQeJB+r4opTTX8er/0HvoUovsyYfeVjVUYoCPECpYbZSd+IgC0tzD4wIyCDOhSh0D
	gcnugcyXG32hW1SoA91zh0fOkYezYy25Nfu2HsCqd92Qn4f0OcSF3ZxHeaQzB3ORVxPO
	gISg==
X-Received: by 10.50.39.51 with SMTP id m19mr570428igk.51.1383883332097;
	Thu, 07 Nov 2013 20:02:12 -0800 (PST)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id hv5sm1230089igb.9.2013.11.07.20.02.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 20:02:11 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  7 Nov 2013 23:00:58 -0500
Message-Id: <1383883267-31992-2-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
References: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH v2 01/10] xen: remove xsm from default PACKAGECONFIG options.
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
X-List-Received-Date: Fri, 08 Nov 2013 04:02:13 -0000

The 'xsm' option adds a dependency for checkpolicy, which
requires an additional layer (meta-selinux).

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/xen_4.3.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.0.bb
index 283da28..afea06c 100644
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


