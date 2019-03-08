Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB4DDE00CEE; Thu,  7 Mar 2019 19:28:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55C1CE00AA9
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Mar 2019 19:28:30 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x283STwh007175
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Mar 2019 19:28:29 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 7 Mar 2019 19:28:17 -0800
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Thu, 7 Mar 2019 19:28:17 -0800
Message-ID: <20190308032817.114059-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH] consul: uprev to v1.4.3
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Mar 2019 03:28:30 -0000
Content-Type: text/plain

Uprev to v1.4.3 and remove invalid patch.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 recipes-connectivity/consul/consul_git.bb     |  5 +--
 ...red_query-make-compatible-with-go1.5.patch | 31 -------------------
 2 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch

diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
index b0afa03..f9fb236 100644
--- a/recipes-connectivity/consul/consul_git.bb
+++ b/recipes-connectivity/consul/consul_git.bb
@@ -4,14 +4,15 @@ LICENSE = "MPL-2.0 & BSD & Apache-2.0 & BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://src/github.com/hashicorp/consul/LICENSE;md5=b278a92d2c1509760384428817710378"
 
 GO_IMPORT = "github.com/hashicorp/consul"
-SRCREV = "f97afda8e15046b41d951bf3b4220372c45df7ab"
+SRCREV = "567e41ff6b096a478333c804d5c18264050bc3f8"
 SRC_URI = "git://${GO_IMPORT}.git \
            file://consul.service \
-           file://0001-prepared_query-make-compatible-with-go1.5.patch \
           "
 
 S = "${WORKDIR}/git"
 
+RDEPENDS_${PN}-dev_append = " bash"
+
 inherit systemd go
 
 # Besides the hosts specified in goarch, we do not build for mips.
diff --git a/recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch b/recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch
deleted file mode 100644
index 324530b..0000000
--- a/recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From fb11d9e31788c912f94faf8b188278d54dc9a8f1 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Wed, 20 Apr 2016 16:34:50 -0400
-Subject: [PATCH] prepared_query: make compatible with go1.5
-
-The copying of a regex is only in go 1.6. We can take the chance of
-lock contention, so we drop the copy and use the regex directly.
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- src/github.com/hashicorp/consul/consul/prepared_query/template.go | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/github.com/hashicorp/consul/consul/prepared_query/template.go b/src/github.com/hashicorp/consul/consul/prepared_query/template.go
-index 984f0bcf9cc6..1c61910c1526 100644
---- a/src/github.com/hashicorp/consul/consul/prepared_query/template.go
-+++ b/src/github.com/hashicorp/consul/consul/prepared_query/template.go
-@@ -116,8 +116,8 @@ func (ct *CompiledTemplate) Render(name string) (*structs.PreparedQuery, error)
- 	// from multiple goroutines.
- 	var matches []string
- 	if ct.re != nil {
--		re := ct.re.Copy()
--		matches = re.FindStringSubmatch(name)
-+		// re := ct.re.Copy()
-+		matches = ct.re.FindStringSubmatch(name)
- 	}
- 
- 	// Create a safe match function that can't fail at run time. It will
--- 
-2.4.0.53.g8440f74
-
-- 
2.17.1


