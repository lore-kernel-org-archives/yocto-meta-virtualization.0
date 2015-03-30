Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE890E0086E; Mon, 30 Mar 2015 07:42:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 499D3E0085D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Mar 2015 07:42:55 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t2UEgtEc028999
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Mar 2015 07:42:55 -0700 (PDT)
Received: from ord-jrw-virt2.corp.ad.wrs.com (147.11.119.45) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 30 Mar 2015 07:42:52 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 30 Mar 2015 09:42:40 -0500
Message-ID: <1427726560-6216-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] docker: Disable CCACHE because golang will fail on some hosts
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
X-List-Received-Date: Mon, 30 Mar 2015 14:42:58 -0000
Content-Type: text/plain

The following is the type of error you see when CCACHE is enabled.

| ---> Making bundle: dynbinary (in bundles/1.5.0-dev/dynbinary)
| go build runtime/cgo: no buildable Go source files in /opt/proj/tmp/sysroots/x86_64-linux/usr/lib/x86_64-wrs-linux/go/src/pkg/runtime/cgo
| WARNING: /opt/proj/tmp/work/core2-64-wrs-linux/docker/1.5.0+git2243e32cbbf1c9809c262a7376d34ca43a7a36dc-r0/temp/do_compile/run.do_compile.19967:1 exit 1 from
|   DOCKER_GITCOMMIT="2243e32cbbf1c9809c262a7376d34ca43a7a36dc" ./hack/make.sh dynbinary
| ERROR: Function failed: do_compile (log file is located at /opt/proj/tmp/work/core2-64-wrs-linux/docker/1.5.0+git2243e32cbbf1c9809c262a7376d34ca43a7a36dc-r0/temp/do_compile/log.do_compile.19967)

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 recipes-containers/docker/docker_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 8357ee8..225745a 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -25,6 +25,11 @@ SRC_URI = "\
 	file://hi.Dockerfile \
 	"
 
+# The golang-cross embeds a compiler invocation for the pre-parser
+# that is incompatible with the $CC definition used by the compiler
+# templates so disable CCACHE
+CCACHE = ""
+
 # Apache-2.0 for docker
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1cc0497778922bfd6cb48721deb80dc7"
-- 
1.9.1


