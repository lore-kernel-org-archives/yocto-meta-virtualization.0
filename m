Return-Path: <fabio.berton@ossystems.com.br>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C3E8E00DCE; Tue, 30 Jan 2018 10:02:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A795E00DBA
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jan 2018 10:02:39 -0800 (PST)
Received: by mail-qk0-f194.google.com with SMTP id d21so11266118qkj.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jan 2018 10:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=Zb/0tjfE7nGD0kb9xJr/QPbVY0o6JPb6aQwy1Vg25HM=;
	b=TeLb2+EIEFtorW9sxsCd7BXrJjki5yhW41u+14O8v3sFI/d/aUgmBLEnQxeR7qHcuf
	yoH2JQtprCsKns9jDayjnmhUXbtITFqa5dN4lFIX0IMFH2nHcUfSshXZcbLxLbqt77s2
	bHpzMH3gMeu1SZqwzPs/BuXSqF9C3nPeMdCVyGvLyUQXn+iHA8EGvuM37kRi+Bg+C7iY
	2Q2iEPQaVIeia3JyDgu4juGWGzo8yzj2gsi9t65e3kZOj/4A1cxZGM2M03+DgpjxZ5wH
	Zmp2gnwWBhPeNktcm85I33QFQ33uw952V1didWokNBr7I7eqvOD18l9WtP6cq0t7FaBG
	yx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=Zb/0tjfE7nGD0kb9xJr/QPbVY0o6JPb6aQwy1Vg25HM=;
	b=C8f7Y7Ed4hNDdyo6nB0gjuRrHz7H5/5rfnL7BtAgMOShNOpsCHJyaLb0argMIMpA36
	ik7HA9EOBBmWkj2hhXiKdTtkMxG8z7VfVEtVK6B9KklAg8ltKj8aCbMeGI7Rf4KwxVyn
	g0XxFSXuUNyaqYDbJWBJtKLRzkGpljRpI6ASM6FRYCYQ/icoE5LQimh8TSyBHtHsDEF3
	+H0iFnRymS31S2D1UMqYUJR4ShNjs1lGmmJRuAnNrS08wggeAyIrRwmSMERgRxGotU5q
	e4kPifaDvaetSw59RNHnC1E8xIj4XpEFovB975gygTyY/m3M2/X7LFJCyEH/Vbq9Me1c
	V8NA==
X-Gm-Message-State: AKwxyte2bVJzTAKBj50g/2hjsOwDVP4pyWDd/ssjukqDpFBX7IHx2yc9
	VWij0HSOam9GSj6lV1syq+Uy0v7j
X-Google-Smtp-Source: AH8x225GXxQSoXo4S7bGJrVwbSvu2MaPbhkqsytyX9zoZU5v2zt28W8p+UT0Gb4qghDCUgVaR6xlgA==
X-Received: by 10.55.103.205 with SMTP id b196mr43038174qkc.227.1517335358782; 
	Tue, 30 Jan 2018 10:02:38 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	l24sm12379057qtb.65.2018.01.30.10.02.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jan 2018 10:02:37 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: meta-virtualization@yoctoproject.org
Date: Tue, 30 Jan 2018 16:02:20 -0200
Message-Id: <20180130180220.10190-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [krogoth][PATCH] docker: override GOROOT at build time
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
X-List-Received-Date: Tue, 30 Jan 2018 18:02:41 -0000

From: Yunguo Wei <yunguo.wei@windriver.com>

Usually $GOROOT is set by go tool, but if sstate is specified, $GOROOT
is set to the path in the first project. If docker is built in the
another project(with same SSTATE_DIR) later, and the first project is removed,
the following error will be seen:

| go: cannot find GOROOT directory:
/path/to/previous/project/bitbake_build/tmp/sysroots/x86_64-linux/usr/lib/x86_64-wrs-linux/go

This commit is overriding $GOROOT stored in the go tool in sstate cache,
making sure it is set to the correct path in current project.

See more information here: https://golang.org/doc/install#install

Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
(cherry picked from commit 01aa8f18196d76d4554649c47348fb68277574c5)
---
 recipes-containers/docker/docker_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 42a336e..898957b 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -80,6 +80,7 @@ do_compile() {
 	mkdir -p .gopath/src/"$(dirname "${DOCKER_PKG}")"
 	ln -sf ../../../.. .gopath/src/"${DOCKER_PKG}"
 	export GOPATH="${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
+	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
 	cd -
 
 	# Pass the needed cflags/ldflags so that cgo
-- 
2.14.2


