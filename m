Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.1060.1583531639308878233
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Mar 2020 13:53:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mark.asselstine@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 026LrtGO022304
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 6 Mar 2020 13:53:56 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 6 Mar 2020
 13:53:55 -0800
From: "Mark Asselstine" <mark.asselstine@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH 1/2] cni: 1.7.0 to 1.7.1 (and plugins 0.8.2 to 0.8.5)
Date: Fri, 6 Mar 2020 16:53:41 -0500
Message-ID: <1583531622-21685-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

Both uprev's are listed as 'minor' in the upstream release
notes. Neither introduces an uprev in spec. This fixes issues we
observed while testing the forthcoming cri-o uprev.

NOTE: this commit should only be used with the follow-on commit [cni:
prevent go from downloading stuff in the background] otherwise you
will end up with files not owned by you which will prevent the recipe
being properly cleaned.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-networking/cni/cni_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index b8adf88..a81e6cc 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -9,8 +9,9 @@ Because of this focus, CNI has a wide range of support and the specification \
 is simple to implement. \
 "
 
-SRCREV_cni = "dc71cd2ba60c452c56a0a259f2a23d2afe42b688"
-SRCREV_plugins = "0eddc554c0747200b7b112ce5322dcfa525298cf"
+SRCREV_cni = "4cfb7b568922a3c79a23e438dc52fe537fc9687e"
+# Version 0.8.5
+SRCREV_plugins = "1f33fb729ae2b8900785f896df2dc1f6fe5e8239"
 SRC_URI = "\
 	git://github.com/containernetworking/cni.git;nobranch=1;name=cni \
         git://github.com/containernetworking/plugins.git;nobranch=1;destsuffix=plugins;name=plugins \
@@ -23,7 +24,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464
 
 GO_IMPORT = "import"
 
-PV = "0.7.0+git${SRCREV_cni}"
+PV = "0.7.1+git${SRCREV_cni}"
 
 inherit go
 inherit goarch
-- 
2.7.4

