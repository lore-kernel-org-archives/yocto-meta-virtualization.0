Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A9EEE0145B
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:13:54 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4008281eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=vLk/UkLma7IMsZz1doni2ezOhmzLxMrjK0E4JxchWUE=;
	b=gPjiPdsX77Bk9yvZDIAPGyweviCwZcxEf6eCYzQJ3JrqXAGz8T2Mzyd34awWKgLsbe
	nR24QIVA16io9N9TOUIW79GpubLhPZqLcynJS83Rcq8+BMHE3RuofNEKOdJx+ey06WcZ
	7yp7KfnAad/ofKr9s/yiI2LKcp+VG90wWuGDGAcNqSJMGIC+Ntloija6UAARaMqpj7T1
	6o+hlaWgjgY+WmUNfVkBGNvpi1Za4LYrSOVal59h4awuetWnat5RMoimgqr9N3+Acu/o
	WDgHhIp0V+9CotrktAB2LZXBPS3xBuS+QyvRE99s15SRrLCSvRUNlP2mwiXDApYUzeqn
	Yovg==
Received: by 10.14.205.198 with SMTP id j46mr5640363eeo.27.1354799634079;
	Thu, 06 Dec 2012 05:13:54 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id y44sm15835117eel.14.2012.12.06.05.13.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:13:53 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 540CC400D66; Thu,  6 Dec 2012 14:13:49 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:13:36 +0100
Message-Id: <1354799626-6911-6-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
References: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
Subject: [PATCH 05/14] Added netcf recipe, libvirt dependency
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
 recipes-networking/netcf/netcf_git.bb |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 recipes-networking/netcf/netcf_git.bb

diff --git a/recipes-networking/netcf/netcf_git.bb b/recipes-networking/netcf/netcf_git.bb
new file mode 100644
index 0000000..60fc446
--- /dev/null
+++ b/recipes-networking/netcf/netcf_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "netcf"
+DESCRIPTION = "netcf is a cross-platform network configuration library."
+HOMEPAGE = "https://fedorahosted.org/netcf/"
+SECTION = "console/tools"
+LICENSE = "LGPLv2.1"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
+
+SRCREV = "2b0d9ca226c13d7150382367f62b256bdb2db5ef"
+PR = "r0"
+PV = "0.2.2+git${SRCPV}"
+
+SRC_URI = "git://git.fedorahosted.org/netcf.git;protocol=git"
+
+DEPENDS += "augeas libnl libxslt libxml2"
+
+S = "${WORKDIR}/git"
+
+inherit gettext autotools
+
+do_configure_prepend() {
+	cd ${S}
+	./bootstrap
+}
+
-- 
1.7.9.5


