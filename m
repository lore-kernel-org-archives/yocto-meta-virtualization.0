Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4D04E00BA2; Wed,  9 Aug 2017 18:28:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F7EFE00B77
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Aug 2017 18:28:57 -0700 (PDT)
Received: by mail-pg0-f47.google.com with SMTP id l64so34783317pge.5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 09 Aug 2017 18:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=miMzkCHHYK9v2kBPNl3M0Ljt23PYhmwxco+xEx3qyQo=;
	b=HLdRL94pusf2X1ZzqPUBJfs8sjEWLf5S1mgDHzMV7V4b856ae6Xmf9+HgV/NTLsfyI
	BdKTf4qjVJ4AdkEdPD3Ncd1u8AVPtv9qylUeVgmWisNJBkHQxNxGfaDgNCJaqfZM4HGs
	M/9LD5lF2+4ApKUhZaNdujLdTVXv3WOGOlzuRYZPpyLvhuJUAx5S1F+Yce+3hAIL82OM
	kE6jHvBfamscrFLCKcV3c0mcYu6yS89nS4up1ujKq4HfTtxASjHrgBHv6F96Wv7gfcVp
	wQFeidK7QTq8IQIbnt3LFUpE+qCTmsPrd+vg89DGX1MJSeXvogCuvfxmyujSSUKF254U
	gK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=miMzkCHHYK9v2kBPNl3M0Ljt23PYhmwxco+xEx3qyQo=;
	b=eMdi7ykc/F0maKC/huTrDrC5fA9AAcDttgVGlJi97b7C4kf6vfq1LbjiDhAiBVbzh3
	++/NXoAxxkiOpip7fqZcxP/dOOAXa+Bo6SGi4YaNst7Juhh8VHCR9FQFN1XRmVkyhZyx
	vEAnRY+0HNSYVo1XHdNE/wyfirZbijY9jc8luCvf0A6zS3u+Wdgokh4KoHeN9wuQPURw
	rI1zn4InJ2CP/0xv0Woabq8ajzMJpx6TZck6mdEEXy3NrH5/JG3TOegMgpu8qWtw6/c2
	9kw2Ntlp9tEvMm14mEmledjqNctvKEq4DT2YP26ss9LJtHKk4r0Hsf0hFdqb0QpowfkL
	DspA==
X-Gm-Message-State: AHYfb5g/1YHLVQ847GU0YCxFTcpwZkxnclshzBQJV0ftPR8frtPg0r29
	UDa7YH4o5P7vwV0jRrE=
X-Received: by 10.98.200.24 with SMTP id z24mr10011774pff.205.1502328536780;
	Wed, 09 Aug 2017 18:28:56 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	o17sm8642348pgn.52.2017.08.09.18.28.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:28:55 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed,  9 Aug 2017 18:28:41 -0700
Message-Id: <1502328524-4230-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org
Subject: [PATCH 0/3] xen: Add Xen recipe for 4.9.0
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
X-List-Received-Date: Thu, 10 Aug 2017 01:28:57 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Add recipe for Xen 4.9.0 and update xen.inc to package new items.

Christopher Clark (3):
  xen: Package libxendevicemodel, introduced in Xen 4.9
  xen: Package .pc packageconfig files into dev packages
  xen: add recipe for Xen 4.9.0

 recipes-extended/xen/xen.inc      | 78 ++++++++++++++++++++++++++++++++-------
 recipes-extended/xen/xen_4.9.0.bb | 10 +++++
 2 files changed, 74 insertions(+), 14 deletions(-)
 create mode 100644 recipes-extended/xen/xen_4.9.0.bb

-- 
2.7.4


