Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5BF20E00E0E; Fri, 30 Aug 2019 04:32:09 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FBF7E00E0A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Aug 2019 04:32:07 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 1C0B95C255E;
	Fri, 30 Aug 2019 13:32:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1567164727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=rHmKllsOe5/IkOehfTdBSKlThV1lS4w1vM+QQkgSs60=;
	b=iT3tPppM6cLFedQfgkjK4blFfmVl/9zceCK9x5QeDbeq6Se20F6zcBDVCCLZGQBQw8pt+U
	dgcG0A3VFxVWgcNxhptw+AX3El8KhqYD6Rww6FAr0Ryr4auWCgGjyvik8B12rGcvEgaSTQ
	dw+nToysWC7oi0DwLHG2ar1+s4zJMsU=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Fri, 30 Aug 2019 13:32:03 +0200
Message-Id: <20190830113203.49678-3-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190830113203.49678-1-stefan@agner.ch>
References: <20190830113203.49678-1-stefan@agner.ch>
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 3/3] docker: update to v19.03.2-rc1
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

Use the docker/engine fork of moby which provides a stabilized version
of moby in its 19.03 branch.

Bump all git hashes to what is used in Docker CE v19.03.2-rc1.
The SRCREVs are selected through an audit of moby and docker-ce to
synchronize the build points for the various components.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/docker/docker_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index e45f87e..3892c65 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -35,11 +35,11 @@ DESCRIPTION = "Linux container runtime \
 #     to a docker.inc recipe
 
 # moby commit matches the docker-ce swarmkit bump on the 18.09 branch
-SRCREV_moby = "344b093258fcb2195fa393081e5224a6c766c798"
+SRCREV_moby = "ed20165a37b40ff1cfbe55e218344c5e89f30ee2"
 SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
-SRCREV_cli = "2f1931f9eb2d6bac2efd48d94739f2e9919d4d7d"
+SRCREV_cli = "578ab52ece34b084621954e0b543003410cdbe84"
 SRC_URI = "\
-	git://github.com/moby/moby.git;nobranch=1;name=moby \
+	git://github.com/docker/engine.git;branch=19.03;name=moby \
 	git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork \
 	git://github.com/docker/cli;branch=19.03;name=cli;destsuffix=git/cli \
 	file://docker.init \
@@ -57,7 +57,7 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-DOCKER_VERSION = "19.03.0-rc3"
+DOCKER_VERSION = "19.03.2-rc1"
 PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
 
 PACKAGES =+ "${PN}-contrib"
-- 
2.20.1


