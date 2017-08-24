Return-Path: <tiniuc.alexandru@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1711FE00A39; Thu, 24 Aug 2017 05:34:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (tiniuc.alexandru[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55540E00726
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 05:34:09 -0700 (PDT)
Received: by mail-wm0-f41.google.com with SMTP id p30so4203253wmi.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 05:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=p1EXmQHXLJoeBfONFrBZTl1WVuYLAao/fQVY91QYyY4=;
	b=cnYXup8y3/EEYSSN87s8GuiOf897TiT5+WoJ/WtxBLS1AdW0CYgn5sFXSd08aFXXM8
	SGShFpvbuRYu2S45MBg4GUlBPgdnJBdiyBpqMFPooDovg1DKUIGY6ASqRLdHY8cHCIiW
	ESkf8QNr1+jf85emVBbprQFNXHfWc0qXCnavzqgdFfZz55v+c134bNAntLt2IvC2clzl
	geS992u2gwMffPPoE6l+6zMIjXwhwGbZaN+Y1nDTD262Z0+XJQX15S12uKnqRWcg3DrJ
	S2C3HK1MR6oUydNZXf5quqAk8bLBMKWush9VSSUnsme8Qg5jA+86uJyMCIQN8w4RfQ21
	z+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p1EXmQHXLJoeBfONFrBZTl1WVuYLAao/fQVY91QYyY4=;
	b=X6jOXRiKVohiea7bS3OnNNkWfB5+0hnqTZa4qEBBvUgZQdQ4vVpk2vATZkm2MazqWU
	/cAVKe+uVQUmEjbOImmNf/P6mRcFX36xexF/uJy87nbarlv7LLmlG677c8drgGqCFEIO
	A7549/+9ndE2dZqkcXFnWf5lN5nTdYhRmjg0E+R6ZWFybVBcUte6T3h6LAAejuCVNnsp
	tqcZozLP0XbDjZghGx2mf1t4ULLLmhuQWemxRCo1FiCzL/yXgAfnedCKCGD6clM6J3yp
	uGsbRpTh/Bcpx47s0wvneSY4ZB/jeCRz75G4MlSEbkjLjruQzCyjf8+4og5JTNLx4lpa
	7S5A==
X-Gm-Message-State: AHYfb5g0kwFCbXWs18U4vufexLCh8Z0ahSdY0uSumz/VnM6D9DQm1EzH
	l9mg3FZ6UjfI0tBdkbQ=
X-Received: by 10.28.208.132 with SMTP id h126mr3148557wmg.95.1503578048818;
	Thu, 24 Aug 2017 05:34:08 -0700 (PDT)
Received: from localhost.localdomain (boldrewood.soton.ac.uk. [152.78.0.15])
	by smtp.gmail.com with ESMTPSA id j96sm19921wrj.10.2017.08.24.05.34.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Aug 2017 05:34:07 -0700 (PDT)
From: Alexandru Tiniuc <tiniuc.alexandru@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 24 Aug 2017 13:33:50 +0100
Message-Id: <1503578041-79596-1-git-send-email-tiniuc.alexandru@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] Added recipe for the Singularity container platform.
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
X-List-Received-Date: Thu, 24 Aug 2017 12:34:12 -0000

Singularity is a container platform built on the principle of mobility
of compute.  It is designed to be used on HPC clusters and, unlike
Docker, it does not require root access to mount an image. In addition,
it can use Docker images out-of-the-box and it can pull them from the
Docker Hub. For more information, see singularity.lbl.gov

This recipe enables building the Singularity container platform.
Additionally, it creates a symlink from /usr/bin/python3 to
/usr/bin/python, as well as a symlink to where python3 expects
CA certificates to be.

I have tested it on a Raspberry Pi 3: I successfully built and run
arm32v7 images from Docker Hub. Make sure you have the right image for
your CPU architecture: it defaults to amd64.

Signed-off-by: Alexandru Tiniuc <tiniuc.alexandru at gmail dot com>
---
 recipes-containers/singularity/singularity_git.bb | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 recipes-containers/singularity/singularity_git.bb

diff --git a/recipes-containers/singularity/singularity_git.bb b/recipes-containers/singularity/singularity_git.bb
new file mode 100644
index 0000000..d0fbeb9
--- /dev/null
+++ b/recipes-containers/singularity/singularity_git.bb
@@ -0,0 +1,35 @@
+# Skip QA check for library symbolic links (core issue is a packaging problem within 
+# Singularity build / config: read up on the dev-so test for more info)
+INSANE_SKIP_${PN} += "dev-so"
+
+RDEPENDS_${PN} += "glibc python3 ca-certificates openssl"
+# Singularity expects to find python3 under the name python, therefore both
+# cannot be installed at the same time.
+RCONFLICTS_${PN} = "python"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYRIGHT.md;md5=be78c34e483dd7d8439358b1e024b294 \
+                    file://LICENSE-LBNL.md;md5=45a007b527e1a9507aa7fa869f8d7ede \
+                    file://LICENSE.md;md5=df4326b473db6424033f1d98a5645e30 \
+                    file://debian/copyright;md5=ed267cf386d9b75ab1f27f407e935b10"
+
+SRC_URI = "git://github.com/singularityware/singularity.git;protocol=https"
+PV = "2.3.1+git${SRCPV}"
+SRCREV = "e214d4ebf0a1274b1c63b095fd55ae61c7e92947"
+
+S = "${WORKDIR}/git"
+
+inherit pythonnative autotools-brokensep
+EXTRA_OECONF = "--prefix=/usr/local"
+
+pkg_postinst_${PN}() {
+    # Singularity requires "python" to resolve to "python3" within the commandline.
+    # This creates a symbolic link from python3 to python. A side-effect of this is
+    # that scripts which expect Python 2 may fail to run correctly.
+    ln -sr $D${bindir}/python3 $D${bindir}/python 
+
+    # python3 expects CA certificates to be installed in a different place to where
+    # they are actually installed. These lines link the two locations.
+    rm -r $D${libdir}/ssl-1.1/certs
+    ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl-1.1 
+}
-- 
2.1.4


