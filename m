Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 053FFE00AB9; Tue, 19 Jan 2016 05:35:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.180 listed in list.dnswl.org]
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8F6FE0090A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Jan 2016 05:35:29 -0800 (PST)
Received: by mail-qk0-f180.google.com with SMTP id b66so29236246qkf.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Jan 2016 05:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TilTKTjSXDnuV5zfO20o/xeUk60w3BZsgWH7Eoh64As=;
	b=OTd/wvEr/V811oKVrhmdreueiTwm60Apnv8iN6ewgIuZXjKwXWz+dFmjeycP7wlWjc
	a/YWqH/JXIXVlOeZ6tjLfC6186xQ2c/NCmqL7fMukyJyxMTYq3ETM4V5ckouMtLkXlJw
	PpYrWaxJZiqClYZCnxaj/xfUUa8yWlxT30YKO0/6uSzMyhm8IkOw5CX+Kzlb267SVPdu
	DXtSWR1ucPMu7OWjXupmSRwHD3VX6Kmo+vWa0/PPRlfb5meyn21V9C0LOJyXozU1tdvj
	Ygpa0G0LejkArze8pd/NQRUpe0fb7x2CWUzgEYQxHuiWRRnUOm2h8w8eYfAxJaphrbgL
	ip0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TilTKTjSXDnuV5zfO20o/xeUk60w3BZsgWH7Eoh64As=;
	b=Q+W9s37vK/MPpVb1L5I3hvcK+KnLlLt8XbP4ZSbqyn2sGOql7mcPvMkK9DaeM8+ZCW
	+6uDrcjcAz5JjOYqAM2sQk49aYmO1Lk7RGY/LHxshw8aCljGAqGzJB4YDF7ztsqrjgRc
	pAD5G+qu66lfy3Nm43psvo6zXiHqKDo+WuZbteXvdhqdHNOD2OW/rWJg4PjDvfAt/4Ma
	DYTBG7odLwbK6pJr0avuy7tfvhWWshqjD/o3L5YLxxMIpX06H/lvJbh0nV1K1vR2maOO
	PsLZXgZbpGkJvyaXokTCuulriImXYn10AwjBzluxIjZnB4tyd4FlxdF15LOkp/kX4BvQ
	G9hQ==
X-Gm-Message-State: ALoCoQkT7afhDoBzEhYCcKe3hXQZy3qVcgppFSTcRHDDzKvp2NmE1bCV2VaSK1Ah+U51bFJmaE+9bA0lS03o3tGOIUk4L5spZA==
X-Received: by 10.55.31.228 with SMTP id n97mr37605970qkh.72.1453210528895;
	Tue, 19 Jan 2016 05:35:28 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	a104sm12152737qge.43.2016.01.19.05.35.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jan 2016 05:35:28 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 19 Jan 2016 08:35:24 -0500
Message-Id: <1453210524-20663-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] xen: add xen-devd to packages list.
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
X-List-Received-Date: Tue, 19 Jan 2016 13:35:31 -0000

Package was configured, but never added to PACKAGES.

Reported-by: Machon Gregory <mbgrego@tycho.nsa.gov>
Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/xen.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index ac9796b..c63cb2c 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -149,6 +149,7 @@ PACKAGES = "\
     ${PN}-console \
     ${PN}-dbg \
     ${PN}-dev \
+    ${PN}-devd \
     ${PN}-doc \
     ${PN}-flask \
     ${PN}-fsimage \
-- 
1.7.10.4


