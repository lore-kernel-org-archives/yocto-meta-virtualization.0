Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B01F8E0145F
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:45:13 -0800 (PST)
Received: by mail-ea0-f176.google.com with SMTP id d13so2770402eaa.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=7ZF6t1z7TbeFKcKEFWp187Hvl8gOPx7KvASzEeAH7OE=;
	b=notS+GKiDO0sJXsB0LZPtDPH5WV0Kk885VosKYYmB+0LUryJiX54vY3OLHyai14iMo
	TYkxzJ1vYWbXRjnHjKm329594+yUUqa6eh2eCbylRBYgI1cz0GY32/NTrf8uWtG9oCz8
	pjM3Pvha4bEbkHrcZVfaWjMwVgNbuOLpjesQvju7Bl8OnEAsiKtN9ptfZtSWzZVuyh49
	4n5rN3nF7sX7HSlm1KUwJYB3x3/tj0Q1alU8F3qFSJIY2wW7KGX5IqYo/ImNDJgcesNg
	pFWR2fat7jQR4EXiS/80bLKEuFyyW/Tk5W8q4eaF11a/tv6GlzLAxEp8Ebbc54zZgyQQ
	YnBg==
Received: by 10.14.214.132 with SMTP id c4mr5953729eep.18.1354801512928;
	Thu, 06 Dec 2012 05:45:12 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id 44sm16027619eek.0.2012.12.06.05.45.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:45:12 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id C876D400D66; Thu,  6 Dec 2012 14:45:06 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:44:37 +0100
Message-Id: <1354801486-9482-6-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
References: <1354801486-9482-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 06 Dec 2012 13:45:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

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


