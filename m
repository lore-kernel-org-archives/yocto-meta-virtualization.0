Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7767CE00D33; Sun,  6 Oct 2019 13:48:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69182E008D9
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Oct 2019 13:48:20 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id DFB545C1CDD;
	Sun,  6 Oct 2019 22:48:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1570394898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=9n7q3SmuhHE4/xY1unGmuCqYuRklYu07LHd2psrCSO8=;
	b=Qd3dI8V+DpxNsqv0MdHvGfK0lvQEqyg7UpVd2qLGboyr7q0p1/bfGF8gzHerGIKvj+iozM
	uM4DuMFgEQNzpmQBEolw7/D3HY4UQ2RFzIxRB5cRzIueD1dCOeC1wliQz7vY6FzSN/k0Cf
	/7kAcRseVNCjNBcACMdW0FkKwc4wLRg=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Sun,  6 Oct 2019 22:47:45 +0200
Message-Id: <20191006204748.15783-2-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191006204748.15783-1-stefan@agner.ch>
References: <20191006204748.15783-1-stefan@agner.ch>
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 2/5] podman: bump to latest release 1.6.1
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
X-List-Received-Date: Sun, 06 Oct 2019 20:48:21 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

Bump to latest podman release 1.6.1.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/podman/podman_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index db595a5..a3529b1 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -30,7 +30,7 @@ python __anonymous() {
         raise bb.parse.SkipRecipe(msg)
 }
 
-SRCREV = "00057929f5acfd98341964d85722383363376d52"
+SRCREV = "233d95f4f0a815f11d1c1ae9aba16781c4eb2700"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=master \
 "
@@ -42,7 +42,7 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-PV = "1.5.1+git${SRCREV}"
+PV = "1.6.1+git${SRCREV}"
 
 PACKAGES =+ "${PN}-contrib"
 
-- 
2.20.1


