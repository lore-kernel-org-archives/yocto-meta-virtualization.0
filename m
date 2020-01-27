Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web09.175.1580161740318255732
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jan 2020 13:49:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=A2N0Fd23;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch [31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id D1D8B5C25FD;
	Mon, 27 Jan 2020 22:48:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1580161737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	 in-reply-to:references; bh=sesR2NEPv4GGZ98hAkmgZFc4npCbMy3BAKpK4k8sMmA=;
	b=A2N0Fd235pri7h7qxo5/JcxL6iLQy1JDxoHtFiYtzKLExi/IWMKR7GjjdBRcD0m2IcwkG1
	qRVUrNMY6duagTMc6xfilOcJwlIk05TmC7pWQhp349hFyU0d12+8bHxeIld85ao+zUGEHe
	mKs6srJVSpuDdy85RdkfSDHjIUm1DLA=
From: "Stefan Agner" <stefan@agner.ch>
To: meta-virtualization@lists.yoctoproject.org
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-virtualization][PATCH v2] conmon: compile with journald support if systemd is enabled
Date: Mon, 27 Jan 2020 21:48:54 +0000
Message-Id: <20200127214854.29367-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1

From: Stefan Agner <stefan.agner@toradex.com>

Currently conman is compiled without journald support which leads to
this error message when trying to use it (e.g. --log-driver=journald
with podman):
  [conmon:e] Include journald in compilation path to log to systemd journal

Make sure to build with journald backend compiled-in when systemd is in
distro features by adding systemd to DEPENDS (through PACKAGECONFIG).

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/conmon/conmon_2.0.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/conmon/conmon_2.0.9.bb b/recipes-containers/conmon/conmon_2.0.9.bb
index fc76f15..af7847b 100644
--- a/recipes-containers/conmon/conmon_2.0.9.bb
+++ b/recipes-containers/conmon/conmon_2.0.9.bb
@@ -20,6 +20,9 @@ inherit pkgconfig
 
 EXTRA_OEMAKE = "PREFIX=${prefix} BINDIR=${bindir} LIBEXECDIR=${libexecdir}"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG[systemd] = ",,systemd"
+
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
-- 
2.17.1

