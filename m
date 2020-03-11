Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web10.2112.1583968515595551705
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Mar 2020 16:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="key unavailable" header.i=@agner.ch header.s=dkim header.b=mgU+qbWr;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch [31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 3A6925C29FF;
	Thu, 12 Mar 2020 00:15:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1583968513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/KPV31zG6XnrANCaeg9xLXdtbRDPAcl16CBRytSb2Ks=;
	b=mgU+qbWrcSwSs5pM3ELmPa59UcFsJ3sSN1hJ54pNWGu2uk+z4faPlhEDimOnUVZ4/QjWLk
	OpfIFOc6I2MfDjLsNxQZNpV133aWYbWi4cfM/zfjVwT3/5IwhoH3aQDi5l9EeaVoLsgKr6
	X/0aauVJv8IllytEAqZTjicvcSdFFSc=
From: "Stefan Agner" <stefan@agner.ch>
To: meta-virtualization@lists.yoctoproject.org
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-virtualization][PATCH 3/3] podman: add system service for podman
Date: Wed, 11 Mar 2020 23:15:04 +0000
Message-Id: <20200311231504.3535-3-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311231504.3535-1-stefan@agner.ch>
References: <20200311231504.3535-1-stefan@agner.ch>

From: Stefan Agner <stefan.agner@toradex.com>

Add system service for podman which starts a podman instance allow to
access the new HTTP based API (apiv2).

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/podman/podman_git.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index c996028..aa6b25b 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -97,6 +97,12 @@ do_install() {
 	if ${@bb.utils.contains('PACKAGECONFIG', 'docker', 'true', 'false', d)}; then
 		oe_runmake install.docker DESTDIR="${D}"
 	fi
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}${systemd_unitdir}/system
+		install -m 644 ${S}/src/import/contrib/systemd/system/podman.service ${D}/${systemd_unitdir}/system
+		install -m 644 ${S}/src/import/contrib/systemd/system/podman.socket ${D}/${systemd_unitdir}/system
+		rm -f ${D}/${systemd_unitdir}/system/docker.service.rpm
+	fi
 }
 
 FILES_${PN} += " \
@@ -106,6 +112,8 @@ FILES_${PN} += " \
     ${sysconfdir}/cni \
 "
 
+SYSTEMD_SERVICE_${PN} = "podman.service podman.socket"
+
 RDEPENDS_${PN} += "conmon virtual/runc iptables cni skopeo"
 RRECOMMENDS_${PN} += "slirp4netns"
 RCONFLICTS_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'docker', '', d)}"
-- 
2.17.1

