Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5CA82E00348
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 09:06:47 -0800 (PST)
Received: by mail-ea0-f176.google.com with SMTP id d13so2862163eaa.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 09:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Ij/Amfk4uaTG2gSLBSEBlZFJ4hgMZocKd96/yquz4FY=;
	b=y9wtt3G54KA6fs8fYTkQ1Bm29sGf1rHiVpWI+4mvrOSn2XbE9+zr2mAEpbO1hbRdcw
	6erJLkfgsu/BV2fx3EGmZk+EsBMmZsHq6w5I/FQ3yFJsf5Sqk8ol2OSQNqERONj6G/Dw
	D84RRe9IkGvuGa4CJ14IafCZOVTdV41JZwIH/GBpE56btKNXahB0Sd2HY76/xlN7fdI0
	HD+mpN/G2EsKzsboDqE+mUyYiFMtt6WKtzIJRpSQoQB5XiRrKWT/SeWyLbpTu7XH7yOK
	TylHBuaKxrtSXNXiDPqT2IC4RKo0E7us1LflZvP/HI76lhlJLcraOm3iGwUoNgiZtzfh
	aayg==
Received: by 10.14.173.65 with SMTP id u41mr7652075eel.13.1354813607072;
	Thu, 06 Dec 2012 09:06:47 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id v46sm17001812eep.1.2012.12.06.09.06.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 09:06:45 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 2DD82400D8C; Thu,  6 Dec 2012 18:06:40 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 18:06:26 +0100
Message-Id: <1354813596-8233-6-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv4 05/15] Added openbsd-netcat recipe, libvirt dependency
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
X-List-Received-Date: Thu, 06 Dec 2012 17:06:47 -0000
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


