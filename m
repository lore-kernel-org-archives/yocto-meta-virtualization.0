Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBFFC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 19:50:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.32354.1743018637457500165
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 12:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=518085a955=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QBtHRZ007840
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Mar 2025 12:50:37 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hvqkcsg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Mar 2025 12:50:36 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 26 Mar 2025 12:50:36 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 26 Mar 2025 12:50:34 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [meta-virtualization][scarthgap][PATCH 3/3] buildah: upgrade 1.34.3 -> 1.35.5
Date: Wed, 26 Mar 2025 19:50:09 +0000
Message-ID: <20250326195009.757247-3-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250326195009.757247-1-praveen.kumar@windriver.com>
References: <20250326195009.757247-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=XNkwSRhE c=1 sm=1 tr=0 ts=67e45a8d cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VZzbbjECq-QA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pM9yUfARAAAA:8 a=ZJS_iD9FzWMXIAxt1zAA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-GUID: SWvtysIH6ScZrhqtrksewK0xTVbVpwJT
X-Proofpoint-ORIG-GUID: SWvtysIH6ScZrhqtrksewK0xTVbVpwJT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503260121
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Mar 2025 19:50:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9176

This upgrade fixes:
CVE-2024-11218
CVE-2024-3727

Changelog:
==========
https://github.com/containers/buildah/releases?q=1.35.5

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 ...SecureJoin-when-forming-userns-paths.patch | 155 +++++++++---------
 recipes-containers/buildah/buildah_git.bb     |   8 +-
 2 files changed, 84 insertions(+), 79 deletions(-)

diff --git a/recipes-containers/buildah/buildah/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch b/recipes-containers/buildah/buildah/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch
index 73040e82..25f15715 100644
--- a/recipes-containers/buildah/buildah/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch
+++ b/recipes-containers/buildah/buildah/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch
@@ -23,16 +23,17 @@ CVE: CVE-2024-9676
 Upstream-Status: Backport [854570c44c219c2b92b03b36b7a2069a32e2c08a]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
 ---
- userns.go             | 92 ++++++++++++++++++++++++++++++-------------
- userns_unsupported.go | 14 +++++++
- 2 files changed, 79 insertions(+), 27 deletions(-)
- create mode 100644 userns_unsupported.go
+ .../github.com/containers/storage/userns.go   | 97 +++++++++++++------
+ .../containers/storage/userns_unsupported.go  | 14 +++
+ 2 files changed, 83 insertions(+), 28 deletions(-)
+ create mode 100644 vendor/github.com/containers/storage/userns_unsupported.go
 
-diff --git a/userns.go b/userns.go
-index 32ae830be..2c855da7c 100644
---- a/userns.go
-+++ b/userns.go
+diff --git a/vendor/github.com/containers/storage/userns.go b/vendor/github.com/containers/storage/userns.go
+index 57120731b..086f8336b 100644
+--- a/vendor/github.com/containers/storage/userns.go
++++ b/vendor/github.com/containers/storage/userns.go
 @@ -1,18 +1,21 @@
 +//go:build linux
 +
@@ -50,36 +51,37 @@ index 32ae830be..2c855da7c 100644
  	"github.com/containers/storage/pkg/unshare"
  	"github.com/containers/storage/types"
 +	securejoin "github.com/cyphar/filepath-securejoin"
- 	libcontainerUser "github.com/opencontainers/runc/libcontainer/user"
+	libcontainerUser "github.com/moby/sys/user"
  	"github.com/sirupsen/logrus"
 +	"golang.org/x/sys/unix"
  )
  
  // getAdditionalSubIDs looks up the additional IDs configured for
