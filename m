Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30350E01465
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:03:56 -0800 (PST)
Received: by mail-ea0-f176.google.com with SMTP id d13so2778674eaa.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=wfAi5KMhu3SpYe30WlETrcs26yvWXgVOqgt0k8N744E=;
	b=nU9YMTvLWYk84wsXzGmcUmS0aoBls6/GBtatzcmu7u8Q/JnmIJgf5cwWkTfMQivl4u
	Rc+yrBh1XXecsnLDRKz61GniyqoBqnCtj8wG22yRK4sNcLLkuJf8rTRuUVviDQbrBMUL
	a8b33+071yEndwzxJZcRTFZ31BPda40jRIGFL45saBTGTadSheaa20TIwuN2CG9l52o6
	MO6Gkk0vr+0U8jORask90U305a65P3ziHQX8D2Hxkt/X/1N5x+boEthk//QQIoQUYwRC
	BfuRkYLtxd780NTJ8L6ozO3Ud8EV++/tuNi2eVEOnA4RRwfw8u1eDUsUg7D/gGYwlf+j
	YFYw==
Received: by 10.14.207.6 with SMTP id m6mr6184901eeo.10.1354802635887;
	Thu, 06 Dec 2012 06:03:55 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id f49sm16077438eep.12.2012.12.06.06.03.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 06:03:54 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id A402A400D96; Thu,  6 Dec 2012 15:03:48 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 15:03:14 +0100
Message-Id: <1354802601-10840-8-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv3 07/14] Added openflow recipe
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
X-List-Received-Date: Thu, 06 Dec 2012 14:03:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

---
 recipes-networking/openflow/openflow_1.0.bb |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 recipes-networking/openflow/openflow_1.0.bb

diff --git a/recipes-networking/openflow/openflow_1.0.bb b/recipes-networking/openflow/openflow_1.0.bb
new file mode 100644
index 0000000..3663e50
--- /dev/null
+++ b/recipes-networking/openflow/openflow_1.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "OpelFlow"
+DESCRIPTION = "Provide a generic framework for handling devices in userspace."
+HOMEPAGE = "http://www.openflow.org"
+SECTION = "networking"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=e870c934e2c3d6ccf085fd7cf0a1e2e2"
+
+SRCREV = "5ccca75a69f99791659bcfbcf35353ab1921320a"
+PR = "r0"
+PV = "1.0+git${SRCPV}"
+
+SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git"
+
+DEPENDS = "virtual/libc"
+
+EXTRA_OECONF += "KARCH=${TARGET_ARCH}"
+
+PACKAGECONFIG ??= "libssl"
+PACKAGECONFIG[libssl] = "--enable-ssl,--disable-ssl, openssl, libssl"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
\ No newline at end of file
-- 
1.7.9.5


