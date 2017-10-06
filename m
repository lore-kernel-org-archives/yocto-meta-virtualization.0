Return-Path: <limon.anibal@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7DA2E00CC6; Fri,  6 Oct 2017 10:32:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.218.67 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.67 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (limon.anibal[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79BADE00C35
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Oct 2017 10:32:54 -0700 (PDT)
Received: by mail-oi0-f67.google.com with SMTP id c77so28721391oig.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Oct 2017 10:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NFNndzDmJQMulDdjCCKQkINYvXVIRaC6PJf4fbQ9Ep0=;
	b=ukH6xlj3lV2m59p/2QZ2A7zk8Ftv/DIE0oaY6qX1x+ZKFDCy9vOaM9mz7V5COhv7Zk
	qV5mJWun6+EOghBSnIh/53XSB8KkxYUrYc0Zs3WrIusj8rJH3OFMxxVV6y2mm3dX59Co
	b7tljU4EJ9tDI7rTE2w6wEtCnSfBu52SeW1ShyF7cyvMqz9NaRUizJ1b879oI23GqlTE
	rKVHAjVNXqpxizmgM4B0Moa75LCo2znBhcS+GPzPTCDFI7IX7qCRr3/d7b65+afyiduP
	Mhuus4587pAGVGPQX/F/lsl5F2dlvLG3cPcKb0Ft22qJeaG8bX1A2RMxNfXb0eWAIeEB
	WytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NFNndzDmJQMulDdjCCKQkINYvXVIRaC6PJf4fbQ9Ep0=;
	b=aHhS/Nn1+mYFux/3uvXMitWiqr03AiFbH/FPNmZMUPHocC5FMOXixfXyl3F+nWZjd7
	xgujSivwkjlqB4jYBfcqQbjmPTAwW5mKmRb2oKaXz/dxgLxT1dFmIMbCNrD2yMYr47jr
	5VVM+sqbtkk981AzOAQyhmK6wZDO9i2bbHlabqDY/Lx0u8yRYTZxdnLm6E7Y7lhAHtJ9
	s0PnIA2B/se8OLjm9wRoEtFCcqQDWiHyEMfgrsSKlTflyTAvI8lpxe3zLndCbe3qn5SU
	4I2yk748r6bue78uvJkjibH+arHTd3IRNLKYtEwRcEmyWaQYeK+RoE2KNlDKMCr4zKkQ
	ZIeA==
X-Gm-Message-State: AMCzsaUR7FpGtgexs1mJlLkedkg5Mk2hSLRIJChEx06l3qE1xKYZBRcx
	QtNvd7EzI58tFXjSIeG8vp2aIKQY
X-Google-Smtp-Source: AOwi7QC8HEhT+uuORUhwPf5DvFDB9tleSS/h574Gfk6yh8vX/66nuaRi4YY9hBcSJwoZwyqIdY0H+g==
X-Received: by 10.202.72.147 with SMTP id v141mr1271273oia.139.1507311173378; 
	Fri, 06 Oct 2017 10:32:53 -0700 (PDT)
Received: from blackbox.Home ([148.240.201.158])
	by smtp.gmail.com with ESMTPSA id
	s203sm908033oif.12.2017.10.06.10.32.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 10:32:52 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  6 Oct 2017 12:32:48 -0500
Message-Id: <20171006173248.8373-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: nicolas.dechesne@linaro.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH] docker/containerd: Export GOARCH to fix build in arm64
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
X-List-Received-Date: Fri, 06 Oct 2017 17:32:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linaro.org>

If the GOARCH isn't set CGO took the ARCH from the host and tries
to use -m64 flag that isn't available in aarch64 compiler.

...
| # github.com/opencontainers/runc/libcontainer/system
| aarch64-linaro-linux-gcc: error: unrecognized command line option
'-m64'
| # github.com/containerd/console
| aarch64-linaro-linux-gcc: error: unrecognized command line option
'-m64'
| Makefile:60: recipe for target 'shim-static' failed
...

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 recipes-containers/containerd/containerd.inc | 1 +
 recipes-containers/docker/docker_git.bb      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/recipes-containers/containerd/containerd.inc b/recipes-containers/containerd/containerd.inc
index 18d9188..e7a3719 100644
--- a/recipes-containers/containerd/containerd.inc
+++ b/recipes-containers/containerd/containerd.inc
@@ -38,6 +38,7 @@ do_compile() {
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
+	export GOARCH="${TARGET_GOARCH}"
 	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 4d6c17c..d2dce76 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -97,6 +97,7 @@ do_compile() {
 
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
+        export GOARCH=${TARGET_GOARCH}
 	export CGO_ENABLED="1"
 	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-- 
2.11.0


