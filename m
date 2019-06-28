Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE497E00A7D; Fri, 28 Jun 2019 05:14:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 800E9E0098A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Jun 2019 05:14:10 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 053E35C00D5;
	Fri, 28 Jun 2019 14:14:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1561724049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=XbyVBHtaokPHcbCgxWUvyPoDD2IJZGlwsB4xIMxfUig=;
	b=iGWJrDlrsxxYmxzj3qmR0SN8TDIYTopSoxXVsfhaiOVTrn9Z5O3HWyNLPHv3FP0R+HcYIw
	yuvsz+8Puc6Ux9XSPuE1PRFHfeuNxM1Lo30Q0kwlwK05zdSauRtyV9t1uqDjYO0Nm7I6TC
	+McDuRI5vfaU23Xq9LdkjFCkPjYdEFg=
From: Stefan Agner <stefan@agner.ch>
To: bruce.ashfield@gmail.com,
	meta-virtualization@yoctoproject.org
Date: Fri, 28 Jun 2019 14:14:06 +0200
Message-Id: <20190628121406.31777-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] docker: make docker-init a runtime dependency by default
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
X-List-Received-Date: Fri, 28 Jun 2019 12:14:11 -0000

From: Stefan Agner <stefan.agner@toradex.com>

If docker run --init is used docker expects docker-init to be
present, if not Docker fails to start the container with the
following error:
  docker: Error response from daemon: exec: "docker-init": executable file not found in $PATH.

However, docker-init does not get deployed by default since commit
d19fda374317 ("docker: consolidate common depends/options"). Readd
docker-init through a PACKAGECONFIG RDEPENDS to make sure it gets
deployed by default again.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/docker/docker.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 168d296..eacaf7f 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -32,8 +32,9 @@ RDEPENDS_${PN} += "virtual/containerd virtual/runc"
 RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
 
 inherit pkgconfig
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "docker-init"
 PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
+PACKAGECONFIG[docker-init] = ",,,docker-init"
 
 inherit systemd update-rc.d
 
-- 
2.13.6


