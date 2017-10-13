Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EE3F8E008A4; Fri, 13 Oct 2017 12:27:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.179 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.128.179 listed in dnsbl.sorbs.net]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 469ACE006CA
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Oct 2017 12:27:30 -0700 (PDT)
Received: by mail-wr0-f179.google.com with SMTP id q42so1733277wrb.7
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Oct 2017 12:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=P3V2Qv8Sc7sB2pVVwF6Kf2I77ZKz+YEWNUNTK7G9rx8=;
	b=S6EtkcTAAbWjUAKlAMwwlwSQqmYHCeaYm7FOyOpJQH/v9mpjblrY13+xC8UTURX9JS
	JMDrJQyrQuMAmQD5c+qO0YkdzaBARtx/ojRSM7DY2SCUuZlu9wPLt+8U+K+waAQX9nEA
	ldqE3m8KdPFYepTo8XwGVCkv90/qii46mUcB5txIYicMHR9MVNvUprnR4aP4D/8dS54S
	3Q/ZaoxiMJu08HqTdhGGGrxnAV/Q1SSc9D2X1evwdDV0A4s3rFwTXrB0ov+1T2jbSFZb
	422rCL+JGIwLqXoXh6l03KfKPo936X/j7NXLgbzUHT2k0MxRY8rBQhRDLW1nRlzJssHk
	IhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P3V2Qv8Sc7sB2pVVwF6Kf2I77ZKz+YEWNUNTK7G9rx8=;
	b=ZGD8I+78gMyoaOFYQEhqPBQouXPDLHANZ/7j+biRGERtb/lHkJPGPJP5xBqgcCXe88
	YDNRF3mBIycIjr42AF9Oril9ATUgvHKJYxXeM1Ji4S0BBU6ACCn6oMW13Ca00fgHFRfy
	tBePxnJtNu6wXCeqc0M7a+f94PUFsnWduFwVSi87N1ykpz6HxcxqEbzKDIWowOGD9ze9
	Rkrtza1iGzK7UC+Lpi2hnq+/8jCEvPTuRFmGrHjZCoM4ef/iLsj38n/rIvLv9CgkUT1H
	GlRkHwPfHjoXOVuyaw7nFZVKVd+kWYj5K9TWbQVqC6X5CDsYrnugLxjYpJBahWR8xddz
	A3yQ==
X-Gm-Message-State: AMCzsaWZztPqOIcMuRLSXkPCO78PveppztFFpHVNPw7wWdhVOCHwM8Yc
	kJ4PVdRjMKcN44s3TIv+/T6RdyLI
X-Google-Smtp-Source: AOwi7QBx42gySwhbrEM471FTSMYKw7g0uyF65oboz3/T7tO5FJ6YJs9Uorh7LeNiH51bjpDeKjNOTA==
X-Received: by 10.223.199.205 with SMTP id y13mr2390352wrg.71.1507922850031;
	Fri, 13 Oct 2017 12:27:30 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id 69sm1846839wmm.2.2017.10.13.12.27.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Oct 2017 12:27:29 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 13 Oct 2017 19:27:11 +0000
Message-Id: <1507922836-17295-1-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/5] netns fix and runc recipe simplification
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
X-List-Received-Date: Fri, 13 Oct 2017 19:27:32 -0000

Here's another round of changes. The first patch fixes netns cross-compilation.
The rest replace "[PATCH 4/4] runc: Simplify recipes" from the previous series,
splitting it into separate commits and dropping churn where it adds no value.

I've left the merging of common metadata as the last patch incase that still
isn't wanted.

Paul Barker (5):
  netns: Use correct go cross-compiler
  runc-opencontainers: Drop unnecessary do_compile_prepend
  runc-docker: Drop unused EXTRA_FLAGS
  runc: Drop inherit goarch
  runc: Merge common metadata into inc file

 recipes-containers/runc/runc-docker_git.bb         |  6 --
 recipes-containers/runc/runc-opencontainers_git.bb | 11 ----
 recipes-containers/runc/runc.inc                   |  6 +-
 .../files/0001-Use-correct-go-cross-compiler.patch | 77 ++++++++++++++++++++++
 recipes-networking/netns/netns_git.bb              |  4 +-
 5 files changed, 84 insertions(+), 20 deletions(-)
 create mode 100644 recipes-networking/netns/files/0001-Use-correct-go-cross-compiler.patch

-- 
2.7.4


