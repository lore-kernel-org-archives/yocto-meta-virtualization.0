Return-Path: <koen@dominion.thruhere.net>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4BF29E00C80; Mon, 23 Jul 2018 07:49:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.208.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA94AE00C58
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 07:48:56 -0700 (PDT)
Received: by mail-ed1-f65.google.com with SMTP id r4-v6so1202803edp.9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jul 2018 07:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=95Vf3VMCvzPMYSKm/BNlC3xW/ZL09qiP0TzBShiy8Os=;
	b=khwSkh0bkIWYBjHM2T30SZbU7P84lgl+zvfsS/9GbXUpoB8qzI5T7mI4WxcPs1uoin
	q/ZkMO4yZOwlHQz6Y2qzcRCvk3IApbFVhlns9CpOHE3X9OdYUrkvxG8XzupXddiv3qDt
	whnWGJdYG/V9VKALiZcDRiSsxRIumgXrFoWgFKLr9xgmhkOBbrHh8Xct8hQQvI9K9u2j
	c81MWa/au4aqW9U7amYmmWplo3zbkBbiu3Z+MvH2kK0dOXhT2aKIpyaOSguBpGrQW1Xy
	Wz2YULFDDkSfmf8n/CTEY7M0rr4TLB8jNP1vSVz28XiEFM6NDGUivqFxK9po+c/tlE56
	FxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=95Vf3VMCvzPMYSKm/BNlC3xW/ZL09qiP0TzBShiy8Os=;
	b=jMegm9YGb9fCqwtLs5g3UOwwoDY1Mkk5Pto7lkozPz8l6fFzOXeD/5iZjYUsZFiYH4
	y+CDn+kG5SrItGJ2JOtyiwIE4OFyMyoZRY0i4jT3tTHfb+r5nlO3b1yv01oxAp5em9ka
	4YrXNjyFxFOAECFAOhzUlLRk4bkwot2QSsq/+Fic0Rd0ojDa5nlc1y92MsYLWPJOBpei
	xApDqTsvSQzcQlCRBKO3otnilOPWfJftqH03VcZBtvKz1DCbVHK+nLgH7w5wtzzAu5y6
	nuCYbwS28WHIythOdLb6RnXtFwGbSpzAXk0arO5GUNjImsF5gDjm8njUk/p2frM4KBMd
	vfpw==
X-Gm-Message-State: AOUpUlHHdGnED4nHGlxvrNuZD47g+NUOVfgaBD4RIo71Df237EbXAuX/
	ppk93HQQrugGbgR/MD+hkpvSRTDrm6Q=
X-Google-Smtp-Source: AAOMgpff4GjCfETkGig3+Ba2wNCPnAE+TUyePyOKV/BEige2MP+4M21e5uBZQODdDlGxEICbe3CjCg==
X-Received: by 2002:a50:9154:: with SMTP id
	f20-v6mr14217768eda.29.1532357335596; 
	Mon, 23 Jul 2018 07:48:55 -0700 (PDT)
Received: from localhost.localdomain ([82.163.40.65])
	by smtp.gmail.com with ESMTPSA id
	w26-v6sm4479189eds.7.2018.07.23.07.48.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 07:48:54 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: meta-virtualization@yoctoproject.org
Date: Mon, 23 Jul 2018 16:48:48 +0200
Message-Id: <20180723144850.17279-2-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20180723144850.17279-1-koen.kooi@linaro.org>
References: <20180723144850.17279-1-koen.kooi@linaro.org>
Cc: Raymond Danks <ray.danks@se-eng.com>, Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 2/4] kubernetes: build host tools using host toolchain
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
X-List-Received-Date: Mon, 23 Jul 2018 14:49:00 -0000

From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>

Compile host tools such as deepcopy-gen, defaulter-gen, openapi-gen
   for host architecture, to solve below error:
-- snip --
| +++ [0117 05:31:35] Building go targets for linux/arm64:
|     ./vendor/k8s.io/code-generator/cmd/deepcopy-gen
| touch: cannot touch '_output/bin/deepcopy-gen': No such file or directory
| make[1]: *** [Makefile.generated_files:323: _output/bin/deepcopy-gen] Error 1
| make: *** [Makefile:478: generated_files] Error 2

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 33cb933..f23721c 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -73,6 +73,12 @@ do_compile() {
 	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
 	cd ${S}/src/import
+	# Build the host tools first, using the host compiler
+	export GOARCH="${BUILD_GOARCH}"
+	make generated_files KUBE_BUILD_PLATFORMS="${HOST_GOOS}/${BUILD_GOARCH}"
+
+	# Reset GOARCH to the target one
+	export GOARCH="${TARGET_GOARCH}"
 	# to limit what is built, use 'WHAT', i.e. make WHAT=cmd/kubelet
 	make cross KUBE_BUILD_PLATFORMS=${GOOS}/${GOARCH}
 }
-- 
2.9.5


