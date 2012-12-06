Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FFB0E01465
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:13:54 -0800 (PST)
Received: by mail-ea0-f176.google.com with SMTP id d13so2757041eaa.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=TuiHks7+KgAgtYWDBrpk4NdftA3RUyr3u/r2uDXsCp8=;
	b=j9MniUAecOu2V0VY9EixHC3AuMW9HMcph6n84rQdU+l9ZkexCe+Bv1hLfUfzWO/E6Q
	zMMfIevXr55R2llHFkkEcfmxvw4Zpq6SaXlG60JROyvpkVShmsHtYuqI0EhOLICTDCB4
	sBFmgpv33hPgsjdKJsKbSflaBwWGPRz1NhEggYcGoPj++x3RJ1iYwos1kMOkPTWWkeby
	zCRzLHNsbVPERgpDrJmhER88CkrksO/qLaTS2AKGOwAb5xVMw9DlQKu6RLO/dT1ZE9VM
	3hKQg0C5kwjR0q+Htux1Rc0FlP+IgVp1GE65X5TtNMEbZ2Yo64Hc8vAb/5zFVgzbgt6f
	v1UA==
Received: by 10.14.221.5 with SMTP id q5mr5566955eep.33.1354799634267;
	Thu, 06 Dec 2012 05:13:54 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id v46sm15877293eep.1.2012.12.06.05.13.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:13:53 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 56BAF400D8C; Thu,  6 Dec 2012 14:13:49 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:13:37 +0100
Message-Id: <1354799626-6911-7-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
References: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
Subject: [PATCH 06/14] Added openbsd-netcat recipe, libvirt dependency
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
X-List-Received-Date: Thu, 06 Dec 2012 13:13:54 -0000

---
 recipes-networking/netcat/openbsd-netcat_1.6.bb |   29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 recipes-networking/netcat/openbsd-netcat_1.6.bb

diff --git a/recipes-networking/netcat/openbsd-netcat_1.6.bb b/recipes-networking/netcat/openbsd-netcat_1.6.bb
new file mode 100644
index 0000000..1ae3f37
--- /dev/null
+++ b/recipes-networking/netcat/openbsd-netcat_1.6.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "OpenBSD Netcat"
+HOMEPAGE = "http://code.google.com/p/openbsd-netcat/"
+SECTION = "console/network"
+LICENSE = "BSD-3-Clause"
+PR = "r0"
+
+SRCREV = "5"
+
+SRC_URI = "svn://openbsd-netcat.googlecode.com/svn;module=trunk;protocol=http"
+S = "${WORKDIR}/trunk"
+
+inherit update-alternatives gettext
+
+do_configure[noexec] = "1"
+
+do_compile() {
+	cd ${S}
+	oe_runmake
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
+}
+
+ALTERNATIVE_${PN} = "nc"
+ALTERNATIVE_PRIORITY = "101"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.7.9.5


