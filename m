Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58D0EE00480; Fri, 20 Jan 2017 00:34:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.49 listed in dnsbl.sorbs.net]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.49 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA3BAE003E1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 00:34:23 -0800 (PST)
Received: by mail-lf0-f49.google.com with SMTP id v186so52738560lfa.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 00:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=A5jf+sAkWplQmTy9gBdilhw/QLCgIK+Sj3hHfDtIN7c=;
	b=FPyTecyOEE8jcsAqw0lhyZIKWx78wyXK6kckz0FC+EtsLvW1mC8DB0wC9yk5XqA6lA
	d4UkQIJomgQ9vq80LHYez7ppk8k+WYVII4iBI8JHo8orZlAghqiViAFKXnmARgvjNlDY
	4EcjCVmQkdl7qrhv6/2ukY8W9497Jgz6ZiFOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=A5jf+sAkWplQmTy9gBdilhw/QLCgIK+Sj3hHfDtIN7c=;
	b=ZjHX9A/Ch9sKk3Wly03AEzVgwcB9P4ye1bftonXMQG91L2LcfoasYz3Bwx+ROvBWf/
	u1CeOSiVGm34AJ3wODh1iIuKl73xf9xEJvI8uDAb5Bc70c9KcZYfFXkb/C2eLzOBmCbC
	VQvsIeH9La1XYBc7H2yDJ4CTKqtaniu+bzsdCjWWGsVk6fQLjEZCm3gb4Drpe3ctJowq
	1VeoH9uSn5Qh+yiDQ1+HLQnW6OqO0nt9Q770rJCdhOooI9fFNR16nx4GXJozygvRSAP1
	x75sWjtaY0OGEYIKfJoBUQFQZ9tPg+QKmcz2R2maf5FwM1boQyANpjUUQFNamgAVRCZ9
	eMtw==
X-Gm-Message-State: AIkVDXKGKyZHC6CflNmN/wxSVU8wepbn3XWWhwOQrUBw+SeJYxH0BTg4UyThKKTODYJclSNK
X-Received: by 10.25.204.197 with SMTP id c188mr3852596lfg.107.1484901262076; 
	Fri, 20 Jan 2017 00:34:22 -0800 (PST)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16])
	by smtp.gmail.com with ESMTPSA id v26sm3041155ljd.9.2017.01.20.00.34.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jan 2017 00:34:20 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-virtualization@yoctoproject.org
Date: Fri, 20 Jan 2017 10:34:15 +0200
Message-Id: <20170120083415.5677-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH] docker: update to 1.13.0 release
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
X-List-Received-Date: Fri, 20 Jan 2017 08:34:25 -0000

Adjust SRCREV and DOCKER_VERSION to match docker 1.13.0 release.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-containers/docker/docker_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 62a016a..1eb24a5 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
  subtle and/or glaring issues. \
  "
 
-SRCREV = "7392c3b0ce0f9d3e918a321c66668c5d1ef4f689"
+SRCREV = "49bf474f9ed7ce7143a59d1964ff7b7fd9b52178"
 SRC_URI = "\
 	git://github.com/docker/docker.git;nobranch=1 \
 	file://docker.service \
@@ -32,7 +32,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
 
 S = "${WORKDIR}/git"
 
-DOCKER_VERSION = "1.12.5"
+DOCKER_VERSION = "1.13.0"
 PV = "${DOCKER_VERSION}+git${SRCREV}"
 
 DEPENDS = " \
-- 
2.11.0


