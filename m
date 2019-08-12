Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1C19E00D75; Sun, 11 Aug 2019 19:33:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7EA8CE0055C
	for <meta-virtualization@yoctoproject.org>;
	Sun, 11 Aug 2019 19:33:51 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7C2XUE9013223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 11 Aug 2019 19:33:40 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Sun, 11 Aug 2019 19:33:19 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 12 Aug 2019 10:33:12 +0800
Message-ID: <20190812023313.17108-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190812023313.17108-1-Qi.Chen@windriver.com>
References: <20190812023313.17108-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/3] cni: fix problem about cross compilation
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
X-List-Received-Date: Mon, 12 Aug 2019 02:33:52 -0000
Content-Type: text/plain

When setting up k8s, the following error appeared, failing
to setup coredns pod.

  NetworkPlugin cni failed to set up pod "coredns-5f7fc64c95-4nnfq_kube-system" network: fork/exec /opt/cni/bin/loopback: no such file or directory

This is because the binary, /opt/cni/bin/loopback, has wrong interpreter.

So fix do_compile to use ${GO} instead of go to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-networking/cni/cni_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index 266ee69..495b9c1 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -47,10 +47,10 @@ do_compile() {
 	export CGO_ENABLED="1"
 
 	cd ${S}/src/import/vendor/github.com/containernetworking/cni/libcni
-	go build
+	${GO} build
 
 	cd ${S}/src/import/vendor/github.com/containernetworking/cni/cnitool
-	go build
+	${GO} build
 
 	cd ${S}/src/import/vendor/github.com/containernetworking/plugins/
 	PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/main/* | grep -v windows)"
@@ -58,7 +58,7 @@ do_compile() {
 	for p in $PLUGINS; do
 	    plugin="$(basename "$p")"
 	    echo "building: $p"
-	    go build -o ${WORKDIR}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
+	    ${GO} build -o ${WORKDIR}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
 	done
 }
 
-- 
2.17.1


