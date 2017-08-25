Return-Path: <tiniuc.alexandru@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 86FB4E00C45; Fri, 25 Aug 2017 05:28:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (tiniuc.alexandru[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CAAB2E00C01
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Aug 2017 05:28:08 -0700 (PDT)
Received: by mail-wr0-f182.google.com with SMTP id a47so6902443wra.4
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Aug 2017 05:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p1EXmQHXLJoeBfONFrBZTl1WVuYLAao/fQVY91QYyY4=;
	b=Qca+w5Eu6HaipSGxZgKjXCFsrnqtUHq2IsSV3hl7QDiDQeKe+KsYQ2egzo2DTBllha
	LkMOnUKCGpuHUEmmqLSymBU4eKhBzRmxudb6qe+k22PwtWaQRPoL+l76zsrC0SoiSKF8
	AH71IdLEfen2n0N4C8C03nizow+gniB8+ZQbgAGcU2HBDI1DsfxtyskNhE6UzEj5ONGu
	2Ea3PhcKHV+Ef4wii/hW+Dd59iScBiqXsB5L0J5qURgd7C7UbMSo2TuEjFnkLKq8JRVK
	XK+kZwOa86yPO4D4uXWepkbv2S4JdRrPgUViJjX88R+eWq/0GH6zgKLgz5PERGXsOKCf
	hX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p1EXmQHXLJoeBfONFrBZTl1WVuYLAao/fQVY91QYyY4=;
	b=nTxAgfM4/1xWXhxGo4eq1eIym31eabSyYSnlhEFvTZc6HKcjeImAZzDHJypKK59GJ2
	6aV52YFjUkbbA84yo8ijGPYeH90RxN7TFO5SyYAZ/gcCsz9bMziR8WW3lx0RjXGyQ++Z
	BKJb9QHyi5j3MUHoWZVC6wt8ndxm7RiFkEbqeSkO3jxlPJ9jO/RJ+D2pdEoOGrrjZiH5
	1kVW4n8ewrD2NypzGI78JpMYWh+Byxl3+nhLcATPCjblzZK1WcwyQvOupJxnWiOJE6FK
	yoe9HNfwEEPPHwrPNighgx1o/d3Db7lBjn4LpHAEjQ9WPNVnlGomLfEigV1VrI6aw4o7
	TeSA==
X-Gm-Message-State: AHYfb5huCViO1X8aywn2Ng0vkArt5xmG3gFaQdV5CncdarSGYceZf1w4
	lf1AxPuzV1aKyMMch0Q=
X-Received: by 10.223.177.25 with SMTP id l25mr5303119wra.14.1503664087439;
	Fri, 25 Aug 2017 05:28:07 -0700 (PDT)
Received: from localhost.localdomain (boldrewood.soton.ac.uk. [152.78.0.15])
	by smtp.gmail.com with ESMTPSA id
	l131sm1864254wmb.5.2017.08.25.05.28.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Aug 2017 05:28:06 -0700 (PDT)
From: Alexandru Tiniuc <tiniuc.alexandru@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 25 Aug 2017 13:27:01 +0100
Message-Id: <1503664040-6908-1-git-send-email-tiniuc.alexandru@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <CADkTA4NW1JvB2uW6qbGRSwcNYS6WCFNKazvwwN5URTSOG22iUw@mail.gmail.com>
References: <CADkTA4NW1JvB2uW6qbGRSwcNYS6WCFNKazvwwN5URTSOG22iUw@mail.gmail.com>
Subject: [PATCH v2 1/2] Added recipe for the Singularity container platform.
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
X-List-Received-Date: Fri, 25 Aug 2017 12:28:09 -0000

Singularity is a container platform built on the principle of mobility
of compute.  It is designed to be used on HPC clusters and, unlike
Docker, it does not require root access to mount an image. In addition,
it can use Docker images out-of-the-box and it can pull them from the
Docker Hub. For more information, see singularity.lbl.gov

This recipe enables building the Singularity container platform.
Additionally, it creates a symlink from /usr/bin/python3 to
/usr/bin/python, as well as a symlink to where python3 expects
CA certificates to be.

I have tested it on a Raspberry Pi 3: I successfully built and run
arm32v7 images from Docker Hub. Make sure you have the right image for
your CPU architecture: it defaults to amd64.

Signed-off-by: Alexandru Tiniuc <tiniuc.alexandru at gmail dot com>
---
 recipes-containers/singularity/singularity_git.bb | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 recipes-containers/singularity/singularity_git.bb

diff --git a/recipes-containers/singularity/singularity_git.bb b/recipes-containers/singularity/singularity_git.bb
new file mode 100644
index 0000000..d0fbeb9
--- /dev/null
+++ b/recipes-containers/singularity/singularity_git.bb
@@ -0,0 +1,35 @@
+# Skip QA check for library symbolic links (core issue is a packaging problem within 
+# Singularity build / config: read up on the dev-so test for more info)
+INSANE_SKIP_${PN} += "dev-so"
+
+RDEPENDS_${PN} += "glibc python3 ca-certificates openssl"
+# Singularity expects to find python3 under the name python, therefore both
+# cannot be installed at the same time.
+RCONFLICTS_${PN} = "python"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYRIGHT.md;md5=be78c34e483dd7d8439358b1e024b294 \
+                    file://LICENSE-LBNL.md;md5=45a007b527e1a9507aa7fa869f8d7ede \
+                    file://LICENSE.md;md5=df4326b473db6424033f1d98a5645e30 \
+                    file://debian/copyright;md5=ed267cf386d9b75ab1f27f407e935b10"
+
+SRC_URI = "git://github.com/singularityware/singularity.git;protocol=https"
+PV = "2.3.1+git${SRCPV}"
+SRCREV = "e214d4ebf0a1274b1c63b095fd55ae61c7e92947"
+
+S = "${WORKDIR}/git"
+
+inherit pythonnative autotools-brokensep
+EXTRA_OECONF = "--prefix=/usr/local"
+
+pkg_postinst_${PN}() {
+    # Singularity requires "python" to resolve to "python3" within the commandline.
+    # This creates a symbolic link from python3 to python. A side-effect of this is
+    # that scripts which expect Python 2 may fail to run correctly.
+    ln -sr $D${bindir}/python3 $D${bindir}/python 
+
+    # python3 expects CA certificates to be installed in a different place to where
+    # they are actually installed. These lines link the two locations.
+    rm -r $D${libdir}/ssl-1.1/certs
+    ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl-1.1 
+}
-- 
2.1.4


