Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98905E00D60; Sun,  1 Sep 2019 13:33:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D89EE00867
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Sep 2019 13:33:41 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 107BA5C2933;
	Sun,  1 Sep 2019 22:33:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1567370021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=O86Y9oh8PR7EQo0xgT4JDGcu65IsvuvVrnaC3VMOPHQ=;
	b=VRGqimPihc6DPw8phH7+6T91ZmfnP2Jo9GxGVypuH1AQ3epTAL42rgoMzppLJYpVvUqdwL
	55LCTmUBopPBCYCBVat+QF+zQboS+Q0XChx+4dENgW2ZliKuCgK4v4G9jmH8DxPLzYJnE8
	r55pABdPfhGjA/Jaa/SmUlqsbocN30U=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Sun,  1 Sep 2019 22:33:34 +0200
Message-Id: <20190901203338.38768-3-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190901203338.38768-1-stefan@agner.ch>
References: <20190901203338.38768-1-stefan@agner.ch>
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 2/6] go-metalinter: add recipe for gometalinter
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
X-List-Received-Date: Sun, 01 Sep 2019 20:33:43 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

A tool that concurrently runs a whole bunch of go linters and
normalises their output to a standard format. Useful to build
podman.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-devtools/go/go-metalinter_git.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 recipes-devtools/go/go-metalinter_git.bb

diff --git a/recipes-devtools/go/go-metalinter_git.bb b/recipes-devtools/go/go-metalinter_git.bb
new file mode 100644
index 0000000..668b431
--- /dev/null
+++ b/recipes-devtools/go/go-metalinter_git.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Go Meta Linter."
+HOMEPAGE = "https://github.com/alecthomas/gometalinter"
+SECTION = "devel/go"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dee20b35647295553d32faef05846a7b"
+
+BBCLASSEXTEND = "native"
+
+SRCNAME = "gometalinter"
+
+PKG_NAME = "github.com/alecthomas/${SRCNAME}"
+SRC_URI = "git://${PKG_NAME}.git"
+
+SRCREV = "e8d801238da6f0dfd14078d68f9b53fa50a7eeb5"
+PV = "0.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
+	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
+}
+
+FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
-- 
2.20.1


