Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38400.1795597246099958209
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 01:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jsSSq0sN;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=122619; q=dns/txt;
  s=iport01; t=1795597247; x=1796806847;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kVXbe0RJRkBYvhCZNBn1DPfhQvoz7zYkFxmMFWBtPfo=;
  b=jsSSq0sNYCPPoeEetg6iZtjsbRtWgsHVq2hxlIvIIKHpEMq+D1aV6vat
   kNrw4x3IfHXw1wnFXYXpWY1CZw1sDRhWOlq6N7ilHeF5A+YWOFKP689pV
   eclJjRNP8LObLWiqPGW2Xk86LOoo57rDSsj9VT6SrAIH208+omTfuHvQg
   aLm4QKLLe9xfq6WKjotVThzO3DiharyQ39dgPxANRdEVHh/hz+lph1Q5O
   8O5DZ+CE+cogK7fuSnlqXVAJBfsGholnJrQFxq02AoUo0BVEhkem3Pqsz
   E8gyNoQU4sMzyKhM0i7IH3RDdnDoO3EsNElSgbR46VfqWMSAqPOukzDlQ
   A==;
X-CSE-ConnectionGUID: 2xzXn32TTdKvREuXOJWm4w==
X-CSE-MsgGUID: Hchm4ZOEQIqValKTG94TXA==
X-IPAS-Result: =?us-ascii?q?A0BLAgBmogZr/9VK/pBaHgEBCxIMggULgld1YUJJA4RUj?=
 =?us-ascii?q?1OCIYEWkD2MWRSBag8BAQEPRAkEBAEBghKCLY5qAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASASABCAQLAXIDAQIDAiYCLR0BB?=
 =?us-ascii?q?RgJCYJ5AYJ0AgERBrhnen8zgQGDbQE/AVDbMwELFAGBCi6FQoMgAYUEXRgBh?=
 =?us-ascii?q?H4nGxuBcoEVgTuBOXaBBYFcAgKBISODdoJIIgSCDRWBDIFUGAZfBYIggxiGW?=
 =?us-ascii?q?QKBSYhSSIECHANZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxcvWBsGBYEcgR6BE?=
 =?us-ascii?q?oEDXYErKF4hgQiBdQKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8C?=
 =?us-ascii?q?SY/FQxnCxoFYQgCDQx0ORAwHCQvBRkmPBsKgQwnHR4ZDgIpBhYhCzQYDUgRL?=
 =?us-ascii?q?DcVGQQ9AW4HlBOCTgojDgsGAQENCBcEDCQDBgUDAgcEAwwBBwMfAQEEARIJA?=
 =?us-ascii?q?g0XAgYCBAwfBgwHAgEFDxQCCAcGEgELBQYBBBgMDwICCQIEGA8CA5JDHQcBA?=
 =?us-ascii?q?QEHMgyPV4IhgTWeHoE+CiiDeYwklToaM4QEgVeSQ5JVC5h9izeCU5U2CSsLD?=
 =?us-ascii?q?gIWN4RqgWg8gUYMB3AVO4JnCUoZD44rAwQHC4NggmmBZ0PJSCM1AgEIAy8BA?=
 =?us-ascii?q?QcCBwIMAwuBaIRhix8CJgQDb2ABAQ?=
IronPort-Data: A9a23:pVtWaa69JsfzykcQE8whuQxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mNNXGGOOPaMM2rzeo8gaN6zoEhSuZSEz4dkS1M+qn83Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eZ50KyuAsW11y+
 d8GEh0QXjehuOfq3+fuIgVsrpxLwMjDNY4F/3UlxjbDALN/G9bIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaOkYn1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FboCEJoDSFJw9ckCwh
 mnG+jjLJTwjFcWhwD6mzl392tP/tHauMG4VPPjinhJwu3WWy3AaTQMXT0emqP24mEeiWtVZA
 0gV4TY167k1/1CsVsP6XRCzvDiDpBF0ZjZLO+Q38kSJj6HT+QvcXzJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:7Jvm0qlJUkRFNHivCxor4n+cscPpDfIa3DAbv31ZSRFFG/Fw8P
 re+cjztCWE6gr5N0tPpTntAsS9qBDnhP1ICPcqXItKNTOO0ADDEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHNuQ8bpE0dKz2DrMpbnmBENjo=
X-Talos-CUID: =?us-ascii?q?9a23=3ApCDipWppu7bAhtFsU1vYIAXmUZo1YE3bly3sH0O?=
 =?us-ascii?q?bF1xEVY2ya2CVpLwxxg=3D=3D?=
