Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2946E008A4; Fri, 13 Oct 2017 12:27:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C138E008A4
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Oct 2017 12:27:32 -0700 (PDT)
Received: by mail-wr0-f178.google.com with SMTP id l1so1734484wrc.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Oct 2017 12:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2oNKbtzojty13vE4dY5YhaM854DS6K3/K33L4nlnFiQ=;
	b=NL+uD+HRrmv+uEEXklNFE/nPoVlyd59e4M5clkohJB2iUSK+tCzU01xKKCDAAhnxSq
	yrXTpJZ5NsTJA3Hs01uk4y927vsUu+P1MfRhz9aGfaSQVF1RJDMDyfsgBRTOSTKLep4I
	UVw87rRN3Yv0zvKj4qX1f1s7/U7LOOmNCJ2/fT/bVvnWHWSb5cwHNVezY8rI5ru92pn0
	ZKPE5o45Jj+lMfN7//bIgnnR9Ir+c1y4qs9+LEM9iiAH94llHbwpEtEzVAz9OY1DNVh2
	6MqdPjaLuf40tIkIsnhd++Sdwz+v5k/1QXjzxCq1VBkqTq53qFNIemNBdae2Ai8XJqCD
	/Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2oNKbtzojty13vE4dY5YhaM854DS6K3/K33L4nlnFiQ=;
	b=LaWqjFGk1vM4G+NHsaztRLvJcrGoyjqCbqPtgZOR/f0C2dU7xW5gl3NVd3MiuRagnH
	HNtY0f98xkYXZqJPKBnru+5hAsh8wWDmpVacWFUuOXPYsIvFcZ8lG/bO+6PBQf6+ZkXV
	HzwU2k1K6FT9hsrPgJuxo49phjM8Rx3GkRMXu7IH1MkyuouosAzSQF0XODMfI0+RboIO
	zJFSoO1RKIBNcu3On3vpfDF0+q1SgvbjObK8ccSkzRZwECFEQ5NwCv6h23PW9QJGLmnJ
	bwRxWmASIFnQIci9QdXerMpVOQEjzMAxUjbgD4aefboY1NAWfGaYnjIkWh0WTKh0H5b6
	Lwrg==
X-Gm-Message-State: AMCzsaVz6I8Qbwi1EUs6IaYBfBzzPK6S8rhKuypbjnOsEZsVIc7aTf2M
	EIv70sQ4QCxj5J/Xprk+qYGFu/OL
X-Google-Smtp-Source: AOwi7QBe9R+lqYIuOF9eRkmIa2R1/HFyePhgjTDstWteaArjie0MQsCVkbSE7AzaHCQINCjn7CA/6w==
X-Received: by 10.223.136.85 with SMTP id e21mr2427827wre.37.1507922851991;
	Fri, 13 Oct 2017 12:27:31 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id 69sm1846839wmm.2.2017.10.13.12.27.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Oct 2017 12:27:31 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 13 Oct 2017 19:27:13 +0000
Message-Id: <1507922836-17295-3-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507922836-17295-1-git-send-email-pbarker@toganlabs.com>
References: <1507922836-17295-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 2/5] runc-opencontainers: Drop unnecessary do_compile_prepend
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
X-List-Received-Date: Fri, 13 Oct 2017 19:27:34 -0000

The "vendor/src" symlink is already created in do_compile in runc.inc.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 recipes-containers/runc/runc-opencontainers_git.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 2cfceea..78488e0 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -10,10 +10,3 @@ PROVIDES += "virtual/runc"
 RPROVIDES_${PN} = "virtual/runc"
 
 GO_IMPORT = "import"
-
-do_compile_prepend() {
-	# Go looks in a src directory under any directory in GOPATH but
-	# runc-opencontainers uses 'vendor' instead of 'vendor/src'. We can fix
-	# this with a symlink.
-	ln -sfn . "${S}/src/import/vendor/src"
-}
-- 
2.7.4


