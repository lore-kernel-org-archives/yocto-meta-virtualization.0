Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.17973.1575187963860426744
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Dec 2019 00:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xB18Cf6H020481
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 1 Dec 2019 00:12:41 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.468.0; Sun, 1 Dec 2019
 00:12:23 -0800
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH] cri-o: workaround failure since go upgraded to 1.13
Date: Sun, 1 Dec 2019 00:12:23 -0800
Message-ID: <20191201081223.10806-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since go was upgraded to 1.13, there is a failure:
...
| src/vendor/golang.org/x/net/http2/frame.go:17:2: use of vendored package not allowed
| ../../../recipe-sysroot/usr/lib64/go/src/net/http/h2_bundle.go:49:2: use of vendored package not allowed
...

Refer upstream suggestion [1]:
`or copying your vendor contents into GOPATH/src rather than
mapping them in to GOPATH/src/vendor.'

[1] https://github.com/prometheus/prometheus/issues/1720

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 8d754ec..4fee385 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -109,6 +109,9 @@ do_compile() {
 	# fixes the bin/crio build of oe_runmake binaries below
 	ln -sf ../../../../cmd/crio ${S}/src/import/src/github.com/cri-o/cri-o/cmd/
 
+	# workaround `use of vendored package not allowed' failure
+	mv ${S}/src/import/vendor/golang.org  ${S}/src/import/
+
 	cd ${S}/src/import
 
 	if [ "${CRIO_BUILD_CROSS}" = "1" ]; then
-- 
2.21.0

