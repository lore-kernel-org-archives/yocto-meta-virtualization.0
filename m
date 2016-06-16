Return-Path: <paul.betafive@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EE563E00D94; Thu, 16 Jun 2016 12:06:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABB78E00D8B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Jun 2016 12:06:13 -0700 (PDT)
Received: by mail-wm0-f65.google.com with SMTP id m124so13549947wme.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Jun 2016 12:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q/wVUskxGHd6ts8MgKGlTUgUG4ktZ3gWHO8NxQpo3A0=;
	b=tHP3i5isR/6Rpcw5NP2813+1/gJOuTKcPTuHBISBL1bjBMduZ64kYwpp1Uuwq9wlOt
	tRYASDcR9zNbstX3XYMXcaj2BPXbHY9pxoyRl5URThJEeu2u3B4FcQEZoGtPHEY0XB4e
	Bbi7dMNcs9/GSVi8jmUSHdPmRG6PM1oJN0mJh7KfDOvSmpKH3ENZVdFVHDbrqAYyV0n3
	ztEVcR1VwAlYNxkwLgB00dcBlgy5KLm+iFU+QPgf3F5P/2of2LMaLUFacGZn8XJDG7Gl
	zgCgTYTV0dftjRzRyBTgZQ8fEj+RVofqxmcsrrE4ztzVq2N4ucg0Yu71tyP9N6d2ffI6
	A+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=q/wVUskxGHd6ts8MgKGlTUgUG4ktZ3gWHO8NxQpo3A0=;
	b=fNOtBRZJM+5m/VObCwTOgU8plu9Gno5ilmPb2CXSNW3PPUvrEP2Xj/F6+X8Xj2ILHk
	LsMoejqCM8yHMF1Oy7EkXbEZZnNgGqeS6d/HVIc3XnDhdJ94NalQ1v756QSgUmWceHev
	3qIwlKPePSgTmukv8KVixdN5vVEFPhLuk1P6/02txgK1fUtU3VK4IMCwFhoHFuTAnGsR
	CcJXxBzIiHvH8c4JhIMRNoNQ9V9bEIGjbNld7xGd7y8k/dbHMl75yqkPDaO2K4ud+Lmu
	oPKyzOg7DMRGkj2vBrE9LV2T/ktCzPKxWHTkRhaiX9dYjogLLKzBIJJvBnVtthmpQweU
	6Onw==
X-Gm-Message-State: ALyK8tKxCPi8KaPFHZUbkkruczVg7LcbIPNIdJ4V5wdfbqQ1lLUPYLBvUcudZ5MlXRFKgg==
X-Received: by 10.28.20.139 with SMTP id 133mr17094549wmu.19.1466103972923;
	Thu, 16 Jun 2016 12:06:12 -0700 (PDT)
Received: from dev-jessie.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net. [86.27.96.131])
	by smtp.gmail.com with ESMTPSA id
	r6sm16243317wme.14.2016.06.16.12.06.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jun 2016 12:06:12 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: meta-virtualization@yoctoproject.org
Date: Thu, 16 Jun 2016 20:06:29 +0100
Message-Id: <1466103989-25752-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466103989-25752-1-git-send-email-paul@paulbarker.me.uk>
References: <1466103989-25752-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 2/2] runc: Use go-osarchmap to set GOARCH
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
X-List-Received-Date: Thu, 16 Jun 2016 19:06:16 -0000

When building for qemux86 the following error was encountered due to GOARCH
being set incorrectly:

    compile: unknown architecture "i586"

This can be fixed by using the go-osarchmap class.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 recipes-containers/runc/runc_git.bb | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/recipes-containers/runc/runc_git.bb b/recipes-containers/runc/runc_git.bb
index b47914e..955ea93 100644
--- a/recipes-containers/runc/runc_git.bb
+++ b/recipes-containers/runc/runc_git.bb
@@ -28,15 +28,10 @@ LIBCONTAINER_PACKAGE="github.com/opencontainers/runc/libcontainer"
 do_configure[noexec] = "1"
 EXTRA_OEMAKE="BUILDTAGS=''"
 
+inherit go-osarchmap
+
 do_compile() {
-	export GOARCH="${TARGET_ARCH}"
-	# supported amd64, 386, arm arm64
-	if [ "${TARGET_ARCH}" = "x86_64" ]; then
-		export GOARCH="amd64"
-	fi
-	if [ "${TARGET_ARCH}" = "aarch64" ]; then
-		export GOARCH="arm64"
-	fi
+	export GOARCH="${TARGET_GOARCH}"
 
 	# Set GOPATH. See 'PACKAGERS.md'. Don't rely on
 	# docker to download its dependencies but rather
-- 
2.1.4


