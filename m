Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7670E01458
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:45:13 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4029677eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=wfAi5KMhu3SpYe30WlETrcs26yvWXgVOqgt0k8N744E=;
	b=l6Le1HxpA+K/yGlN2UU5mOIeD577io9igViFAVbetGcir9nR/RyhAvgF4MB6LnKH/o
	hh43uWp3LbWIC5dt5FsBLLmpazhxkyGQGDV14SYE3Zrxfa/aWdthJDkEOZMeOECQX2iB
	Ww0lHDXjlAmY72s4U/yFHFFRVM8AypTaMeHa7eCaDXD8bU5s/wxdbyr+XTZuXU4K00Nf
	H+nCHM+wTjrgwB5NloJnewxpCVdKTqIlOa3wle5jwKvwdw9rxaW5p3GAfMHXeukz71zL
	FY/DTVzyBUCoMVYPe4WhaEaTUuSy6u7FMLEUJje5xdMrA+ykd1z6bHmQfTy1wUJU1vL4
	4LeQ==
Received: by 10.14.223.200 with SMTP id v48mr5895227eep.24.1354801513579;
	Thu, 06 Dec 2012 05:45:13 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id z8sm15991397eeo.11.2012.12.06.05.45.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:45:12 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id CD469400D96; Thu,  6 Dec 2012 14:45:06 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:44:39 +0100
Message-Id: <1354801486-9482-8-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
References: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 07/14] Added openflow recipe
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
X-List-Received-Date: Thu, 06 Dec 2012 13:45:14 -0000
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


