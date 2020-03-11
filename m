Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web11.2133.1583968515583072341
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Mar 2020 16:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=pA9oN2kf;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch [31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id BA1275C07DE;
	Thu, 12 Mar 2020 00:15:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1583968512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	 in-reply-to:references; bh=NQGKWJN3TDip831cyUOViQc9JYcUfAZOD3kRtLR+W5A=;
	b=pA9oN2kf+e3ds3coozBOzXptAR5+tuxiZ9scMySDgzjK3qZSd3Z223WrBxKnsKNgKNaC0N
	M4s9yMjnQbtp6jtmmXrcXAtzd2Gh2kRtvVYS2WDYDfYOWip2sLm2mrdgIzX7gD+GqrorS+
	A0Pn0jpxuh2GykFWFSg7GZQskkqPih8=
From: "Stefan Agner" <stefan@agner.ch>
To: meta-virtualization@lists.yoctoproject.org
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-virtualization][PATCH 1/3] conmon: bump to version 2.0.11
Date: Wed, 11 Mar 2020 23:15:02 +0000
Message-Id: <20200311231504.3535-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1

From: Stefan Agner <stefan.agner@toradex.com>

Bump to latest version 2.0.11 of conmon.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/conmon/{conmon_2.0.9.bb => conmon_2.0.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-containers/conmon/{conmon_2.0.9.bb => conmon_2.0.11.bb} (93%)

diff --git a/recipes-containers/conmon/conmon_2.0.9.bb b/recipes-containers/conmon/conmon_2.0.11.bb
similarity index 93%
rename from recipes-containers/conmon/conmon_2.0.9.bb
rename to recipes-containers/conmon/conmon_2.0.11.bb
index af7847b..a5bd527 100644
--- a/recipes-containers/conmon/conmon_2.0.9.bb
+++ b/recipes-containers/conmon/conmon_2.0.11.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61af0b6932ea7b12fb9142721043bc77"
 
 DEPENDS = "glib-2.0"
 
-SRCREV = "60b42f20f222df9da07a01ee444327348b9f54ee"
+SRCREV = "ff9d97a08d7a4b58267ac03719786e4e7258cecf"
 SRC_URI = "\
     git://github.com/containers/conmon.git \
 "
-- 
2.17.1

