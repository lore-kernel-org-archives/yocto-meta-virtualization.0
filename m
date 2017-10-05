Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9AC3E00D7E; Thu,  5 Oct 2017 06:39:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2AD7EE00D6D
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Oct 2017 06:39:02 -0700 (PDT)
Received: by mail-wr0-f181.google.com with SMTP id j14so10920552wre.8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Oct 2017 06:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ck+Qynu8cnPszICRWVPedEkTWx15sr4whSOhmz8goNE=;
	b=gflbGSXD2DWxfp65Eu43IlUaxaoW0oHxM5cQs5nRWgDWcIDzAzJZmtRYSo6r0WdASw
	yk7iNbYxu1eet/SMHxl0IhV0EuJoFgadQyU7BGaAfQyRlx2vlX/mBffLioQ4JMg5d962
	wapHC4o2UNIe/yVl5M2dGKaevuQKqQKFgJ6zm4mquOFUL6KR++jtaqv0/o3duAY3ocW/
	cD21tHBgyijY8LoQMWJEm9Z7cPA/wDdSkKk5bfAhPH38LXvgznVVUNjoitRzWQWATvYT
	ntWqYQvwmnlkw7+LzueD5KOucW2/e6bsRGeyqUTyCL7xhNelHpn5Y09mB4jegkhwXi4q
	Fk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ck+Qynu8cnPszICRWVPedEkTWx15sr4whSOhmz8goNE=;
	b=OPgZJAXgegg+8QdcAc3chliBRY7kYvYNQ4hsa0xRfuyCAzLF/Vbgd3nwUcD5vLlFKO
	7Zuv5TBRXW5a8fa9FUPLnMKaECgsifwMssgK63o9edOol2Iyk2UfTohA2S/7GQQge81w
	+42PM2T6tS9V0H//ulgQ+vmenqI/CX1Dho0mESIQxAW3yE5VxQMMRj5BOAsoCFsSO6y1
	ydnLJFj3Qcr0Kpch7UD5kkzEih4HvcNpgpVm9vIzNv0/Bx1jF+pEQqA5/aGHbPmgvOB8
	rzmAJGk/UviFasktj3s+eV3+5hkMDWipVAxJuDqTpZjRkHl5eXrHZ5jU6KbMTonJKY3r
	NwKA==
X-Gm-Message-State: AMCzsaXSTdDw3B3KU4/o8luKGc+Qwms0NuslzU2zf4W2EvZDZcz6Xwqh
	6nvPVuxVNiY7EKCZRjgLzplKtV7Nj0o=
X-Google-Smtp-Source: AOwi7QBhy8kjdEF3273+zlvnY4qh+bpxAxcjKP2BywmQh2WzlvhlNYdDF6zYjlJ1wUosb0wnEyxBlw==
X-Received: by 10.223.183.201 with SMTP id t9mr14298518wre.149.1507210741855; 
	Thu, 05 Oct 2017 06:39:01 -0700 (PDT)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id v3sm6749043wra.39.2017.10.05.06.39.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Oct 2017 06:39:00 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  5 Oct 2017 13:38:16 +0000
Message-Id: <1507210699-13911-2-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507210699-13911-1-git-send-email-pbarker@toganlabs.com>
References: <1507210699-13911-1-git-send-email-pbarker@toganlabs.com>
Subject: [PATCH 1/4] netns: Update to v0.2.1
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
X-List-Received-Date: Thu, 05 Oct 2017 13:39:04 -0000

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 recipes-networking/netns/netns_git.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
index 8e771f5..4437764 100644
--- a/recipes-networking/netns/netns_git.bb
+++ b/recipes-networking/netns/netns_git.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=20ce4c6a4f32d6ee4a68e3a7506db3f1"
 
 SRC_URI = "git://github.com/jessfraz/netns;branch=master"
-SRCREV = "85b1ab9fcccbaa404a2636b52a48bbde02437cf7"
-PV = "0.1.0+git${SRCPV}"
+SRCREV = "74e23a0e5c4e7ac011aafcc4623586c196f1b3ef"
+PV = "0.2.1"
 GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
@@ -21,11 +21,12 @@ do_compile() {
 	# Go looks in a src directory under any directory in GOPATH but netns
 	# uses 'vendor' instead of 'vendor/src'. We can fix this with a symlink.
 	#
-	# We also need to link in the ipallocator directory as that is not under
-	# a src directory.
+	# We also need to link in the ipallocator and version directories as
+	# they are not under the src directory.
 	ln -sfn . "${S}/src/import/vendor/src"
 	mkdir -p "${S}/src/import/vendor/src/github.com/jessfraz/netns"
 	ln -sfn "${S}/src/import/ipallocator" "${S}/src/import/vendor/src/github.com/jessfraz/netns/ipallocator"
+	ln -sfn "${S}/src/import/version" "${S}/src/import/vendor/src/github.com/jessfraz/netns/version"
 	export GOPATH="${S}/src/import/vendor"
 
 	# Pass the needed cflags/ldflags so that cgo
-- 
2.7.4


