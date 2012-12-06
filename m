Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0A8FE00348
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 09:06:45 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4182735eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 09:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=7ZF6t1z7TbeFKcKEFWp187Hvl8gOPx7KvASzEeAH7OE=;
	b=jII0povlP7VPZF0YOPEcfD1OJl6JN/flc6/yle8/m6Nce33yTJuLI3iU2B8JUgjB2f
	DklP1IVFBmk0z/UYCu8O9LTl2tTk7nsukQ+Im4vulmytB5EIDsvUGDs9CEVXmOExbLfr
	YKaPFc6HIXI2DzJ2A+FzyTEjflkQr1F3yF9R+mrI6xSEpO0iCCKQNv01Afty4/tAJAmQ
	cz6+t99D6Eq7562PvrEK1N0r2GgHZLMFQBxKNVCwXfEKMQbaDTByWSIhJawIokuJsjaM
	bkIYGqoxRsGI4FGZen8aOVOc9NhhNYWUn27wUvZV8/+XYD485Bd/zU3aq6IDZuyC7LuA
	KCGw==
Received: by 10.14.215.194 with SMTP id e42mr7514304eep.32.1354813604908;
	Thu, 06 Dec 2012 09:06:44 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id y44sm16961222eel.14.2012.12.06.09.06.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 09:06:42 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 28E17400D66; Thu,  6 Dec 2012 18:06:40 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 18:06:25 +0100
Message-Id: <1354813596-8233-5-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv4 04/15] Added netcf recipe, libvirt dependency
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
X-List-Received-Date: Thu, 06 Dec 2012 17:06:46 -0000
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


