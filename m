Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web12.9992.1578583256626892350
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Jan 2020 07:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=eJl9cMk7;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch [31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 9F1985C0851;
	Thu,  9 Jan 2020 16:20:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1578583254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	 in-reply-to:references; bh=dgyu2NxLa0BuBLskvWugD5kih+S62Vj7f7flX2Ndsjo=;
	b=eJl9cMk7EkyrdnoxP7fUgaF5sQncI1+CaKqVYTkc2sZNm3v+a2nGozlomXBkCVQHIeczYZ
	nrJ9A/k3aOy+UJILFaQoIzouwX6EeEy0oRbpETaFLvMB3uAuPsSHESG4mBg+ehcUGTzzbP
	orEDm1N9AbqhoAlgg2cTfjokvRG6+R8=
From: "Stefan Agner" <stefan@agner.ch>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan@agner.ch,
	Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-virtualization][zeus][PATCH] docker-ce: update to v19.03.5
Date: Thu,  9 Jan 2020 15:20:53 +0000
Message-Id: <20200109152053.17339-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1

From: Stefan Agner <stefan.agner@toradex.com>

Bump the git hashes to Docker CE v19.03.5. This requires to get the
docker daemon binary from a different location as the symlink from
the latest/ subdirectory has been removed. See also commit deaac5d4b3fa
("hack/make.sh remove "latest" symlink") in the docker-ce repository.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/docker/docker-ce_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 817795f..0d088da 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
  subtle and/or glaring issues. \
  "
 
-SRCREV_docker = "6a30dfca03664a0b6bf0646a7d389ee7d0318e6e"
+SRCREV_docker = "633a0ea838f10e000b7c6d6eed1623e6e988b5bb"
 SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
 SRC_URI = "\
 	git://github.com/docker/docker-ce.git;branch=19.03;name=docker \
@@ -38,7 +38,7 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-DOCKER_VERSION = "19.03.2-ce"
+DOCKER_VERSION = "19.03.5-ce"
 PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
 
 PACKAGES =+ "${PN}-contrib"
@@ -99,7 +99,7 @@ do_compile() {
 do_install() {
 	mkdir -p ${D}/${bindir}
 	cp ${S}/src/import/components/cli/build/docker ${D}/${bindir}/docker
-	cp ${S}/src/import/components/engine/bundles/latest/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
+	cp ${S}/src/import/components/engine/bundles/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
 	cp ${WORKDIR}/git/libnetwork/bin/docker-proxy* ${D}/${bindir}/docker-proxy
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-- 
2.17.1

