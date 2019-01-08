Return-Path: <paul@betafive.co.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E382E00CDE; Tue,  8 Jan 2019 05:42:29 -0800 (PST)
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
X-Greylist: delayed 478 seconds by postgrey-1.32 at yocto-www;
	Tue, 08 Jan 2019 05:42:28 PST
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
	[64.147.123.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8CA57E008F1
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Jan 2019 05:42:28 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id CC683143B;
	Tue,  8 Jan 2019 08:34:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Tue, 08 Jan 2019 08:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:in-reply-to:references; s=
	fm3; bh=MlO9oyDEKNhj2bXBzVeM6BgnhlB91Q/scgqzGgIO0UQ=; b=my1rC3xP
	A8Wg/s+TmUafZI3etpG5VVLyIgfB+Y4xuX8Q4yM3/ffYFjDXdUJZ/EaRgbZH3yNR
	phbh50x1VPSjKMZGh80D7J+vcjR4tTwZN8mn2WmBMXlmMzK7Fgdbmn8sm00Wn+gO
	G9O4xLXPSDg25HRFo7ikSEA2dsAttFxvh4qF1cOOH5W7oPIDkjlAUC4kjV34pj7S
	Dt7TYnwe5KD2n5BdJKXitr+l4dPfDrqBbQhFc1whOl84049y9AwQzouLHDfx6pOc
	BKhs0uT1WyOgl5vT59MyqFKXBhSm3rAGFda2cucWkgjR0pRV/ySxVyXrk4Wj7ul8
	5osYSCBlnXWsUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=MlO9oyDEKNhj2bXBzVeM6BgnhlB91
	Q/scgqzGgIO0UQ=; b=urNQ8GrAO4Q3+MrElxB5SBK2fCxV5g/OLHOQJAqd2hKkt
	eot1Sr0J5WsPYTVsZno6H6ZwNlTtJMMb0dngzkoK3/zsqwErgyBrvS3FwCAYzmkV
	epaL9rH/hQ5VQY42V6+v8qk2qTQJNTTF+UrAc99eqk48tBDRvkQ6jfpx73IlkzlS
	yJu/7oH2C4sp1cXfJQf9/+9YVSo4S80RcEV7FCxKDhLv7icYiCpm9p1/VsXGdpYu
	k2dLxa/8j2/9qpmTxqXLHblFpZfc4vT/vRgJlYK78W8lT2tPmd/T5emgZ4kr+iLB
	TWh7+GWB+IMWBcdZLWTnaUgh99h8V3+h3xULc9chQ==
X-ME-Sender: <xms:46Y0XCkFaIkl1hzhFBiHNJUUMyRVCpJ3GV2v-Buu2Y46VyPDDGi7xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrvdelgdehvdculddtuddrgedtkedrtddtmd
	cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhestddtredtre
	dttdenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhessggvthgrfhhivhgv
	rdgtohdruhhkqeenucfkphepkeekrdelledrvdejrdelvdenucfrrghrrghmpehmrghilh
	hfrhhomhepphgruhhlsegsvghtrghfihhvvgdrtghordhukhenucevlhhushhtvghrufhi
	iigvpedt
X-ME-Proxy: <xmx:46Y0XGL1YwfKi1a6b6uzVnJzcMcVg6yTT4EoaGvJKf1CVDw4RSMQyQ>
	<xmx:46Y0XDaQXDW8gNQIcOE0YEERxhkJ11P1xjvSkanFqBdaqC4mmIjh-g>
	<xmx:46Y0XIaKVYB-OAcBlWelTEfpZXkZOeRizwbsNkMuNo15ZuIINPWXfg>
	<xmx:46Y0XPZh7gB15S2TdTYVl4BqNHxC8ywxghk9XE0oJ2vT8oa-fQuA3w>
Received: from eng01.s01.b5net.uk (unknown [88.99.27.92])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9A5561026D;
	Tue,  8 Jan 2019 08:34:26 -0500 (EST)
From: Paul Barker <paul@betafive.co.uk>
To: meta-virtualization@yoctoproject.org
Date: Tue,  8 Jan 2019 13:34:24 +0000
Message-Id: <20190108133424.24377-2-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190108133424.24377-1-paul@betafive.co.uk>
References: <20190108133424.24377-1-paul@betafive.co.uk>
Subject: [PATCH 1/1] netns: Use correct go toolchain
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

If we don't explicitly set the GO variable as an argument to make then
the native go toolchain is invoked instead of the cross-toolchain we
actually want. This can result in a netns binary which is built for the
wrong architecture.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 recipes-networking/netns/netns_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
index 82a961b..b6d3594 100644
--- a/recipes-networking/netns/netns_git.bb
+++ b/recipes-networking/netns/netns_git.bb
@@ -15,6 +15,8 @@ S = "${WORKDIR}/git"
 inherit goarch
 inherit go
 
+EXTRA_OEMAKE = "GO='${GO}'"
+
 do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
 	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
-- 
2.17.1


