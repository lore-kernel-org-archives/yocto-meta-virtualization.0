Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E2C7E007EA; Mon, 11 Jan 2016 11:37:51 -0800 (PST)
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
	*      [209.85.220.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 090A3E0070F
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Jan 2016 11:37:47 -0800 (PST)
Received: by mail-qk0-f178.google.com with SMTP id r67so32914752qke.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Jan 2016 11:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aNT/DRmAZVrQdm+uQ6+ANtE0tbduvPVX/4tcevQGMmU=;
	b=sb37tdokexO37+13VTrhjc4uWYvSvO0E/tQqQF5TJa1wG6kP8XwG5qE8L87HXW4ssz
	EbiGBzOifE0lmWwAsqu3AQob+hMdw0B2+IuA3vppVD9huelPbzL1CSn7wuBR9duZNAu2
	x3ofJwokqJh0Qqf6jVNB7YIN3xhW7/yPVNnl7a3xbfjoZmnQiyGYdRc8vwbWTjtEH0FF
	zntKP86CqHroEh1rAx1f1aATmx6l/Q/3poqkVYgNPSIcXbqjRMGHKSQheDPEHmuL/+HK
	7ebACXj2VEKHwHsl980bjIpHWugtrvR+lCYsAUNJsbfEbLdwfudaCCVu9sIT0TV/9jBn
	/TYw==
X-Received: by 10.55.15.139 with SMTP id 11mr19265890qkp.50.1452541066387;
	Mon, 11 Jan 2016 11:37:46 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	a69sm31462201qgf.21.2016.01.11.11.37.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jan 2016 11:37:45 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 11 Jan 2016 14:37:41 -0500
Message-Id: <1452541061-26516-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] xen.cfg: enable CONFIG_HYPERVISOR_GUEST by default
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
X-List-Received-Date: Mon, 11 Jan 2016 19:37:51 -0000

Required dependency for CONFIG_XEN.

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-kernel/linux/linux-yocto/xen.cfg |    1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg b/recipes-kernel/linux/linux-yocto/xen.cfg
index 096bea0..4780311 100644
--- a/recipes-kernel/linux/linux-yocto/xen.cfg
+++ b/recipes-kernel/linux/linux-yocto/xen.cfg
@@ -1,3 +1,4 @@
+CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
 CONFIG_XEN=y
 CONFIG_XEN_DOM0=y
-- 
1.7.10.4


