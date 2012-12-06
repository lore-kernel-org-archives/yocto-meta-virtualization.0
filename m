Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CEE89E01458
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:03:54 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4044011eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Ij/Amfk4uaTG2gSLBSEBlZFJ4hgMZocKd96/yquz4FY=;
	b=y2N+xgNxsxOc6teLTHAkn3gPfPZA9AQa9OEbKntKohLsKBFakALNP64RFt5xCoKMFW
	UZhCc/y64IVcrO/D9lkCn2k6nb3QhEvHm+/XKoBpYR/Sldp/Z8pJOTg2IM6FboXTqpMJ
	vfYf9P8UTsqNh1eN81Pc/yTbICTP5gjh4yTQZ60V6ssNLLrQVSoKkMQYaZGCvnVik9uZ
	OpKYqSNnEZn868sJCyrn9zTkKyu6qZcHxDVD5YyfYmq6VfPa3ERHqL6/7bHt8hHM2i1V
	tS1EgRJm/gxu/zhN/gjoKhBTnhc3qfxRnzMi2vtuhk+gP79qkpV6vlioSCGY7kV++MYs
	lu0A==
Received: by 10.14.215.197 with SMTP id e45mr6331544eep.0.1354802634551;
	Thu, 06 Dec 2012 06:03:54 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id e2sm16089379eeo.8.2012.12.06.06.03.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 06:03:53 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 9EE1A400D8C; Thu,  6 Dec 2012 15:03:48 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 15:03:13 +0100
Message-Id: <1354802601-10840-7-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv3 06/14] Added openbsd-netcat recipe, libvirt dependency
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
X-List-Received-Date: Thu, 06 Dec 2012 14:03:55 -0000
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


