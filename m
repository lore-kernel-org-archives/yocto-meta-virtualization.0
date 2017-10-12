Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04134E00D28; Thu, 12 Oct 2017 09:50:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.42 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.42 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5758E00CC0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 09:50:32 -0700 (PDT)
Received: by mail-wm0-f42.google.com with SMTP id m72so24803960wmc.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EyqSrtdi1+swDe3JDh3H7uEmp8cNeU5sfZFsqDDx2X8=;
	b=VZ/037DdDtXypEhIGXPSKokPPINwHxnEnKpbHasFH+Icg5zXhwLUDDacbnjoAaOAz5
	F3IH8r5IuuGofzEhTV+AL3MSabFqYalGFxjnWR3d+7mSAMHCGGF3LnFUcui1Pu9/9lQO
	jO2l9JOryRoBh/iiBXxpHAvmMxwiYNrVFQKUYC5g1fd0wfuALPZypFi81KrMTpfNMyn9
	uPkmzw8R+ux/gRxm2OX/xssdQPKCTpFn0lyQ9cyR0g512fFRB3wx7n+n6X3vF9/vgFCF
	HzfIwW0gCtsMXHwehUwU5El75Jql7sHQApm4JL5WB38Yjva3vHMOeCgfon9jqtDazxp6
	Tn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EyqSrtdi1+swDe3JDh3H7uEmp8cNeU5sfZFsqDDx2X8=;
	b=afeDTUfOs7bc+KOp+tRWRdGtonO2PPMGvp6wCQieZIxVH2cEYv4x87doYC6fh9JNXG
	55EFPsdOH08szAhu8jb6Oe2BaolimChMzi905+Tvcq+h1/kZiGbioN6MAZn57NMaZ+ZK
	P4/XhIlzc8kZ7cm7zA3p9PAdnkfYd9RvQg906YBO8ggqidCNeurckuFfxd0eHp2vQykV
	G74EDWPoo2E0jAdyMrPWTn1gTnNgOQykBAAyWfHcl7H4DvmTNch6D/4jzhKA6zXsT+B5
	M6hwwvGNGI4GtQ3EjstFS6qSCratG8t9z/yPa84GsfNKgiiyUVgKNqUP17cOrLl1PnEp
	5DuQ==
X-Gm-Message-State: AMCzsaW+kzQly7255qXfBGC/BRr8Nd7u+OYmyLNQkLkkehFce1HEcrDl
	y2lW42qygrRkmzJKDytN3DjwkgIh
X-Google-Smtp-Source: AOwi7QBUoOWTTzPLyt0GpDQOFCBDXUdX+5jMiXWvM1H+Dd3VnryVt3uejOdYnZDmOOlRePhnz0yJnA==
X-Received: by 10.223.157.203 with SMTP id q11mr2952299wre.131.1507827031312; 
	Thu, 12 Oct 2017 09:50:31 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	h201sm756969wmd.27.2017.10.12.09.50.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Oct 2017 09:50:30 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 12 Oct 2017 16:49:56 +0000
Message-Id: <1507826997-28383-4-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507826997-28383-1-git-send-email-pbarker@toganlabs.com>
References: <1507826997-28383-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 3/4] runc-docker: Disable building recvtty
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
X-List-Received-Date: Thu, 12 Oct 2017 16:50:35 -0000

The recvtty demo/reference application has cross compilation issues when
targeting aarch64 platforms. As it is just a demo application and is not usually
used, we can just patch the Makefile to disable building this application.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 .../0001-Disable-building-recvtty.patch            | 26 ++++++++++++++++++++++
 recipes-containers/runc/runc-docker_git.bb         |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 recipes-containers/runc/runc-docker/0001-Disable-building-recvtty.patch

diff --git a/recipes-containers/runc/runc-docker/0001-Disable-building-recvtty.patch b/recipes-containers/runc/runc-docker/0001-Disable-building-recvtty.patch
new file mode 100644
index 0000000..fa1f695
--- /dev/null
+++ b/recipes-containers/runc/runc-docker/0001-Disable-building-recvtty.patch
@@ -0,0 +1,26 @@
+From aa2fc7b0eacba61175f083cc8d8adc233bcd0575 Mon Sep 17 00:00:00 2001
+From: Paul Barker <pbarker@toganlabs.com>
+Date: Thu, 12 Oct 2017 11:34:24 +0000
+Subject: [PATCH] Disable building recvtty
+
+Signed-off-by: Paul Barker <pbarker@toganlabs.com>
+Upstream-status: Inappropriate
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 0fcf508..24f47dc 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -38,7 +38,6 @@ contrib/cmd/recvtty/recvtty: $(SOURCES)
+ 
+ static: $(SOURCES)
+ 	CGO_ENABLED=1 $(GO) build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS) cgo static_build" -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o runc .
+-	CGO_ENABLED=1 $(GO) build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS) cgo static_build" -ldflags "-w -extldflags -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
+ 
+ release:
+ 	@flag_list=(seccomp selinux apparmor static); \
+-- 
+2.7.4
+
diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 0198652..28232d9 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
            file://0003-Update-memory-specs-to-use-int64-not-uint64.patch \
            file://0001-runc-Add-console-socket-dev-null.patch \
            file://0001-Use-correct-go-cross-compiler.patch \
+           file://0001-Disable-building-recvtty.patch \
           "
 
 GO_IMPORT = "import"
-- 
2.7.4


