Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.10803.1623335165779293572
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 07:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 15AEQ3vB027827
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Jun 2021 07:26:04 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 10 Jun 2021 07:26:03 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Thu, 10 Jun 2021 07:26:03 -0700
From: sakib.sajal@windriver.com
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][hardnott][PATCH] kubernetes: fix CVE-2021-20206
Date: Thu, 10 Jun 2021 10:26:03 -0400
Message-ID: <20210610142603.27429-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Bump containernetworking/cni to v0.8.1

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../kubernetes/CVE-2021-20206.patch           | 97 +++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
new file mode 100644
index 0000000..7bdd735
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2021-20206.patch
@@ -0,0 +1,97 @@
+From 1ff7fc0a0b8e5ee0bff0c7ba979efcd1ecdb9a39 Mon Sep 17 00:00:00 2001
+From: Navid Shaikh <navids@vmware.com>
+Date: Thu, 6 May 2021 15:41:08 +0530
+Subject: [PATCH] Bump containernetworking/cni to v0.8.1
+
+ Fix CVE-2021-20206
+
+Upstream-Status: Backport [185f65fbddb5239666c0c67fb335589b7570f60c]
+CVE: CVE-2021-20206
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ go.mod                                                       | 4 ++--
+ go.sum                                                       | 4 ++--
+ vendor/github.com/containernetworking/cni/pkg/invoke/find.go | 5 +++++
+ vendor/modules.txt                                           | 4 ++--
+ 4 files changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/src/import/go.mod b/src/import/go.mod
+index e0ba549ab40..d4cc9ce01a9 100644
+--- a/src/import/go.mod
++++ b/src/import/go.mod
+@@ -28,7 +28,7 @@ require (
+ 	github.com/clusterhq/flocker-go v0.0.0-20160920122132-2b8b7259d313
+ 	github.com/codegangsta/negroni v1.0.0 // indirect
+ 	github.com/container-storage-interface/spec v1.2.0
+-	github.com/containernetworking/cni v0.8.0
++	github.com/containernetworking/cni v0.8.1
+ 	github.com/coredns/corefile-migration v1.0.10
+ 	github.com/coreos/go-oidc v2.1.0+incompatible
+ 	github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e
+@@ -214,7 +214,7 @@ replace (
+ 	github.com/containerd/go-runc => github.com/containerd/go-runc v0.0.0-20180907222934-5a6d9f37cfa3
+ 	github.com/containerd/ttrpc => github.com/containerd/ttrpc v1.0.2
+ 	github.com/containerd/typeurl => github.com/containerd/typeurl v1.0.1
+-	github.com/containernetworking/cni => github.com/containernetworking/cni v0.8.0
++	github.com/containernetworking/cni => github.com/containernetworking/cni v0.8.1
+ 	github.com/coredns/corefile-migration => github.com/coredns/corefile-migration v1.0.10
+ 	github.com/coreos/bbolt => github.com/coreos/bbolt v1.3.2
+ 	github.com/coreos/etcd => github.com/coreos/etcd v3.3.13+incompatible
+diff --git a/src/import/go.sum b/src/import/go.sum
+index 288f4554b1f..9168f49c859 100644
+--- a/src/import/go.sum
++++ b/src/import/go.sum
+@@ -113,8 +113,8 @@ github.com/containerd/ttrpc v1.0.2 h1:2/O3oTZN36q2xRolk0a2WWGgh7/Vf/liElg5hFYLX9
+ github.com/containerd/ttrpc v1.0.2/go.mod h1:UAxOpgT9ziI0gJrmKvgcZivgxOp8iFPSk8httJEt98Y=
+ github.com/containerd/typeurl v1.0.1 h1:PvuK4E3D5S5q6IqsPDCy928FhP0LUIGcmZ/Yhgp5Djw=
+ github.com/containerd/typeurl v1.0.1/go.mod h1:TB1hUtrpaiO88KEK56ijojHS1+NeF0izUACaJW2mdXg=
+-github.com/containernetworking/cni v0.8.0 h1:BT9lpgGoH4jw3lFC7Odz2prU5ruiYKcgAjMCbgybcKI=
+-github.com/containernetworking/cni v0.8.0/go.mod h1:LGwApLUm2FpoOfxTDEeq8T9ipbpZ61X79hmU3w8FmsY=
++github.com/containernetworking/cni v0.8.1 h1:7zpDnQ3T3s4ucOuJ/ZCLrYBxzkg0AELFfII3Epo9TmI=
++github.com/containernetworking/cni v0.8.1/go.mod h1:LGwApLUm2FpoOfxTDEeq8T9ipbpZ61X79hmU3w8FmsY=
+ github.com/coredns/corefile-migration v1.0.10 h1:7HI4r5S5Fne749a+JDxUZppqBpYoZK8Q53ZVK9cn3aM=
+ github.com/coredns/corefile-migration v1.0.10/go.mod h1:RMy/mXdeDlYwzt0vdMEJvT2hGJ2I86/eO0UdXmH9XNI=
+ github.com/coreos/bbolt v1.3.2 h1:wZwiHHUieZCquLkDL0B8UhzreNWsPHooDAG3q34zk0s=
+diff --git a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go b/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go
+index e815404c859..e62029eb788 100644
+--- a/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go
++++ b/src/import/vendor/github.com/containernetworking/cni/pkg/invoke/find.go
+@@ -18,6 +18,7 @@ import (
+ 	"fmt"
+ 	"os"
+ 	"path/filepath"
++	"strings"
+ )
+ 
+ // FindInPath returns the full path of the plugin by searching in the provided path
+@@ -26,6 +27,10 @@ func FindInPath(plugin string, paths []string) (string, error) {
+ 		return "", fmt.Errorf("no plugin name provided")
+ 	}
+ 
++	if strings.ContainsRune(plugin, os.PathSeparator) {
++		return "", fmt.Errorf("invalid plugin name: %s", plugin)
++	}
++
+ 	if len(paths) == 0 {
+ 		return "", fmt.Errorf("no paths provided")
+ 	}
+diff --git a/src/import/vendor/modules.txt b/src/import/vendor/modules.txt
+index 6a263b51686..f549467e77d 100644
+--- a/src/import/vendor/modules.txt
++++ b/src/import/vendor/modules.txt
+@@ -257,9 +257,9 @@ github.com/containerd/containerd/pkg/dialer
+ github.com/containerd/ttrpc
+ # github.com/containerd/ttrpc => github.com/containerd/ttrpc v1.0.2
+ # github.com/containerd/typeurl => github.com/containerd/typeurl v1.0.1
+-# github.com/containernetworking/cni v0.8.0 => github.com/containernetworking/cni v0.8.0
++# github.com/containernetworking/cni v0.8.1 => github.com/containernetworking/cni v0.8.1
+ ## explicit
+-# github.com/containernetworking/cni => github.com/containernetworking/cni v0.8.0
++# github.com/containernetworking/cni => github.com/containernetworking/cni v0.8.1
+ github.com/containernetworking/cni/libcni
+ github.com/containernetworking/cni/pkg/invoke
+ github.com/containernetworking/cni/pkg/types
+-- 
+2.25.1
+
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 57cadfe..6120116 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.20;name=k
            file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch \
            file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch \
            file://CVE-2021-25737.patch \
+           file://CVE-2021-20206.patch \
           "
 
 DEPENDS += "rsync-native \
-- 
2.29.2

