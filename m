Return-Path: <paul@betafive.co.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 953DFE00CC4; Fri, 11 Jan 2019 09:29:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [66.111.4.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30CFBE00B77
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2019 09:29:47 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id A1DA5243F5;
	Fri, 11 Jan 2019 12:29:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Fri, 11 Jan 2019 12:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id; s=fm3; bh=+NcBSJ3aSJ26DMP
	MwupCefeE6hKwZvqdZ8BeBJylU+Y=; b=PJQ8BOotT9Ei2Blf38dSk6lMF3cdLH/
	+wgF6b4Q+B9L/C36QzeZrV50AoEkc78C2FZAI7VtecX4sM+6bAwhM2OwZZ9EEKYp
	8DxI0aaT6l6u9G3m11YQM4s7Zk9VatdhAUsMPwuuDgTN/M1QOpdxcyDOUALUaVnU
	rezSGKbKkqaw5Q4QFbQ1vilw6K6r3jf+UrM6ioJ+Vs5WU2x6CuQEjopSHizJOFsT
	0iWhswBgN5/fv9A6XjEtLuu2ajwPlh6+ce2sOvbGoh/Ekxce2EHNnXl79GzoQtox
	Du+SobuKRi5YbRb6FsuF1o5TbkS6sxSOUzbbPsDofdC2fW6FlPJbF3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=+NcBSJ3aSJ26DMPMwupCefeE6hKwZvqdZ8BeBJylU+Y=; b=a0t767RV
	SX8jX9JllMDwf0KUCRBMeXjuwo1dWgR9TBNnE27ygLcQyNEVpb6Uir62LWtawsI/
	moOIID6vPXIc+69+RB7NoGwspWe34GxP3ZJ/OJjOlcO0DsLWztGXpiblYYWAJOyz
	HpwnCDI7qlPW3QvcvQUTTN8IwqvwwcLZRr9zOcdsu95B1lnjRWUCG59179a07KX3
	PQf9bJntsjuN6ItOwQ7hu2lYdBPiLU3z2YVg0qbZirFBosKkTXVxC7xfunNrywia
	MmuDgc8O/btSjv9RgLSkBxq1o1ve2GHCA9mHa1GC2okcc8RqTHHgP5sD6BanyDOE
	+znVzTHR1WHWTw==
X-ME-Sender: <xms:idI4XN-mzvXCH8ffX65NGp-9Q_ywbG2-a_fBPzpMQW9c-BDXKlaDLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrfeehgddutddvucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
	tddtnecunecujfgurhephffvufffkffosedttdertdertddtnecuhfhrohhmpefrrghulh
	cuuegrrhhkvghruceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecukfhppeek
	kedrleelrddvjedrledvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhessggvth
	grfhhivhgvrdgtohdruhhknecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:idI4XM2M-fBtpUt_4wVK8u1RsiOz29_2DfK2RLFqm4wjubgpAXGD7A>
	<xmx:idI4XAY8R4zJCF8hEIlkXtEyNdT2z0oymg-43GDrJC2_2QdIBkiMxw>
	<xmx:idI4XBSyD0SmQeAW47PKNDLA49ETYpZZ2CUyoevqHYaC7IttaCPPbA>
	<xmx:itI4XCDfZv0LiPRJ8CplRjJMgszlW5ryo4JJvaXbG_u60HC_nfOAPQ>
Received: from eng01.s01.b5net.uk (unknown [88.99.27.92])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0CF5710281;
	Fri, 11 Jan 2019 12:29:44 -0500 (EST)
From: Paul Barker <paul@betafive.co.uk>
To: meta-virtualization@yoctoproject.org
Date: Fri, 11 Jan 2019 17:29:37 +0000
Message-Id: <20190111172937.9197-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] runc.inc: Move RRECOMMENDS to runc-docker
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
X-List-Received-Date: Fri, 11 Jan 2019 17:29:47 -0000

If we're building runc-opencontainers it's likely that we're not using
docker.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 recipes-containers/runc/runc-docker_git.bb | 2 ++
 recipes-containers/runc/runc.inc           | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 02bda31..11fa68a 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -1,5 +1,7 @@
 include runc.inc
 
+RRECOMMENDS_${PN} = "lxc docker"
+
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
 SRCREV_runc-docker = "6a2c15596845f6ff5182e2022f38a65e5dfa88eb"
diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
index 6d11a6e..5a2ca31 100644
--- a/recipes-containers/runc/runc.inc
+++ b/recipes-containers/runc/runc.inc
@@ -17,7 +17,6 @@ inherit pkgconfig
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
 
-RRECOMMENDS_${PN} = "lxc docker"
 PROVIDES += "virtual/runc"
 RPROVIDES_${PN} = "virtual/runc"
 
-- 
2.17.1


