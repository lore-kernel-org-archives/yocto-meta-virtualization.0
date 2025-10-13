Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48D7CCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 11:48:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.41441.1760356078820291757
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 04:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aM7nCR1I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23817c5fde=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59D7jsxi811277
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Oct 2025 04:47:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=5rSVS6EiEFNZTH5BpXWzlYELN9HXjdb2DGfA3zdSlJU=; b=aM7nCR1IOnb/
	ZJXqGvtLyLXXFbf25scnzitZhi+9PnbqQ3e4UXe6rXoCLHwCUWeKBnpw9wRWjfFa
	ktaMXAeAznBe1G7/zUqcLS6cWN7pBdqNMQyXauoXVLO7xR485YVrzUX8TstKYpiK
	RTPoc72SI6oYhlRDNrpb3nSS+AuCxefVQ45Ttxfv06L9HHwGIG1b2TfTPsWraQii
	S3D+8UlP1V0O1DFrsyA2YqVOSNJkjCghIVQazcZ8JfaAqPmEkRuOsEwkoUo8iEgq
	e2H9fgW0DVT9EldPtjEeUb1vjQdb6/PER4wYyj53rsRqA/1JvWJpyT5tp1TcmQ3l
	w80q+x0eiQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1hjye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Oct 2025 04:47:58 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 13 Oct 2025 04:47:56 -0700
From: dchellam <divya.chellam@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][walnascar][PATCH 2/2] podman: fix CVE-2025-9566
Date: Mon, 13 Oct 2025 17:17:25 +0530
Message-ID: <20251013114725.2268483-2-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251013114725.2268483-1-divya.chellam@windriver.com>
References: <20251013114725.2268483-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA1MyBTYWx0ZWRfXwpCuu0x2IIRg
 oqIzCrMxOWwdodzmu6A7Xx4vytWminEDHSktTjxSXD5QMuYG8L32+/k4pEulukxi/Yw9WAOzzU1
 5pYMiP3SX1I29IY0dW4I8Gs07nndHr56qbqP9KcS1yK6KE+XoyEcWcCeBV4X069FGnh88r1Mm+M
 xVJyo46Fv1GoZIsjMQ7Ym3qmcHXbky3Gqj1qZiMzsdXTri6BclrUTkFH9Fb655O39z7cFrl6AsW
 askcUldgEvi8P39A+WLbAmxcMY7Hz53V4HBQeF2xMHcFj1hPrQXNmgnsTuAuFC3pPfbBeqJWCE3
 zc1kqHIpgDXIMonK9HSeatgEbe5ufwJafXoS9Ehxxuzbdc326InaTJJzCcKCbjH/Blegv+sXXTr
 QL87p2c2synIxnRsPWVDkDGoU5GgTQ==
X-Proofpoint-GUID: abfciYOBkBxsOQG1qsPkmPaHoRdticxT
X-Proofpoint-ORIG-GUID: abfciYOBkBxsOQG1qsPkmPaHoRdticxT
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68ece6ee cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=MkUnBrgfyNUA:10 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=xNf9USuDAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=pM9yUfARAAAA:8
 a=9vtvMr6WjeyNXNOe7-cA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=YH-7kEGJnRg4CV3apUU-:22
 a=6_D5ljFcL1GZDUJyZucp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510130053
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Oct 2025 11:48:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9415

From: Divya Chellam <divya.chellam@windriver.com>

There's a vulnerability in podman where an attacker may use the kube play
command to overwrite host files when the kube file container a Secrete or
a ConfigMap volume mount and such volume contains a symbolic link to a host
file path. In a successful attack, the attacker can only control the target
file to be overwritten but not the content to be written into the file.
[EOL][EOL]Binary-Affected: podman[EOL]Upstream-version-introduced:
v4.0.0[EOL]Upstream-version-fixed: v5.6.1

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-9566