X-Talos-MUID: 9a23:VC/1bwSMaJg3nyZNRXTMjzFnaPVPzp2PEX4ElbY6lJjYCRxZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="62944091"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 09:00:44 +0000
Received: from sjc-ads-2449.cisco.com (sjc-ads-2449.cisco.com [171.70.63.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id 7079318000232
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 09:00:43 +0000 (GMT)
Received: by sjc-ads-2449.cisco.com (Postfix, from userid 1795984)
	id 231E8CC12A6; Wed, 25 Nov 2026 01:00:42 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 1/3] docker-moby: fix CVE-2026-17106
Date: Wed, 25 Nov 2026 01:00:31 -0800
Message-Id: <20261125090033.2807645-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2449.cisco.com [171.70.63.137];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.63.137, sjc-ads-2449.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 09:00:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10183
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

Vendor go-archive v0.3.3 to fix archive extraction path traversal and
preserve valid archive handling. Apply the upstream path-resolution
correction so symlinks are resolved before parent traversal. Adapt the
archive option setup for the target source tree.

The upstream fix is referenced in [1], and the public advisory is
referenced in [2].

[1] https://github.com/moby/go-archive/commit/df55fdf3cd62b85c6f22c7b1002c3acb3481f78c
[2] https://github.com/moby/go-archive/security/advisories/GHSA-hfg8-hc9c-6c3h

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 recipes-containers/docker/docker-moby_git.bb  |    2 +
 .../docker/files/CVE-2026-17106_p1.patch      | 2888 +++++++++++++++++
 .../docker/files/CVE-2026-17106_p2.patch      |  186 ++
 3 files changed, 3076 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2026-17106_p1.patch
 create mode 100644 recipes-containers/docker/files/CVE-2026-17106_p2.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 9768b306..4c47a137 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -64,6 +64,8 @@ SRC_URI = "\
         file://CVE-2026-92542-dependent.patch;patchdir=src/import \
         file://CVE-2026-92542_p1.patch;patchdir=src/import \
         file://CVE-2026-92542_p2.patch;patchdir=src/import \
+        file://CVE-2026-17106_p1.patch;patchdir=src/import \
+        file://CVE-2026-17106_p2.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2026-17106_p1.patch b/recipes-containers/docker/files/CVE-2026-17106_p1.patch
new file mode 100644
index 00000000..375e9c82
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-17106_p1.patch
@@ -0,0 +1,2888 @@
+From 2a3ab8fcc0c5e4b9bfce4577e7baddc842032298 Mon Sep 17 00:00:00 2001
+From: Sebastiaan van Stijn <github@gone.nl>
+Date: Tue, 4 Aug 2026 21:07:17 +0200
+Subject: [PATCH] vendor: github.com/moby/go-archive v0.3.3
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+- Fix a regression introduced in v0.3.0 that caused archive extraction
+  to reject hardlinks with absolute targets, as produced by some image
+  builders. Absolute hardlink targets are now resolved relative to the
+  extraction root, while paths that escape the root remain rejected.
+- Fix a regression introduced in v0.3.0 that caused archive extraction
+  to fail when applying permissions to device nodes, including nodes on
+  `nodev` filesystems and `dev/ptmx`. Device nodes are now referenced
+  without opening the underlying device before applying their mode.
+- Set close-on-exec on file descriptors used by the Linux permission
+  fallback to prevent them from leaking into child processes.
+
+full diff: https://github.com/moby/go-archive/compare/v0.3.2...v0.3.3
+
+CVE: CVE-2026-17106
+Upstream-Status: Backport [https://github.com/moby/moby/commit/2a3ab8fcc0c5e4b9bfce4577e7baddc842032298]
+
+Backport Changes:
+- Replace the complete vendored go-archive directory with v0.3.3 because
+  the target source starts from v0.2.0.
+- Adapt daemon/archive_unix.go for the target source while keeping user lookup inside
+  the container filesystem.
+
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ daemon/archive_unix.go                        |  19 +-
+ go.mod                                        |   2 +-
+ go.sum                                        |   4 +-
+ .../github.com/moby/go-archive/.golangci.yml  |  12 +
+ vendor/github.com/moby/go-archive/archive.go  | 559 +++++++++++++-----
+ .../moby/go-archive/archive_linux.go          | 127 ++--
+ .../moby/go-archive/archive_other.go          |   8 +
+ .../moby/go-archive/archive_unix.go           | 100 +++-
+ .../moby/go-archive/archive_windows.go        |  15 +-
+ vendor/github.com/moby/go-archive/changes.go  |  18 +-
+ .../moby/go-archive/changes_linux.go          |   2 +-
+ .../moby/go-archive/changes_other.go          |   2 +-
+ .../github.com/moby/go-archive/chmod_linux.go |  46 ++
+ .../moby/go-archive/chmod_unix_nolinux.go     |  27 +
+ .../moby/go-archive/chrootarchive/archive.go  |   3 -
+ .../go-archive/chrootarchive/archive_linux.go |  20 +-
+ .../chrootarchive/archive_unix_nolinux.go     |   4 +-
+ .../go-archive/chrootarchive/diff_unix.go     |   3 -
+ .../go-archive/compression/compression.go     |   4 +-
+ vendor/github.com/moby/go-archive/copy.go     |  64 +-
+ .../github.com/moby/go-archive/dev_darwin.go  |  21 +
+ .../github.com/moby/go-archive/dev_freebsd.go |  17 +-
+ vendor/github.com/moby/go-archive/dev_unix.go |  21 +-
+ vendor/github.com/moby/go-archive/diff.go     | 141 +++--
+ .../internal/archiveoptions/options.go        |  12 +
+ vendor/github.com/moby/go-archive/rootpath.go | 142 +++++
+ .../moby/go-archive/sequential_other.go       |   6 +
+ .../go-archive/sequential_windows_go126.go    |   9 +
+ .../go-archive/sequential_windows_pre126.go   |   6 +
+ .../moby/go-archive/tarheader/tarheader.go    |   2 +-
+ .../go-archive/tarheader/tarheader_unix.go    |   9 +-
+ vendor/github.com/moby/go-archive/time.go     |   4 +
+ .../moby/go-archive/time_nonwindows.go        |  61 +-
+ .../moby/go-archive/time_windows.go           | 105 +++-
+ .../moby/go-archive/xattr_supported.go        |  20 +-
+ vendor/modules.txt                            |   5 +-
+ 36 files changed, 1237 insertions(+), 383 deletions(-)
+ create mode 100644 vendor/github.com/moby/go-archive/chmod_linux.go
+ create mode 100644 vendor/github.com/moby/go-archive/chmod_unix_nolinux.go
+ create mode 100644 vendor/github.com/moby/go-archive/dev_darwin.go
+ create mode 100644 vendor/github.com/moby/go-archive/internal/archiveoptions/options.go
+ create mode 100644 vendor/github.com/moby/go-archive/rootpath.go
+ create mode 100644 vendor/github.com/moby/go-archive/sequential_other.go
+ create mode 100644 vendor/github.com/moby/go-archive/sequential_windows_go126.go
+ create mode 100644 vendor/github.com/moby/go-archive/sequential_windows_pre126.go
+
+diff --git a/daemon/archive_unix.go b/daemon/archive_unix.go
+index cc6264faca4818a606c7dabc720323edd9f2939f..d1eecaf4281faff9bc04dc2c5ab4bc0368badd52 100644
+--- a/daemon/archive_unix.go
++++ b/daemon/archive_unix.go
+@@ -101,6 +101,13 @@ func (daemon *Daemon) containerExtractToDir(container *container.Container, path
+ 	container.Lock()
+ 	defer container.Unlock()
+ 
++	options := daemon.defaultTarCopyOptions(allowOverwriteDirWithFile)
++	options, cleanup, err := archive.WithProcSelfFD(options)
++	if err != nil {
++		return err
++	}
++	defer cleanup()
++
+ 	cfs, err := daemon.openContainerFS(container)
+ 	if err != nil {
+ 		return err
+@@ -131,16 +138,16 @@ func (daemon *Daemon) containerExtractToDir(container *container.Container, path
+ 			return err
+ 		}
+ 
+-		options := daemon.defaultTarCopyOptions(allowOverwriteDirWithFile)
+-
+ 		if copyUIDGID {
+-			var err error
+-			// tarCopyOptions will appropriately pull in the right uid/gid for the
+-			// user/group and will set the options.
+-			options, err = daemon.tarCopyOptions(container, allowOverwriteDirWithFile)
++			// Resolve the user inside the container filesystem, then copy the
++			// resulting options into the options prepared before entering it.
++			copyOptions, err := daemon.tarCopyOptions(container, allowOverwriteDirWithFile)
+ 			if err != nil {
+ 				return err
+ 			}
++			options.IDMap = copyOptions.IDMap
++			options.ChownOpts = copyOptions.ChownOpts
++			options.NoOverwriteDirNonDir = copyOptions.NoOverwriteDirNonDir
+ 		}
+ 
+ 		return archive.Untar(content, absPath, options)
+diff --git a/go.mod b/go.mod
+index ff587a776a5a94731a5773ec5d6ed09f82f4b5dd..4ebb8641d866a2d7e263a9a131e93f685ff554fa 100644
+--- a/go.mod
++++ b/go.mod
+@@ -58,7 +58,7 @@ require (
+ 	github.com/mitchellh/copystructure v1.2.0
+ 	github.com/moby/buildkit v0.28.0
+ 	github.com/moby/docker-image-spec v1.3.1
+-	github.com/moby/go-archive v0.2.0
++	github.com/moby/go-archive v0.3.3
+ 	github.com/moby/ipvs v1.1.0
+ 	github.com/moby/locker v1.0.1
+ 	github.com/moby/moby/api v1.54.0
+diff --git a/go.sum b/go.sum
+index 46c20acddeea45f50927bddf011d244e420df978..5a1a504c2042c7433be94771b2f613ddbc37f2ff 100644
+--- a/go.sum
++++ b/go.sum
+@@ -560,8 +560,8 @@ github.com/moby/buildkit v0.28.0 h1:rKulfRRSduHJPNpLTk481fHElqN9tps0VUx8YV/5zsA=
+ github.com/moby/buildkit v0.28.0/go.mod h1:RCuOcj/bVsCriBG8NeFzRxjiCFQKnKP7KOVlNTS18t4=
+ github.com/moby/docker-image-spec v1.3.1 h1:jMKff3w6PgbfSa69GfNg+zN/XLhfXJGnEx3Nl2EsFP0=
+ github.com/moby/docker-image-spec v1.3.1/go.mod h1:eKmb5VW8vQEh/BAr2yvVNvuiJuY6UIocYsFu/DxxRpo=
+-github.com/moby/go-archive v0.2.0 h1:zg5QDUM2mi0JIM9fdQZWC7U8+2ZfixfTYoHL7rWUcP8=
+-github.com/moby/go-archive v0.2.0/go.mod h1:mNeivT14o8xU+5q1YnNrkQVpK+dnNe/K6fHqnTg4qPU=
++github.com/moby/go-archive v0.3.3 h1:OxxR9paxsluYi+zDUEXTTaIxtkK3viymW+Ka7vRhhME=
++github.com/moby/go-archive v0.3.3/go.mod h1:Npdv43fFqlhZW7Xo8fbm3ZMYFvAGNviUPqX21VERbcE=
+ github.com/moby/ipvs v1.1.0 h1:ONN4pGaZQgAx+1Scz5RvWV4Q7Gb+mvfRh3NsPS+1XQQ=
+ github.com/moby/ipvs v1.1.0/go.mod h1:4VJMWuf098bsUMmZEiD4Tjk/O7mOn3l1PTD3s4OoYAs=
+ github.com/moby/locker v1.0.1 h1:fOXqR41zeveg4fFODix+1Ch4mj/gT0NE1XJbp/epuBg=
+diff --git a/vendor/github.com/moby/go-archive/.golangci.yml b/vendor/github.com/moby/go-archive/.golangci.yml
+index 21439e5c6951657515db29beae6e7541d04b2c53..761e36d9d944bf8fc4fe6be997f2283407ceb77c 100644
+--- a/vendor/github.com/moby/go-archive/.golangci.yml
++++ b/vendor/github.com/moby/go-archive/.golangci.yml
+@@ -9,6 +9,7 @@ issues:
+ linters:
+   enable:
+     - errorlint
++    - gosec
+     - unconvert
+     - unparam
+   exclusions:
+@@ -16,7 +17,18 @@ linters:
+     presets:
+       - comments
+       - std-error-handling
++    rules:
++      # Ignore "G204: Subprocess launched with a potential tainted input or cmd arguments"
++      - path: '(.+)_test\.go'
++        linters:
++          - gosec
++        text: 'G204: Subprocess launched'
+   settings:
++    gosec:
++      excludes:
++        - G301 # Expect directory permissions to be 0750 or less
++        - G304 # Potential file inclusion via variable
++        - G306 # Expect WriteFile permissions to be 0600 or less
+     staticcheck:
+       # Enable all options, with some exceptions.
+       # For defaults, see https://golangci-lint.run/usage/linters/#staticcheck
+diff --git a/vendor/github.com/moby/go-archive/archive.go b/vendor/github.com/moby/go-archive/archive.go
+index 8dce2e6e2afa34cb1ebf9296777306fe16c3aa7a..689720afaaf237d259e7260505a378edc39e8c9b 100644
+--- a/vendor/github.com/moby/go-archive/archive.go
++++ b/vendor/github.com/moby/go-archive/archive.go
+@@ -8,13 +8,16 @@
+ 	"fmt"
+ 	"io"
+ 	"os"
++	"path"
+ 	"path/filepath"
+ 	"runtime"
+ 	"strings"
++	"sync"
+ 	"syscall"
+ 	"time"
+ 
+ 	"github.com/containerd/log"
++	"github.com/moby/go-archive/internal/archiveoptions"
+ 	"github.com/moby/patternmatcher"
+ 	"github.com/moby/sys/sequential"
+ 	"github.com/moby/sys/user"
+@@ -46,9 +49,18 @@
+ 
+ 	// TarOptions wraps the tar options.
+ 	TarOptions struct {
+-		IncludeFiles     []string
+-		ExcludePatterns  []string
+-		Compression      compression.Compression
++		// IncludeFiles lists archive-relative paths to include.
++		// Paths use POSIX ('/') separators.
++		IncludeFiles []string
++
++		// ExcludePatterns lists archive-relative exclude patterns.
++		// Patterns use POSIX ('/') separators, matching patternmatcher semantics.
++		ExcludePatterns []string
++		Compression     compression.Compression
++		// NoLchown disables applying ownership from the archive to extracted files
++		// and directories. Despite its historical name, it applies to all ownership
++		// changes, leaving extracted filesystem objects owned by the user performing
++		// the extraction.
+ 		NoLchown         bool
+ 		IDMap            user.IdentityMapping
+ 		ChownOpts        *ChownOpts
+@@ -70,9 +82,22 @@
+ 		// were probably in the archive for a reason, so set this option at
+ 		// your own peril.
+ 		BestEffortXattrs bool
++
++		// internalOptions contains options for use by packages within this module.
++		internalOptions *archiveoptions.Options
+ 	}
+ )
+ 
++// WithProcSelfFD returns a copy of opts prepared for extraction in a
++// filesystem context where /proc/self/fd may not be accessible by path.
++//
++// The caller must invoke the returned cleanup function after extraction
++// completes. On platforms that do not use /proc/self/fd for extraction,
++// the returned cleanup function is a no-op.
++func WithProcSelfFD(opts *TarOptions) (*TarOptions, func(), error) {
++	return withProcSelfFD(opts)
++}
++
+ // Archiver implements the Archiver interface and allows the reuse of most utility functions of
+ // this package with a pluggable Untar function. Also, to facilitate the passing of specific id
+ // mappings for untar, an Archiver can be created with maps which will then be passed to Untar operations.
+@@ -86,10 +111,33 @@ func NewDefaultArchiver() *Archiver {
+ 	return &Archiver{Untar: Untar}
+ }
+ 
+-// breakoutError is used to differentiate errors related to breaking out
+-// When testing archive breakout in the unit tests, this error is expected
+-// in order for the test to pass.
+-type breakoutError error
++// isPathEscapes reports whether err is os.Root's path-containment error.
++//
++// os.Root currently returns an unexported errPathEscapes sentinel, so callers
++// cannot detect it with errors.Is. Keep the string comparison isolated here
++// until Go exports the error; see https://go.dev/issue/74640.
++func isPathEscapes(err error) bool {
++	// https://github.com/golang/go/blob/go1.26.5/src/os/file.go#L421
++	const errPathEscapes = "path escapes from parent"
++	for err != nil {
++		if errors.Unwrap(err) == nil {
++			return err.Error() == errPathEscapes
++		}
++		err = errors.Unwrap(err)
++	}
++	return false
++}
++
++// breakoutErr marks errors caused by archive breakout attempts.
++// Unit tests use it to distinguish expected breakout failures from other
++// errors.
++type breakoutErr struct{ error }
++
++func breakoutError(err error) error {
++	return &breakoutErr{error: err}
++}
++
++func (e *breakoutErr) Unwrap() error { return e.error }
+ 
+ const (
+ 	AUFSWhiteoutFormat    WhiteoutFormat = 0 // AUFSWhiteoutFormat is the default format for whiteouts
+@@ -98,17 +146,17 @@ func NewDefaultArchiver() *Archiver {
+ 
+ // IsArchivePath checks if the (possibly compressed) file at the given path
+ // starts with a tar file header.
+-func IsArchivePath(path string) bool {
+-	file, err := os.Open(path)
++func IsArchivePath(filePath string) bool {
++	file, err := os.Open(filePath)
+ 	if err != nil {
+ 		return false
+ 	}
+-	defer file.Close()
++	defer func() { _ = file.Close() }()
+ 	rdr, err := compression.DecompressStream(file)
+ 	if err != nil {
+ 		return false
+ 	}
+-	defer rdr.Close()
++	defer func() { _ = rdr.Close() }()
+ 	r := tar.NewReader(rdr)
+ 	_, err = r.Next()
+ 	return err == nil
+@@ -129,8 +177,10 @@ func ReplaceFileTarWrapper(inputTarStream io.ReadCloser, mods map[string]TarModi
+ 	go func() {
+ 		tarReader := tar.NewReader(inputTarStream)
+ 		tarWriter := tar.NewWriter(pipeWriter)
+-		defer inputTarStream.Close()
+-		defer tarWriter.Close()
++		defer func() {
++			_ = tarWriter.Close()
++			_ = inputTarStream.Close()
++		}()
+ 
+ 		modify := func(name string, original *tar.Header, modifier TarModifierFunc, tarReader io.Reader) error {
+ 			header, data, err := modifier(name, original, tarReader)
+@@ -164,7 +214,7 @@ func ReplaceFileTarWrapper(inputTarStream io.ReadCloser, mods map[string]TarModi
+ 				break
+ 			}
+ 			if err != nil {
+-				pipeWriter.CloseWithError(err)
++				_ = pipeWriter.CloseWithError(err)
+ 				return
+ 			}
+ 
+@@ -172,11 +222,11 @@ func ReplaceFileTarWrapper(inputTarStream io.ReadCloser, mods map[string]TarModi
+ 			if !ok {
+ 				// No modifiers for this file, copy the header and data
+ 				if err := tarWriter.WriteHeader(originalHeader); err != nil {
+-					pipeWriter.CloseWithError(err)
++					_ = pipeWriter.CloseWithError(err)
+ 					return
+ 				}
+ 				if err := copyWithBuffer(tarWriter, tarReader); err != nil {
+-					pipeWriter.CloseWithError(err)
++					_ = pipeWriter.CloseWithError(err)
+ 					return
+ 				}
+ 				continue
+@@ -184,7 +234,7 @@ func ReplaceFileTarWrapper(inputTarStream io.ReadCloser, mods map[string]TarModi
+ 			delete(mods, originalHeader.Name)
+ 
+ 			if err := modify(originalHeader.Name, originalHeader, modifier, tarReader); err != nil {
+-				pipeWriter.CloseWithError(err)
++				_ = pipeWriter.CloseWithError(err)
+ 				return
+ 			}
+ 		}
+@@ -192,12 +242,12 @@ func ReplaceFileTarWrapper(inputTarStream io.ReadCloser, mods map[string]TarModi
+ 		// Apply the modifiers that haven't matched any files in the archive
+ 		for name, modifier := range mods {
+ 			if err := modify(name, nil, modifier, nil); err != nil {
+-				pipeWriter.CloseWithError(err)
++				_ = pipeWriter.CloseWithError(err)
+ 				return
+ 			}
+ 		}
+ 
+-		pipeWriter.Close()
++		_ = pipeWriter.Close()
+ 	}()
+ 	return pipeReader
+ }
+@@ -218,7 +268,7 @@ func FileInfoHeader(name string, fi os.FileInfo, link string) (*tar.Header, erro
+ 	hdr.ModTime = hdr.ModTime.Truncate(time.Second)
+ 	hdr.AccessTime = time.Time{}
+ 	hdr.ChangeTime = time.Time{}
+-	hdr.Mode = int64(chmodTarEntry(os.FileMode(hdr.Mode)))
++	hdr.Mode = chmodTarEntry(hdr.Mode)
+ 	hdr.Name = canonicalTarName(name, fi.IsDir())
+ 	return hdr, nil
+ }
+@@ -227,7 +277,7 @@ func FileInfoHeader(name string, fi os.FileInfo, link string) (*tar.Header, erro
+ 
+ // ReadSecurityXattrToTarHeader reads security.capability xattr from filesystem
+ // to a tar header
+-func ReadSecurityXattrToTarHeader(path string, hdr *tar.Header) error {
++func ReadSecurityXattrToTarHeader(filePath string, hdr *tar.Header) error {
+ 	const (
+ 		// Values based on linux/include/uapi/linux/capability.h
+ 		xattrCapsSz2    = 20
+@@ -235,7 +285,7 @@ func ReadSecurityXattrToTarHeader(path string, hdr *tar.Header) error {
+ 		vfsCapRevision2 = 2
+ 		vfsCapRevision3 = 3
+ 	)
+-	capability, _ := lgetxattr(path, "security.capability")
++	capability, _ := lgetxattr(filePath, "security.capability")
+ 	if capability != nil {
+ 		if capability[versionOffset] == vfsCapRevision3 {
+ 			// Convert VFS_CAP_REVISION_3 to VFS_CAP_REVISION_2 as root UID makes no
+@@ -253,7 +303,7 @@ func ReadSecurityXattrToTarHeader(path string, hdr *tar.Header) error {
+ 
+ type tarWhiteoutConverter interface {
+ 	ConvertWrite(*tar.Header, string, os.FileInfo) (*tar.Header, error)
+-	ConvertRead(*tar.Header, string) (bool, error)
++	ConvertRead(*os.Root, *tar.Header, string) (bool, error)
+ }
+ 
+ type tarAppender struct {
+@@ -292,9 +342,10 @@ func canonicalTarName(name string, isDir bool) string {
+ 	return name
+ }
+ 
+-// addTarFile adds to the tar archive a file from `path` as `name`
+-func (ta *tarAppender) addTarFile(path, name string) error {
+-	fi, err := os.Lstat(path)
++// addTarFile adds to the tar archive a file from `srcPath` as `name`
++func (ta *tarAppender) addTarFile(srcPath, archivePath string) error {
++	archivePath = filepath.ToSlash(archivePath)
++	fi, err := os.Lstat(srcPath)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -302,17 +353,17 @@ func (ta *tarAppender) addTarFile(path, name string) error {
+ 	var link string
+ 	if fi.Mode()&os.ModeSymlink != 0 {
+ 		var err error
+-		link, err = os.Readlink(path)
++		link, err = os.Readlink(srcPath)
+ 		if err != nil {
+ 			return err
+ 		}
+ 	}
+ 
+-	hdr, err := FileInfoHeader(name, fi, link)
++	hdr, err := FileInfoHeader(archivePath, fi, link)
+ 	if err != nil {
+ 		return err
+ 	}
+-	if err := ReadSecurityXattrToTarHeader(path, hdr); err != nil {
++	if err := ReadSecurityXattrToTarHeader(srcPath, hdr); err != nil {
+ 		return err
+ 	}
+ 
+@@ -321,7 +372,7 @@ func (ta *tarAppender) addTarFile(path, name string) error {
+ 	if !fi.IsDir() && hasHardlinks(fi) {
+ 		inode, err := getInodeFromStat(fi.Sys())
+ 		if err != nil {
+-			return err
++			return fmt.Errorf("unexpected file info for %q: %w", srcPath, err)
+ 		}
+ 		// a link should have a name that it links too
+ 		// and that linked name should be first in the tar archive
+@@ -330,7 +381,7 @@ func (ta *tarAppender) addTarFile(path, name string) error {
+ 			hdr.Linkname = oldpath
+ 			hdr.Size = 0 // This Must be here for the writer math to add up!
+ 		} else {
+-			ta.SeenFiles[inode] = name
++			ta.SeenFiles[inode] = hdr.Name
+ 		}
+ 	}
+ 
+@@ -341,7 +392,7 @@ func (ta *tarAppender) addTarFile(path, name string) error {
+ 	// handle re-mapping container ID mappings back to host ID mappings before
+ 	// writing tar headers/files. We skip whiteout files because they were written
+ 	// by the kernel and already have proper ownership relative to the host
+-	if !isOverlayWhiteout && !strings.HasPrefix(filepath.Base(hdr.Name), WhiteoutPrefix) && !ta.IdentityMapping.Empty() {
++	if !isOverlayWhiteout && !strings.HasPrefix(path.Base(hdr.Name), WhiteoutPrefix) && !ta.IdentityMapping.Empty() {
+ 		uid, gid, err := getFileUIDGID(fi.Sys())
+ 		if err != nil {
+ 			return err
+@@ -359,7 +410,7 @@ func (ta *tarAppender) addTarFile(path, name string) error {
+ 	}
+ 
+ 	if ta.WhiteoutConverter != nil {
+-		wo, err := ta.WhiteoutConverter.ConvertWrite(hdr, path, fi)
++		wo, err := ta.WhiteoutConverter.ConvertWrite(hdr, srcPath, fi)
+ 		if err != nil {
+ 			return err
+ 		}
+@@ -370,12 +421,12 @@ func (ta *tarAppender) addTarFile(path, name string) error {
+ 		// hdr may have been updated to be a whiteout with returning
+ 		// a whiteout header
+ 		if wo != nil {
++			if hdr.Typeflag == tar.TypeReg && hdr.Size > 0 {
++				return fmt.Errorf("tar: cannot use whiteout for non-empty file %q", hdr.Name)
++			}
+ 			if err := ta.TarWriter.WriteHeader(hdr); err != nil {
+ 				return err
+ 			}
+-			if hdr.Typeflag == tar.TypeReg && hdr.Size > 0 {
+-				return fmt.Errorf("tar: cannot use whiteout for non-empty file")
+-			}
+ 			hdr = wo
+ 		}
+ 	}
+@@ -387,13 +438,13 @@ func (ta *tarAppender) addTarFile(path, name string) error {
+ 	if hdr.Typeflag == tar.TypeReg && hdr.Size > 0 {
+ 		// We use sequential file access to avoid depleting the standby list on
+ 		// Windows. On Linux, this equates to a regular os.Open.
+-		file, err := sequential.Open(path)
++		file, err := sequential.Open(srcPath)
+ 		if err != nil {
+ 			return err
+ 		}
+ 
+ 		err = copyWithBuffer(ta.TarWriter, file)
+-		file.Close()
++		_ = file.Close()
+ 		if err != nil {
+ 			return err
+ 		}
+@@ -402,11 +453,99 @@ func (ta *tarAppender) addTarFile(path, name string) error {
+ 	return nil
+ }
+ 
+-func createTarFile(path, extractDir string, hdr *tar.Header, reader io.Reader, opts *TarOptions) error {
++// resolveArchivePath resolves intermediate symlinks in name using chroot-like
++// semantics when os.Root cannot traverse them. The final path component is
++// intentionally preserved because archive extraction may create or replace it.
++//
++// This is a compatibility workaround rather than the preferred long-term
++// implementation. It resolves the path separately before the actual operation,
++// so a concurrent filesystem change may cause the operation to affect a
++// different path within root. The subsequent os.Root operation still confines
++// the operation to root and prevents such a change from escaping it.
++//
++// Paths with missing components are supported. Existing symlinks are resolved,
++// and any remaining nonexistent components are retained for later creation.
++//
++// This helper should eventually be replaced by handle-relative resolution and
++// operations with resolve-in-root semantics, avoiding the resolution/use race
++// and repeated path traversal.
++func resolveArchivePath(root *os.Root, name string) (string, error) {
++	parent, base := filepath.Split(name)
++	if parent == "" {
++		return name, nil
++	}
++
++	parent = filepath.Clean(parent)
++
++	// Follow the final parent component: it is an intermediate component of name,
++	// and an absolute symlink there must trigger the resolve-in-root fallback.
++	_, statErr := root.Stat(parent)
++	switch {
++	case statErr == nil:
++		return name, nil
++	case !os.IsNotExist(statErr) && !isPathEscapes(statErr):
++		return "", statErr
++	}
++
++	// Resolve the parent both to handle ENOENT from missing components or dangling
++	// symlinks, and to determine whether an os.Root breakout was caused by an
++	// absolute symlink. Relative symlink escapes preserve the original Stat error.
++	resolved, err := resolveFSRootPath(root.Name(), parent)
++	if err != nil {
++		return "", err
++	}
++
++	if isPathEscapes(statErr) && (!resolved.followedAbsoluteLink || resolved.relativeEscapeBeforeAbsolute) {
++		return "", statErr
++	}
++
++	relParent, err := filepath.Rel(root.Name(), resolved.path)
++	if err != nil {
++		return "", breakoutError(fmt.Errorf(
++			"could not make resolved parent %q relative to root %q: %w",
++			resolved.path,
++			root.Name(),
++			err,
++		))
++	}
++	if relParent != "." && !filepath.IsLocal(relParent) {
++		return "", breakoutError(fmt.Errorf(
++			"resolved parent %q escapes root %q",
++			resolved.path,
++			root.Name(),
++		))
++	}
++
++	return filepath.Join(relParent, base), nil
++}
++
++// resolveHardlinkTarget validates a POSIX hardlink target and resolves it to
++// the native, root-relative filesystem path used for extraction.
++func resolveHardlinkTarget(root *os.Root, linkname string) (string, error) {
++	cleaned := path.Clean(linkname)
++	if strings.HasPrefix(cleaned, "/") {
++		// Some image builders (e.g. kaniko) write hardlink targets as absolute
++		// paths. Resolve those relative to the extraction root, with chroot-like
++		// semantics matching absolute symlink targets. Strip the root from the
++		// original linkname rather than the cleaned one so that ".." components
++		// are not collapsed against "/" but instead rejected below.
++		cleaned = path.Clean(strings.TrimLeft(linkname, "/"))
++	}
++	if cleaned == "." || !filepath.IsLocal(cleaned) {
++		return "", breakoutError(fmt.Errorf("invalid hardlink target %q", linkname))
++	}
++	return resolveArchivePath(root, filepath.FromSlash(cleaned))
++}
++
++// createTarFile extracts a single tar entry into the given root. dstPath is the
++// root-relative path of the entry being extracted, in native (host-separator)
++// form so it can be passed directly to os.Root methods and fsRootPath.
++func createTarFile(root *os.Root, dstPath string, hdr *tar.Header, reader io.Reader, opts *TarOptions) error {
+ 	var (
+ 		Lchown                     = true
+ 		inUserns, bestEffortXattrs bool
+ 		chownOpts                  *ChownOpts
++		internalOpts               *archiveoptions.Options
+ 	)
+ 
+ 	// TODO(thaJeztah): make opts a required argument.
+@@ -415,6 +554,7 @@ func createTarFile(path, extractDir string, hdr *tar.Header, reader io.Reader, o
+ 		inUserns = opts.InUserNS // TODO(thaJeztah): consider deprecating opts.InUserNS and detect locally.
+ 		chownOpts = opts.ChownOpts
+ 		bestEffortXattrs = opts.BestEffortXattrs
++		internalOpts = opts.internalOptions
+ 	}
+ 
+ 	// hdr.Mode is in linux format, which we can use for sycalls,
+@@ -422,20 +562,35 @@ func createTarFile(path, extractDir string, hdr *tar.Header, reader io.Reader, o
+ 	// so use hdrInfo.Mode() (they differ for e.g. setuid bits)
+ 	hdrInfo := hdr.FileInfo()
+ 
++	var hardlinkTarget string
++	if hdr.Typeflag == tar.TypeLink {
++		var err error
++		hardlinkTarget, err = resolveHardlinkTarget(root, hdr.Linkname)
++		if err != nil {
++			return err
++		}
++	}
++
+ 	switch hdr.Typeflag {
+ 	case tar.TypeDir:
+-		// Create directory unless it exists as a directory already.
+-		// In that case we just want to merge the two
+-		if fi, err := os.Lstat(path); err != nil || !fi.IsDir() {
+-			if err := os.Mkdir(path, hdrInfo.Mode()); err != nil {
++		// Create directory unless it already exists as one; merge in that case.
++		// os.Root.Mkdir only accepts the nine least-significant permission
++		// bits; special bits (setuid, setgid, sticky) are applied afterward
++		// by handleLChmod via root.Chmod.
++		if fi, err := root.Lstat(dstPath); err != nil || !fi.IsDir() {
++			if err := root.Mkdir(dstPath, hdrInfo.Mode()&0o777); err != nil {
+ 				return err
+ 			}
+ 		}
+ 
+ 	case tar.TypeReg:
+-		// Source is regular file. We use sequential file access to avoid depleting
+-		// the standby list on Windows. On Linux, this equates to a regular os.OpenFile.
+-		file, err := sequential.OpenFile(path, os.O_CREATE|os.O_WRONLY, hdrInfo.Mode())
++		// Source is a regular file. Use os.Root.OpenFile so that all
++		// path resolution is bounded within root using openat(2) semantics.
++		// os.Root.OpenFile only accepts the nine least-significant permission
++		// bits; special bits are applied afterward by handleLChmod.
++		// We use sequential file access to avoid depleting the standby list
++		// on Windows (go1.26). On Linux, this equates to a regular os.OpenFile.
++		file, err := root.OpenFile(dstPath, os.O_CREATE|os.O_WRONLY|os.O_TRUNC|windows_O_FILE_FLAG_SEQUENTIAL_SCAN, hdrInfo.Mode()&0o777)
+ 		if err != nil {
+ 			return err
+ 		}
+@@ -447,47 +602,41 @@ func createTarFile(path, extractDir string, hdr *tar.Header, reader io.Reader, o
+ 
+ 	case tar.TypeBlock, tar.TypeChar:
+ 		if inUserns { // cannot create devices in a userns
+-			log.G(context.TODO()).WithFields(log.Fields{"path": path, "type": hdr.Typeflag}).Debug("skipping device nodes in a userns")
++			log.G(context.TODO()).WithFields(log.Fields{"path": dstPath, "type": hdr.Typeflag}).Debug("skipping device nodes in a userns")
+ 			return nil
+ 		}
+-		// Handle this is an OS-specific way
+-		if err := handleTarTypeBlockCharFifo(hdr, path); err != nil {
++		if err := handleTarTypeBlockCharFifo(root, hdr, dstPath); err != nil {
+ 			return err
+ 		}
+ 
+ 	case tar.TypeFifo:
+-		// Handle this is an OS-specific way
+-		if err := handleTarTypeBlockCharFifo(hdr, path); err != nil {
++		if err := handleTarTypeBlockCharFifo(root, hdr, dstPath); err != nil {
+ 			if inUserns && errors.Is(err, syscall.EPERM) {
+ 				// In most cases, cannot create a fifo if running in user namespace
+-				log.G(context.TODO()).WithFields(log.Fields{"error": err, "path": path, "type": hdr.Typeflag}).Debug("creating fifo node in a userns")
++				log.G(context.TODO()).WithFields(log.Fields{"error": err, "path": dstPath, "type": hdr.Typeflag}).Debug("creating fifo node in a userns")
+ 				return nil
+ 			}
+ 			return err
+ 		}
+ 
+ 	case tar.TypeLink:
+-		// #nosec G305 -- The target path is checked for path traversal.
+-		targetPath := filepath.Join(extractDir, hdr.Linkname)
+-		// check for hardlink breakout
+-		if !strings.HasPrefix(targetPath, extractDir) {
+-			return breakoutError(fmt.Errorf("invalid hardlink %q -> %q", targetPath, hdr.Linkname))
+-		}
+-		if err := os.Link(targetPath, path); err != nil {
++		if err := root.Link(hardlinkTarget, dstPath); err != nil {
+ 			return err
+ 		}
+ 
+ 	case tar.TypeSymlink:
+-		// 	path 				-> hdr.Linkname = targetPath
+-		// e.g. /extractDir/path/to/symlink 	-> ../2/file	= /extractDir/path/2/file
+-		targetPath := filepath.Join(filepath.Dir(path), hdr.Linkname) // #nosec G305 -- The target path is checked for path traversal.
+-
+-		// the reason we don't need to check symlinks in the path (with FollowSymlinkInScope) is because
+-		// that symlink would first have to be created, which would be caught earlier, at this very check:
+-		if !strings.HasPrefix(targetPath, extractDir) {
+-			return breakoutError(fmt.Errorf("invalid symlink %q -> %q", path, hdr.Linkname))
+-		}
+-		if err := os.Symlink(hdr.Linkname, path); err != nil {
++		// Symlink targets are archive data, not filesystem paths. Preserve the
++		// target verbatim rather than cleaning or converting it (filepath.FromSlash).
++		linkTarget := hdr.Linkname
++
++		// os.Root.Symlink contains the symlink's location (newname) within
++		// root but stores the target (oldname) verbatim, so absolute targets
++		// such as /usr/lib -- common and legitimate in container images -- are
++		// preserved rather than rejected. The symlink node is therefore always
++		// created within root via openat(2) semantics, without resolving to an
++		// absolute path; containment applies when the symlink is followed, not
++		// at creation.
++		if err := root.Symlink(linkTarget, dstPath); err != nil {
+ 			return err
+ 		}
+ 
+@@ -504,22 +653,31 @@ func createTarFile(path, extractDir string, hdr *tar.Header, reader io.Reader, o
+ 		if chownOpts == nil {
+ 			chownOpts = &ChownOpts{UID: hdr.Uid, GID: hdr.Gid}
+ 		}
+-		if err := os.Lchown(path, chownOpts.UID, chownOpts.GID); err != nil {
++		if err := root.Lchown(dstPath, chownOpts.UID, chownOpts.GID); err != nil {
+ 			var msg string
+ 			if inUserns && errors.Is(err, syscall.EINVAL) {
+ 				msg = " (try increasing the number of subordinate IDs in /etc/subuid and /etc/subgid)"
+ 			}
+-			return fmt.Errorf("failed to Lchown %q for UID %d, GID %d%s: %w", path, hdr.Uid, hdr.Gid, msg, err)
++			return fmt.Errorf("failed to Lchown %q for UID %d, GID %d%s: %w", dstPath, hdr.Uid, hdr.Gid, msg, err)
+ 		}
+ 	}
+ 
+ 	var xattrErrs []string
++	absPath := sync.OnceValues(func() (string, error) {
++		return fsRootPath(root.Name(), dstPath)
++	})
+ 	for key, value := range hdr.PAXRecords {
+ 		xattr, ok := strings.CutPrefix(key, paxSchilyXattr)
+ 		if !ok {
+ 			continue
+ 		}
+-		if err := lsetxattr(path, xattr, []byte(value), 0); err != nil {
++		// os.Root has no xattr support; use the absolute path derived from
++		// the root so the path remains bounded.
++		ap, err := absPath()
++		if err != nil {
++			return err
++		}
++		if err := lsetxattr(ap, xattr, []byte(value), 0); err != nil {
+ 			if bestEffortXattrs && errors.Is(err, syscall.ENOTSUP) || errors.Is(err, syscall.EPERM) {
+ 				// EPERM occurs if modifying xattrs is not allowed. This can
+ 				// happen when running in userns with restrictions (ChromeOS).
+@@ -538,39 +696,43 @@ func createTarFile(path, extractDir string, hdr *tar.Header, reader io.Reader, o
+ 
+ 	// There is no LChmod, so ignore mode for symlink. Also, this
+ 	// must happen after chown, as that can modify the file mode
+-	if err := handleLChmod(hdr, path, hdrInfo); err != nil {
++	if err := handleLChmod(root, dstPath, hardlinkTarget, hdr, hdrInfo, internalOpts); err != nil {
+ 		return err
+ 	}
+ 
+ 	aTime := boundTime(latestTime(hdr.AccessTime, hdr.ModTime))
+ 	mTime := boundTime(hdr.ModTime)
+ 
+-	// chtimes doesn't support a NOFOLLOW flag atm
+-	if hdr.Typeflag == tar.TypeLink {
+-		if fi, err := os.Lstat(hdr.Linkname); err == nil && (fi.Mode()&os.ModeSymlink == 0) {
+-			if err := chtimes(path, aTime, mTime); err != nil {
++	switch hdr.Typeflag {
++	case tar.TypeSymlink:
++		// Apply timestamps to the symlink itself (AT_SYMLINK_NOFOLLOW).
++		if err := lchtimes(root, dstPath, aTime, mTime); err != nil {
++			return err
++		}
++	case tar.TypeLink:
++		// Follow the hardlink only when its target is not itself a symlink.
++		fi, err := root.Lstat(hardlinkTarget)
++		if err == nil && fi.Mode()&os.ModeSymlink == 0 {
++			if err := chtimes(root, dstPath, aTime, mTime); err != nil {
+ 				return err
+ 			}
+ 		}
+-	} else if hdr.Typeflag != tar.TypeSymlink {
+-		if err := chtimes(path, aTime, mTime); err != nil {
+-			return err
+-		}
+-	} else {
+-		if err := lchtimes(path, aTime, mTime); err != nil {
++	default:
++		// All other file types follow symlinks.
++		if err := chtimes(root, dstPath, aTime, mTime); err != nil {
+ 			return err
+ 		}
+ 	}
+ 	return nil
+ }
+ 
+-// Tar creates an archive from the directory at `path`, and returns it as a
++// Tar creates an archive from the directory at `srcPath`, and returns it as a
+ // stream of bytes.
+-func Tar(path string, comp compression.Compression) (io.ReadCloser, error) {
+-	return TarWithOptions(path, &TarOptions{Compression: comp})
++func Tar(srcPath string, comp compression.Compression) (io.ReadCloser, error) {
++	return TarWithOptions(srcPath, &TarOptions{Compression: comp})
+ }
+ 
+-// TarWithOptions creates an archive from the directory at `path`, only including files whose relative
++// TarWithOptions creates an archive from the directory at `srcPath`, only including files whose relative
+ // paths are included in `options.IncludeFiles` (if non-nil) or not in `options.ExcludePatterns`.
+ func TarWithOptions(srcPath string, options *TarOptions) (io.ReadCloser, error) {
+ 	tb, err := NewTarballer(srcPath, options)
+@@ -639,13 +801,13 @@ func (t *Tarballer) Do() {
+ 
+ 	defer func() {
+ 		// Make sure to check the error on Close.
+-		if err := ta.TarWriter.Close(); err != nil {
++		if err := ta.TarWriter.Close(); err != nil && !errors.Is(err, io.ErrClosedPipe) {
+ 			log.G(context.TODO()).Errorf("Can't close tar writer: %s", err)
+ 		}
+-		if err := t.compressWriter.Close(); err != nil {
++		if err := t.compressWriter.Close(); err != nil && !errors.Is(err, io.ErrClosedPipe) {
+ 			log.G(context.TODO()).Errorf("Can't close compress writer: %s", err)
+ 		}
+-		if err := t.pipeWriter.Close(); err != nil {
++		if err := t.pipeWriter.Close(); err != nil && !errors.Is(err, io.ErrClosedPipe) {
+ 			log.G(context.TODO()).Errorf("Can't close pipe writer: %s", err)
+ 		}
+ 	}()
+@@ -803,11 +965,28 @@ func (t *Tarballer) Do() {
+ 	}
+ }
+ 
++// unpackedDir records a directory whose mtime must be restored after all
++// entries are extracted, along with the root-relative entry name used during
++// extraction.
++type unpackedDir struct {
++	hdr  *tar.Header
++	name string // root-relative entry name
++}
++
+ // Unpack unpacks the decompressedArchive to dest with options.
+ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) error {
++	if options == nil {
++		options = &TarOptions{}
++	}
++	root, err := os.OpenRoot(dest)
++	if err != nil {
++		return err
++	}
++	defer func() { _ = root.Close() }()
++
+ 	tr := tar.NewReader(decompressedArchive)
+ 
+-	var dirs []*tar.Header
++	var dirs []unpackedDir
+ 	whiteoutConverter := getWhiteoutConverter(options.WhiteoutFormat)
+ 
+ 	// Iterate through the files in the archive.
+@@ -828,48 +1007,53 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ 			continue
+ 		}
+ 
+-		// Normalize name, for safety and for a simple is-root check
+-		// This keeps "../" as-is, but normalizes "/../" to "/". Or Windows:
+-		// This keeps "..\" as-is, but normalizes "\..\" to "\".
+-		hdr.Name = filepath.Clean(hdr.Name)
+-
++		// Strip a leading "/" so absolute entries stay root-relative, and
++		// normalize the POSIX tar path. Skip entries referring to the extraction
++		// root and reject paths that escape it.
++		name := path.Clean(strings.TrimLeft(hdr.Name, "/"))
++		if name == "." {
++			continue
++		}
++		if !filepath.IsLocal(name) {
++			return breakoutError(fmt.Errorf("invalid entry name %q", hdr.Name))
++		}
+ 		for _, exclude := range options.ExcludePatterns {
+-			if strings.HasPrefix(hdr.Name, exclude) {
++			if strings.HasPrefix(name, exclude) {
+ 				continue loop
+ 			}
+ 		}
+ 
+-		// Ensure that the parent directory exists.
+-		err = createImpliedDirectories(dest, hdr, options)
+-		if err != nil {
+-			return err
++		hdr.Name = name
++
++		// Skip entries whose name (or hardlink target) Windows cannot represent.
++		if err := unrepresentableOnWindows(hdr); err != nil {
++			log.G(context.TODO()).Warnf("Windows: ignoring entry: %v", err)
++			continue loop
+ 		}
+ 
+-		// #nosec G305 -- The joined path is checked for path traversal.
+-		path := filepath.Join(dest, hdr.Name)
+-		rel, err := filepath.Rel(dest, path)
++		// dstPath is the native (host-separator) form of the entry name,
++		// used at all filesystem boundaries (os.Root methods, fsRootPath).
++		// hdr.Name stays POSIX (forward-slash) for logical string checks.
++		dstPath, err := resolveArchivePath(root, filepath.FromSlash(hdr.Name))
+ 		if err != nil {
+ 			return err
+ 		}
+-		if strings.HasPrefix(rel, ".."+string(os.PathSeparator)) {
+-			return breakoutError(fmt.Errorf("%q is outside of %q", hdr.Name, dest))
+-		}
+ 
+-		// If path exits we almost always just want to remove and replace it
++		// If dstPath exists we almost always just want to remove and replace it.
+ 		// The only exception is when it is a directory *and* the file from
+ 		// the layer is also a directory. Then we want to merge them (i.e.
+ 		// just apply the metadata from the layer).
+-		if fi, err := os.Lstat(path); err == nil {
++		if fi, err := root.Lstat(dstPath); err == nil {
+ 			if options.NoOverwriteDirNonDir && fi.IsDir() && hdr.Typeflag != tar.TypeDir {
+ 				// If NoOverwriteDirNonDir is true then we cannot replace
+ 				// an existing directory with a non-directory from the archive.
+-				return fmt.Errorf("cannot overwrite directory %q with non-directory %q", path, dest)
++				return fmt.Errorf("cannot overwrite directory %q with non-directory %q", hdr.Name, dest)
+ 			}
+ 
+ 			if options.NoOverwriteDirNonDir && !fi.IsDir() && hdr.Typeflag == tar.TypeDir {
+ 				// If NoOverwriteDirNonDir is true then we cannot replace
+ 				// an existing non-directory with a directory from the archive.
+-				return fmt.Errorf("cannot overwrite non-directory %q with directory %q", path, dest)
++				return fmt.Errorf("cannot overwrite non-directory %q with directory %q", hdr.Name, dest)
+ 			}
+ 
+ 			if fi.IsDir() && hdr.Name == "." {
+@@ -877,7 +1061,7 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ 			}
+ 
+ 			if !fi.IsDir() || hdr.Typeflag != tar.TypeDir {
+-				if err := os.RemoveAll(path); err != nil {
++				if err := root.RemoveAll(dstPath); err != nil {
+ 					return err
+ 				}
+ 			}
+@@ -887,8 +1071,16 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ 			return err
+ 		}
+ 
++		// Ensure that the parent directory exists.
++		//
++		// This must be done before whiteoutConverter.ConvertRead, which
++		// may set xattrs on the directory or create whiteout files.
++		if err := createImpliedDirectories(root, dstPath, options); err != nil {
++			return err
++		}
++
+ 		if whiteoutConverter != nil {
+-			writeFile, err := whiteoutConverter.ConvertRead(hdr, path)
++			writeFile, err := whiteoutConverter.ConvertRead(root, hdr, dstPath)
+ 			if err != nil {
+ 				return err
+ 			}
+@@ -897,51 +1089,121 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ 			}
+ 		}
+ 
+-		if err := createTarFile(path, dest, hdr, tr, options); err != nil {
++		if err := createTarFile(root, dstPath, hdr, tr, options); err != nil {
+ 			return err
+ 		}
+ 
+ 		// Directory mtimes must be handled at the end to avoid further
+ 		// file creation in them to modify the directory mtime
+ 		if hdr.Typeflag == tar.TypeDir {
+-			dirs = append(dirs, hdr)
++			dirs = append(dirs, unpackedDir{hdr: hdr, name: dstPath})
+ 		}
+ 	}
+ 
+-	for _, hdr := range dirs {
+-		// #nosec G305 -- The header was checked for path traversal before it was appended to the dirs slice.
+-		path := filepath.Join(dest, hdr.Name)
+-
+-		if err := chtimes(path, boundTime(latestTime(hdr.AccessTime, hdr.ModTime)), boundTime(hdr.ModTime)); err != nil {
++	for _, d := range dirs {
++		aTime := boundTime(latestTime(d.hdr.AccessTime, d.hdr.ModTime))
++		if err := chtimes(root, d.name, aTime, boundTime(d.hdr.ModTime)); err != nil {
+ 			return err
+ 		}
+ 	}
+ 	return nil
+ }
+ 
+-// createImpliedDirectories will create all parent directories of the current path with default permissions, if they do
+-// not already exist. This is possible as the tar format supports 'implicit' directories, where their existence is
+-// defined by the paths of files in the tar, but there are no header entries for the directories themselves, and thus
+-// we most both create them and choose metadata like permissions.
++// unrepresentableOnWindows returns an error describing why a tar entry cannot
++// be faithfully created on Windows, or nil if it can (always on non-Windows).
++// On Windows ":" is illegal in a filename and "\" is a path separator, so a tar
++// name or hardlink target containing them (they use POSIX semantics) would be
++// misinterpreted by os.Root (e.g. "a\b" resolved as two components). Symlink
++// targets are stored verbatim (not resolved at creation), so they are exempt.
++func unrepresentableOnWindows(hdr *tar.Header) error {
++	if runtime.GOOS != "windows" {
++		return nil
++	}
++	if strings.ContainsAny(hdr.Name, `:\`) {
++		return fmt.Errorf("entry name %q contains a character Windows cannot represent in a path", hdr.Name)
++	}
++	// A hardlink target is resolved within the root by os.Root.Link; a symlink
++	// target is stored verbatim, so only hardlinks need the target checked.
++	if hdr.Typeflag == tar.TypeLink && strings.ContainsAny(hdr.Linkname, `:\`) {
++		return fmt.Errorf("hardlink target %q contains a character Windows cannot represent in a path", hdr.Linkname)
++	}
++	return nil
++}
++
++// createImpliedDirectories creates all parent directories of dstPath with
++// default permissions if they do not already exist. This is necessary because
++// the tar format permits implicit directories whose existence is defined only
++// by file paths, without corresponding directory headers from which metadata
++// could be restored.
+ //
+-// The caller should have performed filepath.Clean(hdr.Name), so hdr.Name will now be in the filepath format for the OS
+-// on which the daemon is running. This precondition is required because this function assumes a OS-specific path
+-// separator when checking that a path is not the root.
+-func createImpliedDirectories(dest string, hdr *tar.Header, options *TarOptions) error {
+-	// Not the root directory, ensure that the parent directory exists
+-	if !strings.HasSuffix(hdr.Name, string(os.PathSeparator)) {
+-		parent := filepath.Dir(hdr.Name)
+-		parentPath := filepath.Join(dest, parent)
+-		if _, err := os.Lstat(parentPath); err != nil && os.IsNotExist(err) {
+-			// RootPair() is confined inside this loop as most cases will not require a call, so we can spend some
+-			// unneeded function calls in the uncommon case to encapsulate logic -- implied directories are a niche
+-			// usage that reduces the portability of an image.
+-			uid, gid := options.IDMap.RootPair()
+-
+-			err = user.MkdirAllAndChown(parentPath, ImpliedDirectoryMode, uid, gid, user.WithOnlyNew)
++// The caller must pass a normalized, root-relative local path. Any archive-path
++// conversion and resolve-in-root handling must already have been applied.
++// Directory creation is performed through root, so it remains confined to the
++// extraction destination even if the destination tree changes concurrently.
++func createImpliedDirectories(root *os.Root, dstPath string, options *TarOptions) error {
++	parent := filepath.Dir(dstPath)
++
++	// Skip when the parent is the root itself; nothing to create.
++	if parent == "." || parent == "" {
++		return nil
++	}
++	if _, err := root.Lstat(parent); err == nil {
++		return nil
++	} else if !os.IsNotExist(err) {
++		return err
++	}
++	// RootPair() is confined inside this loop as most cases will not require a call, so we can spend some
++	// unneeded function calls in the uncommon case to encapsulate logic -- implied directories are a niche
++	// usage that reduces the portability of an image.
++	uid, gid := options.IDMap.RootPair()
++
++	// Similar to [user.MkdirAllAndChown]
++	//
++	// [user.MkdirAllAndChown]: https://pkg.go.dev/github.com/moby/sys/user#MkdirAllAndChown
++	var cur string
++	for c := range strings.SplitSeq(parent, string(os.PathSeparator)) {
++		if c == "" {
++			continue
++		}
++		cur = filepath.Join(cur, c)
++		if err := root.Mkdir(cur, ImpliedDirectoryMode); err != nil {
++			if !errors.Is(err, os.ErrExist) {
++				return err
++			}
++
++			fi, err := root.Stat(cur)
+ 			if err != nil {
+ 				return err
+ 			}
++			if fi.IsDir() {
++				continue
++			}
++			return &os.PathError{Op: "mkdir", Path: cur, Err: syscall.ENOTDIR}
++		}
++		if options.NoLchown {
++			continue
++		}
++		// Only the successful Mkdir case is newly-created.
++		dir, err := root.Open(cur)
++		if err != nil {
++			return err
++		}
++		if uid != 0 || gid != 0 {
++			if err := dir.Chown(uid, gid); err != nil {
++				_ = dir.Close()
++				return err
++			}
++		}
++		// root.Mkdir applies the mode subject to the process umask, so
++		// re-apply it with Chmod to guarantee ImpliedDirectoryMode
++		// independent of umask, matching the previous MkdirAllAndChown
++		// behavior.
++		if err := dir.Chmod(ImpliedDirectoryMode); err != nil {
++			_ = dir.Close()
++			return err
++		}
++		if err := dir.Close(); err != nil {
++			return err
+ 		}
+ 	}
+ 
+@@ -974,9 +1236,6 @@ func untarHandler(tarArchive io.Reader, dest string, options *TarOptions, decomp
+ 	if options == nil {
+ 		options = &TarOptions{}
+ 	}
+-	if options.ExcludePatterns == nil {
+-		options.ExcludePatterns = []string{}
+-	}
+ 
+ 	r := tarArchive
+ 	if decompress {
+@@ -984,7 +1243,7 @@ func untarHandler(tarArchive io.Reader, dest string, options *TarOptions, decomp
+ 		if err != nil {
+ 			return err
+ 		}
+-		defer decompressedArchive.Close()
++		defer func() { _ = decompressedArchive.Close() }()
+ 		r = decompressedArchive
+ 	}
+ 
+@@ -998,7 +1257,7 @@ func (archiver *Archiver) TarUntar(src, dst string) error {
+ 	if err != nil {
+ 		return err
+ 	}
+-	defer archive.Close()
++	defer func() { _ = archive.Close() }()
+ 	return archiver.Untar(archive, dst, &TarOptions{
+ 		IDMap: archiver.IDMapping,
+ 	})
+@@ -1010,7 +1269,7 @@ func (archiver *Archiver) UntarPath(src, dst string) error {
+ 	if err != nil {
+ 		return err
+ 	}
+-	defer archive.Close()
++	defer func() { _ = archive.Close() }()
+ 	return archiver.Untar(archive, dst, &TarOptions{
+ 		IDMap: archiver.IDMapping,
+ 	})
+@@ -1070,13 +1329,13 @@ func (archiver *Archiver) CopyFileWithTar(src, dst string) (err error) {
+ 		defer close(errC)
+ 
+ 		errC <- func() error {
+-			defer w.Close()
++			defer func() { _ = w.Close() }()
+ 
+ 			srcF, err := os.Open(src)
+ 			if err != nil {
+ 				return err
+ 			}
+-			defer srcF.Close()
++			defer func() { _ = srcF.Close() }()
+ 
+ 			hdr, err := tarheader.FileInfoHeaderNoLookups(srcSt, "")
+ 			if err != nil {
+@@ -1087,14 +1346,14 @@ func (archiver *Archiver) CopyFileWithTar(src, dst string) (err error) {
+ 			hdr.AccessTime = time.Time{}
+ 			hdr.ChangeTime = time.Time{}
+ 			hdr.Name = filepath.Base(dst)
+-			hdr.Mode = int64(chmodTarEntry(os.FileMode(hdr.Mode)))
++			hdr.Mode = chmodTarEntry(hdr.Mode)
+ 
+ 			if err := remapIDs(archiver.IDMapping, hdr); err != nil {
+ 				return err
+ 			}
+ 
+ 			tw := tar.NewWriter(w)
+-			defer tw.Close()
++			defer func() { _ = tw.Close() }()
+ 			if err := tw.WriteHeader(hdr); err != nil {
+ 				return err
+ 			}
+@@ -1112,7 +1371,7 @@ func (archiver *Archiver) CopyFileWithTar(src, dst string) (err error) {
+ 
+ 	err = archiver.Untar(r, filepath.Dir(dst), nil)
+ 	if err != nil {
+-		r.CloseWithError(err)
++		_ = r.CloseWithError(err)
+ 	}
+ 	return err
+ }
+diff --git a/vendor/github.com/moby/go-archive/archive_linux.go b/vendor/github.com/moby/go-archive/archive_linux.go
+index 7b6c3e02b6438f1656d5cd91be4134c0f81fd0b2..c813cf9a7d50f9b417a228ba8171ca9361230526 100644
+--- a/vendor/github.com/moby/go-archive/archive_linux.go
++++ b/vendor/github.com/moby/go-archive/archive_linux.go
+@@ -4,45 +4,71 @@
+ 	"archive/tar"
+ 	"fmt"
+ 	"os"
++	"path"
+ 	"path/filepath"
+ 	"strings"
+ 
++	"github.com/moby/go-archive/internal/archiveoptions"
+ 	"github.com/moby/sys/userns"
+ 	"golang.org/x/sys/unix"
+ )
+ 
++func withProcSelfFD(opts *TarOptions) (*TarOptions, func(), error) {
++	procSelfFD, err := os.Open("/proc/self/fd")
++	if err != nil {
++		return nil, nil, err
++	}
++
++	var prepared TarOptions
++	if opts != nil {
++		prepared = *opts
++	}
++	prepared.internalOptions = &archiveoptions.Options{
++		ProcSelfFD: procSelfFD,
++	}
++
++	return &prepared, func() { _ = procSelfFD.Close() }, nil
++}
++
+ func getWhiteoutConverter(format WhiteoutFormat) tarWhiteoutConverter {
+ 	if format == OverlayWhiteoutFormat {
+-		return overlayWhiteoutConverter{}
++		return newOverlayWhiteoutConverter()
+ 	}
+ 	return nil
+ }
+ 
+-type overlayWhiteoutConverter struct{}
++type overlayWhiteoutConverter struct {
++	opaqueXattr string
++}
++
++func newOverlayWhiteoutConverter() overlayWhiteoutConverter {
++	opaqueXattr := "trusted.overlay.opaque"
++	if userns.RunningInUserNS() {
++		opaqueXattr = "user.overlay.opaque"
++	}
++	return overlayWhiteoutConverter{
++		opaqueXattr: opaqueXattr,
++	}
++}
+ 
+-func (overlayWhiteoutConverter) ConvertWrite(hdr *tar.Header, path string, fi os.FileInfo) (wo *tar.Header, _ error) {
++func (c overlayWhiteoutConverter) ConvertWrite(hdr *tar.Header, filePath string, fi os.FileInfo) (wo *tar.Header, _ error) {
+ 	// convert whiteouts to AUFS format
+ 	if fi.Mode()&os.ModeCharDevice != 0 && hdr.Devmajor == 0 && hdr.Devminor == 0 {
+ 		// we just rename the file and make it normal
+-		dir, filename := filepath.Split(hdr.Name)
+-		hdr.Name = filepath.Join(dir, WhiteoutPrefix+filename)
++		dir, filename := path.Split(hdr.Name)
++		hdr.Name = path.Join(dir, WhiteoutPrefix+filename)
+ 		hdr.Mode = 0o600
+ 		hdr.Typeflag = tar.TypeReg
+ 		hdr.Size = 0
+ 	}
+ 
+-	if fi.Mode()&os.ModeDir == 0 {
++	if !fi.IsDir() {
+ 		// FIXME(thaJeztah): return a sentinel error instead of nil, nil
+ 		return nil, nil
+ 	}
+ 
+-	opaqueXattrName := "trusted.overlay.opaque"
+-	if userns.RunningInUserNS() {
+-		opaqueXattrName = "user.overlay.opaque"
+-	}
+-
+ 	// convert opaque dirs to AUFS format by writing an empty file with the prefix
+-	opaque, err := lgetxattr(path, opaqueXattrName)
++	opaque, err := lgetxattr(filePath, c.opaqueXattr)
+ 	if err != nil {
+ 		return nil, err
+ 	}
+@@ -50,14 +76,14 @@ func (overlayWhiteoutConverter) ConvertWrite(hdr *tar.Header, path string, fi os
+ 		// FIXME(thaJeztah): return a sentinel error instead of nil, nil
+ 		return nil, nil
+ 	}
+-	delete(hdr.PAXRecords, paxSchilyXattr+opaqueXattrName)
++	delete(hdr.PAXRecords, paxSchilyXattr+c.opaqueXattr)
+ 
+ 	// create a header for the whiteout file
+ 	// it should inherit some properties from the parent, but be a regular file
+ 	return &tar.Header{
+ 		Typeflag:   tar.TypeReg,
+ 		Mode:       hdr.Mode & int64(os.ModePerm),
+-		Name:       filepath.Join(hdr.Name, WhiteoutOpaqueDir), // #nosec G305 -- An archive is being created, not extracted.
++		Name:       path.Join(hdr.Name, WhiteoutOpaqueDir), // #nosec G305 -- An archive is being created, not extracted.
+ 		Size:       0,
+ 		Uid:        hdr.Uid,
+ 		Uname:      hdr.Uname,
+@@ -68,40 +94,67 @@ func (overlayWhiteoutConverter) ConvertWrite(hdr *tar.Header, path string, fi os
+ 	}, nil
+ }
+ 
+-func (c overlayWhiteoutConverter) ConvertRead(hdr *tar.Header, path string) (bool, error) {
+-	base := filepath.Base(path)
+-	dir := filepath.Dir(path)
++func (c overlayWhiteoutConverter) ConvertRead(root *os.Root, hdr *tar.Header, filePath string) (bool, error) {
++	base := filepath.Base(filePath)
++	dir := filepath.Dir(filePath)
++
++	switch base {
++	case WhiteoutPrefix, WhiteoutPrefix + ".", WhiteoutPrefix + "..":
++		return false, fmt.Errorf("invalid whiteout entry %q", hdr.Name)
++
++	case WhiteoutOpaqueDir:
++		parent, err := root.Open(dir)
++		if err != nil {
++			return false, err
++		}
++		defer parent.Close()
+ 
+-	// if a directory is marked as opaque by the AUFS special file, we need to translate that to overlay
+-	if base == WhiteoutOpaqueDir {
+-		opaqueXattrName := "trusted.overlay.opaque"
+-		if userns.RunningInUserNS() {
+-			opaqueXattrName = "user.overlay.opaque"
++		// If a directory is marked as opaque by the AUFS special file, we need to translate that to overlay.
++		if err := unix.Fsetxattr(int(parent.Fd()), c.opaqueXattr, []byte{'y'}, 0); err != nil {
++			return false, fmt.Errorf("fsetxattr('%s', %s=y): %w", dir, c.opaqueXattr, err)
+ 		}
++		// Don't write the whiteout file itself.
++		return false, nil
+ 
+-		err := unix.Setxattr(dir, opaqueXattrName, []byte{'y'}, 0)
++	default:
++		originalBase, ok := strings.CutPrefix(base, WhiteoutPrefix)
++		if !ok {
++			// Regular file.
++			return true, nil
++		}
++
++		parent, err := root.Open(dir)
+ 		if err != nil {
+-			return false, fmt.Errorf("setxattr('%s', %s=y): %w", dir, opaqueXattrName, err)
++			return false, err
+ 		}
+-		// don't write the file itself
+-		return false, err
+-	}
++		defer parent.Close()
+ 
+-	// if a file was deleted and we are using overlay, we need to create a character device
+-	if strings.HasPrefix(base, WhiteoutPrefix) {
+-		originalBase := base[len(WhiteoutPrefix):]
++		// If a file was deleted, and we are using overlay, we need to create a character device.
+ 		originalPath := filepath.Join(dir, originalBase)
+-
+-		if err := unix.Mknod(originalPath, unix.S_IFCHR, 0); err != nil {
++		if err := unix.Mknodat(int(parent.Fd()), originalBase, unix.S_IFCHR, 0); err != nil {
+ 			return false, fmt.Errorf("failed to mknod('%s', S_IFCHR, 0): %w", originalPath, err)
+ 		}
+-		if err := os.Chown(originalPath, hdr.Uid, hdr.Gid); err != nil {
+-			return false, err
++
++		// Header IDs have already been remapped. Optimize the common non-remapped
++		// root-owned (0:0) case by assuming the created whiteout has the expected
++		// ownership, rather than comparing against the effective UID/GID or stat'ing
++		// the created node to verify it.
++		if hdr.Uid != 0 || hdr.Gid != 0 {
++			// TODO(thaJeztah): Revisit whether whiteout ownership needs to be preserved.
++			//
++			// This was added in the original overlay whiteout implementation:
++			// https://github.com/moby/moby/pull/18560 / https://github.com/moby/moby/pull/22126
++			//
++			// OverlayFS documents whiteouts in terms of a character device with device
++			// number 0:0, not ownership: https://docs.kernel.org/filesystems/overlayfs.html#whiteouts-and-opaque-directories
++			//
++			// If ownership is not required, this Fchownat can be removed to avoid the remaining TOCTOU window.
++			if err := unix.Fchownat(int(parent.Fd()), originalBase, hdr.Uid, hdr.Gid, unix.AT_SYMLINK_NOFOLLOW); err != nil {
++				return false, &os.PathError{Op: "lchown", Path: originalPath, Err: err}
++			}
+ 		}
+ 
+-		// don't write the file itself
++		// Don't write the whiteout file itself.
+ 		return false, nil
+ 	}
+-
+-	return true, nil
+ }
+diff --git a/vendor/github.com/moby/go-archive/archive_other.go b/vendor/github.com/moby/go-archive/archive_other.go
+index 6495549f60e8eee6721b629f8d0030d53c397089..c8fe043455f111597ffed77abc80b7619f30a56b 100644
+--- a/vendor/github.com/moby/go-archive/archive_other.go
++++ b/vendor/github.com/moby/go-archive/archive_other.go
+@@ -2,6 +2,14 @@
+ 
+ package archive
+ 
++func withProcSelfFD(opts *TarOptions) (*TarOptions, func(), error) {
++	var prepared TarOptions
++	if opts != nil {
++		prepared = *opts
++	}
++	return &prepared, func() {}, nil
++}
++
+ func getWhiteoutConverter(format WhiteoutFormat) tarWhiteoutConverter {
+ 	return nil
+ }
+diff --git a/vendor/github.com/moby/go-archive/archive_unix.go b/vendor/github.com/moby/go-archive/archive_unix.go
+index 3a9f5b0b5863879999c6d1219682ef2852f1071e..6b333e5b2ce0f16e576e628916338af381645105 100644
+--- a/vendor/github.com/moby/go-archive/archive_unix.go
++++ b/vendor/github.com/moby/go-archive/archive_unix.go
+@@ -5,14 +5,19 @@
+ import (
+ 	"archive/tar"
+ 	"errors"
++	"fmt"
++	"math"
+ 	"os"
+ 	"path/filepath"
+ 	"strings"
+ 	"syscall"
+ 
++	"github.com/moby/go-archive/internal/archiveoptions"
+ 	"golang.org/x/sys/unix"
+ )
+ 
++var errInvalidArchive = errors.New("invalid archive")
++
+ // addLongPathPrefix adds the Windows long path prefix to the path provided if
+ // it does not already have it. It is a no-op on platforms other than Windows.
+ func addLongPathPrefix(srcPath string) string {
+@@ -29,20 +34,19 @@ func getWalkRoot(srcPath string, include string) string {
+ 
+ // chmodTarEntry is used to adjust the file permissions used in tar header based
+ // on the platform the archival is done.
+-func chmodTarEntry(perm os.FileMode) os.FileMode {
+-	return perm // noop for unix as golang APIs provide perm bits correctly
++func chmodTarEntry(mode int64) int64 {
++	return mode // noop for unix as golang APIs provide perm bits correctly
+ }
+ 
+-func getInodeFromStat(stat interface{}) (uint64, error) {
++func getInodeFromStat(stat any) (uint64, error) {
+ 	s, ok := stat.(*syscall.Stat_t)
+ 	if !ok {
+-		// FIXME(thaJeztah): this should likely return an error; see https://github.com/moby/moby/pull/49493#discussion_r1979152897
+-		return 0, nil
++		return 0, fmt.Errorf("unexpected stat type %T", stat)
+ 	}
+ 	return s.Ino, nil
+ }
+ 
+-func getFileUIDGID(stat interface{}) (int, int, error) {
++func getFileUIDGID(stat any) (int, int, error) {
+ 	s, ok := stat.(*syscall.Stat_t)
+ 
+ 	if !ok {
+@@ -56,7 +60,7 @@ func getFileUIDGID(stat interface{}) (int, int, error) {
+ //
+ // Creating device nodes is not supported when running in a user namespace,
+ // produces a [syscall.EPERM] in most cases.
+-func handleTarTypeBlockCharFifo(hdr *tar.Header, path string) error {
++func handleTarTypeBlockCharFifo(root *os.Root, hdr *tar.Header, dstPath string) error {
+ 	mode := uint32(hdr.Mode & 0o7777)
+ 	switch hdr.Typeflag {
+ 	case tar.TypeBlock:
+@@ -67,20 +71,78 @@ func handleTarTypeBlockCharFifo(hdr *tar.Header, path string) error {
+ 		mode |= unix.S_IFIFO
+ 	}
+ 
+-	return mknod(path, mode, unix.Mkdev(uint32(hdr.Devmajor), uint32(hdr.Devminor)))
++	// Devmajor and Devminor come straight from the (untrusted) tar header as
++	// int64, but Mkdev only takes uint32. Casting a value that does not fit
++	// silently truncates it, so the node created on disk would carry a
++	// different major/minor than the header declares. Reject those instead of
++	// creating a mismatched device.
++	if hdr.Devmajor < 0 || hdr.Devmajor > math.MaxUint32 ||
++		hdr.Devminor < 0 || hdr.Devminor > math.MaxUint32 {
++		return fmt.Errorf("device number %d:%d for %q out of range: %w", hdr.Devmajor, hdr.Devminor, hdr.Name, errInvalidArchive)
++	}
++
++	// Prefer mknodat; fall back to a bounded path where unavailable.
++	return mknodInRoot(root, dstPath, mode, unix.Mkdev(uint32(hdr.Devmajor), uint32(hdr.Devminor)))
+ }
+ 
+-func handleLChmod(hdr *tar.Header, path string, hdrInfo os.FileInfo) error {
+-	if hdr.Typeflag == tar.TypeLink {
+-		if fi, err := os.Lstat(hdr.Linkname); err == nil && (fi.Mode()&os.ModeSymlink == 0) {
+-			if err := os.Chmod(path, hdrInfo.Mode()); err != nil {
+-				return err
+-			}
+-		}
+-	} else if hdr.Typeflag != tar.TypeSymlink {
+-		if err := os.Chmod(path, hdrInfo.Mode()); err != nil {
+-			return err
++// handleLChmod applies the mode from hdrInfo to dstPath within root, skipping
++// symlinks (there is no lchmod). For hardlinks, the mode is applied only when
++// the link target is itself not a symlink.
++func handleLChmod(root *os.Root, dstPath string, hardlinkTarget string, hdr *tar.Header, hdrInfo os.FileInfo, opts *archiveoptions.Options) error {
++	switch hdr.Typeflag {
++	case tar.TypeSymlink:
++		return nil
++
++	case tar.TypeLink:
++		// If the target is a symlink, there is no way to chmod the hardlink
++		// without following it.
++		fi, err := root.Lstat(hardlinkTarget)
++		if err != nil || fi.Mode()&os.ModeSymlink != 0 {
++			return nil
+ 		}
++		return chmodNoSymlink(root, dstPath, hdrInfo.Mode(), opts)
++
++	default:
++		return chmodNoSymlink(root, dstPath, hdrInfo.Mode(), opts)
++	}
++}
++
++// chmodNoSymlink applies mode to a non-symlink entry.
++//
++// Callers must have already excluded symlink entries.
++func chmodNoSymlink(root *os.Root, name string, mode os.FileMode, opts *archiveoptions.Options) error {
++	parent, err := root.OpenFile(filepath.Dir(name), os.O_RDONLY, 0)
++	if err != nil {
++		return err
++	}
++	defer parent.Close()
++
++	base := filepath.Base(name)
++	perm := fileModeToPerm(mode)
++	// #nosec G115 -- ignore integer overflow conversion for parent.Fd
++	if err := unix.Fchmodat(int(parent.Fd()), base, perm, unix.AT_SYMLINK_NOFOLLOW); err == nil {
++		return nil
++	} else if !errors.Is(err, syscall.EOPNOTSUPP) {
++		return &os.PathError{Op: "fchmodat2", Path: name, Err: err}
++	}
++
++	// Fallback for systems that cannot perform fchmodat with AT_SYMLINK_NOFOLLOW.
++	return chmodNoSymlinkFallback(int(parent.Fd()), base, name, perm, opts) // #nosec G115 -- ignore integer overflow conversion for parent.Fd
++}
++
++// fileModeToPerm returns the subset of an os.FileMode that can be applied
++// by chmod.
++func fileModeToPerm(mode os.FileMode) uint32 {
++	perm := uint32(mode.Perm())
++
++	if mode&os.ModeSetuid != 0 {
++		perm |= unix.S_ISUID
++	}
++	if mode&os.ModeSetgid != 0 {
++		perm |= unix.S_ISGID
++	}
++	if mode&os.ModeSticky != 0 {
++		perm |= unix.S_ISVTX
+ 	}
+-	return nil
++	return perm
+ }
+diff --git a/vendor/github.com/moby/go-archive/archive_windows.go b/vendor/github.com/moby/go-archive/archive_windows.go
+index 0e3e316afc2f0b0e5ed82cbcf21bf9a1d223f03d..a0e4336339238a28ebe26e73179fd3e8689582c6 100644
+--- a/vendor/github.com/moby/go-archive/archive_windows.go
++++ b/vendor/github.com/moby/go-archive/archive_windows.go
+@@ -33,30 +33,31 @@ func getWalkRoot(srcPath string, include string) string {
+ 
+ // chmodTarEntry is used to adjust the file permissions used in tar header based
+ // on the platform the archival is done.
+-func chmodTarEntry(perm os.FileMode) os.FileMode {
++func chmodTarEntry(mode int64) int64 {
+ 	// Remove group- and world-writable bits.
+-	perm &= 0o755
++	mode &= 0o755
+ 
+ 	// Add the x bit: make everything +x on Windows
+-	return perm | 0o111
++	return mode | 0o111
+ }
+ 
+-func getInodeFromStat(stat interface{}) (uint64, error) {
++func getInodeFromStat(stat any) (uint64, error) {
+ 	// do nothing. no notion of Inode in stat on Windows
+ 	return 0, nil
+ }
+ 
+ // handleTarTypeBlockCharFifo is an OS-specific helper function used by
+ // createTarFile to handle the following types of header: Block; Char; Fifo
+-func handleTarTypeBlockCharFifo(hdr *tar.Header, path string) error {
++func handleTarTypeBlockCharFifo(root *os.Root, hdr *tar.Header, path string) error {
+ 	return nil
+ }
+ 
+-func handleLChmod(hdr *tar.Header, path string, hdrInfo os.FileInfo) error {
++// handleLChmod is a no-op on Windows because chmod is not supported.
++func handleLChmod(root *os.Root, dstPath string, hardlinkTarget string, hdr *tar.Header, hdrInfo os.FileInfo, opts any) error {
+ 	return nil
+ }
+ 
+-func getFileUIDGID(stat interface{}) (int, int, error) {
++func getFileUIDGID(stat any) (int, int, error) {
+ 	// no notion of file ownership mapping yet on Windows
+ 	return 0, 0, nil
+ }
+diff --git a/vendor/github.com/moby/go-archive/changes.go b/vendor/github.com/moby/go-archive/changes.go
+index 02a0372c6f9979abbb1ec430b698cf5f73891b7b..c5d647c030d291d511ee47e7e2d904316ce5c016 100644
+--- a/vendor/github.com/moby/go-archive/changes.go
++++ b/vendor/github.com/moby/go-archive/changes.go
+@@ -7,6 +7,7 @@
+ 	"fmt"
+ 	"io"
+ 	"io/fs"
++	"maps"
+ 	"os"
+ 	"path/filepath"
+ 	"sort"
+@@ -217,8 +218,8 @@ func (info *FileInfo) LookUp(path string) *FileInfo {
+ 		return info
+ 	}
+ 
+-	pathElements := strings.Split(path, string(os.PathSeparator))
+-	for _, elem := range pathElements {
++	pathElements := strings.SplitSeq(path, string(os.PathSeparator))
++	for elem := range pathElements {
+ 		if elem != "" {
+ 			child := parent.children[elem]
+ 			if child == nil {
+@@ -256,9 +257,7 @@ func (info *FileInfo) addChanges(oldInfo *FileInfo, changes *[]Change) {
+ 	// otherwise any previous delete/change is considered recursive
+ 	oldChildren := make(map[string]*FileInfo)
+ 	if oldInfo != nil && info.isDir() {
+-		for k, v := range oldInfo.children {
+-			oldChildren[k] = v
+-		}
++		maps.Copy(oldChildren, oldInfo.children)
+ 	}
+ 
+ 	for name, newChild := range info.children {
+@@ -401,7 +400,7 @@ func ExportChanges(dir string, changes []Change, idMap user.IdentityMapping) (io
+ 				whiteOut := filepath.Join(whiteOutDir, WhiteoutPrefix+whiteOutBase)
+ 				timestamp := time.Now()
+ 				hdr := &tar.Header{
+-					Name:       whiteOut[1:],
++					Name:       strings.TrimPrefix(filepath.ToSlash(whiteOut), "/"),
+ 					Size:       0,
+ 					ModTime:    timestamp,
+ 					AccessTime: timestamp,
+@@ -411,9 +410,10 @@ func ExportChanges(dir string, changes []Change, idMap user.IdentityMapping) (io
+ 					log.G(context.TODO()).Debugf("Can't write whiteout header: %s", err)
+ 				}
+ 			} else {
+-				path := filepath.Join(dir, change.Path)
+-				if err := ta.addTarFile(path, change.Path[1:]); err != nil {
+-					log.G(context.TODO()).Debugf("Can't add file %s to tar: %s", path, err)
++				srcPath := filepath.Join(dir, change.Path)
++				archivePath := strings.TrimPrefix(filepath.ToSlash(change.Path), "/")
++				if err := ta.addTarFile(srcPath, archivePath); err != nil {
++					log.G(context.TODO()).Debugf("Can't add file %s to tar: %s", srcPath, err)
+ 				}
+ 			}
+ 		}
+diff --git a/vendor/github.com/moby/go-archive/changes_linux.go b/vendor/github.com/moby/go-archive/changes_linux.go
+index 8289fe17d906937e611d2cbd11962b6ecf55755d..39ec7475f4ea21689ea604def261e5ba0dbbb8ac 100644
+--- a/vendor/github.com/moby/go-archive/changes_linux.go
++++ b/vendor/github.com/moby/go-archive/changes_linux.go
+@@ -265,7 +265,7 @@ func parseDirent(buf []byte, names []nameIno) (consumed int, newnames []nameIno)
+ }
+ 
+ func clen(n []byte) int {
+-	for i := 0; i < len(n); i++ {
++	for i := range n {
+ 		if n[i] == 0 {
+ 			return i
+ 		}
+diff --git a/vendor/github.com/moby/go-archive/changes_other.go b/vendor/github.com/moby/go-archive/changes_other.go
+index a8a3a5a6faa8333f7ab649d2ecc457dd3a64d600..7eb195d500ec2e8edab4737e7e2c82022b7d394e 100644
+--- a/vendor/github.com/moby/go-archive/changes_other.go
++++ b/vendor/github.com/moby/go-archive/changes_other.go
+@@ -26,7 +26,7 @@ func collectFileInfoForChanges(oldDir, newDir string) (*FileInfo, *FileInfo, err
+ 	}()
+ 
+ 	// block until both routines have returned
+-	for i := 0; i < 2; i++ {
++	for range 2 {
+ 		if err := <-errs; err != nil {
+ 			return nil, nil, err
+ 		}
+diff --git a/vendor/github.com/moby/go-archive/chmod_linux.go b/vendor/github.com/moby/go-archive/chmod_linux.go
+new file mode 100644
+index 0000000000000000000000000000000000000000..8d92f594ad3f22ed7e68dd2e7c91ab5559ac8533
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/chmod_linux.go
+@@ -0,0 +1,46 @@
++package archive
++
++import (
++	"fmt"
++	"os"
++	"runtime"
++	"strconv"
++
++	"github.com/moby/go-archive/internal/archiveoptions"
++	"golang.org/x/sys/unix"
++)
++
++// chmodNoSymlinkFallback applies mode without following the final path
++// component on systems without fchmodat2 support.
++//
++// Callers must have already excluded symlink entries.
++func chmodNoSymlinkFallback(parentFD int, base, name string, perm uint32, opts *archiveoptions.Options) error {
++	fd, err := unix.Openat(parentFD, base, unix.O_PATH|unix.O_NOFOLLOW|unix.O_CLOEXEC, 0)
++	if err != nil {
++		return &os.PathError{Op: "openat", Path: name, Err: err}
++	}
++	defer unix.Close(fd)
++
++	if opts != nil && opts.ProcSelfFD != nil {
++		err := unix.Fchmodat(int(opts.ProcSelfFD.Fd()), strconv.Itoa(fd), perm, 0)
++		// Keep the os.File alive until fchmodat has finished using its descriptor.
++		runtime.KeepAlive(opts.ProcSelfFD)
++		if err != nil {
++			return &os.PathError{
++				Op:   "fchmodat",
++				Path: name,
++				Err:  fmt.Errorf("via pre-opened /proc/self/fd/%d: %w", fd, err),
++			}
++		}
++	} else {
++		procPath := "/proc/self/fd/" + strconv.Itoa(fd)
++		if err := unix.Chmod(procPath, perm); err != nil {
++			return &os.PathError{
++				Op:   "chmod",
++				Path: name,
++				Err:  fmt.Errorf("via %s: %w", procPath, err),
++			}
++		}
++	}
++	return nil
++}
+diff --git a/vendor/github.com/moby/go-archive/chmod_unix_nolinux.go b/vendor/github.com/moby/go-archive/chmod_unix_nolinux.go
+new file mode 100644
+index 0000000000000000000000000000000000000000..0acddb1b98f7d850e4cd69af23db3fba43b00aff
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/chmod_unix_nolinux.go
+@@ -0,0 +1,27 @@
++//go:build !linux && !windows
++
++package archive
++
++import (
++	"os"
++
++	"github.com/moby/go-archive/internal/archiveoptions"
++	"golang.org/x/sys/unix"
++)
++
++// chmodNoSymlinkFallback applies mode without following the final path
++// component on systems without fchmodat2 support.
++//
++// Callers must have already excluded symlink entries.
++func chmodNoSymlinkFallback(parentFD int, base, name string, perm uint32, _ *archiveoptions.Options) error {
++	fd, err := unix.Openat(parentFD, base, unix.O_RDONLY|unix.O_NOFOLLOW|unix.O_NONBLOCK|unix.O_CLOEXEC, 0)
++	if err != nil {
++		return &os.PathError{Op: "openat", Path: name, Err: err}
++	}
++	defer unix.Close(fd)
++
++	if err := unix.Fchmod(fd, perm); err != nil {
++		return &os.PathError{Op: "fchmod", Path: name, Err: err}
++	}
++	return nil
++}
+diff --git a/vendor/github.com/moby/go-archive/chrootarchive/archive.go b/vendor/github.com/moby/go-archive/chrootarchive/archive.go
+index 26da8e2924ba1ec21dd3571b1ad9a870d7f92d02..1e79837db8e3b4b713bc02418de1c2d4dd735417 100644
+--- a/vendor/github.com/moby/go-archive/chrootarchive/archive.go
++++ b/vendor/github.com/moby/go-archive/chrootarchive/archive.go
+@@ -59,9 +59,6 @@ func untarHandler(tarArchive io.Reader, dest string, options *archive.TarOptions
+ 	if options == nil {
+ 		options = &archive.TarOptions{}
+ 	}
+-	if options.ExcludePatterns == nil {
+-		options.ExcludePatterns = []string{}
+-	}
+ 
+ 	// If dest is inside a root then directory is created within chroot by extractor.
+ 	// This case is only currently used by cp.
+diff --git a/vendor/github.com/moby/go-archive/chrootarchive/archive_linux.go b/vendor/github.com/moby/go-archive/chrootarchive/archive_linux.go
+index a3b73676d2193ab8b0499e783ade20e0e1c4de3c..de7b16acc6653c56d07f85dcfda7e92c21168341 100644
+--- a/vendor/github.com/moby/go-archive/chrootarchive/archive_linux.go
++++ b/vendor/github.com/moby/go-archive/chrootarchive/archive_linux.go
+@@ -9,9 +9,15 @@
+ 	"github.com/moby/go-archive"
+ )
+ 
+-func doUnpack(decompressedArchive io.Reader, relDest, root string, options *archive.TarOptions) error {
++func doUnpack(decompressedArchive io.Reader, relDest, root string, opts *archive.TarOptions) error {
++	options, closeOptions, err := archive.WithProcSelfFD(opts)
++	if err != nil {
++		return err
++	}
++	defer closeOptions()
++
+ 	done := make(chan error)
+-	err := goInChroot(root, func() { done <- archive.Unpack(decompressedArchive, relDest, options) })
++	err = goInChroot(root, func() { done <- archive.Unpack(decompressedArchive, relDest, options) })
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -30,14 +36,20 @@ func doPack(relSrc, root string, options *archive.TarOptions) (io.ReadCloser, er
+ 	return tb.Reader(), nil
+ }
+ 
+-func doUnpackLayer(root string, layer io.Reader, options *archive.TarOptions) (int64, error) {
++func doUnpackLayer(root string, layer io.Reader, opts *archive.TarOptions) (int64, error) {
++	options, closeOptions, err := archive.WithProcSelfFD(opts)
++	if err != nil {
++		return 0, err
++	}
++	defer closeOptions()
++
+ 	type result struct {
+ 		layerSize int64
+ 		err       error
+ 	}
+ 	done := make(chan result)
+ 
+-	err := goInChroot(root, func() {
++	err = goInChroot(root, func() {
+ 		// We need to be able to set any perms
+ 		_ = unix.Umask(0)
+ 
+diff --git a/vendor/github.com/moby/go-archive/chrootarchive/archive_unix_nolinux.go b/vendor/github.com/moby/go-archive/chrootarchive/archive_unix_nolinux.go
+index f5b02ea55068885c9cbcbdf51b254de1d5a3ed62..6341860bcb0684bcae65b7b8c9e18069801d4de6 100644
+--- a/vendor/github.com/moby/go-archive/chrootarchive/archive_unix_nolinux.go
++++ b/vendor/github.com/moby/go-archive/chrootarchive/archive_unix_nolinux.go
+@@ -119,9 +119,9 @@ func doPack(relSrc, root string, options *archive.TarOptions) (io.ReadCloser, er
+ 		_, _ = io.Copy(w, stdout)
+ 		// Cleanup once stdout pipe is closed.
+ 		if err = cmd.Wait(); err != nil {
+-			r.CloseWithError(fmt.Errorf("%s: %w", stderr.String(), err))
++			_ = r.CloseWithError(fmt.Errorf("%s: %w", stderr.String(), err))
+ 		} else {
+-			r.Close()
++			_ = r.Close()
+ 		}
+ 	}()
+ 
+diff --git a/vendor/github.com/moby/go-archive/chrootarchive/diff_unix.go b/vendor/github.com/moby/go-archive/chrootarchive/diff_unix.go
+index 0e95bcd95bc38c8e53294fc46c747f9a527d34b9..de6f052eb6f9f841da14fa04c7aa21a1413d5411 100644
+--- a/vendor/github.com/moby/go-archive/chrootarchive/diff_unix.go
++++ b/vendor/github.com/moby/go-archive/chrootarchive/diff_unix.go
+@@ -31,9 +31,6 @@ func applyLayerHandler(dest string, layer io.Reader, options *archive.TarOptions
+ 	if userns.RunningInUserNS() {
+ 		options.InUserNS = true
+ 	}
+-	if options.ExcludePatterns == nil {
+-		options.ExcludePatterns = []string{}
+-	}
+ 	dest = filepath.Clean(dest)
+ 	return doUnpackLayer(dest, layer, options)
+ }
+diff --git a/vendor/github.com/moby/go-archive/compression/compression.go b/vendor/github.com/moby/go-archive/compression/compression.go
+index e298cefb3249d757bb9e345715cd5689e9dd4f38..824267924d8ce865460acc2333f47e871ad66094 100644
+--- a/vendor/github.com/moby/go-archive/compression/compression.go
++++ b/vendor/github.com/moby/go-archive/compression/compression.go
+@@ -66,7 +66,7 @@ type nopWriteCloser struct {
+ func (nopWriteCloser) Close() error { return nil }
+ 
+ var bufioReader32KPool = &sync.Pool{
+-	New: func() interface{} { return bufio.NewReaderSize(nil, 32*1024) },
++	New: func() any { return bufio.NewReaderSize(nil, 32*1024) },
+ }
+ 
+ type bufferedReader struct {
+@@ -217,7 +217,7 @@ func gzipDecompress(ctx context.Context, buf io.Reader) (io.ReadCloser, error) {
+ 
+ 	log.G(ctx).Debugf("Using %s to decompress", unpigzPath)
+ 
+-	return cmdStream(exec.CommandContext(ctx, unpigzPath, "-d", "-c"), buf)
++	return cmdStream(exec.CommandContext(ctx, unpigzPath, "-d", "-c"), buf) // #nosec G204 -- Subprocess launched with variable
+ }
+ 
+ // cmdStream executes a command, and returns its stdout as a stream.
+diff --git a/vendor/github.com/moby/go-archive/copy.go b/vendor/github.com/moby/go-archive/copy.go
+index 77d038c42310eb89ec8e272639626829953a0ab4..7447e8bd106b60eadbcac70e25a735ba8fcc64cf 100644
+--- a/vendor/github.com/moby/go-archive/copy.go
++++ b/vendor/github.com/moby/go-archive/copy.go
+@@ -22,7 +22,7 @@
+ )
+ 
+ var copyPool = sync.Pool{
+-	New: func() interface{} { s := make([]byte, 32*1024); return &s },
++	New: func() any { s := make([]byte, 32*1024); return &s },
+ }
+ 
+ func copyWithBuffer(dst io.Writer, src io.Reader) error {
+@@ -316,16 +316,40 @@ func PrepareArchiveCopy(srcContent io.Reader, srcInfo, dstInfo CopyInfo) (dstDir
+ 	}
+ }
+ 
++// newNameRebaser returns a function that replaces oldBase with newBase at the
++// beginning of POSIX-style archive entry names. It converts oldBase and newBase
++// to forward-slash form and trims trailing slashes.
++//
++// When rebasing from the archive root, the returned function removes all
++// leading slashes from names. It otherwise preserves the remainder verbatim
++// and does not clean or canonicalize paths.
++func newNameRebaser(oldBase, newBase string) func(string) string {
++	oldBase = strings.TrimRight(filepath.ToSlash(oldBase), "/")
++	newBase = strings.TrimRight(filepath.ToSlash(newBase), "/")
++
++	if oldBase == "" {
++		return func(name string) string {
++			name = strings.TrimLeft(name, "/")
++			if newBase == "" {
++				return name
++			}
++			return newBase + "/" + name
++		}
++	}
++
++	return func(name string) string {
++		suffix, ok := strings.CutPrefix(name, oldBase)
++		if !ok || suffix != "" && !strings.HasPrefix(suffix, "/") {
++			return name
++		}
++		return newBase + suffix
++	}
++}
++
+ // RebaseArchiveEntries rewrites the given srcContent archive replacing
+ // an occurrence of oldBase with newBase at the beginning of entry names.
+ func RebaseArchiveEntries(srcContent io.Reader, oldBase, newBase string) io.ReadCloser {
+-	if oldBase == string(os.PathSeparator) {
+-		// If oldBase specifies the root directory, use an empty string as
+-		// oldBase instead so that newBase doesn't replace the path separator
+-		// that all paths will start with.
+-		oldBase = ""
+-	}
+-
++	rebase := newNameRebaser(oldBase, newBase)
+ 	rebased, w := io.Pipe()
+ 
+ 	go func() {
+@@ -336,12 +360,12 @@ func RebaseArchiveEntries(srcContent io.Reader, oldBase, newBase string) io.Read
+ 			hdr, err := srcTar.Next()
+ 			if errors.Is(err, io.EOF) {
+ 				// Signals end of archive.
+-				rebasedTar.Close()
+-				w.Close()
++				_ = rebasedTar.Close()
++				_ = w.Close()
+ 				return
+ 			}
+ 			if err != nil {
+-				w.CloseWithError(err)
++				_ = w.CloseWithError(err)
+ 				return
+ 			}
+ 
+@@ -353,13 +377,13 @@ func RebaseArchiveEntries(srcContent io.Reader, oldBase, newBase string) io.Read
+ 			//
+ 			// To fix, set the format to PAX here. See docker/for-linux issue #484.
+ 			hdr.Format = tar.FormatPAX
+-			hdr.Name = strings.Replace(hdr.Name, oldBase, newBase, 1)
++			hdr.Name = rebase(hdr.Name)
+ 			if hdr.Typeflag == tar.TypeLink {
+-				hdr.Linkname = strings.Replace(hdr.Linkname, oldBase, newBase, 1)
++				hdr.Linkname = rebase(hdr.Linkname)
+ 			}
+ 
+ 			if err = rebasedTar.WriteHeader(hdr); err != nil {
+-				w.CloseWithError(err)
++				_ = w.CloseWithError(err)
+ 				return
+ 			}
+ 
+@@ -374,7 +398,7 @@ func RebaseArchiveEntries(srcContent io.Reader, oldBase, newBase string) io.Read
+ 			// not be vulnerable to this code consuming memory.
+ 			//nolint:gosec // G110: Potential DoS vulnerability via decompression bomb (gosec)
+ 			if _, err = io.Copy(rebasedTar, srcTar); err != nil {
+-				w.CloseWithError(err)
++				_ = w.CloseWithError(err)
+ 				return
+ 			}
+ 		}
+@@ -408,7 +432,7 @@ func CopyResource(srcPath, dstPath string, followLink bool) error {
+ 	if err != nil {
+ 		return err
+ 	}
+-	defer content.Close()
++	defer func() { _ = content.Close() }()
+ 
+ 	return CopyTo(content, srcInfo, dstPath)
+ }
+@@ -427,14 +451,12 @@ func CopyTo(content io.Reader, srcInfo CopyInfo, dstPath string) error {
+ 	if err != nil {
+ 		return err
+ 	}
+-	defer copyArchive.Close()
++	defer func() { _ = copyArchive.Close() }()
+ 
+-	options := &TarOptions{
++	return Untar(copyArchive, dstDir, &TarOptions{
+ 		NoLchown:             true,
+ 		NoOverwriteDirNonDir: true,
+-	}
+-
+-	return Untar(copyArchive, dstDir, options)
++	})
+ }
+ 
+ // ResolveHostSourcePath decides real path need to be copied with parameters such as
+diff --git a/vendor/github.com/moby/go-archive/dev_darwin.go b/vendor/github.com/moby/go-archive/dev_darwin.go
+new file mode 100644
+index 0000000000000000000000000000000000000000..fcfe730ce0a8ddcbdd1e9381d5397d500d70c93e
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/dev_darwin.go
+@@ -0,0 +1,21 @@
++//go:build darwin
++
++package archive
++
++import (
++	"os"
++
++	"golang.org/x/sys/unix"
++)
++
++func mknod(path string, mode uint32, dev uint64) error {
++	return unix.Mknod(path, mode, int(dev)) // #nosec G115 -- Required conversion for the platform-specific Mknod API.
++}
++
++func mknodInRoot(root *os.Root, path string, mode uint32, dev uint64) error {
++	abs, err := fsRootPath(root.Name(), path)
++	if err != nil {
++		return err
++	}
++	return unix.Mknod(abs, mode, int(dev)) // #nosec G115 -- Required conversion for the platform-specific Mknod API.
++}
+diff --git a/vendor/github.com/moby/go-archive/dev_freebsd.go b/vendor/github.com/moby/go-archive/dev_freebsd.go
+index b3068fce9110f65bd4f6ce6c2acddac5710040f4..d18e829b050731c9ec3b47390791b5daa3710a22 100644
+--- a/vendor/github.com/moby/go-archive/dev_freebsd.go
++++ b/vendor/github.com/moby/go-archive/dev_freebsd.go
+@@ -2,8 +2,23 @@
+ 
+ package archive
+ 
+-import "golang.org/x/sys/unix"
++import (
++	"os"
++	"path/filepath"
++
++	"golang.org/x/sys/unix"
++)
+ 
+ func mknod(path string, mode uint32, dev uint64) error {
+ 	return unix.Mknod(path, mode, dev)
+ }
++
++func mknodInRoot(root *os.Root, path string, mode uint32, dev uint64) error {
++	parent, err := root.OpenFile(filepath.Dir(path), os.O_RDONLY|unix.O_DIRECTORY, 0)
++	if err != nil {
++		return err
++	}
++	defer parent.Close()
++
++	return unix.Mknodat(int(parent.Fd()), filepath.Base(path), mode, dev)
++}
+diff --git a/vendor/github.com/moby/go-archive/dev_unix.go b/vendor/github.com/moby/go-archive/dev_unix.go
+index dffc596f93f7efb740a9b1bda6f9a9bbe1273b91..0eb8b6da5cea4b03d27dfa5e2fbc154943d8ddc3 100644
+--- a/vendor/github.com/moby/go-archive/dev_unix.go
++++ b/vendor/github.com/moby/go-archive/dev_unix.go
+@@ -1,9 +1,24 @@
+-//go:build !windows && !freebsd
++//go:build !darwin && !freebsd && !windows
+ 
+ package archive
+ 
+-import "golang.org/x/sys/unix"
++import (
++	"os"
++	"path/filepath"
++
++	"golang.org/x/sys/unix"
++)
+ 
+ func mknod(path string, mode uint32, dev uint64) error {
+-	return unix.Mknod(path, mode, int(dev))
++	return unix.Mknod(path, mode, int(dev)) // #nosec G115 -- Required conversion for the platform-specific Mknod API.
++}
++
++func mknodInRoot(root *os.Root, path string, mode uint32, dev uint64) error {
++	parent, err := root.OpenFile(filepath.Dir(path), os.O_RDONLY|unix.O_DIRECTORY, 0)
++	if err != nil {
++		return err
++	}
++	defer parent.Close()
++
++	return unix.Mknodat(int(parent.Fd()), filepath.Base(path), mode, int(dev)) // #nosec G115 -- Required conversion for the platform-specific Mknod API.
+ }
+diff --git a/vendor/github.com/moby/go-archive/diff.go b/vendor/github.com/moby/go-archive/diff.go
+index 96db972d13837db7c9b5fc50b3730a05871187c9..b94501862652993899ee5b910992fccb1faec6a3 100644
+--- a/vendor/github.com/moby/go-archive/diff.go
++++ b/vendor/github.com/moby/go-archive/diff.go
+@@ -7,8 +7,8 @@
+ 	"fmt"
+ 	"io"
+ 	"os"
++	"path"
+ 	"path/filepath"
+-	"runtime"
+ 	"strings"
+ 
+ 	"github.com/containerd/log"
+@@ -20,17 +20,23 @@
+ // compressed or uncompressed.
+ // Returns the size in bytes of the contents of the layer.
+ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64, err error) {
++	root, err := os.OpenRoot(dest)
++	if err != nil {
++		return 0, err
++	}
++	defer root.Close()
++
+ 	tr := tar.NewReader(layer)
+ 
+-	var dirs []*tar.Header
++	var dirs []unpackedDir
++	// unpackedPaths tracks resolved, native-separator, root-relative paths
++	// already written in this layer so that the AUFS opaque-whiteout walk
++	// knows which paths to preserve.
+ 	unpackedPaths := make(map[string]struct{})
+ 
+ 	if options == nil {
+ 		options = &TarOptions{}
+ 	}
+-	if options.ExcludePatterns == nil {
+-		options.ExcludePatterns = []string{}
+-	}
+ 
+ 	aufsTempdir := ""
+ 	aufsHardlinks := make(map[string]*tar.Header)
+@@ -48,34 +54,22 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 
+ 		size += hdr.Size
+ 
+-		// Normalize name, for safety and for a simple is-root check
+-		hdr.Name = filepath.Clean(hdr.Name)
+-
+-		// Windows does not support filenames with colons in them. Ignore
+-		// these files. This is not a problem though (although it might
+-		// appear that it is). Let's suppose a client is running docker pull.
+-		// The daemon it points to is Windows. Would it make sense for the
+-		// client to be doing a docker pull Ubuntu for example (which has files
+-		// with colons in the name under /usr/share/man/man3)? No, absolutely
+-		// not as it would really only make sense that they were pulling a
+-		// Windows image. However, for development, it is necessary to be able
+-		// to pull Linux images which are in the repository.
+-		//
+-		// TODO Windows. Once the registry is aware of what images are Windows-
+-		// specific or Linux-specific, this warning should be changed to an error
+-		// to cater for the situation where someone does manage to upload a Linux
+-		// image but have it tagged as Windows inadvertently.
+-		if runtime.GOOS == "windows" {
+-			if strings.Contains(hdr.Name, ":") {
+-				log.G(context.TODO()).Warnf("Windows: Ignoring %s (is this a Linux image?)", hdr.Name)
+-				continue
+-			}
++		// Strip a leading "/" so absolute entries stay root-relative, and
++		// normalize the POSIX tar path. Skip entries referring to the extraction
++		// root and reject paths that escape it.
++		name := path.Clean(strings.TrimLeft(hdr.Name, "/"))
++		if name == "." {
++			continue
++		}
++		if !filepath.IsLocal(name) {
++			return 0, breakoutError(fmt.Errorf("invalid entry name %q", hdr.Name))
+ 		}
++		hdr.Name = name
+ 
+-		// Ensure that the parent directory exists.
+-		err = createImpliedDirectories(dest, hdr, options)
+-		if err != nil {
+-			return 0, err
++		// Skip entries whose name (or hardlink target) Windows cannot represent.
++		if err := unrepresentableOnWindows(hdr); err != nil {
++			log.G(context.TODO()).Warnf("Windows: ignoring entry: %v", err)
++			continue
+ 		}
+ 
+ 		// Skip AUFS metadata dirs
+@@ -84,7 +78,7 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 			// We don't want this directory, but we need the files in them so that
+ 			// such hardlinks can be resolved.
+ 			if strings.HasPrefix(hdr.Name, WhiteoutLinkDir) && hdr.Typeflag == tar.TypeReg {
+-				basename := filepath.Base(hdr.Name)
++				basename := path.Base(hdr.Name)
+ 				aufsHardlinks[basename] = hdr
+ 				if aufsTempdir == "" {
+ 					if aufsTempdir, err = os.MkdirTemp(dest, "dockerplnk"); err != nil {
+@@ -92,47 +86,68 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 					}
+ 					defer os.RemoveAll(aufsTempdir)
+ 				}
+-				if err := createTarFile(filepath.Join(aufsTempdir, basename), dest, hdr, tr, options); err != nil {
++				aufsRoot, err := os.OpenRoot(aufsTempdir)
++				if err != nil {
+ 					return 0, err
+ 				}
++				cerr := createTarFile(aufsRoot, basename, hdr, tr, options)
++				_ = aufsRoot.Close()
++				if cerr != nil {
++					return 0, cerr
++				}
+ 			}
+ 
+ 			if hdr.Name != WhiteoutOpaqueDir {
+ 				continue
+ 			}
+ 		}
+-		// #nosec G305 -- The joined path is guarded against path traversal.
+-		path := filepath.Join(dest, hdr.Name)
+-		rel, err := filepath.Rel(dest, path)
++		// dstPath is the native (host-separator) form of the entry name,
++		// used at all filesystem boundaries (os.Root methods, fsRootPath).
++		// The tar-header name (hdr.Name) is POSIX, so convert it here.
++		dstPath, err := resolveArchivePath(root, filepath.FromSlash(hdr.Name))
+ 		if err != nil {
+ 			return 0, err
+ 		}
+-
+-		// Note as these operations are platform specific, so must the slash be.
+-		if strings.HasPrefix(rel, ".."+string(os.PathSeparator)) {
+-			return 0, breakoutError(fmt.Errorf("%q is outside of %q", hdr.Name, dest))
++		// Ensure that the parent directory exists.
++		if err := createImpliedDirectories(root, dstPath, options); err != nil {
++			return 0, err
+ 		}
+-		base := filepath.Base(path)
+-
+-		if strings.HasPrefix(base, WhiteoutPrefix) {
+-			dir := filepath.Dir(path)
++		if base := filepath.Base(dstPath); strings.HasPrefix(base, WhiteoutPrefix) {
++			dir := filepath.Dir(dstPath)
+ 			if base == WhiteoutOpaqueDir {
+-				_, err := os.Lstat(dir)
++				_, err := root.Lstat(dir)
++				if err != nil {
++					return 0, err
++				}
++				// Walk the absolute directory so we can call os.RemoveAll on
++				// paths outside the walk callback's reach, then convert each
++				// walked path back to a root-relative name for the
++				// unpackedPaths check.
++				// fsRootPath walks each path component and bounds any symlinks
++				// within the root to prevent TOCTOU symlink attacks.
++				absDir, err := fsRootPath(root.Name(), dir)
+ 				if err != nil {
+ 					return 0, err
+ 				}
+-				err = filepath.WalkDir(dir, func(path string, info os.DirEntry, err error) error {
++				err = filepath.WalkDir(absDir, func(p string, info os.DirEntry, err error) error {
+ 					if err != nil {
+ 						if os.IsNotExist(err) {
+-							err = nil // parent was deleted
++							return nil // parent was deleted
+ 						}
+ 						return err
+ 					}
+-					if path == dir {
++					if p == absDir {
+ 						return nil
+ 					}
+-					if _, exists := unpackedPaths[path]; !exists {
+-						return os.RemoveAll(path)
++					rel, err := filepath.Rel(root.Name(), p)
++					if err != nil {
++						return err
++					}
++
++					// unpackedPaths is keyed by resolved, native-separator,
++					// root-relative paths, matching filepath.WalkDir's paths.
++					if _, exists := unpackedPaths[rel]; !exists {
++						return root.RemoveAll(rel)
+ 					}
+ 					return nil
+ 				})
+@@ -142,18 +157,18 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 			} else {
+ 				originalBase := base[len(WhiteoutPrefix):]
+ 				originalPath := filepath.Join(dir, originalBase)
+-				if err := os.RemoveAll(originalPath); err != nil {
++				if err := root.RemoveAll(originalPath); err != nil {
+ 					return 0, err
+ 				}
+ 			}
+ 		} else {
+-			// If path exits we almost always just want to remove and replace it.
++			// If dstPath exists we almost always just want to remove and replace it.
+ 			// The only exception is when it is a directory *and* the file from
+ 			// the layer is also a directory. Then we want to merge them (i.e.
+ 			// just apply the metadata from the layer).
+-			if fi, err := os.Lstat(path); err == nil {
++			if fi, err := root.Lstat(dstPath); err == nil {
+ 				if !fi.IsDir() || hdr.Typeflag != tar.TypeDir {
+-					if err := os.RemoveAll(path); err != nil {
++					if err := root.RemoveAll(dstPath); err != nil {
+ 						return 0, err
+ 					}
+ 				}
+@@ -164,8 +179,8 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 
+ 			// Hard links into /.wh..wh.plnk don't work, as we don't extract that directory, so
+ 			// we manually retarget these into the temporary files we extracted them into
+-			if hdr.Typeflag == tar.TypeLink && strings.HasPrefix(filepath.Clean(hdr.Linkname), WhiteoutLinkDir) {
+-				linkBasename := filepath.Base(hdr.Linkname)
++			if hdr.Typeflag == tar.TypeLink && strings.HasPrefix(path.Clean(hdr.Linkname), WhiteoutLinkDir) {
++				linkBasename := path.Base(hdr.Linkname)
+ 				srcHdr = aufsHardlinks[linkBasename]
+ 				if srcHdr == nil {
+ 					return 0, errors.New("invalid aufs hardlink")
+@@ -182,23 +197,23 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 				return 0, err
+ 			}
+ 
+-			if err := createTarFile(path, dest, srcHdr, srcData, options); err != nil {
++			if err := createTarFile(root, dstPath, srcHdr, srcData, options); err != nil {
+ 				return 0, err
+ 			}
+ 
+ 			// Directory mtimes must be handled at the end to avoid further
+ 			// file creation in them to modify the directory mtime
+ 			if hdr.Typeflag == tar.TypeDir {
+-				dirs = append(dirs, hdr)
++				dirs = append(dirs, unpackedDir{hdr: hdr, name: dstPath})
+ 			}
+-			unpackedPaths[path] = struct{}{}
++			// Record the resolved, native-separator, root-relative path so it
++			// matches the paths produced by the opaque-whiteout walk.
++			unpackedPaths[dstPath] = struct{}{}
+ 		}
+ 	}
+ 
+-	for _, hdr := range dirs {
+-		// #nosec G305 -- The header was checked for path traversal before it was appended to the dirs slice.
+-		path := filepath.Join(dest, hdr.Name)
+-		if err := chtimes(path, hdr.AccessTime, hdr.ModTime); err != nil {
++	for _, d := range dirs {
++		if err := chtimes(root, d.name, boundTime(latestTime(d.hdr.AccessTime, d.hdr.ModTime)), boundTime(d.hdr.ModTime)); err != nil {
+ 			return 0, err
+ 		}
+ 	}
+diff --git a/vendor/github.com/moby/go-archive/internal/archiveoptions/options.go b/vendor/github.com/moby/go-archive/internal/archiveoptions/options.go
+new file mode 100644
+index 0000000000000000000000000000000000000000..201eb91b6d0d9d705602973438d410ec364be2d3
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/internal/archiveoptions/options.go
+@@ -0,0 +1,12 @@
++// Package archiveoptions defines internal options shared between archive and
++// chrootarchive.
++package archiveoptions
++
++import "os"
++
++// Options contains extraction resources supplied by internal callers.
++type Options struct {
++	// ProcSelfFD references /proc/self/fd as opened before entering a chroot.
++	// The caller retains ownership of the file.
++	ProcSelfFD *os.File
++}
+diff --git a/vendor/github.com/moby/go-archive/rootpath.go b/vendor/github.com/moby/go-archive/rootpath.go
+new file mode 100644
+index 0000000000000000000000000000000000000000..7d34839df469265944675f9b3dc1ce37db00b1df
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/rootpath.go
+@@ -0,0 +1,142 @@
++/*
++   Copyright The containerd Authors.
++
++   Licensed under the Apache License, Version 2.0 (the "License");
++   you may not use this file except in compliance with the License.
++   You may obtain a copy of the License at
++
++       http://www.apache.org/licenses/LICENSE-2.0
++
++   Unless required by applicable law or agreed to in writing, software
++   distributed under the License is distributed on an "AS IS" BASIS,
++   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++   See the License for the specific language governing permissions and
++   limitations under the License.
++*/
++
++package archive
++
++import (
++	"errors"
++	"os"
++	"path/filepath"
++)
++
++var errTooManyLinks = errors.New("too many links")
++
++type fsRootPathResult struct {
++	path                         string
++	followedAbsoluteLink         bool
++	relativeEscapeBeforeAbsolute bool
++}
++
++// fsRootPath joins a path with a root, evaluating and bounding any
++// symlink to the root directory.
++func fsRootPath(root, path string) (string, error) {
++	result, err := resolveFSRootPath(root, path)
++	if err != nil {
++		return "", err
++	}
++	return result.path, nil
++}
++
++func resolveFSRootPath(root, path string) (fsRootPathResult, error) {
++	result := fsRootPathResult{path: root}
++	if path == "" {
++		return result, nil
++	}
++	var linksWalked int // to protect against cycles
++	for {
++		i := linksWalked
++		newpath, err := walkLinks(root, path, &linksWalked, &result)
++		if err != nil {
++			return fsRootPathResult{}, err
++		}
++		path = newpath
++		if i == linksWalked {
++			newpath = filepath.Join(string(os.PathSeparator), newpath)
++			if path == newpath {
++				result.path = filepath.Join(root, newpath)
++				return result, nil
++			}
++			path = newpath
++		}
++	}
++}
++
++func walkLink(root, path string, linksWalked *int, result *fsRootPathResult) (newpath string, islink bool, err error) {
++	if *linksWalked > 255 {
++		return "", false, errTooManyLinks
++	}
++
++	path = filepath.Join(string(os.PathSeparator), path)
++	if path == string(os.PathSeparator) {
++		return path, false, nil
++	}
++	realPath := filepath.Join(root, path)
++
++	fi, err := os.Lstat(realPath)
++	if err != nil {
++		// If path does not yet exist, treat as non-symlink
++		if os.IsNotExist(err) {
++			return path, false, nil
++		}
++		return "", false, err
++	}
++	if fi.Mode()&os.ModeSymlink == 0 {
++		return path, false, nil
++	}
++	newpath, err = os.Readlink(realPath)
++	if err != nil {
++		return "", false, err
++	}
++	if filepath.IsAbs(newpath) {
++		result.followedAbsoluteLink = true
++	} else if !result.followedAbsoluteLink {
++		// Record an escape before a later absolute link can make the original
++		// os.Root error appear eligible for resolve-in-root fallback.
++		relativeDir, err := filepath.Rel(string(os.PathSeparator), filepath.Dir(path))
++		if err != nil {
++			return "", false, err
++		}
++
++		resolved := filepath.Join(relativeDir, newpath)
++		if resolved != "." && !filepath.IsLocal(resolved) {
++			result.relativeEscapeBeforeAbsolute = true
++		}
++	}
++
++	*linksWalked++
++	return newpath, true, nil
++}
++
++func walkLinks(root, path string, linksWalked *int, result *fsRootPathResult) (string, error) {
++	switch dir, file := filepath.Split(path); {
++	case dir == "":
++		newpath, _, err := walkLink(root, file, linksWalked, result)
++		return newpath, err
++	case file == "":
++		if os.IsPathSeparator(dir[len(dir)-1]) {
++			if dir == string(os.PathSeparator) {
++				return dir, nil
++			}
++			return walkLinks(root, dir[:len(dir)-1], linksWalked, result)
++		}
++		newpath, _, err := walkLink(root, dir, linksWalked, result)
++		return newpath, err
++
++	default:
++		newdir, err := walkLinks(root, dir, linksWalked, result)
++		if err != nil {
++			return "", err
++		}
++		newpath, islink, err := walkLink(root, filepath.Join(newdir, file), linksWalked, result)
++		if err != nil {
++			return "", err
++		}
++		if !islink || filepath.IsAbs(newpath) {
++			return newpath, nil
++		}
++		return filepath.Join(newdir, newpath), nil
++	}
++}
+diff --git a/vendor/github.com/moby/go-archive/sequential_other.go b/vendor/github.com/moby/go-archive/sequential_other.go
+new file mode 100644
+index 0000000000000000000000000000000000000000..90edb13933d23e0a702d2d6904770a5a509b1832
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/sequential_other.go
+@@ -0,0 +1,6 @@
++//go:build !windows
++
++package archive
++
++// windows_O_FILE_FLAG_SEQUENTIAL_SCAN is not supported on go < 1.26.
++const windows_O_FILE_FLAG_SEQUENTIAL_SCAN = 0
+diff --git a/vendor/github.com/moby/go-archive/sequential_windows_go126.go b/vendor/github.com/moby/go-archive/sequential_windows_go126.go
+new file mode 100644
+index 0000000000000000000000000000000000000000..1e80d11b73eaf9dcdd2bb158a6bc6690c7916c3f
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/sequential_windows_go126.go
+@@ -0,0 +1,9 @@
++//go:build windows && go1.26
++
++package archive
++
++// windows_O_FILE_FLAG_SEQUENTIAL_SCAN matches [golang.org/x/sys/windows.O_FILE_FLAG_SEQUENTIAL_SCAN].
++// Starting in Go 1.26, os.OpenFile supports passing this flag through.
++//
++// TODO(thaJeztah): use windows.O_FILE_FLAG_SEQUENTIAL_SCAN once we drop Go <1.26.
++const windows_O_FILE_FLAG_SEQUENTIAL_SCAN = 0x08000000
+diff --git a/vendor/github.com/moby/go-archive/sequential_windows_pre126.go b/vendor/github.com/moby/go-archive/sequential_windows_pre126.go
+new file mode 100644
+index 0000000000000000000000000000000000000000..2b281741ae12696d5742a1d411af57c6e9fbc83c
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/sequential_windows_pre126.go
+@@ -0,0 +1,6 @@
++//go:build windows && !go1.26
++
++package archive
++
++// windows_O_FILE_FLAG_SEQUENTIAL_SCAN is not supported on go < 1.26.
++const windows_O_FILE_FLAG_SEQUENTIAL_SCAN = 0
+diff --git a/vendor/github.com/moby/go-archive/tarheader/tarheader.go b/vendor/github.com/moby/go-archive/tarheader/tarheader.go
+index 03732a4f844b01d010e419c75a592a622892c68f..78ab55cd410f59519bf43cdf8b9a379567a1ba52 100644
+--- a/vendor/github.com/moby/go-archive/tarheader/tarheader.go
++++ b/vendor/github.com/moby/go-archive/tarheader/tarheader.go
+@@ -32,7 +32,7 @@ func (fi nosysFileInfo) Gname() (string, error) {
+ 	return "", nil
+ }
+ 
+-func (fi nosysFileInfo) Sys() interface{} {
++func (fi nosysFileInfo) Sys() any {
+ 	// A Sys value of type *tar.Header is safe as it is system-independent.
+ 	// The tar.FileInfoHeader function copies the fields into the returned
+ 	// header without performing any OS lookups.
+diff --git a/vendor/github.com/moby/go-archive/tarheader/tarheader_unix.go b/vendor/github.com/moby/go-archive/tarheader/tarheader_unix.go
+index 9c3311c63abc3da880a39c457aaa33c62d3328de..bd12d46a8a67e8e9705b6b696f9baddd683d9233 100644
+--- a/vendor/github.com/moby/go-archive/tarheader/tarheader_unix.go
++++ b/vendor/github.com/moby/go-archive/tarheader/tarheader_unix.go
+@@ -36,10 +36,11 @@ func sysStat(fi os.FileInfo, hdr *tar.Header) error {
+ 	hdr.Uid = int(s.Uid)
+ 	hdr.Gid = int(s.Gid)
+ 
+-	if s.Mode&unix.S_IFBLK != 0 ||
+-		s.Mode&unix.S_IFCHR != 0 {
+-		hdr.Devmajor = int64(unix.Major(uint64(s.Rdev))) //nolint: unconvert
+-		hdr.Devminor = int64(unix.Minor(uint64(s.Rdev))) //nolint: unconvert
++	if s.Mode&unix.S_IFBLK != 0 || s.Mode&unix.S_IFCHR != 0 {
++		// #nosec G115 -- Rdev type varies by platform.
++		rdev := uint64(s.Rdev) //nolint:unconvert // Rdev type varies by platform.
++		hdr.Devmajor = int64(unix.Major(rdev))
++		hdr.Devminor = int64(unix.Minor(rdev))
+ 	}
+ 
+ 	return nil
+diff --git a/vendor/github.com/moby/go-archive/time.go b/vendor/github.com/moby/go-archive/time.go
+index 4e9ae95084328439e13415d589ba23a3ee0cf0bd..fb8c0299b9d38d51a71cf826a269655dd7ca3b43 100644
+--- a/vendor/github.com/moby/go-archive/time.go
++++ b/vendor/github.com/moby/go-archive/time.go
+@@ -22,6 +22,10 @@ func init() {
+ 	}
+ }
+ 
++// boundTime returns t if it falls within the range supported by os.Chtimes.
++// Times before the Unix epoch (minTime) or after the end of Unix time
++// (maxTime) are replaced with minTime, as os.Chtimes has undefined behavior
++// outside that range.
+ func boundTime(t time.Time) time.Time {
+ 	if t.Before(minTime) || t.After(maxTime) {
+ 		return minTime
+diff --git a/vendor/github.com/moby/go-archive/time_nonwindows.go b/vendor/github.com/moby/go-archive/time_nonwindows.go
+index 5bfdfa2f17e859fec39f6732b1c003c853c89cb4..418bc887a9b8f68bec0e6a95127f7dbecfd66e78 100644
+--- a/vendor/github.com/moby/go-archive/time_nonwindows.go
++++ b/vendor/github.com/moby/go-archive/time_nonwindows.go
+@@ -3,18 +3,55 @@
+ package archive
+ 
+ import (
++	"errors"
+ 	"os"
++	"path"
++	"path/filepath"
++	"strings"
++	"syscall"
+ 	"time"
+ 
+ 	"golang.org/x/sys/unix"
+ )
+ 
+-// chtimes changes the access time and modified time of a file at the given path.
+-// If the modified time is prior to the Unix Epoch (unixMinTime), or after the
+-// end of Unix Time (unixEpochTime), os.Chtimes has undefined behavior. In this
+-// case, Chtimes defaults to Unix Epoch, just in case.
+-func chtimes(name string, atime time.Time, mtime time.Time) error {
+-	return os.Chtimes(name, atime, mtime)
++// chtimes changes the access and modification time of a file at the given
++// path relative to root.
++//
++// Callers must use boundTime to ensure timestamps are within the range
++// supported by os.Chtimes.
++func chtimes(root *os.Root, name string, atime, mtime time.Time) error {
++	return root.Chtimes(name, atime, mtime)
++}
++
++func lchtimes(root *os.Root, name string, atime, mtime time.Time) error {
++	dir, base := path.Split(filepath.ToSlash(name))
++	if base == "" {
++		return &os.PathError{Op: "lchtimes", Path: name, Err: syscall.EINVAL}
++	}
++
++	dir = strings.TrimSuffix(dir, "/")
++	if dir == "" {
++		dir = "."
++	}
++
++	parent, err := root.Open(dir)
++	if err != nil {
++		return err
++	}
++	defer parent.Close()
++
++	utimes := [2]unix.Timespec{
++		timeToTimespec(atime),
++		timeToTimespec(mtime),
++	}
++	// #nosec G115 -- ignore integer overflow conversion for parent.Fd
++	if err := unix.UtimesNanoAt(int(parent.Fd()), base, utimes[:], unix.AT_SYMLINK_NOFOLLOW); err != nil {
++		if errors.Is(err, unix.ENOSYS) {
++			return nil
++		}
++		return &os.PathError{Op: "lchtimes", Path: name, Err: err}
++	}
++	return nil
+ }
+ 
+ func timeToTimespec(time time.Time) unix.Timespec {
+@@ -27,15 +64,3 @@ func timeToTimespec(time time.Time) unix.Timespec {
+ 	}
+ 	return unix.NsecToTimespec(time.UnixNano())
+ }
+-
+-func lchtimes(name string, atime time.Time, mtime time.Time) error {
+-	utimes := [2]unix.Timespec{
+-		timeToTimespec(atime),
+-		timeToTimespec(mtime),
+-	}
+-	err := unix.UtimesNanoAt(unix.AT_FDCWD, name, utimes[0:], unix.AT_SYMLINK_NOFOLLOW)
+-	if err != nil && err != unix.ENOSYS {
+-		return err
+-	}
+-	return err
+-}
+diff --git a/vendor/github.com/moby/go-archive/time_windows.go b/vendor/github.com/moby/go-archive/time_windows.go
+index af1f7c8f3a075962374f476edd4e17513ed2ba94..66173c58bbe26b776fcac8c32e65a1571101b219 100644
+--- a/vendor/github.com/moby/go-archive/time_windows.go
++++ b/vendor/github.com/moby/go-archive/time_windows.go
+@@ -1,32 +1,111 @@
+ package archive
+ 
+ import (
++	"errors"
+ 	"os"
++	"path/filepath"
+ 	"time"
++	"unsafe"
+ 
+ 	"golang.org/x/sys/windows"
+ )
+ 
+-func chtimes(name string, atime time.Time, mtime time.Time) error {
+-	if err := os.Chtimes(name, atime, mtime); err != nil {
++// chtimes changes the access and modification time of a file at the given
++// path relative to root.
++//
++// Symlink entries are handled separately through lchtimes. The final path
++// component is expected not to be a reparse point; if one is encountered,
++// chtimes returns an error.
++//
++// Callers must use boundTime to ensure timestamps are within the range
++// supported by os.Chtimes.
++func chtimes(root *os.Root, name string, atime, mtime time.Time) error {
++	parent, err := root.OpenFile(filepath.Dir(name), os.O_RDONLY, 0)
++	if err != nil {
+ 		return err
+ 	}
++	defer parent.Close()
++
++	// Symlink entries are handled by lchtimes. The destination for all
++	// chtimes callers is therefore expected not to be a reparse point.
++	//
++	// Do not follow the final component: if it was concurrently replaced
++	// with a reparse point, fail instead of updating its target.
++	return chtimesAt(parent, filepath.Base(name), atime, mtime, true)
++}
+ 
+-	pathp, err := windows.UTF16PtrFromString(name)
++func lchtimes(root *os.Root, name string, atime time.Time, mtime time.Time) error {
++	return nil
++}
++
++func chtimesAt(parent *os.File, name string, atime, mtime time.Time, noFollow bool) error {
++	h, err := openForWriteAttributesAt(windows.Handle(parent.Fd()), name, noFollow)
+ 	if err != nil {
++		if noFollow && errors.Is(err, windows.STATUS_REPARSE_POINT_ENCOUNTERED) {
++			// Encountering a reparse point when noFollow is requested is unexpected.
++			// Treat it as a potential breakout to fail extraction safely.
++			return breakoutError(err)
++		}
+ 		return err
+ 	}
+-	h, err := windows.CreateFile(pathp,
+-		windows.FILE_WRITE_ATTRIBUTES, windows.FILE_SHARE_WRITE, nil,
+-		windows.OPEN_EXISTING, windows.FILE_FLAG_BACKUP_SEMANTICS, 0)
++	defer func() { _ = windows.Close(h) }()
++
++	var (
++		creationTime     = windows.NsecToFiletime(mtime.UnixNano())
++		accessTime       = windows.NsecToFiletime(atime.UnixNano())
++		modificationTime = windows.NsecToFiletime(mtime.UnixNano())
++	)
++	return windows.SetFileTime(h, &creationTime, &accessTime, &modificationTime)
++}
++
++// openForWriteAttributesAt opens name relative to parent with permission to
++// modify its file attributes. If noFollow is true, it does not follow reparse
++// points.
++//
++// This implementation is based on Go's internal Windows Openat support:
++//
++//	https://github.com/golang/go/blob/go1.26.0/src/internal/syscall/windows/at_windows.go
++//
++// It is used by os.Root's Windows implementation for root-relative filesystem
++// operations:
++//
++//	https://github.com/golang/go/blob/go1.26.0/src/os/root_windows.go
++//
++// Keep this implementation aligned with the upstream code until an equivalent
++// operation is available from golang.org/x/sys/windows.
++func openForWriteAttributesAt(parent windows.Handle, name string, noFollow bool) (windows.Handle, error) {
++	name16, err := windows.UTF16FromString(name)
+ 	if err != nil {
+-		return err
++		return windows.InvalidHandle, err
+ 	}
+-	defer windows.Close(h)
+-	c := windows.NsecToFiletime(mtime.UnixNano())
+-	return windows.SetFileTime(h, &c, nil, nil)
+-}
+ 
+-func lchtimes(name string, atime time.Time, mtime time.Time) error {
+-	return nil
++	attrs := uint32(windows.OBJ_CASE_INSENSITIVE)
++	if noFollow {
++		attrs |= windows.OBJ_DONT_REPARSE
++	}
++
++	var handle windows.Handle
++	err = windows.NtCreateFile(
++		&handle,
++		windows.SYNCHRONIZE|windows.FILE_WRITE_ATTRIBUTES,
++		&windows.OBJECT_ATTRIBUTES{
++			Length:        uint32(unsafe.Sizeof(windows.OBJECT_ATTRIBUTES{})),
++			RootDirectory: parent,
++			ObjectName: &windows.NTUnicodeString{
++				Length:        uint16((len(name16) - 1) * 2), // #nosec G115 -- Length is USHORT by definition. A Windows path component cannot exceed uint16 bytes.
++				MaximumLength: uint16(len(name16) * 2),       // #nosec G115 -- MaximumLength is USHORT by definition. A Windows path component cannot exceed uint16 bytes.
++				Buffer:        &name16[0],
++			},
++			Attributes: attrs,
++		},
++		&windows.IO_STATUS_BLOCK{},
++		nil,
++		windows.FILE_ATTRIBUTE_NORMAL,
++		windows.FILE_SHARE_READ|windows.FILE_SHARE_WRITE|windows.FILE_SHARE_DELETE,
++		windows.FILE_OPEN,
++		windows.FILE_OPEN_FOR_BACKUP_INTENT|windows.FILE_SYNCHRONOUS_IO_NONALERT,
++		0, // EA buffer
++		0, // EA length
++	)
++	return handle, err
+ }
+diff --git a/vendor/github.com/moby/go-archive/xattr_supported.go b/vendor/github.com/moby/go-archive/xattr_supported.go
+index 652a1f0f349d72a7d63743ac2114f1604f01f776..8478fe1446da93da0bcde69dd6ed0a7c8528752b 100644
+--- a/vendor/github.com/moby/go-archive/xattr_supported.go
++++ b/vendor/github.com/moby/go-archive/xattr_supported.go
+@@ -13,26 +13,26 @@
+ // lgetxattr retrieves the value of the extended attribute identified by attr
+ // and associated with the given path in the file system.
+ // It returns a nil slice and nil error if the xattr is not set.
+-func lgetxattr(path string, attr string) ([]byte, error) {
++func lgetxattr(filePath string, attr string) ([]byte, error) {
+ 	// Start with a 128 length byte array
+ 	dest := make([]byte, 128)
+-	sz, err := unix.Lgetxattr(path, attr, dest)
++	sz, err := unix.Lgetxattr(filePath, attr, dest)
+ 
+ 	for errors.Is(err, unix.ERANGE) {
+ 		// Buffer too small, use zero-sized buffer to get the actual size
+-		sz, err = unix.Lgetxattr(path, attr, []byte{})
++		sz, err = unix.Lgetxattr(filePath, attr, []byte{})
+ 		if err != nil {
+-			return nil, wrapPathError("lgetxattr", path, attr, err)
++			return nil, wrapPathError("lgetxattr", filePath, attr, err)
+ 		}
+ 		dest = make([]byte, sz)
+-		sz, err = unix.Lgetxattr(path, attr, dest)
++		sz, err = unix.Lgetxattr(filePath, attr, dest)
+ 	}
+ 
+ 	if err != nil {
+ 		if errors.Is(err, noattr) {
+ 			return nil, nil
+ 		}
+-		return nil, wrapPathError("lgetxattr", path, attr, err)
++		return nil, wrapPathError("lgetxattr", filePath, attr, err)
+ 	}
+ 
+ 	return dest[:sz], nil
+@@ -40,13 +40,13 @@ func lgetxattr(path string, attr string) ([]byte, error) {
+ 
+ // lsetxattr sets the value of the extended attribute identified by attr
+ // and associated with the given path in the file system.
+-func lsetxattr(path string, attr string, data []byte, flags int) error {
+-	return wrapPathError("lsetxattr", path, attr, unix.Lsetxattr(path, attr, data, flags))
++func lsetxattr(filePath string, attr string, data []byte, flags int) error {
++	return wrapPathError("lsetxattr", filePath, attr, unix.Lsetxattr(filePath, attr, data, flags))
+ }
+ 
+-func wrapPathError(op, path, attr string, err error) error {
++func wrapPathError(op, filePath, attr string, err error) error {
+ 	if err == nil {
+ 		return nil
+ 	}
+-	return &fs.PathError{Op: op, Path: path, Err: fmt.Errorf("xattr %q: %w", attr, err)}
++	return &fs.PathError{Op: op, Path: filePath, Err: fmt.Errorf("xattr %q: %w", attr, err)}
+ }
+diff --git a/vendor/modules.txt b/vendor/modules.txt
+index efe00e3195ffa545c6927908b1562fdb6ee18d19..db25d05b6772601dc42dfdcad4d202b7d35410ea 100644
+--- a/vendor/modules.txt
++++ b/vendor/modules.txt
+@@ -1152,11 +1152,12 @@ github.com/moby/buildkit/worker/label
+ # github.com/moby/docker-image-spec v1.3.1
+ ## explicit; go 1.18
+ github.com/moby/docker-image-spec/specs-go/v1
+-# github.com/moby/go-archive v0.2.0
+-## explicit; go 1.23.0
++# github.com/moby/go-archive v0.3.3
++## explicit; go 1.25
+ github.com/moby/go-archive
+ github.com/moby/go-archive/chrootarchive
+ github.com/moby/go-archive/compression
++github.com/moby/go-archive/internal/archiveoptions
+ github.com/moby/go-archive/internal/mounttree
+ github.com/moby/go-archive/internal/unshare
+ github.com/moby/go-archive/tarheader
+-- 
+2.35.6
+
diff --git a/recipes-containers/docker/files/CVE-2026-17106_p2.patch b/recipes-containers/docker/files/CVE-2026-17106_p2.patch
new file mode 100644
index 00000000..6fd06a2c
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-17106_p2.patch
@@ -0,0 +1,186 @@
+From 982beef695c33fca482428ba98d7668cfd93b9ac Mon Sep 17 00:00:00 2001
+From: CrazyMax <1951866+crazy-max@users.noreply.github.com>
+Date: Sun, 15 Nov 2026 20:34:34 -0800
+Subject: [PATCH] archive: resolve symlinks before parent traversal
+
+Resolve fallback paths component by component instead of lexically cleaning symlink targets.
+Cleaning alias/../out before expanding alias can select the wrong extraction directory when
+a missing parent triggers fallback.
+
+Preserve root-bounding and escape-before-absolute-link tracking, and continue resolving after
+missing components. Reject parent traversal through non-directories and retain bounded symlink
+expansion.
+
+CVE: CVE-2026-17106
+Upstream-Status: Backport [https://github.com/moby/go-archive/commit/b6d491b14626a6913b224ec38558d62b8912dbd6]
+
+Backport Changes:
+- Omitted upstream archive_unix_test.go because Moby's vendored
+  go-archive source does not include the upstream module's test suite.
+
+Signed-off-by: CrazyMax <1951866+crazy-max@users.noreply.github.com>
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ vendor/github.com/moby/go-archive/rootpath.go | 127 ++++++------------
+ 1 file changed, 44 insertions(+), 83 deletions(-)
+
+diff --git a/vendor/github.com/moby/go-archive/rootpath.go b/vendor/github.com/moby/go-archive/rootpath.go
+index 7d34839..0434b42 100644
+--- a/vendor/github.com/moby/go-archive/rootpath.go
++++ b/vendor/github.com/moby/go-archive/rootpath.go
+@@ -20,6 +20,8 @@
+ 	"errors"
+ 	"os"
+ 	"path/filepath"
++	"strings"
++	"syscall"
+ )
+ 
+ var errTooManyLinks = errors.New("too many links")
+@@ -42,101 +44,60 @@ func fsRootPath(root, path string) (string, error) {
+ 
+ func resolveFSRootPath(root, path string) (fsRootPathResult, error) {
+ 	result := fsRootPathResult{path: root}
+-	if path == "" {
+-		return result, nil
+-	}
+-	var linksWalked int // to protect against cycles
+-	for {
+-		i := linksWalked
+-		newpath, err := walkLinks(root, path, &linksWalked, &result)
+-		if err != nil {
+-			return fsRootPathResult{}, err
+-		}
+-		path = newpath
+-		if i == linksWalked {
+-			newpath = filepath.Join(string(os.PathSeparator), newpath)
+-			if path == newpath {
+-				result.path = filepath.Join(root, newpath)
+-				return result, nil
++	parts := strings.Split(filepath.FromSlash(path), string(os.PathSeparator))
++	resolved := make([]string, 0, len(parts))
++	linksWalked := 0
++	for len(parts) > 0 {
++		part := parts[0]
++		parts = parts[1:]
++		switch part {
++		case "", ".":
++			continue
++		case "..":
++			if len(resolved) > 0 {
++				resolved = resolved[:len(resolved)-1]
++			} else if !result.followedAbsoluteLink {
++				// Keep the path bounded, but do not let a later absolute link
++				// hide a relative escape from resolveArchivePath.
++				result.relativeEscapeBeforeAbsolute = true
+ 			}
+-			path = newpath
++			continue
+ 		}
+-	}
+-}
+ 
+-func walkLink(root, path string, linksWalked *int, result *fsRootPathResult) (newpath string, islink bool, err error) {
+-	if *linksWalked > 255 {
+-		return "", false, errTooManyLinks
+-	}
+-
+-	path = filepath.Join(string(os.PathSeparator), path)
+-	if path == string(os.PathSeparator) {
+-		return path, false, nil
+-	}
+-	realPath := filepath.Join(root, path)
+-
+-	fi, err := os.Lstat(realPath)
+-	if err != nil {
+-		// If path does not yet exist, treat as non-symlink
++		candidate := filepath.Join(root, filepath.Join(append(resolved, part)...))
++		fi, err := os.Lstat(candidate)
+ 		if os.IsNotExist(err) {
+-			return path, false, nil
++			// A later .. can return to an existing parent. Continue resolving
++			// instead of cleaning the remaining path and skipping its symlinks.
++			resolved = append(resolved, part)
++			continue
+ 		}
+-		return "", false, err
+-	}
+-	if fi.Mode()&os.ModeSymlink == 0 {
+-		return path, false, nil
+-	}
+-	newpath, err = os.Readlink(realPath)
+-	if err != nil {
+-		return "", false, err
+-	}
+-	if filepath.IsAbs(newpath) {
+-		result.followedAbsoluteLink = true
+-	} else if !result.followedAbsoluteLink {
+-		// Record an escape before a later absolute link can make the original
+-		// os.Root error appear eligible for resolve-in-root fallback.
+-		relativeDir, err := filepath.Rel(string(os.PathSeparator), filepath.Dir(path))
+ 		if err != nil {
+-			return "", false, err
+-		}
+-
+-		resolved := filepath.Join(relativeDir, newpath)
+-		if resolved != "." && !filepath.IsLocal(resolved) {
+-			result.relativeEscapeBeforeAbsolute = true
++			return fsRootPathResult{}, err
+ 		}
+-	}
+-
+-	*linksWalked++
+-	return newpath, true, nil
+-}
+-
+-func walkLinks(root, path string, linksWalked *int, result *fsRootPathResult) (string, error) {
+-	switch dir, file := filepath.Split(path); {
+-	case dir == "":
+-		newpath, _, err := walkLink(root, file, linksWalked, result)
+-		return newpath, err
+-	case file == "":
+-		if os.IsPathSeparator(dir[len(dir)-1]) {
+-			if dir == string(os.PathSeparator) {
+-				return dir, nil
++		if fi.Mode()&os.ModeSymlink == 0 {
++			if len(parts) > 0 && !fi.IsDir() {
++				return fsRootPathResult{}, &os.PathError{Op: "resolve", Path: candidate, Err: syscall.ENOTDIR}
+ 			}
+-			return walkLinks(root, dir[:len(dir)-1], linksWalked, result)
++			resolved = append(resolved, part)
++			continue
+ 		}
+-		newpath, _, err := walkLink(root, dir, linksWalked, result)
+-		return newpath, err
+-
+-	default:
+-		newdir, err := walkLinks(root, dir, linksWalked, result)
+-		if err != nil {
+-			return "", err
++		if linksWalked == 255 {
++			return fsRootPathResult{}, errTooManyLinks
+ 		}
+-		newpath, islink, err := walkLink(root, filepath.Join(newdir, file), linksWalked, result)
++		linksWalked++
++		target, err := os.Readlink(candidate)
+ 		if err != nil {
+-			return "", err
++			return fsRootPathResult{}, err
+ 		}
+-		if !islink || filepath.IsAbs(newpath) {
+-			return newpath, nil
++		if filepath.IsAbs(target) {
++			result.followedAbsoluteLink = true
++			resolved = resolved[:0]
+ 		}
+-		return filepath.Join(newdir, newpath), nil
++		// Expand symlinks before processing a following ..; lexical cleaning
++		// would remove the link rather than the directory it resolves to.
++		parts = append(strings.Split(filepath.FromSlash(target), string(os.PathSeparator)), parts...)
+ 	}
++	result.path = filepath.Join(root, filepath.Join(resolved...))
++	return result, nil
+ }
+-- 
+2.35.6
+
-- 
2.35.6

