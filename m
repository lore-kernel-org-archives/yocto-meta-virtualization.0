Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4CE62E00DAA; Fri, 20 Sep 2019 00:18:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DEC4FE00D94
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Sep 2019 00:18:14 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 241905C0A5D;
	Fri, 20 Sep 2019 09:18:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1568963894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=jIS0JZtfSZR6bcJ9J2ugY5mT3M9LJAZNNE4DNcXT6ms=;
	b=oOQParyzApxwI3unYZIsVFNRwyNgL0XCmcOSig4M9e0rupGhAIWiqayrJTSTqEQjIujVWl
	/sUiLdkvJrAMEyg8GpawD3hVF0fLyo49ocBApbXPTBxdgsH8YWpwUPntc/OZ9Rkk/ho62d
	+ztpAejW1s0+a/URekO2E3SOtGrEsAo=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Fri, 20 Sep 2019 09:18:03 +0200
Message-Id: <20190920071807.13139-4-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190920071807.13139-1-stefan@agner.ch>
References: <20190920071807.13139-1-stefan@agner.ch>
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH v2 3/7] go-md2man: add md2man
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
X-List-Received-Date: Fri, 20 Sep 2019 07:18:16 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

This tool converts markdown into roff (man pages). Useful to build
podman.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-devtools/go/go-md2man_git.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 recipes-devtools/go/go-md2man_git.bb

diff --git a/recipes-devtools/go/go-md2man_git.bb b/recipes-devtools/go/go-md2man_git.bb
new file mode 100644
index 0000000..cc8dd5c
--- /dev/null
+++ b/recipes-devtools/go/go-md2man_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "A markdown to manpage generator."
+HOMEPAGE = "https://github.com/cpuguy83/go-md2man"
+SECTION = "devel/go"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE.md;md5=80794f9009df723bbc6fe19234c9f517"
+
+BBCLASSEXTEND = "native"
+
+GO_IMPORT = "github.com/cpuguy83/go-md2man"
+#GO_INSTALL = "${GO_IMPORT}/bin/go-md2man"
+
+SRC_URI = "git://${GO_IMPORT}.git"
+
+SRCREV = "f79a8a8ca69da163eee19ab442bedad7a35bba5a"
+PV = "1.0.10+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+inherit go
+
-- 
2.20.1


