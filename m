Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 529F7E00D5F; Sun,  1 Sep 2019 13:33:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2ECD2E00D59
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Sep 2019 13:33:43 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 9C8115C2958;
	Sun,  1 Sep 2019 22:33:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1567370021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=z+4I+J5OvYZvxHfb2dNfcnYopCHDJRCTbLjqMoqj2bM=;
	b=sxPHOC93ZVx49qVazXrySxy5D3vXBuEF7rB+rOkjWXbEskomlXRfS7dfW7fozBvHCtwhap
	R8n3bXi4gHRJSlIz8qPVbPgaxxyNcsnWX7vo3o6HBFuq2sA9N3DXnbjyyG00fCAKIWDx+s
	Erp8aWQF0yDK21Bne67hK5neyZHMuDI=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Sun,  1 Sep 2019 22:33:37 +0200
Message-Id: <20190901203338.38768-6-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190901203338.38768-1-stefan@agner.ch>
References: <20190901203338.38768-1-stefan@agner.ch>
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 5/6] cni: move cni tools to /usr/lib/cni
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
X-List-Received-Date: Sun, 01 Sep 2019 20:33:44 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

Use a standard location to store the cni tools and plugins. This
is more in line how other distributions package cni.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/cri-o/files/crio.conf | 2 +-
 recipes-networking/cni/cni_git.bb        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/cri-o/files/crio.conf b/recipes-containers/cri-o/files/crio.conf
index 51d7f40..dd22465 100644
--- a/recipes-containers/cri-o/files/crio.conf
+++ b/recipes-containers/cri-o/files/crio.conf
@@ -144,4 +144,4 @@ registries = [
 network_dir = "/etc/cni/net.d/"
 
 # plugin_dir is is where CNI plugin binaries are stored.
-plugin_dir = "/opt/cni/bin/"
+plugin_dir = "/usr/lib/cni/"
diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index 5348b95..86e5e0f 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -63,7 +63,7 @@ do_compile() {
 }
 
 do_install() {
-    localbindir="/opt/cni/bin"
+    localbindir="${libdir}/cni/"
 
     install -d ${D}${localbindir}
     install -d ${D}/${sysconfdir}/cni/net.d
@@ -72,7 +72,7 @@ do_install() {
     install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
 }
 
-FILES_${PN} += "/opt/cni/bin/*"
+FILES_${PN} += "${libdir}/cni/*"
 
 INSANE_SKIP_${PN} += "ldflags already-stripped"
 
-- 
2.20.1


