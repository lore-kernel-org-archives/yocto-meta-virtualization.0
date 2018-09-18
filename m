Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 147E8E00C09; Tue, 18 Sep 2018 13:29:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F9EAE00971
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 13:28:20 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8IKSK3D018809
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Sep 2018 13:28:20 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 18 Sep 2018 13:28:19 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 18 Sep 2018 16:27:29 -0400
Message-ID: <1537302451-32569-5-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537302451-32569-1-git-send-email-mark.asselstine@windriver.com>
References: <1537302451-32569-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 4/6] consul: update to use go.bbclass
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
X-List-Received-Date: Tue, 18 Sep 2018 20:29:07 -0000
Content-Type: text/plain

We don't want meta-cloud-services to have to rely on meta-overc for
access to golang.bbclass (which predates go.bbclass in oe-core/yocto)
so switch to make use of go.bbclass.

This requires the definition of GO_IMPORT and the dropping of some
custom handling of 'configure' and others.

Since go.bbclass uses a slighly different directory structure than we
used with golang.bbclass we have to adjust some paths accordingly,
including those in patches.

We also need to expand the list of LICENSES to cover licenses of all
the GO packages included in consul.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-connectivity/consul/consul_git.bb          | 22 +++++++---------------
 ...prepared_query-make-compatible-with-go1.5.patch |  8 ++++----
 2 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
index 5f86597..a44e0b2 100644
--- a/recipes-connectivity/consul/consul_git.bb
+++ b/recipes-connectivity/consul/consul_git.bb
@@ -1,30 +1,22 @@
 DESCRIPTION = "A tool for discovering and configuring services in your infrastructure"
 HOMEPAGE = "https://www.consul.io/"
-LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b278a92d2c1509760384428817710378"
+LICENSE = "MPL-2.0 & BSD & Apache-2.0 & BSD-2-Clause & MIT"
+LIC_FILES_CHKSUM = "file://src/github.com/hashicorp/consul/LICENSE;md5=b278a92d2c1509760384428817710378"
 
-PKG_NAME = "github.com/hashicorp/consul"
-SRC_URI = "git://${PKG_NAME}.git \
+GO_IMPORT = "github.com/hashicorp/consul"
+SRCREV = "f97afda8e15046b41d951bf3b4220372c45df7ab"
+SRC_URI = "git://${GO_IMPORT}.git \
            file://consul.service \
            file://0001-prepared_query-make-compatible-with-go1.5.patch \
           "
-SRCREV = "f97afda8e15046b41d951bf3b4220372c45df7ab"
-
-CCACHE = ""
 
-inherit systemd golang
+S = "${WORKDIR}/git"
 
-INSANE_SKIP_${PN} += "ldflags"
+inherit systemd go
 
 SYSTEMD_SERVICE_${PN} = "consul.service"
 SYSTEMD_AUTO_ENABLE_${PN} = "enable"
 
-export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
-
-#Stops go from installing and testing the package
-do_configure(){
-}
-
 do_install_append() {
     install -d ${D}/${systemd_unitdir}/system
     cp ${WORKDIR}/consul.service ${D}/${systemd_unitdir}/system
diff --git a/recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch b/recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch
index a66e1dc..324530b 100644
--- a/recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch
+++ b/recipes-connectivity/consul/files/0001-prepared_query-make-compatible-with-go1.5.patch
@@ -8,13 +8,13 @@ lock contention, so we drop the copy and use the regex directly.
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
 ---
- consul/prepared_query/template.go | 4 ++--
+ src/github.com/hashicorp/consul/consul/prepared_query/template.go | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/consul/prepared_query/template.go b/consul/prepared_query/template.go
+diff --git a/src/github.com/hashicorp/consul/consul/prepared_query/template.go b/src/github.com/hashicorp/consul/consul/prepared_query/template.go
 index 984f0bcf9cc6..1c61910c1526 100644
---- a/consul/prepared_query/template.go
-+++ b/consul/prepared_query/template.go
+--- a/src/github.com/hashicorp/consul/consul/prepared_query/template.go
++++ b/src/github.com/hashicorp/consul/consul/prepared_query/template.go
 @@ -116,8 +116,8 @@ func (ct *CompiledTemplate) Render(name string) (*structs.PreparedQuery, error)
  	// from multiple goroutines.
  	var matches []string
-- 
2.7.4


