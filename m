Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A066E00D4A; Sun,  6 Oct 2019 13:48:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A7BAE00805
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Oct 2019 13:48:20 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 436C65C2354;
	Sun,  6 Oct 2019 22:48:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1570394899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=/vqAzpkH2RW1nJe8DG7Rtb+L34k+YKnlTCVMD1QLHg4=;
	b=IOInNzfBNaIGZx+MWvfM6vx34bCLG2zgv7nMgoRkV51XwPcrOjTWtAizclfH1ivQIuziMO
	LOObG2tORdXLbqwq8gO4UFtMKBIJl/luMVTN8Hl8F+ceZDHugT06nEQTUt2p+rXKoWwIgB
	+R47cCvxqSV4iX0p/hnl8MedUwHuEn0=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Sun,  6 Oct 2019 22:47:48 +0200
Message-Id: <20191006204748.15783-5-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191006204748.15783-1-stefan@agner.ch>
References: <20191006204748.15783-1-stefan@agner.ch>
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 5/5] fuse-overlayfs: add FUSE implementation of overlayfs
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
X-List-Received-Date: Sun, 06 Oct 2019 20:48:21 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

Add recipe for the FUSE implementation of overlayfs. This is useful
to improve startup time for podman rootless containers.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../fuse-overlayfs/fuse-overlayfs_0.6.4.bb        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb

diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb b/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
new file mode 100644
index 0000000..a8bbf0f
--- /dev/null
+++ b/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
@@ -0,0 +1,15 @@
+SUMMARY = "FUSE implementation of overlayfs."
+DESCRIPTION = "An implementation of overlay+shiftfs in FUSE for rootless \
+containers."
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRCREV = "098d9ad79fdbb8538adde08628408aa32a8b4b17"
+SRC_URI = "git://github.com/containers/fuse-overlayfs.git;nobranch=1"
+
+DEPENDS = "fuse3"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
-- 
2.20.1


