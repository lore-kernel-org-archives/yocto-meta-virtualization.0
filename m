Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B08C4E009BC; Thu,  9 Feb 2017 13:54:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36859E0094C
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Feb 2017 13:54:04 -0800 (PST)
Received: by mail-lf0-f52.google.com with SMTP id x1so10644125lff.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 09 Feb 2017 13:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=XJssUPh/ckvIEM46P366grw6j2DgplZ5r7oFypqbcoc=;
	b=XhuO5o4fmQ+Mkesa0GCW+AtDe0HEuxKT9BFmyJcGZ4f5ERtHTd8GBvupU+CDMFne6P
	rKH5o/gR7AAajS8hIKnI26JB1ED2l9lcc4asxxGCUiVWF6/9KFL7cwLWKH9Zepx9HVa8
	dsvMieZrBlN8HXgwsfrqKzWtSkIT6rwYH5QSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XJssUPh/ckvIEM46P366grw6j2DgplZ5r7oFypqbcoc=;
	b=VJT08ap/X3FkP0/Q3lAxnnF3Uj+gc0OVuSaFpAg9nS6aT78m6tO7zY9yCI2miqSbpE
	9SrYidJ3y9voz54FvmsEMPEsrUl5RTH5CdjdLLs4U7BozGEt5yEiydfhiQbWSdDo5tsa
	92u3hDjeQILunJN0+YaWnIcLMPnSKxbIgWvNM7UF32KEmRZq1PIcFHn8xUNoHaEqHjGm
	Uwm5ZKVP43tJse+raOjsNK/cTjiejQiZfZvhOqIIb2vS9ES0MEzEeKFP4cY5HCIta8Q0
	MPKIdCAivRgZLYUTOYPDqaaNcSgPoHH2v4r7nxaqPbjWyVGzh/eYMRjxa9jIpe0+hzkW
	D4bg==
X-Gm-Message-State: AMke39kUbPOZK69A7Y/1KgQqxjIw4/tUsiN/ONSfPOQZYhp1w1ojpLEMwfsXsrzW5frCTnqM
X-Received: by 10.25.25.8 with SMTP id 8mr1965544lfz.164.1486677243567;
	Thu, 09 Feb 2017 13:54:03 -0800 (PST)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	b18sm3878607lje.13.2017.02.09.13.54.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Feb 2017 13:54:02 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-virtualization@yoctoproject.org
Date: Thu,  9 Feb 2017 23:53:58 +0200
Message-Id: <20170209215358.4272-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: bruce.ashfield@windriver.com, koen.kooi@linaro.org
Subject: [PATCH] docker: update to 1.13.1 release
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
X-List-Received-Date: Thu, 09 Feb 2017 21:54:09 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-containers/docker/docker_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 009fe9f..d288898 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
  subtle and/or glaring issues. \
  "
 
-SRCREV = "49bf474f9ed7ce7143a59d1964ff7b7fd9b52178"
+SRCREV = "092cba3727bb9b4a2f0e922cd6c0f93ea270e363"
 SRC_URI = "\
 	git://github.com/docker/docker.git;nobranch=1 \
 	file://docker.service \
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
 
 S = "${WORKDIR}/git"
 
-DOCKER_VERSION = "1.13.0"
+DOCKER_VERSION = "1.13.1"
 PV = "${DOCKER_VERSION}+git${SRCREV}"
 
 DEPENDS = " \
-- 
2.11.0


