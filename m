Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 13D86E00DE5; Tue, 20 Dec 2016 01:25:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B100CE00DF0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Dec 2016 01:25:45 -0800 (PST)
Received: by mail-lf0-f47.google.com with SMTP id y21so71868335lfa.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Dec 2016 01:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rAz6vZ/AjpcHpbAPqlty2BKRBFG8IpLjHk4Ap+3xrhI=;
	b=JZKjFeKb9wS5QSpBF6jMuktuS1E353621gx42MKiXZXaVxtbZnzwLNk8pec5/lf6SF
	R0RycjBBunJhhpSbJoNJXKLHx3barqNEnCW4rrbtHeIuT+M8E5J0fuNzQ5alqvy18dUG
	zD9QVOzBbZ8DmgS1URa062LYKq+HhDUw3dTHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rAz6vZ/AjpcHpbAPqlty2BKRBFG8IpLjHk4Ap+3xrhI=;
	b=lkS2a8OHikvfS8gCODqet+lbD9Dpa0254wtHkUvf08kKMc3r2ChlBbClFUGDrpOAA9
	BDP8B/pIz7RCzF9eDW5mmp2kVJ8hfELfVZudyYWVMBp32JLRAJr08rCiaEQM9XUodpeQ
	nsWYM85MTCtG2MMlT9+TlrM9YcsusFmaa/e3HuueIDvCAXrBlFfkQ8QuxX/i1B+/si9f
	6CkwRGC2AElLDInkT2iadnNxnymS5cIWr9DUKgAz/zlcArKzNFiUWBAajDl2zaAvYVx9
	FkAQPFUWhqUIkwjQTpZ2TFKI5ZRsAhi8X2OFAcHTj6bWAHurDVSPIWbKu0XGLnkszCgL
	B50Q==
X-Gm-Message-State: AIkVDXJyzC6Ae5wgKORsGaG+KYl3PbwI10X7FEWuRM40qq20DjIZ5wNamSdXS2qUz6PZ76v+
X-Received: by 10.25.16.164 with SMTP id 36mr446433lfq.75.1482225944070;
	Tue, 20 Dec 2016 01:25:44 -0800 (PST)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	l135sm4558020lfe.10.2016.12.20.01.25.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Dec 2016 01:25:43 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-virtualization@yoctoproject.org
Date: Tue, 20 Dec 2016 11:25:34 +0200
Message-Id: <20161220092535.9066-3-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161220092535.9066-1-fathi.boudra@linaro.org>
References: <20161220092535.9066-1-fathi.boudra@linaro.org>
Cc: bruce.ashfield@windriver.com, koen.kooi@linaro.org
Subject: [PATCH v2 3/4] docker: use a switch to set GOARCH based on TARGET_ARCH value
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
X-List-Received-Date: Tue, 20 Dec 2016 09:25:59 -0000

It allows to:
* easily extend future architecture added/supported
* tune arm architecture and set GOARM as appropriate

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-containers/docker/docker_git.bb | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 37df3c4..d163b13 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -66,14 +66,29 @@ DOCKER_PKG="github.com/docker/docker"
 do_configure[noexec] = "1"
 
 do_compile() {
-	export GOARCH="${TARGET_ARCH}"
-	# supported amd64, 386, arm arm64
-	if [ "${TARGET_ARCH}" = "x86_64" ]; then
-		export GOARCH="amd64"
-	fi
-	if [ "${TARGET_ARCH}" = "aarch64" ]; then
-		export GOARCH="arm64"
-	fi
+	case "${TARGET_ARCH}" in
+		arm)
+			GOARCH=arm
+			case "${TUNE_PKGARCH}" in
+				cortexa*)
+					export GOARM=7
+				;;
+			esac
+		;;
+		aarch64)
+			GOARCH=arm64
+		;;
+		i586|i686)
+			GOARCH=386
+		;;
+		x86_64)
+			GOARCH=amd64
+		;;
+		*)
+			GOARCH="${TARGET_ARCH}"
+		;;
+	esac
+	export GOARCH
 
 	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
 	# docker to download its dependencies but rather
-- 
2.11.0


