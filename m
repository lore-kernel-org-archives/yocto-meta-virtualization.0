Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1BCC1E00716
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 04:47:46 -0800 (PST)
Received: by mail-ee0-f53.google.com with SMTP id e53so3482544eek.40
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 04:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=N5NYFg30h/V6EptAD4n9XJiwVOxtrVs/UHfsOTNR1Rk=;
	b=wboCUg5DdUqRgrxOehgs5N+D38gCH9FEYOFyh8u9Qas3S6WNAc1tn1RVUlRAqhV8s2
	BjUubAzC3kgxqwy/HMtZU9GDFwtDAJ2xNTslHHpYTS4sZ/Prr30L/mYzFiR0ZwNBbfzW
	tVtvNEDWja7R+I42S5nItGkGbNR3+JpJycaTPTAFvWCHL7XQ3IBiN/2MhjLy9d+JKdNi
	Qg0rgLFREPjCfj0j+OKke9cwHpZ79I2dO+76T8LHLixix2Jn5RZ9WCWoKMoFoNP5wtQK
	aKUpx3D8O0N37DG9XwhSDvo1seX1emngFLMmzOE0Zr4QsjQGxWYNR3IjTTxpys0wsQLj
	Mb2A==
X-Received: by 10.14.174.198 with SMTP id x46mr72062661eel.23.1358858865359;
	Tue, 22 Jan 2013 04:47:45 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id f49sm26893909eep.12.2013.01.22.04.47.43
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:47:44 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id DE322400DF7; Tue, 22 Jan 2013 13:47:31 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 22 Jan 2013 13:47:18 +0100
Message-Id: <1358858841-13339-4-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1358858841-13339-1-git-send-email-david.nystrom@enea.com>
References: <1358858841-13339-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] Removed openbsd-netcat since it now recides in meta-networking
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
X-List-Received-Date: Tue, 22 Jan 2013 12:47:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 recipes-networking/netcat/openbsd-netcat_1.6.bb |   29 -----------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 recipes-networking/netcat/openbsd-netcat_1.6.bb

diff --git a/recipes-networking/netcat/openbsd-netcat_1.6.bb b/recipes-networking/netcat/openbsd-netcat_1.6.bb
deleted file mode 100644
index 1ae3f37..0000000
--- a/recipes-networking/netcat/openbsd-netcat_1.6.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "OpenBSD Netcat"
-HOMEPAGE = "http://code.google.com/p/openbsd-netcat/"
-SECTION = "console/network"
-LICENSE = "BSD-3-Clause"
-PR = "r0"
-
-SRCREV = "5"
-
-SRC_URI = "svn://openbsd-netcat.googlecode.com/svn;module=trunk;protocol=http"
-S = "${WORKDIR}/trunk"
-
-inherit update-alternatives gettext
-
-do_configure[noexec] = "1"
-
-do_compile() {
-	cd ${S}
-	oe_runmake
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
-}
-
-ALTERNATIVE_${PN} = "nc"
-ALTERNATIVE_PRIORITY = "101"
-
-BBCLASSEXTEND = "nativesdk"
-- 
1.7.9.5


