Return-Path: <straka.derek@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3B2CE00E94; Thu, 14 Apr 2016 17:52:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5BF36E00AD7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Apr 2016 17:52:04 -0700 (PDT)
Received: by mail-qg0-f44.google.com with SMTP id j35so73505053qge.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Apr 2016 17:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mq6XuB7Zj/B2RoHpfFUT5/52rZS/ROZ2/UkCBJ5F+LU=;
	b=SfdkheRRk5F3kTvx5POJEYooGJgySNyQB5hWVsysnhFV7Mja29mv31gg2NKX+oV3sN
	ii8CF+tyNONvMsAHLWZP3hjRXvXhPgNr5sbcq/3h3oNSmvtzXE78iDY47IZbK5pCgqzX
	TBi/3Xc5UFet7E0CeBepPn5mGDQ7T3eJu+M6RN/pmj/kFn6p3vmprhcFc/wDsvGk0U4S
	5S7mvQKZh0AoyobAkEn9AJgLsWzwoqOebrxoyqzIgLi8Cfj/Ce3rh2MsqGT1Ja1CzBU8
	51q7AJKTcV1JNfy06q8xb7cEKg9d7qPOe1M1bPyk5ajO7aSRIhTuC29fDw5sDX9X09PI
	6cpg==
X-Gm-Message-State: AOPr4FW+ktrDRfjh1S7a9gFfLgG1yIVvIr8LRF5an66gN4M/D/GaWZ4imvSJlsHKCBwOGA==
X-Received: by 10.140.164.71 with SMTP id k68mr22916199qhk.97.1460681523460;
	Thu, 14 Apr 2016 17:52:03 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	a17sm13747061qgf.25.2016.04.14.17.52.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Apr 2016 17:52:02 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: meta-virtualization@yoctoproject.org
Date: Thu, 14 Apr 2016 20:51:25 -0400
Message-Id: <1460681485-15647-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH] irqbalance: update to 1.1.0
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
X-List-Received-Date: Fri, 15 Apr 2016 00:52:07 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../irqbalance/{irqbalance_1.0.9.bb => irqbalance_1.1.0.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-extended/irqbalance/{irqbalance_1.0.9.bb => irqbalance_1.1.0.bb} (52%)

diff --git a/recipes-extended/irqbalance/irqbalance_1.0.9.bb b/recipes-extended/irqbalance/irqbalance_1.1.0.bb
similarity index 52%
rename from recipes-extended/irqbalance/irqbalance_1.0.9.bb
rename to recipes-extended/irqbalance/irqbalance_1.1.0.bb
index fc91aa7..16efa95 100644
--- a/recipes-extended/irqbalance/irqbalance_1.0.9.bb
+++ b/recipes-extended/irqbalance/irqbalance_1.1.0.bb
@@ -4,10 +4,10 @@
 
 require irqbalance.inc
 
-SRC_URI[md5sum] = "30174d3941c5452a1e4ecee394a76ff8"
-SRC_URI[sha256sum] = "f1b8115948bb9f0bc36b9d7143ee8be751a294bc189d311408e753acc37169c3"
+SRC_URI[md5sum] = "b15d975336080bcac4be0c1752d43cf3"
+SRC_URI[sha256sum] = "91506e638b03bf27cf5da7dc250d58a753ce8a0288a20265fc7ff0266040706b"
 
-SRC_URI = "https://github.com/Irqbalance/irqbalance/archive/v1.0.9.tar.gz;downloadfilename=irqbalance-1.0.9.tar.gz \
+SRC_URI = "https://github.com/Irqbalance/irqbalance/archive/v${PV}.tar.gz;downloadfilename=irqbalance-${PV}.tar.gz \
            file://add-initscript.patch \
            file://irqbalance-Add-status-and-reload-commands.patch \
            file://fix-configure-libcap-ng.patch \
-- 
1.9.1


