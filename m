Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AF94DE00973; Tue, 26 Jan 2016 11:09:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f196.google.com (mail-yk0-f196.google.com
	[209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5695CE00973
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:44 -0800 (PST)
Received: by mail-yk0-f196.google.com with SMTP id v14so15389373ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 11:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=tTW85hXUtiH+WYOwzKEB3k3nT488X/HvU5+2NMROypk=;
	b=PExFp+q2oPVbXxLiWu+R4e85AgGK/xaTwFkcctAedcPb9VSTk8Sszyer+FoNOW864c
	W9KeIays3YRA4QK6yXQKHpikUAbkTLKCk5FMXCRLnrsXYPCXt8y7P1CTkKiuFoTPHZFc
	kDjg8fTd2vxbQYMBB6P774jfMR6FjHOGyemokvpxzCx54pHstadPXdIyfLBUtwj+Do9j
	UVdZOgXwuqpEz0diK+/csabqqhxl7MAgCtA854G4TAKwJ8MR3TL8rO4N1YeK71xEuFXC
	X8bfb6/BcvIviY5dTp6gNvv1U/HaLaZoS2NqPYsQuxpoFFw+tY0OOVGvJiPWFfND+V1m
	hsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tTW85hXUtiH+WYOwzKEB3k3nT488X/HvU5+2NMROypk=;
	b=IVJSYGJbzaP2c29rjHDmWFhAaDUmA8v0rlxZ2gSVfqdr87naOREcU7qf0dUh0XFUsI
	RdExxdseHIstyr8AaD7OiKYZwWRF+zFGAslI4CcTI40HiwilAimFXQZA/YzEUlkk7pEa
	RoaZo346MvIa8scbkcWG6w9HdFjfXsDCeVUBLiNstcbLnEBhFt0JQQ0Lqrqou2IBDdw5
	kr6pzKnksHac9i2Gi18epHeMN3iqlzGYGG7k5fUQhBSKpPPIX/UJW/xCET8DoXjyAiZV
	/ZFzywqBjdA9kUP/9HY1qibuV49hGTACfOs+2TpnK3JG+x+VBc3vCwzyIYG1QaUy4b/O
	6iLQ==
X-Gm-Message-State: AG10YORELQBLpG1EpW9lQxCONOkPSAJVfZokGHw9JtkvOXLfchxtblbmzrElYGc/gvd/cw==
X-Received: by 10.13.207.65 with SMTP id r62mr7774659ywd.27.1453835384211;
	Tue, 26 Jan 2016 11:09:44 -0800 (PST)
Received: from swanson.lan (c-68-46-196-185.hsd1.al.comcast.net.
	[68.46.196.185]) by smtp.gmail.com with ESMTPSA id
	h187sm1899502ywc.0.2016.01.26.11.09.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 11:09:43 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 26 Jan 2016 13:09:16 -0600
Message-Id: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
X-Mailer: git-send-email 2.4.10
Subject: [PATCH v2 0/8] Xen 4.6 updates
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
X-List-Received-Date: Tue, 26 Jan 2016 19:09:48 -0000

A number of updates for building Xen 4.6. This should be the last of the
patches that I've been carrying locally for 4.6 (save for init script
changes but those I'm trying to upstream).

change since v1:
- readd libgcc to xen-xl per Chris Patterson's testing
- add patches I forgot to submit in the first place
- squash in EXTRA_OEMAKE and do_install_append changes into xen.inc
- make sure xen_git is able to fetch

Doug Goldstein (8):
  xen: update git version to 4.6.x
  xen: drop explicit DEPEND on libgcc
  xen: fix up typo in XSM comments
  xen: separate the extra steps into their own tasks
  xen: move bits common to all Xen versions to xen.inc
  xen: merge do_install_append to do_install
  xen: don't allow the build system to fetch
  xen: don't inject -mfpmath=sse which causes build issues

 ...xen-x86-Fix-up-rules-when-forcing-mno-sse.patch | 28 ----------
 recipes-extended/xen/xen.inc                       | 59 ++++++++++++++++++++--
 recipes-extended/xen/xen_4.6.0.bb                  | 40 ---------------
 recipes-extended/xen/xen_git.bb                    |  8 +--
 4 files changed, 60 insertions(+), 75 deletions(-)
 delete mode 100644 recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch

-- 
2.4.10


