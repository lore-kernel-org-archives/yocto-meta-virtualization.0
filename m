Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 427DBE00BEC; Mon, 25 Jan 2016 07:29:40 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD456E00AAB
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 07:29:37 -0800 (PST)
Received: by mail-yk0-f195.google.com with SMTP id v14so12299630ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 07:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=icr1eXfhaqX7ONkJFS+/qMSpHjUKcQuQVmInCgWrji8=;
	b=CjD263VNgI/uz5SLNtUqxm6J3Lu+RT1GV8NiOZUcGPm+QboN3e/v0tVRjjjO33dg7Q
	70G0r87L7ohmsTseb4JiytJ+Yfbaj0buAKhHh5OVtRWVNLfu3rMwDgwfvnuMh9AodPLV
	FT6rhDaHmBX6OfYHfGVrRM1SkWy8wJhF7TUyWB5ZCgYIACFjjgFDhsSFoY6KteqF8eL1
	F/ym74U5qVuubVhA6jDarI+C3+vafmFlbazuDRTPKdOzqviur15U7Wbay6d+akMqZUpG
	XIjYdJ75avXG9uUbn5PQP6VkskTCvpza6QkYtcfqgVXMXk5XSWplrgH76+bAAqMyhzz2
	wDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=icr1eXfhaqX7ONkJFS+/qMSpHjUKcQuQVmInCgWrji8=;
	b=Crn0/Mj8xDul5/ox/GL5tTFuiThDjKnvUO2ELt7fHDhRigfhmISPo/F0jj0wHVPynb
	zbKiBlLtUDsRwA8h4t9foyMaImfsO0Y5Fhraf3utHVVJymdRRc3NbD9r9ar61JNGNUlc
	NFkJR6rQUZDVgBZ0TgBscAgQ6C89b3DYBSNMj2SIIN/+/3LOk3h8AnXUtbwIbDWWtxn3
	rIQ8EjdqJN9G6td663rgcbGqq5RPsWI73B5Wy8Sk6OPApiVR8q5pY3sv0YnTGlNJnW0s
	OmA941sHTTGjo8D/MmnNPEiLPqob2AJhw+loNX303gwiU05MHPcrNEFdTpXgy3GHFbbK
	gQ/Q==
X-Gm-Message-State: AG10YOR1LyE6FmbQzudaql/ZvuFpGuEzEf8NXBX8unIWjVwkfRLD7NU4BSk/svilRZU7/A==
X-Received: by 10.37.230.203 with SMTP id d194mr9485484ybh.136.1453735777177; 
	Mon, 25 Jan 2016 07:29:37 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	193sm14422579ywe.22.2016.01.25.07.29.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 07:29:36 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 25 Jan 2016 09:29:10 -0600
Message-Id: <1453735752-966-3-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
In-Reply-To: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
References: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
Subject: [PATCH 3/5] xen: fix up typo in XSM comments
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
X-List-Received-Date: Mon, 25 Jan 2016 15:29:40 -0000

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index c0acbcd..2df7525 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -720,7 +720,7 @@ EXTRA_OECONF += " \
     --disable-ocamltools \
     "
 
-# check for XSM in package config to allow XSM_ENABLE to be set 
+# check for XSM in package config to allow XSM_ENABLE to be set
 python () {
     pkgconfig = d.getVar('PACKAGECONFIG', True)
     if ('xsm') in pkgconfig.split():
@@ -741,7 +741,7 @@ do_configure() {
         fi
     fi
 
-    #./configure --enable-xsm does not set XSM_ENABLE must be done manually
+    #./configure --enable-xsmpolicy does not set XSM_ENABLE must be done manually
     if [ "${XSM_ENABLED}" = "1" ]; then
         echo "XSM_ENABLE := y" > ${S}/.config
     fi
-- 
2.4.10


