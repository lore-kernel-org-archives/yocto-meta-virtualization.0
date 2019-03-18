Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 179FBE00B58; Mon, 18 Mar 2019 11:49:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D30DAE00AC5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Mar 2019 11:49:00 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2IImwQw004024
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Mar 2019 11:48:58 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 18 Mar 2019 11:48:57 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <pbarker@toganlabs.com>,
	<bruce.ashfield@gmail.com>
Date: Mon, 18 Mar 2019 14:48:55 -0400
Message-ID: <1552934935-27182-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] netns: change build target to 'build' instead of 'static'
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
X-List-Received-Date: Mon, 18 Mar 2019 18:49:03 -0000
Content-Type: text/plain

Attempting to build for x86-64 will result in an error:
   cannot find package runtime/cgo (using -importcfg)
   ...go/pkg/tool/linux_amd64/link: cannot open file : open : no such file or directory

As a workaround we switch the build target to 'build' which results in
a slightly smaller executable but does mean that several dynamic
libraries are required to run the generated executable. This shouldn't
be a problem as the build system will ensure the libraries are present
on images where the executable will be included. This change only
means the executable can't be copied as a single entity to a different
machine and run.

We do also patch the Makefile to allow the 'static' target to build
successfully and in the patch commit log we describe the issue in full
(at least in as much detail as we currently have on the issue). But
since the issue isn't fully understood we don't recommend the 'static'
build to be used at this time, thus default to the 'build' target.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

Bruce, Paul,

Just a few notes on this.
* Do I understand what is going on in full, no. The behavior is
  matching what was described in earlier version of GO but I don't
  know why we are being affected when we should not be.
* This brings up a question around GO recipes, we should most likely
  be consistent in building fully static vs not. This should most
  likely be addressed in the go.bbclass. A topic for further discussion.
* Do I want to get to 100% understanding yes. But as you two have seen
  there are other GO related changes/work that I have underway that
  I want to get done to make building GO packages consistent. I have
  a gut feeling that part of the issue here is related to a build
  inconsistency so I want to rule that out before I dig in any further.
* Related to the previous point, the reason I found this and the reason
  I want a fix merged is to get me to a point where all GO packages in
  meta-virtualization build correctly, so I can affect other changes and
  cleanup accross all GO recipes knowing they are kept in a working
  state.

I do want to have this merged as we are going from a not working to a
working state, freeing me up to tackle some needed GO cleanup, to
address the consistency issues I mention above. That being said, I
will definitely understand if you or others object to this change
being merged.

 ...orce-rebuilding-all-packages-to-avoid-cgo.patch | 54 ++++++++++++++++++++++
 recipes-networking/netns/netns_git.bb              |  5 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch

diff --git a/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch b/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
new file mode 100644
index 0000000..3b0c0a4
--- /dev/null
+++ b/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
@@ -0,0 +1,54 @@
+From 09524d187ef108784c854a0c247ac6476a10bb67 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Mon, 18 Mar 2019 14:04:16 -0400
+Subject: [PATCH] Makefile: force rebuilding all packages to avoid cgo
+
+We are running into an issue when attempting to build 'static',
+similar to what is described by
+
+https://plus.google.com/117192131596509381660/posts/eNnNePihYnK
+and
+https://github.com/golang/go/issues/9369
+
+In our case we can see that it manifests as a build error
+
+    cannot find package runtime/cgo (using -importcfg)
+    ...go/pkg/tool/linux_amd64/link: cannot open file : open : no such file or directory
+
+Although the descriptions of issue indicate that newer versions of GO,
+such as the version we are using, should not have this issue it is
+clear from the error that cgo is being referenced when it should be
+out of the picture.
+
+Interesting enough this issue only manifests when we are building on
+x86-64 and building for x86-64 which might indicate that GO might be
+finding -native packages and not -cross packages.
+
+This change works around the issue and will allow for the building of
+the 'static' make target, but at this time and until the issue is
+completely understood, it is recommended that the 'build' target is
+used.
+
+Upstream-Status: Inappropriate [only an issue with our builds]
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 476cb9b..ecd0df4 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -41,7 +41,7 @@ $(NAME): *.go VERSION.txt
+ .PHONY: static
+ static: ## Builds a static executable
+ 	@echo "+ $@"
+-	CGO_ENABLED=0 $(GO) build \
++	CGO_ENABLED=0 $(GO) build -a -pkgdir dontusecurrentpkgs \
+ 				-tags "$(BUILDTAGS) static_build" \
+ 				${GO_LDFLAGS_STATIC} -o $(NAME) .
+ 
+-- 
+2.7.4
+
diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
index b6d3594..f5cdace 100644
--- a/recipes-networking/netns/netns_git.bb
+++ b/recipes-networking/netns/netns_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=48ef0979a2bcc3fae14ff30b8a7f5d
 
 SRC_URI = "git://github.com/genuinetools/netns;branch=master \
            file://0001-Allow-selection-of-go-compiler.patch \
+           file://Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch \
           "
 SRCREV = "0da6ab0997707024debe68c91e940c9168041bf8"
 PV = "0.4.0"
@@ -42,7 +43,9 @@ do_compile() {
 	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
 	cd ${S}/src/import
-	oe_runmake static
+	# Static builds work but are not recommended. See Makefile*cgo patch.
+	#oe_runmake static
+	oe_runmake build
 }
 
 do_install() {
-- 
2.7.4


