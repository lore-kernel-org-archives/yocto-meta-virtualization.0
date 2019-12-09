Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.5856.1575858069249419108
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Dec 2019 18:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xB92L6NI027194
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 8 Dec 2019 18:21:06 -0800 (PST)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.468.0; Sun, 8 Dec 2019
 18:20:54 -0800
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <joe_macdonald@mentor.com>
Subject: [meta-selinux][PATCH] rename sed_4.2.2.bbappend to sed_4.%.bbappend
Date: Sun, 8 Dec 2019 18:20:54 -0800
Message-ID: <20191209022054.112793-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since upstream oe-core [bd40260cba sed: upgrade to 4.7],
renme bbappend to match the new version

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-extended/sed/{sed_4.2.2.bbappend => sed_4.%.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-extended/sed/{sed_4.2.2.bbappend => sed_4.%.bbappend} (100%)

diff --git a/recipes-extended/sed/sed_4.2.2.bbappend b/recipes-extended/sed/sed_4.%.bbappend
similarity index 100%
rename from recipes-extended/sed/sed_4.2.2.bbappend
rename to recipes-extended/sed/sed_4.%.bbappend
-- 
2.21.0

