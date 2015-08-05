Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1AD86E009B8; Wed,  5 Aug 2015 08:40:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.174 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E434DE009A7
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 08:40:03 -0700 (PDT)
Received: by ykeo23 with SMTP id o23so38433342yke.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 05 Aug 2015 08:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o9M60XUbuOBL7ftiOuohEI8KBZlnb4Kv50v9Yf8Nf5U=;
	b=Y1ekZAVnlIfcYFakJGG1WgZXC+rwKellNvb1wpOYmSQNjb0YU7aB/19BBcyxJsIkAx
	sVRsJ2yt4ipe/ZYTskbRjNwIQrTH4MIrBqw32vmfJJ2laTm6S1ZGE9AdyomaQMHUNNQF
	1AQBmhuLRNlDD19fcuowD9pqAaKhVDCa3pyZyF2jzcAoE8ReBAD/OMQtRMCJpMp6hmQc
	HvjUsrswePphku7lzqJp/GAqwdRou3vBE/3IFyw/LyCWxOEVkOPcl6Q1eB0kMy95o7pS
	Kh3WuYZeA98q1BaubPSYnb5DBVeYnBE0ndwhls1kZqX4yvIPvKh7pKjlJdUg6Cih4zQu
	t+AA==
X-Gm-Message-State: ALoCoQmxlb+WBan8nq27OPgYAjof3ZKOImZh76sJoXPvlF25MRPNifrlSfnzL2et86/5o9YmgW+D
X-Received: by 10.170.98.84 with SMTP id p81mr9962714yka.128.1438789202998;
	Wed, 05 Aug 2015 08:40:02 -0700 (PDT)
Received: from doug-t430.lan ([67.63.141.2]) by smtp.gmail.com with ESMTPSA id
	q67sm3066918ywe.54.2015.08.05.08.40.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Aug 2015 08:40:02 -0700 (PDT)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Message-Id: <1438789182-2716-1-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.1.4
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:38 -0800
Subject: [PATCH] README: don't advertise obsolete layer URLs
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
Date: Wed, 05 Aug 2015 15:40:13 -0000
X-Original-Date: Wed,  5 Aug 2015 10:39:42 -0500
X-List-Received-Date: Wed, 05 Aug 2015 15:40:13 -0000

This layer depends on openembedded-core and meta-openembedded so
recommend the actual URLs and not the obsolete ones.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README b/README
index beb3760..652d98f 100644
--- a/README
+++ b/README
@@ -8,12 +8,12 @@ Dependencies
 ------------
 This layer depends on:
 
-URI: git://github.com/openembedded/oe-core.git
+URI: git://github.com/openembedded/openembedded-core.git
 branch: master
 revision: HEAD
 prio: default
 
-URI: git://github.com/openembedded/meta-oe.git
+URI: git://github.com/openembedded/meta-openembedded.git
 branch: master
 revision: HEAD
 layers: meta-oe
-- 
2.1.4


