Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12C30E00C75; Mon, 17 Jul 2017 13:04:25 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2370CE00C3B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:19 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6HK4JPm019484
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 13:04:19 -0700 (PDT)
Received: from yow-bashfiel-d2.wrs.com (128.224.56.49) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 17 Jul 2017 13:04:19 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 17 Jul 2017 16:04:06 -0400
Message-ID: <1500321853-984-6-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.4.0.53.g8440f74
In-Reply-To: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
References: <1500321853-984-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/12] docker: Uprev to latest based on runc 1.0-rc3
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
X-List-Received-Date: Mon, 17 Jul 2017 20:04:25 -0000
Content-Type: text/plain

From: Jason Wessel <jason.wessel@windriver.com>

The build method for docker client changed where by the docker cli is
now required to be pulled in from a separate git tree to be built.

The integration patch to cross compile was also upreved since some
parts of it were accepted upstream while other parts have not been
accepted at this time.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 recipes-containers/docker/docker_git.bb            | 14 ++++--
 ...-golang.org-x-net-pkg-until-we-move-to-go.patch | 57 +++-------------------
 2 files changed, 18 insertions(+), 53 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index c1b38dce92da..acb177099807 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -18,11 +18,13 @@ DESCRIPTION = "Linux container runtime \
  subtle and/or glaring issues. \
  "
 
-SRCREV_docker = "49bf474f9ed7ce7143a59d1964ff7b7fd9b52178"
-SRCREV_libnetwork="0f534354b813003a754606689722fe253101bc4e"
+SRCREV_docker = "e639a70fbe999d96354a5bcf560231b7b8aa935c"
+SRCREV_libnetwork = "26addf43a5d925ff79d262dbbdb5344bc2b6e198"
+SRCREV_cli = "a765218f1988e85b68aa3977f34893ec7b059a60"
 SRC_URI = "\
-	git://github.com/docker/docker.git;nobranch=1;name=docker \
+	git://github.com/moby/moby.git;nobranch=1;name=docker \
 	git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=libnetwork \
+	git://github.com/docker/cli;branch=master;name=cli;destsuffix=cli \
 	file://docker.init \
 	file://hi.Dockerfile \
 	file://context-use-golang.org-x-net-pkg-until-we-move-to-go.patch \
@@ -30,7 +32,7 @@ SRC_URI = "\
 
 # Apache-2.0 for docker
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9740d093a080530b5c5c6573df9af45a"
 
 S = "${WORKDIR}/git"
 
