Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F805E00AF6; Thu, 29 Oct 2015 19:55:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6460E00AD1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Oct 2015 19:54:59 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9U2swUg019057
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Oct 2015 19:54:58 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 29 Oct 2015 19:54:57 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 29 Oct 2015 22:54:55 -0400
Message-ID: <1446173696-15191-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1446173696-15191-1-git-send-email-mark.asselstine@windriver.com>
References: <1446173696-15191-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-overc][PATCH] local.conf.sample: set DISTRO
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
X-List-Received-Date: Fri, 30 Oct 2015 02:55:02 -0000
Content-Type: text/plain

My builds kept on producing images with sysvinit as the init system
despite being told that systemd was the expected default throughout
meta-overc. After poking around I found that the DISTRO in the
local.conf.sample still had the default DISTRO set to 'poky' so
changing this to be the expected 'pod'.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-pod/conf/local.conf.sample | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-pod/conf/local.conf.sample b/meta-pod/conf/local.conf.sample
index a5f9bfd..dbab304 100644
--- a/meta-pod/conf/local.conf.sample
+++ b/meta-pod/conf/local.conf.sample
@@ -115,7 +115,7 @@ KMACHINE_genericx86-64 ?= "common-pc-64"
 # Ultimately when creating custom policy, people will likely end up subclassing 
 # these defaults.
 #
-DISTRO ?= "poky"
+DISTRO ?= "pod"
 # As an example of a subclass there is a "bleeding" edge policy configuration
 # where many versions are set to the absolute latest code from the upstream 
 # source control systems. This is just mentioned here as an example, its not
-- 
2.1.4


