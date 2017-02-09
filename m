Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F628E00A80; Wed,  8 Feb 2017 23:25:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.51 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.51 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 094A6E00A51
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Feb 2017 23:25:08 -0800 (PST)
Received: by mail-lf0-f51.google.com with SMTP id x1so96099364lff.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 08 Feb 2017 23:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=ECBKL44xEmhc5LfRHwTdMBtu2PWtJ8Ij2hTedFbCqps=;
	b=kLQJ+7fLKvns055tHpZT/6xsy+AP7aNQgnX3zGgW1KGGBdhVYjGg/3WejhxYOWd1ud
	nqZLRn8sRvh6y/8S+0Olt+aDG2LcAZEEIoeak5MCt8q6ZIAb+3oJYCpUxu+zfw1OnPxn
	RnJEmFgA7vEySH+iA1ugynMs8B3ei1bsm9SUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ECBKL44xEmhc5LfRHwTdMBtu2PWtJ8Ij2hTedFbCqps=;
	b=ZBGYNsvUHeEkKqtrfiqiDPkpDdAfHTK83MktkCTdQXAhM1Qat2yIc4y3/AVmA4tY1Q
	NIiNuq7LpsZJgp9QDESvlkMhgydWB0tXNrLBFXlmG31DRU9PnfghI2cWbnRwYH/ilcNi
	ghxSG1qqW6c+c4KieR/zY8w1+6DsYP8q7tpyrx2c89vHoM6O2sgczQppAx8LgvRFuWBR
	FOl2gYI10KC70/6hEBJaM1fu3GGSR+dqyh0eqWezApfY4zCBwkXBFFWD78de0ET+oWxB
	ZieannPZzXXcgfFPeXQPykVo562SmJVIkRRGdDSmFzYt06CWBNAbgUmFTlAIDd3wgRRP
	veGw==
X-Gm-Message-State: AMke39m2/d45szs10XZnVvnlQmHI84TtYAGan4qKMkR47cKTxFTyuiIT/m+1dh6k13pO/8tI
X-Received: by 10.25.72.20 with SMTP id v20mr463449lfa.46.1486625107585;
	Wed, 08 Feb 2017 23:25:07 -0800 (PST)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	j11sm3145476lfd.23.2017.02.08.23.25.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 23:25:06 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-virtualization@yoctoproject.org
Date: Thu,  9 Feb 2017 09:25:01 +0200
Message-Id: <20170209072501.19696-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: bruce.ashfield@windriver.com, koen.kooi@linaro.org
Subject: [PATCH] docker: downgrade lxc/docker-registry/rt-tests to suggests
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
X-List-Received-Date: Thu, 09 Feb 2017 07:25:15 -0000

Regular users don't need lxc, docker-registry and rt-tests on the target.
These tools aren't even needed or provide additional features when running
docker at runtime. They also increase the size of the image uneccessarily.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-containers/docker/docker_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index c208a02..81fd4d4 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -61,8 +61,8 @@ RDEPENDS_${PN} = "curl aufs-util git util-linux iptables \
                   ${@bb.utils.contains('DISTRO_FEATURES','systemd','','cgroup-lite',d)} \
                  "
 RDEPENDS_${PN} += "containerd runc"
-RRECOMMENDS_${PN} = "lxc docker-registry rt-tests"
-RRECOMMENDS_${PN} += " kernel-module-dm-thin-pool kernel-module-nf-nat"
+RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
+RSUGGESTS_${PN} = "lxc docker-registry rt-tests"
 DOCKER_PKG="github.com/docker/docker"
 
 do_configure[noexec] = "1"
-- 
2.11.0