@@ -86,6 +88,7 @@ do_compile() {
 
 	mkdir -p .gopath/src/github.com/docker
 	ln -sf ../../../../../libnetwork .gopath/src/github.com/docker/libnetwork
+	ln -sf ../../../../../cli .gopath/src/github.com/docker/cli
 
 	export GOPATH="${S}/.gopath:${S}/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
 	export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
@@ -107,6 +110,9 @@ do_compile() {
 
 	# build the proxy
 	go build -o ${S}/docker-proxy github.com/docker/libnetwork/cmd/proxy
+
+        # build the cli
+	go build -o ${S}/bundles/latest/dynbinary-client/docker github.com/docker/cli/cmd/docker
 }
 
 SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
diff --git a/recipes-containers/docker/files/context-use-golang.org-x-net-pkg-until-we-move-to-go.patch b/recipes-containers/docker/files/context-use-golang.org-x-net-pkg-until-we-move-to-go.patch
index 240b744188a9..c43a7e74827c 100644
--- a/recipes-containers/docker/files/context-use-golang.org-x-net-pkg-until-we-move-to-go.patch
+++ b/recipes-containers/docker/files/context-use-golang.org-x-net-pkg-until-we-move-to-go.patch
@@ -11,20 +11,16 @@ walwrap.go:4:2: cannot find package "context" in any of:
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 ---
- client/README.md                                                        | 2 +-
- client/client.go                                                        | 2 +-
- daemon/info_unix.go                                                     | 2 +-
- integration-cli/docker_api_attach_test.go                               | 2 +-
- integration-cli/docker_cli_save_load_unix_test.go                       | 2 +-
- vendor/github.com/docker/swarmkit/manager/logbroker/subscription.go     | 2 +-
- vendor/github.com/docker/swarmkit/manager/state/raft/storage/walwrap.go | 2 +-
- 7 files changed, 7 insertions(+), 7 deletions(-)
+ client/README.md                                  |    2 +-
+ client/client.go                                  |    2 +-
+ daemon/info_unix.go                               |    2 +-
+ integration-cli/docker_api_attach_test.go         |    2 +-
+ integration-cli/docker_cli_save_load_unix_test.go |    2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
 
-diff --git a/client/README.md b/client/README.md
-index 059dfb3..9de54aa 100644
 --- a/client/README.md
 +++ b/client/README.md
-@@ -8,7 +8,7 @@ For example, to list running containers (the equivalent of `docker ps`):
+@@ -8,7 +8,7 @@ For example, to list running containers
  package main
  
  import (
@@ -33,11 +29,9 @@ index 059dfb3..9de54aa 100644
  	"fmt"
  
  	"github.com/docker/docker/api/types"
-diff --git a/client/client.go b/client/client.go
-index a9bdab6..95933af 100644
 --- a/client/client.go
 +++ b/client/client.go
-@@ -19,7 +19,7 @@ For example, to list running containers (the equivalent of "docker ps"):
+@@ -19,7 +19,7 @@ For example, to list running containers
  	package main
  
  	import (
@@ -46,8 +40,6 @@ index a9bdab6..95933af 100644
  		"fmt"
  
  		"github.com/docker/docker/api/types"
-diff --git a/daemon/info_unix.go b/daemon/info_unix.go
-index 9c41c0e..57f8a7b 100644
 --- a/daemon/info_unix.go
 +++ b/daemon/info_unix.go
 @@ -3,7 +3,7 @@
@@ -59,8 +51,6 @@ index 9c41c0e..57f8a7b 100644
  	"os/exec"
  	"strings"
  
-diff --git a/integration-cli/docker_api_attach_test.go b/integration-cli/docker_api_attach_test.go
-index d43bf3a..e5802a7 100644
 --- a/integration-cli/docker_api_attach_test.go
 +++ b/integration-cli/docker_api_attach_test.go
 @@ -3,7 +3,7 @@ package main
@@ -72,8 +62,6 @@ index d43bf3a..e5802a7 100644
  	"io"
  	"net"
  	"net/http"
-diff --git a/integration-cli/docker_cli_save_load_unix_test.go b/integration-cli/docker_cli_save_load_unix_test.go
-index 22445e5..d0afc8c 100644
 --- a/integration-cli/docker_cli_save_load_unix_test.go
 +++ b/integration-cli/docker_cli_save_load_unix_test.go
 @@ -3,7 +3,7 @@
@@ -85,32 +73,3 @@ index 22445e5..d0afc8c 100644
  	"fmt"
  	"io/ioutil"
  	"os"
-diff --git a/vendor/github.com/docker/swarmkit/manager/logbroker/subscription.go b/vendor/github.com/docker/swarmkit/manager/logbroker/subscription.go
-index 6b3295a..cbfcf7e 100644
---- a/vendor/github.com/docker/swarmkit/manager/logbroker/subscription.go
-+++ b/vendor/github.com/docker/swarmkit/manager/logbroker/subscription.go
-@@ -1,7 +1,7 @@
- package logbroker
- 
- import (
--	"context"
-+	"golang.org/x/net/context"
- 	"fmt"
- 	"strings"
- 	"sync"
-diff --git a/vendor/github.com/docker/swarmkit/manager/state/raft/storage/walwrap.go b/vendor/github.com/docker/swarmkit/manager/state/raft/storage/walwrap.go
-index 5a6c71a..efe5921 100644
---- a/vendor/github.com/docker/swarmkit/manager/state/raft/storage/walwrap.go
-+++ b/vendor/github.com/docker/swarmkit/manager/state/raft/storage/walwrap.go
-@@ -1,7 +1,7 @@
- package storage
- 
- import (
--	"context"
-+	"golang.org/x/net/context"
- 	"io"
- 	"io/ioutil"
- 	"os"
--- 
-2.7.4
-
-- 
2.4.0.53.g8440f74


