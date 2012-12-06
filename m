Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7CCA9E0144E
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:45:13 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4029671eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Ij/Amfk4uaTG2gSLBSEBlZFJ4hgMZocKd96/yquz4FY=;
	b=VEl52jrIdPOyTbyw8ufe1mhs9gQRm2XR9DIuGeA3jOAWgvBf2WrGmRqEWhQprhrDPp
	TiFZrCaKWWHXY2fIzSIj3lcKHGx6Cp1hnTSdPMMwUkg97J8sxhGRdakXEI+GTWX4+hNN
	iD58hclWHqqt+gU7bSQSO3MjsbSbGHOUB5jJnK6zWnp1qzklLJzfZ/3dZNxoM77fA39T
	HLZx7mttPPeQVJkjyNaF5E4VAo3ec/b/YqKOennJZUU8ANJagQKtKnPJBn0fR86fOYUi
	gbP2lH/SfhpXYwcTq6okX1yrHnVv7kGcvwH917QCdEvvAMZf1QxS1pXVLXvYKW2Ypd/T
	/E+A==
Received: by 10.14.207.6 with SMTP id m6mr6022834eeo.10.1354801513196;
	Thu, 06 Dec 2012 05:45:13 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id b49sm15982431eem.16.2012.12.06.05.45.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:45:12 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id CA2E4400D8C; Thu,  6 Dec 2012 14:45:06 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:44:38 +0100
Message-Id: <1354801486-9482-7-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
References: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 06 Dec 2012 13:45:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

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


