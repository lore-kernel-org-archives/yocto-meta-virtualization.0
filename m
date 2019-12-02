Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web09.1399.1575276593941568849
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Dec 2019 00:49:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xB28noRD002847
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 2 Dec 2019 00:49:50 -0800 (PST)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.468.0; Mon, 2 Dec 2019
 00:49:49 -0800
From: "hongxu" <hongxu.jia@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] cni: never uses module support since go was upgraded to 1.13
Date: Mon, 2 Dec 2019 00:49:49 -0800
Message-ID: <20191202084949.21918-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since go was upgraded to 1.13, it support for Go modules by default [1],
but for cni recipe, it uses GOPATH mode which supports offline build

[1] https://golang.org/cmd/go/#hdr-Module_support

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-networking/cni/cni.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-networking/cni/cni.inc b/recipes-networking/cni/cni.inc
index 6590b27..7e5af04 100644
--- a/recipes-networking/cni/cni.inc
+++ b/recipes-networking/cni/cni.inc
@@ -45,6 +45,7 @@ do_compile() {
 	ln -sf ../../../../cnitool ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
 	ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/github.com/containernetworking/plugins
 
+	export GO111MODULE="off"
 	export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
 	export CGO_ENABLED="1"
 
-- 
2.21.0