Upstream-patch:
https://github.com/containers/podman/commit/ca994186f07822b9048fe711b6903e51614d3e15

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../podman/podman/CVE-2025-9566.patch         | 152 ++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |   1 +
 2 files changed, 153 insertions(+)
 create mode 100644 recipes-containers/podman/podman/CVE-2025-9566.patch

diff --git a/recipes-containers/podman/podman/CVE-2025-9566.patch b/recipes-containers/podman/podman/CVE-2025-9566.patch
new file mode 100644
index 00000000..7e5cbe8b
--- /dev/null
+++ b/recipes-containers/podman/podman/CVE-2025-9566.patch
@@ -0,0 +1,152 @@
+From ca994186f07822b9048fe711b6903e51614d3e15 Mon Sep 17 00:00:00 2001
+From: Paul Holzinger <pholzing@redhat.com>
+Date: Fri, 29 Aug 2025 15:39:38 +0200
+Subject: [PATCH] kube play: don't follow volume symlinks onto the host
+
+For ConfigMap and Secret kube play volumes podman populates the data
+from the yaml. However the volume content is not controlled by us and we
+can be tricked following a symlink to a file on the host instead.
+
+Fixes: CVE-2025-9566
+
+Signed-off-by: Paul Holzinger <pholzing@redhat.com>
+(cherry picked from commit 43fbde4e665fe6cee6921868f04b7ccd3de5ad89)
+Signed-off-by: Paul Holzinger <pholzing@redhat.com>
+
+CVE: CVE-2025-9566
+
+Upstream-Status: Backport [https://github.com/containers/podman/commit/ca994186f07822b9048fe711b6903e51614d3e15]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ pkg/domain/infra/abi/play.go             |  5 ++-
+ pkg/domain/infra/abi/play_linux.go       | 18 +++++++++++
+ pkg/domain/infra/abi/play_unsupported.go | 13 ++++++++
+ pkg/domain/infra/abi/play_utils.go       | 39 +++++++++++++++++++++++-
+ 4 files changed, 71 insertions(+), 4 deletions(-)
+ create mode 100644 pkg/domain/infra/abi/play_linux.go
+ create mode 100644 pkg/domain/infra/abi/play_unsupported.go
+
+diff --git a/pkg/domain/infra/abi/play.go b/pkg/domain/infra/abi/play.go
+index 6ffbf4cf54..2fa2752d7c 100644
+--- a/pkg/domain/infra/abi/play.go
++++ b/pkg/domain/infra/abi/play.go
+@@ -808,8 +808,7 @@ func (ic *ContainerEngine) playKubePod(ctx context.Context, podName string, podY
+ 			defaultMode := v.DefaultMode
+ 			// Create files and add data to the volume mountpoint based on the Items in the volume
+ 			for k, v := range v.Items {
+-				dataPath := filepath.Join(mountPoint, k)
+-				f, err := os.Create(dataPath)
++				f, err := openPathSafely(mountPoint, k)
+ 				if err != nil {
+ 					return nil, nil, fmt.Errorf("cannot create file %q at volume mountpoint %q: %w", k, mountPoint, err)
+ 				}
+@@ -819,7 +818,7 @@ func (ic *ContainerEngine) playKubePod(ctx context.Context, podName string, podY
+ 					return nil, nil, err
+ 				}
+ 				// Set file permissions
+-				if err := os.Chmod(f.Name(), os.FileMode(defaultMode)); err != nil {
++				if err := f.Chmod(os.FileMode(defaultMode)); err != nil {
+ 					return nil, nil, err
+ 				}
+ 			}
+diff --git a/pkg/domain/infra/abi/play_linux.go b/pkg/domain/infra/abi/play_linux.go
+new file mode 100644
+index 0000000000..a0f9811516
+--- /dev/null
++++ b/pkg/domain/infra/abi/play_linux.go
+@@ -0,0 +1,18 @@
++//go:build !remote
++
++package abi
++
++import (
++	"os"
++
++	securejoin "github.com/cyphar/filepath-securejoin"
++)
++
++// openSymlinkPath opens the path under root using securejoin.OpenatInRoot().
++func openSymlinkPath(root *os.File, unsafePath string, flags int) (*os.File, error) {
++	file, err := securejoin.OpenatInRoot(root, unsafePath)
++	if err != nil {
++		return nil, err
++	}
++	return securejoin.Reopen(file, flags)
++}
+diff --git a/pkg/domain/infra/abi/play_unsupported.go b/pkg/domain/infra/abi/play_unsupported.go
+new file mode 100644
+index 0000000000..3ecbae7cc1
+--- /dev/null
++++ b/pkg/domain/infra/abi/play_unsupported.go
+@@ -0,0 +1,13 @@
++//go:build !linux && !remote
++
++package abi
++
++import (
++	"errors"
++	"os"
++)
++
++// openSymlinkPath is not supported on this platform.
++func openSymlinkPath(root *os.File, unsafePath string, flags int) (*os.File, error) {
++	return nil, errors.New("cannot safely open symlink on this platform")
++}
+diff --git a/pkg/domain/infra/abi/play_utils.go b/pkg/domain/infra/abi/play_utils.go
+index 7285d9c9b9..217b656997 100644
+--- a/pkg/domain/infra/abi/play_utils.go
++++ b/pkg/domain/infra/abi/play_utils.go
+@@ -2,7 +2,14 @@
+ 
+ package abi
+ 
+-import "github.com/containers/podman/v5/libpod/define"
++import (
++	"fmt"
++	"os"
++	"strings"
++
++	"github.com/containers/podman/v5/libpod/define"
++	"golang.org/x/sys/unix"
++)
+ 
+ // getSdNotifyMode returns the `sdNotifyAnnotation/$name` for the specified
+ // name. If name is empty, it'll only look for `sdNotifyAnnotation`.
+@@ -16,3 +23,33 @@ func getSdNotifyMode(annotations map[string]string, name string) (string, error)
+ 	}
+ 	return mode, define.ValidateSdNotifyMode(mode)
+ }
++
++// openPathSafely opens the given name under the trusted root path, the unsafeName
++// must be a single path component and not contain "/".
++// The resulting path will be opened or created if it does not exists.
++// Following of symlink is done within staying under root, escapes outsides
++// of root are not allowed and prevent.
++//
++// This custom function is needed because securejoin.SecureJoin() is not race safe
++// and the volume might be mounted in another container that could swap in a symlink
++// after the function ahs run. securejoin.OpenInRoot() doesn't work either because
++// it cannot create files and doesn't work on freebsd.
++func openPathSafely(root, unsafeName string) (*os.File, error) {
++	if strings.Contains(unsafeName, "/") {
++		return nil, fmt.Errorf("name %q must not contain path separator", unsafeName)
++	}
++	fdDir, err := os.OpenFile(root, unix.O_RDONLY, 0)
++	if err != nil {
++		return nil, err
++	}
++	defer fdDir.Close()
++	flags := unix.O_CREAT | unix.O_WRONLY | unix.O_TRUNC | unix.O_CLOEXEC
++	fd, err := unix.Openat(int(fdDir.Fd()), unsafeName, flags|unix.O_NOFOLLOW, 0o644)
++	if err == nil {
++		return os.NewFile(uintptr(fd), unsafeName), nil
++	}
++	if err == unix.ELOOP {
++		return openSymlinkPath(fdDir, unsafeName, flags)
++	}
++	return nil, &os.PathError{Op: "openat", Path: unsafeName, Err: err}
++}
+-- 
+2.40.0
+
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index a83764fc..fc7a01d2 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v5.4;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
     file://CVE-2025-6032.patch;patchdir=src/import \
+    file://CVE-2025-9566.patch;patchdir=src/import \
 "
 
 LICENSE = "Apache-2.0"
-- 
2.40.0


