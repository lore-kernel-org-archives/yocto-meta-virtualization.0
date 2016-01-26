Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5BB5EE00973; Tue, 26 Jan 2016 11:09:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.195 listed in list.dnswl.org]
Received: from mail-yk0-f195.google.com (mail-yk0-f195.google.com
	[209.85.160.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7061E00973
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:48 -0800 (PST)
Received: by mail-yk0-f195.google.com with SMTP id y10so15711488ykf.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=565WdlK84E8RL31D1XCAO00aBgox7YwnDQnggZ53YVE=;
	b=xCyAqOO4bLqUnTrDcKF2rt9qgt/yta+OjvOv5dEa4q0d1xwp6OIbhNXyl/051E9u0O
	k5mqlYEb6BSAzx9Azl9VC3cfmb/TKa8poiVdQFx1FecsjcD8LZoypdOZmvXRtxzrFm+B
	lX8XzvoW3q8hhP+T5PUodNG65leShO9cD+6BbRPF69xkSmxQ9QUOrIRn3/j4HEbyx+fy
	Kr1viavGV0Dqze0e5Iqb8LUnWZ/J46et0VaTOt9SOLrt3bAWWX5DWryTMERu/hvgf6FR
	Scxk4QFLrX/ccLKt8VyetYMPsnF+N0ELV5petWE058in8ytHELHhIOGF4KOsUvziQ/Ca
	8WoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=565WdlK84E8RL31D1XCAO00aBgox7YwnDQnggZ53YVE=;
	b=kqVGiTu2B7BtOfTtlB4L/sQ1ZysvzgDeGWY4M4y9iUm1sWA5wp884T5vQhBuOUAea9
	n/S4maPN8HZwkfqZp6NKnbnJWdFFWhs4lxtpFBTBwCoixo3DPHjBx1ANs6pUd3wHqp+y
	EU8hBMl1ymP5f9bYpdoQopnFQwxd6Y6nsNNAkv7ySx6r1TX+a/OkwX3dzlI+X5bOkdxV
	JJyYEGqNdFjOfxf16ZnIsX9Y4RLh0NXOoOgUqv/GfVJlk8EI7QxeqEH33fkgGYaG039c
	xjFvioiwvWWNbBFw+bfya255e2flBvNwUxcASgjWibePU6R9QaYj3sy9MaH3cVONBvJo
	Z/Lg==
X-Gm-Message-State: AG10YOSvjFrHrr58hWVI/1ksm6nOeaFYIb+oebGPvngK24JSe6FcrGYlLWo6Q7GSPGQQ/g==
X-Received: by 10.37.44.129 with SMTP id s123mr12764374ybs.55.1453835388184;
	Tue, 26 Jan 2016 11:09:48 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	h187sm1899502ywc.0.2016.01.26.11.09.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 11:09:47 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 26 Jan 2016 13:09:19 -0600
Message-Id: <1453835364-6473-4-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
In-Reply-To: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
References: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH v2 3/8] xen: fix up typo in XSM comments
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
X-List-Received-Date: Tue, 26 Jan 2016 19:09:51 -0000

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 966d356..789fd34 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -722,7 +722,7 @@ EXTRA_OECONF += " \
     --disable-ocamltools \
     "
 
-# check for XSM in package config to allow XSM_ENABLE to be set 
+# check for XSM in package config to allow XSM_ENABLE to be set
 python () {
     pkgconfig = d.getVar('PACKAGECONFIG', True)
     if ('xsm') in pkgconfig.split():
@@ -743,7 +743,7 @@ do_configure() {
         fi
     fi
 
-    #./configure --enable-xsm does not set XSM_ENABLE must be done manually
+    #./configure --enable-xsmpolicy does not set XSM_ENABLE must be done manually
     if [ "${XSM_ENABLED}" = "1" ]; then
         echo "XSM_ENABLE := y" > ${S}/.config
     fi
-- 
2.4.10


