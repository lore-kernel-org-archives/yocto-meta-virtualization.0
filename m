Return-Path: <costamagna.gianfranco@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33F71E0086B; Tue,  8 May 2018 03:28:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (costamagna.gianfranco[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87F46E005A9
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 May 2018 03:28:20 -0700 (PDT)
Received: by mail-wr0-f193.google.com with SMTP id g21-v6so31717449wrb.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 May 2018 03:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HTgQtde3zzmlbJBr8p2cGZWZUYsj+ug8lw0zHGmADeU=;
	b=W9bA7lO5lUevDWJG9eWoUYk93fwj4rAB/7LHjfFVMTobh6o+a6XU0zZqKGC/E2TUs+
	BPLMyaP9SiWBwmUmOH46esi6Xhaw3412qXli05xFpfwVs7SmRciLZOmJVtTkekq1eJvQ
	ClcZh9viXPb2jtLkXlqAYZtcakLwuQMscD261qv1YSOZLyvctkOdegdg+c5dqCcI/pEQ
	0tjN7KgsB4Qngf8MvZJJRbZjp4kjPSILIFi894IVPIl2xQCsbDYthZxCb6HvGdGD77ig
	nTjvyOZ4fpDU4Ayt6D4dXtMV4fUxuAD32JiPImZHeIu0zqTY13xliuzSBLYhq8eYbJ/u
	Swww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HTgQtde3zzmlbJBr8p2cGZWZUYsj+ug8lw0zHGmADeU=;
	b=NL9vH3k2FKnrt2Eo8cXltCTLGW8PPXqTQJOHyL7hYybm+s5FC00FrBHaiLzeH4594t
	dLG+MXamxsoSUaCmELYl0flHz9apR8U3zOMaRL7Z+6z5vObq1SlZv9BOBWz+EpMJaoZy
	L8JfXCdbhcIoy6/3yammOt+7Owu0Ctk8MySgmQ3ZV0DnRJPx1DrjMaImRRgyJoRSRHUL
	7IqCOqg+l/DTSQjolEvWHJim/hrMTc2Fh+QShAWQuxfm4LQNQ24XIWFuYqptONqzn69D
	NPwORg5viBkCcO8GnSwqYXX2WFyLU7u14uYco4osx7CnVrOJfX00chB7hKj0WDZm7qYq
	JZnw==
X-Gm-Message-State: ALQs6tBeFdu955K2zdR9b63Fv6RgcvDoqiQYeWaFb4AiGQgKaedeN4L2
	j9ukDmSHwipFQXzW/db4MbGSxi2U
X-Google-Smtp-Source: AB8JxZquPfqD98JQjHlA7TPy1+La2bYrebBU0s/M86dRdJUSJxATjEmQZuqilKdtSPXLjT7baeE7yw==
X-Received: by 2002:adf:c4c4:: with SMTP id
	o4-v6mr32440573wrf.173.1525775298668; 
	Tue, 08 May 2018 03:28:18 -0700 (PDT)
Received: from localhost.localdomain (mi-18-46-152.service.infuturo.it.
	[151.18.46.152]) by smtp.gmail.com with ESMTPSA id
	b123-v6sm9948663wme.22.2018.05.08.03.28.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 May 2018 03:28:17 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: meta-virtualization@yoctoproject.org
Date: Tue,  8 May 2018 12:28:12 +0200
Message-Id: <20180508102812.25246-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.14.1
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [PATCH] lxc: enable fix apparmor feature name. A typo called it "apparmour", back in commit 7a62620ea09f01c1f2a730cbb1264202276f2b87 Changing the default to the right value
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
X-List-Received-Date: Tue, 08 May 2018 10:28:22 -0000

Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
---
 recipes-containers/lxc/lxc_2.0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
index d8607f8..c87b875 100644
--- a/recipes-containers/lxc/lxc_2.0.8.bb
+++ b/recipes-containers/lxc/lxc_2.0.8.bb
@@ -65,7 +65,7 @@ PACKAGECONFIG ??= "templates \
 "
 PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
 PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
-PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
+PACKAGECONFIG[apparmor] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
 PACKAGECONFIG[templates] = ",,, ${PN}-templates"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
 PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
-- 
2.14.1


