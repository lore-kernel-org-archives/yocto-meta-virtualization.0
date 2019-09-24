Return-Path: <paul@betafive.co.uk>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40201E00D46; Tue, 24 Sep 2019 02:46:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
	low *      trust
	*      [66.111.4.28 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A052E009E6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 02:46:04 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 4B068209B5;
	Tue, 24 Sep 2019 05:37:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Tue, 24 Sep 2019 05:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm2; bh=peExkU1NrJ5cu
	b0dsbN+R6dfnyCl8vjwaiotPeM/C6k=; b=XW+RSbvgzyc4EJe5r9/9kLpJgrmZH
	P1B2wV17YH8pN7t+BUQ7qcifmOhvCagLVeLjUJmF7//NhSvm1LmuokZbeVkt5FH+
	O5wa91O5qOa0BEed+6798fKtlhIsuhHhThY/hJZFpxRuqAAvPfi27jamQ9P3R6Ub
	gNGzac0B2NGD+4y/QIVZjI5jNqafQCmKC9NI8aeLI6VsmF9MHGzJ+15wvAQxGpvD
	ug3XLGwqLghY+vpRobro92R5+MSTF4YCAAc20q8lWuGLrO1tCXC7sy2WnFBj+tqc
	VJRlKy18V+IlM8WsAITWpfCI5ksOCg/cPoYamb4p68R3jZg/Mg9fvKlVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; bh=peExkU1NrJ5cub0dsbN+R6dfnyCl8vjwaiotPeM/C6k=; b=JCChU3Jy
	ub6UWX0bn0uhDzVoxxSzv1+nrPBT5z6KwpOHrC8FykWKbPk+cvlP1tHg9WtwHNki
	dGUqwcSw6uufOy7WPKN1yIQrZZWMw6BiZkGoQhJ2opdjR3fdAMRuwBQv7N98e/Oh
	jom7cQY1fR6Q3tNhhPPET04EyuzkHc/D0DRF90BMZJhlJgDTUitsS1HGDc1I5LhF
	LaBC+cO4eANByH0IkzItHRHUnjqRFmOTQ3HFd9yWuoG2fwN5VS96n96PutNR4J4Z
	xM5hrFB1BRrL7L+UKPkv9t1pcfTT4KGmOOtXjG1AIlgz1ONIwsM/zvgj9HOvIpF4
	xqwy59W0dmYw0g==
X-ME-Sender: <xms:6uOJXTAEvhIGH7Gu2nSyQVkPsFCu06JBMlDW-UL1zMyN8FqfX94jsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedtgddujecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
	ertddtnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsegsvghtrghfihhv
	vgdrtghordhukheqnecukfhppedvudefrdegkedruddurddugeelnecurfgrrhgrmhepmh
	grihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehluhhsthgv
	rhfuihiivgeptd
X-ME-Proxy: <xmx:6uOJXZp5pnEipGiVLYK1sM_ExTeQRl3DY2QZzAqd6404_IFGSm0u0Q>
	<xmx:6uOJXWA3TyJT6vNEeZDTwkakc-UN9WXCF4Vnq-eD1VGqFdDowh_XYg>
	<xmx:6uOJXcVzwcCw7NmO8OxFjOfJHKQjn9rNQyYjioO9rxiHMcGDgWsfqw>
	<xmx:6uOJXXUHq_HDDD6raYb1rtBbHQZf5NukOLNaHa_ttIXoAEQCEI5H2w>
Received: from arch0.home.b5net.uk (unknown [213.48.11.149])
	by mail.messagingengine.com (Postfix) with ESMTPA id 866388005A;
	Tue, 24 Sep 2019 05:37:45 -0400 (EDT)
From: Paul Barker <paul@betafive.co.uk>
To: meta-virtualization@yoctoproject.org
Date: Tue, 24 Sep 2019 10:37:37 +0100
Message-Id: <20190924093737.265426-2-paul@betafive.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924093737.265426-1-paul@betafive.co.uk>
References: <20190924093737.265426-1-paul@betafive.co.uk>
MIME-Version: 1.0
Subject: [PATCH 2/2] netns: Fix build on qemux86-64
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
X-List-Received-Date: Tue, 24 Sep 2019 09:46:05 -0000
Content-Transfer-Encoding: 8bit

The build has broken again on master, even for non-static builds of
netns. The simplest fix is to extend our existing patch to cover this
case as well.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 ...ce-rebuilding-all-packages-to-avoid-cgo.patch | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch b/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
index 3ed4c21..e4967d2 100644
--- a/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
+++ b/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
@@ -37,14 +37,20 @@ Forward-ported to v0.5.3.
 
 Signed-off-by: Paul Barker <paul@betafive.co.uk>
 ---
- basic.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ basic.mk | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/basic.mk b/basic.mk
-index 187dff3..fb080b7 100644
+index 187dff3..76a8d93 100644
 --- a/src/import/basic.mk
 +++ b/src/import/basic.mk
-@@ -50,7 +50,7 @@ $(NAME): $(wildcard *.go) $(wildcard */*.go) VERSION.txt
+@@ -45,12 +45,12 @@ build: prebuild $(NAME) ## Builds a dynamic executable or package.
+ 
+ $(NAME): $(wildcard *.go) $(wildcard */*.go) VERSION.txt
+ 	@echo "+ $@"
+-	$(GO) build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
++	$(GO) build -a -pkgdir dontusecurrentpkgs -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
+ 
  .PHONY: static
  static: prebuild ## Builds a static executable.
  	@echo "+ $@"
@@ -54,5 +60,5 @@ index 187dff3..fb080b7 100644
  				${GO_LDFLAGS_STATIC} -o $(NAME) .
  
 -- 
-2.17.1
+2.23.0
 
-- 
2.23.0


