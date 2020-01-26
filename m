Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web10.212.1580078429052995650
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Jan 2020 14:40:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=NUAYMdzL;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch [31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 5CB4F5C5706;
	Sun, 26 Jan 2020 23:40:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1580078426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	 in-reply-to:references; bh=mb80+TIzn83hDPhXNDlXa3jQu7crFoNcTS4D9Ego3zY=;
	b=NUAYMdzLSmB/JzsRj/9AB6Bknpvz2cqZQJ+Bidn0QqO/0I3vPMasZT13CHnRb1aHb23GXn
	vQ2MpTaR6MF2iIy/71JIx40BLpnfz+fRQ+On9rHats4B3TP6tsGCTVOH2xYlHzu9YPiIVf
	D4vmynhglWbVciYhMFMBwjMYvQuJ0MY=
From: "Stefan Agner" <stefan@agner.ch>
To: meta-virtualization@lists.yoctoproject.org
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-virtualization][PATCH] conmon: compile with journald support if systemd is enabled
Date: Sun, 26 Jan 2020 22:40:16 +0000
Message-Id: <20200126224016.24918-1-stefan@agner.ch>
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
index fc76f15..7f6f6e7 100644
--- a/recipes-containers/conmon/conmon_2.0.9.bb
+++ b/recipes-containers/conmon/conmon_2.0.9.bb
@@ -20,6 +20,9 @@ inherit pkgconfig
 
 EXTRA_OEMAKE = "PREFIX=${prefix} BINDIR=${bindir} LIBEXECDIR=${libexecdir}"
 
+PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG[systemd] = ",,systemd"
+
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
-- 
2.17.1

