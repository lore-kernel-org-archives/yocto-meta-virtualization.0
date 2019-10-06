Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D378E00994; Sun,  6 Oct 2019 13:48:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D214E00ADD
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Oct 2019 13:48:20 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 27C035C229F;
	Sun,  6 Oct 2019 22:48:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1570394899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=D0QP54qbWCfnYPMvNBpN2YAXM5+jaaXQx/uQw9NWm5E=;
	b=SAsZrgqgpquLHiMiVoXMpFTSRQ4VtV0vjMaDAygAiVhC9AtwhWmeRdxiL0yzWvFHHra1+T
	FfMDRAxseSBKyw46qou6IpL8eWETODlHpKQIAjomqbZg16iScQkx5vzJKNDo68+gxVrfj9
	FBUyBR2YDiI2r0dlM7WfEVQvtgH+Lck=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Sun,  6 Oct 2019 22:47:47 +0200
Message-Id: <20191006204748.15783-4-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191006204748.15783-1-stefan@agner.ch>
References: <20191006204748.15783-1-stefan@agner.ch>
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 4/5] podman-compose: initial version
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
X-List-Received-Date: Sun, 06 Oct 2019 20:48:22 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

Add podman-compose, a docker-compose implementation for podman. The
current version is not feature complete, hence not all docker-compose
file work.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/podman-compose_0.1.5.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-containers/podman-compose_0.1.5.bb

diff --git a/recipes-containers/podman-compose_0.1.5.bb b/recipes-containers/podman-compose_0.1.5.bb
new file mode 100644
index 0000000..4015069
--- /dev/null
+++ b/recipes-containers/podman-compose_0.1.5.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "An implementation of docker-compose with podman backend"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit setuptools3 pypi
+
+SRC_URI = "git://github.com/containers/podman-compose.git"
+
+SRCREV = "f008986633879acf3f54848dabbf07cef8e9c68f"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "${PYTHON_PN}-pyyaml-native"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-pyyaml"
-- 
2.20.1


