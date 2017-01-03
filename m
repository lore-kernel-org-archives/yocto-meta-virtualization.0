Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE1C4E0092C; Mon,  2 Jan 2017 20:48:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.195 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69A6CE008F3
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Jan 2017 20:48:15 -0800 (PST)
Received: by mail-yw0-f195.google.com with SMTP id r204so37365203ywb.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 02 Jan 2017 20:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5auSJ65ZwvCrvyljOL9HugxCYx9On3lRDw1sfrP1KcE=;
	b=Cu04bAofGO9kLTZDydljMsez6xwUcPENBRuUh4iwl1KnkeVhmR7NF1WCyCWTaoI/gN
	zuUr6ogf1vkdn+6ZovzgQ3M0FBMyW9WtBwzJpcH9/qSxHrsYXyZcE0TeWOLfQjm0LIpW
	Mt5QnboJ0Cbeu/d4GHwwj8Dtw8KvQWQHvg3oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5auSJ65ZwvCrvyljOL9HugxCYx9On3lRDw1sfrP1KcE=;
	b=oiQLwGaTJOm/FPoyDZi4QOguInwnW9QyZkY+7BVlBKsMAMj/FfIrPrKpsAC6SWuiVz
	v1u2pGGfWkMUp4qjytirkzj7TpEgcMOCjOBtNFSB4n3PVllxvzlO2W5EFnj+xPijxaZo
	LKfy2GZzMnYZfvR9TLtr/9cd3PGngFXyCyxxw31JDgsjN4iibqEqkGGOLT6r95BKwfKc
	z5ZRFrVf3VV38K54zeZ0+Hee8Ic3jM+P3FthlVl/inYENc28QVzCNCFJ44HqSkzxgxs6
	OTD3wFSyzERP46I2TmNH/i2RpTJKT4smCflarpHtyAC+u7mX9xupdYuMZ0POJbMKNAx7
	VsDA==
X-Gm-Message-State: AIkVDXLuD6/EY83Sz48p/dNqip8X+w4DL+7L0TwDkh5o0h5FDW/+scoH0JFymDoOnZwcrA==
X-Received: by 10.13.205.4 with SMTP id p4mr55512267ywd.337.1483418895047;
	Mon, 02 Jan 2017 20:48:15 -0800 (PST)
Received: from swanson.attlocal.net
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.gmail.com with ESMTPSA id
	v1sm16209892ywc.17.2017.01.02.20.48.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Jan 2017 20:48:14 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  2 Jan 2017 22:47:54 -0600
Message-Id: <20170103044754.15012-5-cardoe@cardoe.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170103044754.15012-1-cardoe@cardoe.com>
References: <20170103044754.15012-1-cardoe@cardoe.com>
Subject: [meta-virtualization (krogoth)][PATCH 5/5] xen: ensure we build release builds
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
X-List-Received-Date: Tue, 03 Jan 2017 04:48:16 -0000

Don't build with asserts on. This is the default for release tarballs
but if someone bbappends patches in we should ensure they don't shoot
themselves.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
 recipes-extended/xen/xen.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 38922dc..d9490fe 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -843,6 +843,10 @@ addtask stubs after do_configure before do_compile
 
 # Allow all hypervisor settings in a defconfig
 EXTRA_OEMAKE += "XEN_CONFIG_EXPERT=y"
+# Build release versions always. Technically since we track release
+# tarballs this always happens but occasionally people pull in patches
+# from staging that reverts this
+EXTRA_OEMAKE += "debug=n"
 
 do_configure() {
 
-- 
2.10.2


