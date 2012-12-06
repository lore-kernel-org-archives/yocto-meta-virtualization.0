Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 953D8E006D5
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 09:06:47 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4182732eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 09:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=wfAi5KMhu3SpYe30WlETrcs26yvWXgVOqgt0k8N744E=;
	b=xWZuyiAsL4MSFya+PTWnPxh4K+YtdA4Ifl3W9fNFCw2OwjkgnVSnVb1vl3O6l1fKjH
	BAfWxg3z/gU0+PEHVHFQ7VyMSBbJINDPpwEG5A+IFwBZoulPACoIw2tbvmYd3tITk7IY
	6tpHsvRMT26u+WyNAwFxPH3Mp7KHkEE18ZXrT7h79dSGxHaGXdjGEyKi6MJ0yMXIWjPY
	LOVNBSTxvTXuvq/WtrfVGHO7kKhtRZhP2/mfz2W9Isnd4FcjHNCHqXDibCZLx8Y9zxrz
	6YilGiWZMLmGjq/rhCz6d+sluONKVOEmYdHRzXKkQedrmh6nzt/2dOMVsyotG+iSF0aZ
	Hjnw==
Received: by 10.14.221.65 with SMTP id q41mr7506935eep.30.1354813607296;
	Thu, 06 Dec 2012 09:06:47 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id q44sm16989118eep.5.2012.12.06.09.06.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 09:06:45 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 32E43400D96; Thu,  6 Dec 2012 18:06:40 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 18:06:27 +0100
Message-Id: <1354813596-8233-7-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv4 06/15] Added openflow recipe
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
X-List-Received-Date: Thu, 06 Dec 2012 17:06:48 -0000
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