-@@ -85,40 +88,59 @@ const nobodyUser = 65534
+@@ -85,40 +88,62 @@ const nobodyUser = 65534
  // parseMountedFiles returns the maximum UID and GID found in the /etc/passwd and
  // /etc/group files.
  func parseMountedFiles(containerMount, passwdFile, groupFile string) uint32 {
-+	var (
-+		passwd *os.File
-+		group  *os.File
-+		size   int
-+		err    error
-+	)
++       var (
++               passwd *os.File
++               group  *os.File
++               size   int
++               err    error
++       )
  	if passwdFile == "" {
 -		passwdFile = filepath.Join(containerMount, "etc/passwd")
 -	}
 -	if groupFile == "" {
 -		groupFile = filepath.Join(groupFile, "etc/group")
-+		passwd, err = secureOpen(containerMount, "/etc/passwd")
-+	} else {
-+		// User-specified override from a volume. Will not be in
-+		// container root.
-+		passwd, err = os.Open(passwdFile)
- 	}
+-	}
 -
 -	size := 0
--
++		passwd, err = secureOpen(containerMount, "/etc/passwd")
++	} else {
++                // User-specified override from a volume. Will not be in
++                // container root.
++                passwd, err = os.Open(passwdFile)
++        }
+
 -	users, err := libcontainerUser.ParsePasswdFile(passwdFile)
  	if err == nil {
 -		for _, u := range users {
@@ -93,34 +95,36 @@ index 32ae830be..2c855da7c 100644
 -			}
 -			if u.Gid > size && u.Gid != nobodyUser {
 -				size = u.Gid
-+		defer passwd.Close()
 +
-+		users, err := libcontainerUser.ParsePasswd(passwd)
-+		if err == nil {
-+			for _, u := range users {
-+				// Skip the "nobody" user otherwise we end up with 65536
-+				// ids with most images
-+				if u.Name == "nobody" || u.Name == "nogroup" {
-+					continue
-+				}
-+				if u.Uid > size && u.Uid != nobodyUser {
-+					size = u.Uid + 1
-+				}
-+				if u.Gid > size && u.Gid != nobodyUser {
-+					size = u.Gid + 1
-+				}
++               defer passwd.Close()
++
++               users, err := libcontainerUser.ParsePasswd(passwd)
++               if err == nil {
++                       for _, u := range users {
++                               // Skip the "nobody" user otherwise we end up with 65536
++                               // ids with most images
++                               if u.Name == "nobody" || u.Name == "nogroup" {
++                                       continue
++                               }
++                               if u.Uid > size && u.Uid != nobodyUser {
++                                       size = u.Uid + 1
++                               }
++                               if u.Gid > size && u.Gid != nobodyUser {
++                                       size = u.Gid + 1
++                               }
++
  			}
  		}
  	}
- 
+-
 -	groups, err := libcontainerUser.ParseGroupFile(groupFile)
-+	if groupFile == "" {
-+		group, err = secureOpen(containerMount, "/etc/group")
-+	} else {
-+		// User-specified override from a volume. Will not be in
-+		// container root.
-+		group, err = os.Open(groupFile)
-+	}
++       if groupFile == "" {
++               group, err = secureOpen(containerMount, "/etc/group")
++       } else {
++               // User-specified override from a volume. Will not be in
++               // container root.
++               group, err = os.Open(groupFile)
++       }
  	if err == nil {
 -		for _, g := range groups {
 -			if g.Name == "nobody" {
@@ -128,60 +132,61 @@ index 32ae830be..2c855da7c 100644
 -			}
 -			if g.Gid > size && g.Gid != nobodyUser {
 -				size = g.Gid
-+		defer group.Close()
++               defer group.Close()
++
++               groups, err := libcontainerUser.ParseGroup(group)
++               if err == nil {
++                       for _, g := range groups {
++                               if g.Name == "nobody" || g.Name == "nogroup" {
++                                       continue
++                               }
++                               if g.Gid > size && g.Gid != nobodyUser {
++                                       size = g.Gid + 1
++                               }
 +
-+		groups, err := libcontainerUser.ParseGroup(group)
-+		if err == nil {
-+			for _, g := range groups {
-+				if g.Name == "nobody" || g.Name == "nogroup" {
-+					continue
-+				}
-+				if g.Gid > size && g.Gid != nobodyUser {
-+					size = g.Gid + 1
-+				}
  			}
  		}
  	}
-@@ -309,3 +331,19 @@ func getAutoUserNSIDMappings(
+@@ -309,3 +334,19 @@ func getAutoUserNSIDMappings(
  	gidMap := append(availableGIDs.zip(requestedContainerGIDs), additionalGIDMappings...)
  	return uidMap, gidMap, nil
  }
 +
 +// Securely open (read-only) a file in a container mount.
 +func secureOpen(containerMount, file string) (*os.File, error) {
-+	filePath, err := securejoin.SecureJoin(containerMount, file)
-+	if err != nil {
-+		return nil, err
-+	}
++       filePath, err := securejoin.SecureJoin(containerMount, file)
++       if err != nil {
++               return nil, err
++       }
 +
-+	flags := unix.O_PATH | unix.O_CLOEXEC | unix.O_RDONLY
-+	fileHandle, err := os.OpenFile(filePath, flags, 0)
-+	if err != nil {
-+		return nil, err
-+	}
++       flags := unix.O_PATH | unix.O_CLOEXEC | unix.O_RDONLY
++       fileHandle, err := os.OpenFile(filePath, flags, 0)
++       if err != nil {
++               return nil, err
++       }
 +
-+	return fileHandle, nil
++       return fileHandle, nil
 +}
-diff --git a/userns_unsupported.go b/userns_unsupported.go
+diff --git a/vendor/github.com/containers/storage/userns_unsupported.go b/vendor/github.com/containers/storage/userns_unsupported.go
 new file mode 100644
-index 000000000..e37c18fe4
+index 000000000..3905bd3ce
 --- /dev/null
-+++ b/userns_unsupported.go
++++ b/vendor/github.com/containers/storage/userns_unsupported.go
 @@ -0,0 +1,14 @@
 +//go:build !linux
 +
 +package storage
 +
 +import (
-+	"errors"
++       "errors"
 +
-+	"github.com/containers/storage/pkg/idtools"
-+	"github.com/containers/storage/types"
++       "github.com/containers/storage/pkg/idtools"
++       "github.com/containers/storage/types"
 +)
 +
 +func (s *store) getAutoUserNS(_ *types.AutoUserNsOptions, _ *Image, _ rwLayerStore, _ []roLayerStore) ([]idtools.IDMap, []idtools.IDMap, error) {
-+	return nil, nil, errors.New("user namespaces are not supported on this platform")
++       return nil, nil, errors.New("user namespaces are not supported on this platform")
 +}
 -- 
-2.25.1
+2.40.0
 
diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 288a1cb0..fd2503fe 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a
 
 S = "${WORKDIR}/git"
 
-BUILDAH_VERSION = "1.34.3"
+BUILDAH_VERSION = "1.35.5"
 
 PV = "${BUILDAH_VERSION}"
 
@@ -28,12 +28,12 @@ GO_WORKDIR = "${GO_INSTALL}"
 GOBUILDFLAGS += "-mod vendor"
 
 SRCREV_FORMAT = "buildah_storage"
-SRCREV_buildah = "2db756331014a4f355507df47d2622d05532da1f"
+SRCREV_buildah = "df0b92073ee9d34c1f86e03b4ffb17ec25e514e4"
 SRCREV_storage = "246ba3062e8b551026aef2708eee747014ce5c52"
 
 SRC_URI = " \
-    git://github.com/containers/buildah;branch=release-1.34;name=buildah;protocol=https \
-    file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/github.com/containers/buildah/vendor/github.com/containers/storage \
+    git://github.com/containers/buildah;branch=release-1.35;name=buildah;protocol=https \
+    file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/github.com/containers/buildah/ \
     "
 
 DEPENDS = "libdevmapper btrfs-tools gpgme"
-- 
2.40.0


