Return-Path: <paul@betafive.co.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3206CE00CDF; Tue,  8 Jan 2019 05:42:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [64.147.123.25 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
	[64.147.123.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8DD0DE00CD6
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Jan 2019 05:42:28 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 766721427;
	Tue,  8 Jan 2019 08:34:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Tue, 08 Jan 2019 08:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id; s=fm3; bh=DTwLMUxu2U//sIf
	pfYJANONWWo8o8XwPj4YOUXaOV28=; b=cabHlxwn/f4l1OcNiWqpwL6kr/Qcdgm
	ouyXdnnDyTLLb8uClbwAzVlhpYRMLWVg0ge7QdURpDUNsrGF519mXgXD+RoAFwSI
	AO3hSqFt656VEY0rONInyiakj1G6rEDFmJFgxL8AkKOaRacMpnETCGmkTCWMfO3v
	990MZrvVvX3LllNG1jTS/Rqm953dH6oaFNc3U9hLPxmwtdgyVbT3myN/s7NUubk2
	p0J9pQ1nyqQBlmltSD1KAvlSI+4zMwX/BldV06RgmQgrhiec0t9id4b8HOzfkAcb
	xAryh/n67pUbkjHs/55I3XiLPOSc/LsnIAYAJ/2xIfj/s+leTzoCvWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=DTwLMUxu2U//sIfpfYJANONWWo8o8XwPj4YOUXaOV28=; b=Na6tZOwd
	N3mKC2YOnTk4OD3c+FI6Tq1SanrwG96aI1EjrSHGusl0PXz1tGbAq4tPRREQSt4f
	/S0TFzyUQaqjBft9mLheDxlUGEnDHEvCe8rOKc45/l1+obPWBhyLJV/Dd4RpLvd9
	tY0n5VNfuneHhHuW6mPolOs1JpYzcFA4uw5ZRvvJpcuY2JDLrWcDSWmYIoeDREIu
	6GEEgFwHcLXFCt6NKlg2sO/nQSvsQJ86pdIQizuoI7HXhpxU4Ix5xyxGgqfXURFc
	lcO4U08Ltp53LuViAOw8V+SLuj8/dlUuaTgUzOOCUUh2WmA6/mq8PTJH+ZRp6C/p
	FfklZu4m+Ck7uQ==
X-ME-Sender: <xms:4qY0XG5aoEjxa6coCGRs7N7ykN05nogC8mbZFyaO-FlVVxuZBprMyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrvdelgdehvdculddtuddrgedtkedrtddtmd
	cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofestddtredtredttd
	enucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhessggvthgrfhhivhgvrdgt
	ohdruhhkqeenucfkphepkeekrdelledrvdejrdelvdenucfrrghrrghmpehmrghilhhfrh
	homhepphgruhhlsegsvghtrghfihhvvgdrtghordhukhenucevlhhushhtvghrufhiiigv
	pedt
X-ME-Proxy: <xmx:4qY0XCh1tVqJtQbySX-ua5UAgq_0I8G-A4AMkFu0zZUTxlphuX4m3g>
	<xmx:4qY0XKaXuZDANYp1XbhW0odi6jLAktqIKMe8nZ3i7UqH-XqvAKTg1Q>
	<xmx:4qY0XGEDvJA7uWWC0w_c5ORwNT9mab-cToGOdt_KgKHh0OOnahP90w>
	<xmx:46Y0XJbpMC-Gp7r1WcbMW28z2oTwg4Zb8pQ45Xnhla9phUq3dUu5jw>
Received: from eng01.s01.b5net.uk (unknown [88.99.27.92])
	by mail.messagingengine.com (Postfix) with ESMTPA id 077EE102DD;
	Tue,  8 Jan 2019 08:34:25 -0500 (EST)
From: Paul Barker <paul@betafive.co.uk>
To: meta-virtualization@yoctoproject.org
Date: Tue,  8 Jan 2019 13:34:23 +0000
Message-Id: <20190108133424.24377-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/1] netns fix for master & thud
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
X-List-Received-Date: Tue, 08 Jan 2019 13:42:29 -0000

This patch belongs on both master and thud and should apply to both without
needing modification.

I'll follow up with a netns update on master once I've got some outstanding
issues resolved.

Paul Barker (1):
  netns: Use correct go toolchain

 recipes-networking/netns/netns_git.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.17.1


