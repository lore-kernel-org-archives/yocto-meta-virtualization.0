Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 189DBE00DA7; Tue, 20 Dec 2016 01:25:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.215.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.54 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 319B4E00D92
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Dec 2016 01:25:42 -0800 (PST)
Received: by mail-lf0-f54.google.com with SMTP id t196so71960659lff.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Dec 2016 01:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=cdJoOtmCU/KysbccjxzY5cY55IDwEq7Pkx0MF4sJcc0=;
	b=fW+m6rtQHL/eXCC1xmJ/sA5s4X5EIioTIbLGrYzbL+Apwnjpe1n7a2CI2bAykM5o2l
	/LhWIfagecHhOCqKJtzEZXtYZtIdigP1v72AhRcBUxh6aMWXyA4RxhSOKYswRHmJVR80
	TnH//kbj7k1//HD8eBFWmYRa6VAk9IqNNEMM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cdJoOtmCU/KysbccjxzY5cY55IDwEq7Pkx0MF4sJcc0=;
	b=Vi4Xrj2iujVZy5Da8/CBTaDo5NogJHtR0ioR73qwexFkGi+0fg7B6iZH2Pivmjlt42
	+c7J7Q0pV69pgE9gWGhdsJmNusezObloASnNInOB7k1/7hJ4QIpxq4tuECg/aRinb8MM
	MO0IpQjDtk+4UZp3QgO+2Ve61ILdn49whVT5TjfNzsM6nqxOS2mmQYldUOxbiSY8HjB3
	VFahQf1izwuiXT5/pEb7RIiJXXFT3Es8FHP59CsxROSmPwo1ghIK8L5Z/npHuwX+eX3f
	AhoaS46hlP+BSZ3S9TTzl7PSvGhrHt1S+jdffXQTxmqR0qfstrwCMrs4ZnA1rgQlYH8L
	nptw==
X-Gm-Message-State: AKaTC00QzjPsqp334jSFhayUtHX7qyrpdfMzrkTczBs7SpkrBx9JH9I8tWsTxAe+c5668OuU
X-Received: by 10.25.199.198 with SMTP id x189mr7524843lff.164.1482225941640; 
	Tue, 20 Dec 2016 01:25:41 -0800 (PST)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	l135sm4558020lfe.10.2016.12.20.01.25.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Dec 2016 01:25:40 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-virtualization@yoctoproject.org
Date: Tue, 20 Dec 2016 11:25:32 +0200
Message-Id: <20161220092535.9066-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: bruce.ashfield@windriver.com, koen.kooi@linaro.org
Subject: [PATCH v2 1/4] docker: update to docker 1.12.5 release
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
X-List-Received-Date: Tue, 20 Dec 2016 09:25:56 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-containers/docker/docker_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 2cff6f1..f50f25a 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
  subtle and/or glaring issues. \
  "
 
-SRCREV = "34d9a8240914d30f3a8fe28c1b7d1d4e36d0657b"
+SRCREV = "7392c3b0ce0f9d3e918a321c66668c5d1ef4f689"
 SRC_URI = "\
 	git://github.com/docker/docker.git;nobranch=1 \
 	file://docker.service \
@@ -32,7 +32,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
 
 S = "${WORKDIR}/git"
 
-DOCKER_VERSION = "1.12.0"
+DOCKER_VERSION = "1.12.5"
 PV = "${DOCKER_VERSION}+git${SRCREV}"
 
 DEPENDS = "go-cross \
-- 
2.11.0


