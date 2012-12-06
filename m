Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4407E0146A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:13:54 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4008282eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=WJr9c2SMs0KvtpK2zas+gPkRjvahmSiwJD9SbHQ23F0=;
	b=eJ/wIJt3VsuhmS2is6RcfSsIT7IImMRah8MjQd5hkYRQr1PCataKbuDuwt6zqQ8xyt
	tvSgR8bt/NK6z6+B7SdOJXa6m0gB57tEyN6qN6nQR7M7IRI3bzU5PO8IFjEutQfFqJDL
	lTAzn2rsUtX3iQnwGzXb446Es8Yi2MEdV2+5zM1qyUgW4zseZH5Wkk0Sr4PoIw7KZxbT
	fZtBsl+uVROw48EdPqg4QlrQvrxqeG9HAoxDNxqXC+25Pq9TMqAkdiE1uM8MorLf5MN/
	r2ce1HJa5ZEZHMTAMFZd2xKlcl68kHdUWC7D2NpHRhJXIStqpkNN8ROU7ou4JuY0WAz3
	bkFQ==
Received: by 10.14.209.193 with SMTP id s41mr5820385eeo.9.1354799634437;
	Thu, 06 Dec 2012 05:13:54 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id v46sm15877344eep.1.2012.12.06.05.13.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:13:53 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 5A72D400D96; Thu,  6 Dec 2012 14:13:49 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:13:38 +0100
Message-Id: <1354799626-6911-8-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
References: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
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
X-List-Received-Date: Thu, 06 Dec 2012 13:13:55 -0000

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


