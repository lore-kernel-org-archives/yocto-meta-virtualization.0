Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6E017E00DA9; Fri, 20 Sep 2019 00:18:16 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2813E00D9E
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Sep 2019 00:18:15 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id B5FB85C0F07;
	Fri, 20 Sep 2019 09:18:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1568963894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=j5nBK/2zllLyszBOtKngQaNqG1jDyFbaO+6WGpcp9pM=;
	b=LrChbGrZcEYmUts3qRADNaGZmtMKfusHb7qbPP03/ta3X6D6sKShRN2DiwwdxPNNu2NuPC
	/H33qDibu0v8l4Uv4rhlJGUyzx/QHoPlYLKETcBNKqh3/2YqSqtl6mfD6sJprcB9JWr0H4
	FJ0JMvjj8qGYUE37musDktg8IDBIxZw=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Fri, 20 Sep 2019 09:18:06 +0200
Message-Id: <20190920071807.13139-7-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190920071807.13139-1-stefan@agner.ch>
References: <20190920071807.13139-1-stefan@agner.ch>
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH v2 6/7] slirp4netns: add slirp4netns user-mode networking
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

slirp4netns allows connecting a network namespace to the Internet
in a completely unprivileged way, by connecting a TAP device in a
network namespace to the usermode TCP/IP stack ("slirp")."

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../slirp4netns/slirp4netns_0.4.1.bb             | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 recipes-networking/slirp4netns/slirp4netns_0.4.1.bb

diff --git a/recipes-networking/slirp4netns/slirp4netns_0.4.1.bb b/recipes-networking/slirp4netns/slirp4netns_0.4.1.bb
new file mode 100644
index 0000000..b47df96
--- /dev/null
+++ b/recipes-networking/slirp4netns/slirp4netns_0.4.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "User-mode networking for unprivileged network namespaces."
+DESCRIPTION = "slirp4netns allows connecting a network namespace to the \
+Internet in a completely unprivileged way, by connecting a TAP device in a \
+network namespace to the usermode TCP/IP stack ("slirp")."
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1e2efd29c201480c6be2744d9edade26"
+
+SRCREV = "4d38845e2e311b684fc8d1c775c725bfcd5ddc27"
+SRC_URI = "git://github.com/rootless-containers/slirp4netns.git;nobranch=1"
+
+DEPENDS = "glib-2.0 libcap libseccomp"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
-- 
2.20.1


