Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 283E5E00DF0; Tue, 20 Dec 2016 01:25:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56167E00D9D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Dec 2016 01:25:46 -0800 (PST)
Received: by mail-lf0-f51.google.com with SMTP id c13so71989190lfg.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Dec 2016 01:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jTQMc17MV0MOfVd26CICCkKVU6f75DVVfJe2UiM+gqs=;
	b=OZO6mRNNEyX4jYHK07x1IJMItK+3+LesUq7WogsP4GO/vQNmFCzX1gze9mBu848U7k
	ebdgaxFZvrNHDzRnsLNEV/PYYlqOMwLl/FySJw6Joh5jVOGcoT5tprIDZKN5qLren9+j
	JY2pMrBJqlkze5FJzXH3kQcgQnQKNA2rAzfFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jTQMc17MV0MOfVd26CICCkKVU6f75DVVfJe2UiM+gqs=;
	b=mKqBFKtBCDzCgHpLuJc1lZQXz+Wl+xwjOHhaBrJlZnvyDVOlXL+FQoTEZo4ewrOVN8
	qA3jJ+rTlPAOx40fKMOCvMD7NJAQjBdfZoUHYHjU4vGDtuCxhiXyyjIWL7K+qVLS0cUG
	FsRoV7L9xwmGTGrvXFpHIQ8/vF7fW4jprKElgAGUE7NWO2zUwN8D87VVJwjPoEmpJhio
	w8Ep6uoRDmUbdaPy+4s1SiaHoewPOdkT6+K/6j6NfQwHlNGl+e3cjKKPJWDGYELM/I0J
	qgAJVZY2kgcIvPIM472Jw9Ts2XEsemIuDUQqX+bDVHA+mKkH/Ukb6zkOikmDRFn3nM2l
	Wq0w==
X-Gm-Message-State: AIkVDXJ2ey08MwDXYz2MAGUlaXHMkIjx12fwfcQdN2LSzzeCg3OmNfOJnu1bIWv/X/nVtJs2
X-Received: by 10.25.56.7 with SMTP id f7mr2329035lfa.17.1482225945232;
	Tue, 20 Dec 2016 01:25:45 -0800 (PST)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	l135sm4558020lfe.10.2016.12.20.01.25.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Dec 2016 01:25:44 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-virtualization@yoctoproject.org
Date: Tue, 20 Dec 2016 11:25:35 +0200
Message-Id: <20161220092535.9066-4-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161220092535.9066-1-fathi.boudra@linaro.org>
References: <20161220092535.9066-1-fathi.boudra@linaro.org>
Cc: bruce.ashfield@windriver.com, koen.kooi@linaro.org
Subject: [PATCH v2 4/4] docker: cosmetic - fix indentation
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

cosmetic only, no changes in behavior:
* align all the DEPENDS, better readability
* fix indentation in do_install(): space -> tab

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-containers/docker/docker_git.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index d163b13..62a016a 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -35,7 +35,8 @@ S = "${WORKDIR}/git"
 DOCKER_VERSION = "1.12.5"
 PV = "${DOCKER_VERSION}+git${SRCREV}"
 
-DEPENDS = "go-cross \
+DEPENDS = " \
+    go-cross \
     go-cli \
     go-pty \
     go-context \
@@ -136,9 +137,9 @@ do_install() {
 		install -m 644 ${S}/contrib/init/systemd/docker.* ${D}/${systemd_unitdir}/system
 		# replaces one copied from above with one that uses the local registry for a mirror
 		install -m 644 ${WORKDIR}/docker.service ${D}/${systemd_unitdir}/system
-        else
-            install -d ${D}${sysconfdir}/init.d
-            install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
+	else
+		install -d ${D}${sysconfdir}/init.d
+		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
 	fi
 
 	mkdir -p ${D}/usr/share/docker/
-- 
2.11.0


