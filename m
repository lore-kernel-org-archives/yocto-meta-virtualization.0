Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C162E00E0D; Fri, 30 Aug 2019 04:32:09 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D533E00D89
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Aug 2019 04:32:07 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id C17625C24BE;
	Fri, 30 Aug 2019 13:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1567164726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=MhLK151HzHaQB65/n5Li1h/Zpwvm5yJtj9Va6JPOPEg=;
	b=A3yTfVHN+rTZEiFtpnhbTp8QgCEg82UCgrVL5u5oZnNEe50pa2LmSkDv7rrP/m4KfaXmLT
	GwYnW2GFTp/Cqhhy5F4qdJIx+mdLjKYC6R3BaZTGmExQMtQKIb+KvxNHCmZZPsiwP/k4L7
	VKEVEWCz3aiJYLh9uR41bc9Z6iqvyaU=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Fri, 30 Aug 2019 13:32:02 +0200
Message-Id: <20190830113203.49678-2-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190830113203.49678-1-stefan@agner.ch>
References: <20190830113203.49678-1-stefan@agner.ch>
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 2/3] docker-ce: update to v19.03.2-rc1
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
X-List-Received-Date: Fri, 30 Aug 2019 11:32:09 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

Bump the git hashes to Docker CE v19.03.2-rc1.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/docker/docker-ce_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 215f114..9018d7a 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
  subtle and/or glaring issues. \
  "
 
-SRCREV_docker = "2416d7f930859912c883f964b1cee6909635f951"
+SRCREV_docker = "8296f90eef33e5d30c4521ff6001b9600b4de78f"
 SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
 SRC_URI = "\
 	git://github.com/docker/docker-ce.git;branch=19.03;name=docker \
@@ -38,7 +38,7 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-DOCKER_VERSION = "19.03.0-rc3-ce"
+DOCKER_VERSION = "19.03.2-rc1-ce"
 PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
 
 PACKAGES =+ "${PN}-contrib"
-- 
2.20.1


