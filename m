Return-Path: <akuster@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F2D1E00A44; Thu, 29 May 2014 18:47:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.47 listed in list.dnswl.org]
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D5BEE006EC
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 May 2014 18:47:04 -0700 (PDT)
Received: by mail-pb0-f47.google.com with SMTP id rp16so1139984pbb.6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 May 2014 18:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vbTEagPmiXUOF2Tc3BK7Wv10NMZC/B9Z+RhCa23NOFY=;
	b=gmVLEV0mu3uM0a4Qa/N+yU3CiR9eNHwLlAh6oaT2D0MxQ4wNsavycqWT4J2gdw4Tko
	X/D+TAwe+HCEcx+HxpufsiBr53m74RXsXSyZaYaOXo/IthRyt02nJDsVmaZpCGLFcef8
	DN3wXa4vmTpfprLRW+s+/ZSTcyCcoVF3kFVPzoVZ6BDRw+Ip0w6Tw7Rklov2mEsSz9iJ
	1/ISTF7i3TOGyC6Qgaa2VU1MXDIyNsP6/IGbuUaGOM6dMWu7PxY6zXKC4lcg5zy21VK7
	9/Ia7Z8cxaY9kgws+lo3oM9wIqcqCO+HEpJGx/UmI7ZXCiLdtJ5V7wRFs1jlwcQO7hUY
	JXmw==
X-Gm-Message-State: ALoCoQkFoBqeZ+bXOsWkeN15MHmQt7N/CohcebCtgmA82c/m9RSeNvzW8rPzO2tqTtD94B0yp+hp
X-Received: by 10.66.122.208 with SMTP id lu16mr13470024pab.129.1401414424141; 
	Thu, 29 May 2014 18:47:04 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id nf5sm3374657pbc.77.2014.05.29.18.47.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 May 2014 18:47:03 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: meta-virtualization@yoctoproject.org
Message-Id: <1401414421-25902-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:40 -0800
Cc: akuster808@gmail.com
Subject: [PATCH] python-barbican fix fetch error.
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
Date: Fri, 30 May 2014 01:47:10 -0000
X-Original-Date: Thu, 29 May 2014 18:47:01 -0700
X-List-Received-Date: Fri, 30 May 2014 01:47:10 -0000

It appears the that git repo has moved. This is causing a do_fetch error.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-openstack/recipes-devtools/python/python-barbican_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-barbican_git.bb b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
index bc12fcd..8ae0b21 100644
--- a/meta-openstack/recipes-devtools/python/python-barbican_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
@@ -4,10 +4,10 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc8be9e7dffe97390d1216b01fd0be01"
 
-PR = "r0"
+PR = "r1"
 SRCNAME = "barbican"
 
-SRC_URI = "git://github.com/stackforge/barbican.git;branch=master \
+SRC_URI = "git://github.com/cloudkeep/barbican.git;branch=master \
            file://barbican.init \
           "
 
-- 
1.9.1


