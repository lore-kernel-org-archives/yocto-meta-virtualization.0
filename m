Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web12.2387.1579125264119480939
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2020 13:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=G6rqe8+W;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch [31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 9E2235C686E;
	Wed, 15 Jan 2020 22:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1579125261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ocux3OGsLQv5ukxHmF8J2iA4QQAmcBhkXnznF2ce1ew=;
	b=G6rqe8+WqZ4hBlfhz9qusfJwHOg+/KkixzrW/hljGVC1IeXzf++ixluZKpaltRx8iB62fh
	+HC7inLzb7MVLaOxl2NsjXAZf1V7S+uVFZ4lD2e8UzYcxcC/+X4AI5Siz6PRiFzUdDAnI+
	Xp7bCEg0EK0W3e7/WrsIqpCXrzAkhJE=
From: "Stefan Agner" <stefan@agner.ch>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan@agner.ch,
	timothy.t.orling@linux.intel.com,
	Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-virtualization][zeus][PATCH 2/2] podman: bump to latest release 1.6.4
Date: Wed, 15 Jan 2020 21:54:14 +0000
Message-Id: <20200115215414.16007-2-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115215414.16007-1-stefan@agner.ch>
References: <20200115215414.16007-1-stefan@agner.ch>

From: Stefan Agner <stefan.agner@toradex.com>

Bump to latest podman release 1.6.4. The changelog lists some new
features but mostly bugfixes between 1.6.1 and 1.6.4.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 ...ker-documentation-install-and-genera.patch | 43 +++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |  7 +--
 2 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 recipes-containers/podman/files/0001-Makefile-Fix-docker-documentation-install-and-genera.patch

diff --git a/recipes-containers/podman/files/0001-Makefile-Fix-docker-documentation-install-and-genera.patch b/recipes-containers/podman/files/0001-Makefile-Fix-docker-documentation-install-and-genera.patch
new file mode 100644
index 0000000..59224af
--- /dev/null
+++ b/recipes-containers/podman/files/0001-Makefile-Fix-docker-documentation-install-and-genera.patch
@@ -0,0 +1,43 @@
+From 9558797fb7bb019810d18f7acdde93adc35d02cc Mon Sep 17 00:00:00 2001
+From: Morten Linderud <morten@linderud.pw>
+Date: Sat, 2 Nov 2019 12:58:38 +0100
+Subject: [PATCH] [Makefile] Fix docker documentation install and generation
+
+The final versions of the documentation has been shifted from `docs/` to
+`docs/build/man`. Most of the Makefile has been changed accordingly, but
+the docker documentation generation was not.
+
+Introduced by #4354
+
+Signed-off-by: Morten Linderud <morten@linderud.pw>
+Upstream-Status: Backport
+Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 98b7bbdf..feb8e0ca 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -376,7 +376,7 @@ podman-remote-%-release:
+ 	$(MAKE) podman-remote-v$(RELEASE_NUMBER)-$*.zip
+ 
+ docker-docs: docs
+-	(cd docs; ./dckrman.sh *.1)
++	(cd docs; ./dckrman.sh ./build/man/*.1)
+ 
+ changelog: ## Generate changelog
+ 	@echo "Creating changelog from $(CHANGELOG_BASE) to $(CHANGELOG_TARGET)"
+@@ -425,7 +425,7 @@ install.cni:
+ install.docker: docker-docs
+ 	install ${SELINUXOPT} -d -m 755 $(DESTDIR)$(BINDIR) $(DESTDIR)$(MANDIR)/man1
+ 	install ${SELINUXOPT} -m 755 docker $(DESTDIR)$(BINDIR)/docker
+-	install ${SELINUXOPT} -m 644 docs/docker*.1 -t $(DESTDIR)$(MANDIR)/man1
++	install ${SELINUXOPT} -m 644 docs/build/man/docker*.1 -t $(DESTDIR)$(MANDIR)/man1
+ 
+ install.systemd:
+ 	install ${SELINUXOPT} -m 755 -d ${DESTDIR}${SYSTEMDDIR}  ${DESTDIR}${USERSYSTEMDDIR} ${DESTDIR}${TMPFILESDIR}
+-- 
+2.17.1
+
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 50d07ea..8a5a13a 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -24,9 +24,10 @@ python __anonymous() {
         raise bb.parse.SkipRecipe(msg)
 }
 
-SRCREV = "233d95f4f0a815f11d1c1ae9aba16781c4eb2700"
+SRCREV = "5cc92849f7fc9dd734ca2fd8f3ae8830b9a7eb26"
 SRC_URI = " \
-    git://github.com/containers/libpod.git;branch=master \
+    git://github.com/containers/libpod.git;branch=v1.6 \
+    file://0001-Makefile-Fix-docker-documentation-install-and-genera.patch \
 "
 
 LICENSE = "Apache-2.0"
@@ -36,7 +37,7 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-PV = "1.6.1+git${SRCREV}"
+PV = "1.6.4+git${SRCREV}"
 
 PACKAGES =+ "${PN}-contrib"
 
-- 
2.17.1

