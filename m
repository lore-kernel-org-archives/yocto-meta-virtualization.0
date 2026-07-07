Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401A4C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 07:26:16 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.168320.1783409165073446249
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jul 2026 00:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fbz8JRxi;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12377; q=dns/txt;
  s=iport01; t=1783409165; x=1784618765;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8pB3V1qTmNKT0GQUUdFc3EFAHPyhre0hBNhiv7iAKQg=;
  b=fbz8JRxiBCbAfoYBmKmSl7yMChQUt07gVORFhDd5UNaRJFK9tr1aLI+5
   RZcc0dgyLlOoYu7cab10wlR5KAzx642hsLHDy4J6k/6FFTAFNtMLPfrz/
   eqB9aqqfwLSBVnHNFG0TD62mvpf2EJl0oTD2MFM/uU4surrCLO0PXYBqz
   LgH06WKFNPlej36nkMs1PH/TT/oK3SYbqXM8GTgBopyE0WAFuzv25AGDe
   OjrWXTDmxK5bLP13hH8b+3mDOhDbsExa6vDVDC8Ca2ASUcELGJfQXZ8P+
   vnAdLHzhWQt0O/+aAP9fvWkhN3RLrMxCBaEfm1aJHTaV3+zZ++wWkuf58
   Q==;
X-CSE-ConnectionGUID: 1ncidyYgSsmsx/DGo3JJvA==
X-CSE-MsgGUID: 44yqUvyGQvWBB1JBRzmvmw==
X-IPAS-Result: =?us-ascii?q?A0BEAgCSqExq/4z/Ja1aHgEBCxIMggULgld0X0JJlCqCI?=
 =?us-ascii?q?YEWnQiBfg8BAQEPRA0EAQGEQEYCjU0CJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgE4ATQ+AwECWiMZCIMCAYJzAxEGuFGCLIEBh?=
 =?us-ascii?q?H3bLAELFAGBOIU/iB9bGAGEfCcbG4FygRWCc3aBBYFcAgKBSIZbBIIigQyBW?=
 =?us-ascii?q?oIYjUJIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYFrgQKEe?=
 =?us-ascii?q?SMfAzl/gTB1SnktgQMSHgqBUoFRAwsYDUgRLDcUGwQ+bgeNDRcPgjYGAQEsT?=
 =?us-ascii?q?hMBKwQBGwIuX0kQJA4UkwwRPZF3gTifWgoog3WMIZU6GjOFW6URC5h9izeCU?=
 =?us-ascii?q?5U0gRyEaIFoPIFZcBWDIglKGQ+OOINrzgo8NQsyAQEHAgcOAwuBaJABgXwBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:TDCggaInMDr3b1UNFE+RgpQlxSXFcZb7ZxGr2PjKsXjdYENS1GEGy
 GVMX2zQOKyOYzH0L4ogOoyzpxgC6MeBy4c1SAYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGYrajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN03Cko3MZwp9d1sBHpes
 tA3L2svTA6q0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEyojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjOm0bYKEIofXLSlTthrEt
 3v74XXWOw8lHvbG6xC/4Heyg/CayEsXX6pXTtVU7MVChVCPzykNCQcKSFK/oOuwlk+5XfpbK
 lcI4Ww/qqMu81SxSdvwVAH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:4IniwKPse2VUjsBcTvGjsMiBIKoaSvp037BN7TESdfU7SKKlfq
 yV8cjztiWE6wr5JktApTnoAsDpKhnhHPVOjrX5U43PYOCfgguVBbAny5f+yDv9HCC73Otc2a
 B8N5VaMrTLfD1HZQKQ2njeLz7mq+P3lJyVuQ==
X-Talos-CUID: 9a23:iCohv20oLaKep2bvGr2y3bxfQ8Yuc3HM/XjrOEqjGSFFZ7rOa32O0fYx
X-Talos-MUID: 9a23:B49MhwUFDuQl7DDq/GOwlShfKtZH2rqRImpUs788qcyaMDMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,153,1779148800"; 
   d="scan'208";a="491509035"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Jul 2026 07:26:03 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 9932A180005BF
	for <meta-virtualization@lists.yoctoproject.org>; Tue,  7 Jul 2026 07:26:03 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id ADB08CC037D; Tue,  7 Jul 2026 12:56:01 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][scarthgap][PATCH] podman: Fix CVE-2026-55686
Date: Tue,  7 Jul 2026 12:55:56 +0530
Message-Id: <20260707072556.2854620-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jul 2026 07:26:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9938

From: Deepak Rathore <deeratho@cisco.com>

- This patch applies the upstream v5.7.1 backport for CVE-2026-55686.
- The upstream fix commit is referenced in [1],the public CVE advisory
is referenced in [2], and the dependent upstream workdir test commit
is referenced in [3].
- The dependent patch is carried because the CVE fix extends that
upstream symlinked-workdir regression test.

[1] https://github.com/containers/podman/commit/7ce2e00ab140c11a68301f0b161f51984131a858
[2] https://github.com/advisories/GHSA-q6r4-3wmg-fwcq
[3] https://github.com/podman-container-tools/podman/commit/e576e002e9d95ae6b37265d9e0b3deaa4c43d73f

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../podman/CVE-2026-55686-dependent.patch     |  53 +++++
 .../podman/podman/CVE-2026-55686.patch        | 190 ++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |   2 +
 3 files changed, 245 insertions(+)
 create mode 100644 recipes-containers/podman/podman/CVE-2026-55686-dependent.patch
 create mode 100644 recipes-containers/podman/podman/CVE-2026-55686.patch

diff --git a/recipes-containers/podman/podman/CVE-2026-55686-dependent.patch b/recipes-containers/podman/podman/CVE-2026-55686-dependent.patch
new file mode 100644
index 0000000..026e5b6
--- /dev/null
+++ b/recipes-containers/podman/podman/CVE-2026-55686-dependent.patch
@@ -0,0 +1,53 @@
+From 757c798d8fd8ee2b05a7f0b5df753b37c7169a49 Mon Sep 17 00:00:00 2001
+From: Paul Holzinger <pholzing@redhat.com>
+Date: Wed, 3 Dec 2025 16:57:15 +0100
+Subject: [PATCH 1/2] libpod: fix workdir MkdirAll() all check
+
+MkdirAll can fail with EEXIST when the path is a symlink and the target
+doesn't exist. As such we should ignore the error.
+
+Note there is something fundemantal wrong here with the path access as
+it is following the symlink to the host, however it is only for a
+stat() so it is not an security issue here.
+
+Fixes: 637c264e2e ("fix issues found by nilness")
+
+CVE: CVE-2026-55686
+Upstream-Status: Backport [https://github.com/podman-container-tools/podman/commit/e576e002e9d95ae6b37265d9e0b3deaa4c43d73f]
+
+Backport Changes:
+- Omitted the libpod/container_internal_common.go hunk because
+  Scarthgap already has equivalent os.IsExist(err) handling in the
+  resolveWorkDir() os.MkdirAll() error path.
+- Kept the upstream symlinked-workdir e2e test because the CVE fix
+  commit extends this test upstream.
+
+Signed-off-by: Paul Holzinger <pholzing@redhat.com>
+(cherry picked from commit e576e002e9d95ae6b37265d9e0b3deaa4c43d73f)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ test/e2e/run_working_dir_test.go | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/test/e2e/run_working_dir_test.go b/test/e2e/run_working_dir_test.go
+index 9f06df9313..53040cd98c 100644
+--- a/test/e2e/run_working_dir_test.go
++++ b/test/e2e/run_working_dir_test.go
+@@ -56,4 +56,14 @@ WORKDIR  /etc/foobar`, ALPINE)
+ 		Expect(session).Should(ExitCleanly())
+ 		Expect(session.OutputToString()).To(Equal("/home/foobar"))
+ 	})
++
++	It("podman run on an image with a symlinked workdir", func() {
++		dockerfile := fmt.Sprintf(`FROM %s
++RUN mkdir /A && ln -s /A /B
++WORKDIR /B`, ALPINE)
++		podmanTest.BuildImage(dockerfile, "test", "false")
++
++		session := podmanTest.PodmanExitCleanly("run", "test", "pwd")
++		Expect(session.OutputToString()).To(Equal("/A"))
++	})
+ })
+-- 
+2.35.6
+
diff --git a/recipes-containers/podman/podman/CVE-2026-55686.patch b/recipes-containers/podman/podman/CVE-2026-55686.patch
new file mode 100644
index 0000000..fe0744c
--- /dev/null
+++ b/recipes-containers/podman/podman/CVE-2026-55686.patch
@@ -0,0 +1,190 @@
+From 7548d6714dee9c43f437202dc3d3652e89a99ee1 Mon Sep 17 00:00:00 2001
+From: Paul Holzinger <pholzing@redhat.com>
+Date: Wed, 3 Dec 2025 19:15:24 +0100
+Subject: [PATCH 2/2] libpod: simplify resolveWorkDir()
+
+The code checks for isPathOnVolume and isPathOnMount so we can just use
+the SecureJoin here directly to check for path existance.
+
+Then instead of walking symlinks and trying to guess if they are on a
+mount just assume if it is a link (path is different from the normal
+joined one) then don't error out early and let the OCI runtime deal with
+it. The runtime does produce a less readable error but it still fails
+and we have much less fragile code.
+
+CVE: CVE-2026-55686
+Upstream-Status: Backport [https://github.com/podman-container-tools/podman/commit/7ce2e00ab140c11a68301f0b161f51984131a858]
+
+Backport Changes:
+- Applied the upstream SecureJoin-based resolveWorkDir() change to
+  Scarthgap's older v5.0 function shape, replacing its
+  isWorkDirSymlink()/resolvePath() flow with the same security behavior.
+- Kept Scarthgap's existing os.MkdirAll(..., 0755) and os.IsExist(err)
+  context because the equivalent prerequisite behavior is already present
+  and is documented in CVE-2026-55686-dependent.patch.
+- Kept Scarthgap's existing gexec import while applying the upstream
+  symlinked-workdir test extension.
+
+Signed-off-by: Paul Holzinger <pholzing@redhat.com>
+(cherry picked from commit 7ce2e00ab140c11a68301f0b161f51984131a858)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ libpod/container_internal_common.go | 81 +++++++----------------------
+ test/e2e/run_working_dir_test.go    | 24 ++++++++-
+ 2 files changed, 41 insertions(+), 64 deletions(-)
+
+diff --git a/libpod/container_internal_common.go b/libpod/container_internal_common.go
+index 3bb6dfe1eb..cfdaf1a148 100644
+--- a/libpod/container_internal_common.go
++++ b/libpod/container_internal_common.go
+@@ -688,54 +688,6 @@ func (c *Container) generateSpec(ctx context.Context) (s *spec.Spec, cleanupFunc
+ 	return g.Config, cleanupFunc, nil
+ }
+ 
+-// isWorkDirSymlink returns true if resolved workdir is symlink or a chain of symlinks,
+-// and final resolved target is present either on  volume, mount or inside of container
+-// otherwise it returns false. Following function is meant for internal use only and
+-// can change at any point of time.
+-func (c *Container) isWorkDirSymlink(resolvedPath string) bool {
+-	// We cannot create workdir since explicit --workdir is
+-	// set in config but workdir could also be a symlink.
+-	// If it's a symlink, check if the resolved target is present in the container.
+-	// If so, that's a valid use case: return nil.
+-
+-	maxSymLinks := 0
+-	for {
+-		// Linux only supports a chain of 40 links.
+-		// Reference: https://github.com/torvalds/linux/blob/master/include/linux/namei.h#L13
+-		if maxSymLinks > 40 {
+-			break
+-		}
+-		resolvedSymlink, err := os.Readlink(resolvedPath)
+-		if err != nil {
+-			// End sym-link resolution loop.
+-			break
+-		}
+-		if resolvedSymlink != "" {
+-			_, resolvedSymlinkWorkdir, err := c.resolvePath(c.state.Mountpoint, resolvedSymlink)
+-			if isPathOnVolume(c, resolvedSymlinkWorkdir) || isPathOnMount(c, resolvedSymlinkWorkdir) {
+-				// Resolved symlink exists on external volume or mount
+-				return true
+-			}
+-			if err != nil {
+-				// Could not resolve path so end sym-link resolution loop.
+-				break
+-			}
+-			if resolvedSymlinkWorkdir != "" {
+-				resolvedPath = resolvedSymlinkWorkdir
+-				_, err := os.Stat(resolvedSymlinkWorkdir)
+-				if err == nil {
+-					// Symlink resolved successfully and resolved path exists on container,
+-					// this is a valid use-case so return nil.
+-					logrus.Debugf("Workdir is a symlink with target to %q and resolved symlink exists on container", resolvedSymlink)
+-					return true
+-				}
+-			}
+-		}
+-		maxSymLinks++
+-	}
+-	return false
+-}
+-
+ // resolveWorkDir resolves the container's workdir and, depending on the
+ // configuration, will create it, or error out if it does not exist.
+ // Note that the container must be mounted before.
+@@ -750,7 +702,7 @@ func (c *Container) resolveWorkDir() error {
+ 		return nil
+ 	}
+ 
+-	_, resolvedWorkdir, err := c.resolvePath(c.state.Mountpoint, workdir)
++	resolvedWorkdir, err := securejoin.SecureJoin(c.state.Mountpoint, workdir)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -766,20 +718,23 @@ func (c *Container) resolveWorkDir() error {
+ 	if !c.config.CreateWorkingDir {
+ 		// No need to create it (e.g., `--workdir=/foo`), so let's make sure
+ 		// the path exists on the container.
+-		if err != nil {
+-			if os.IsNotExist(err) {
+-				// If resolved Workdir path gets marked as a valid symlink,
+-				// return nil cause this is valid use-case.
+-				if c.isWorkDirSymlink(resolvedWorkdir) {
+-					return nil
+-				}
+-				return fmt.Errorf("workdir %q does not exist on container %s", workdir, c.ID())
+-			}
+-			// This might be a serious error (e.g., permission), so
+-			// we need to return the full error.
+-			return fmt.Errorf("detecting workdir %q on container %s: %w", workdir, c.ID(), err)
+-		}
+-		return nil
++		if errors.Is(err, os.ErrNotExist) {
++			// Check if path is a symlink, securejoin resolves and follows the links
++			// so the path will be different from the normal join if it is one.
++			if resolvedWorkdir != filepath.Join(c.state.Mountpoint, workdir) {
++				// Path must be a symlink to non existing directory.
++				// It could point to mounts that are only created later so that make
++				// an assumption here and let's just continue and let the oci runtime
++				// do its job.
++				return nil
++			}
++			// If they are the same we know there is no symlink/relative path involved.
++			// We can return a nicer error message without having to go through the OCI runtime.
++			return fmt.Errorf("workdir %q does not exist on container %s", workdir, c.ID())
++		}
++		// This might be a serious error (e.g., permission), so
++		// we need to return the full error.
++		return fmt.Errorf("detecting workdir %q on container %s: %w", workdir, c.ID(), err)
+ 	}
+ 	if err := os.MkdirAll(resolvedWorkdir, 0755); err != nil {
+ 		if os.IsExist(err) {
+diff --git a/test/e2e/run_working_dir_test.go b/test/e2e/run_working_dir_test.go
+index 53040cd98c..ff9eeac50c 100644
+--- a/test/e2e/run_working_dir_test.go
++++ b/test/e2e/run_working_dir_test.go
+@@ -9,6 +9,7 @@ import (
+ 	. "github.com/onsi/ginkgo/v2"
+ 	. "github.com/onsi/gomega"
+ 	. "github.com/onsi/gomega/gexec"
++	"github.com/onsi/gomega/types"
+ )
+ 
+ var _ = Describe("Podman run", func() {
+@@ -59,11 +60,32 @@ WORKDIR  /etc/foobar`, ALPINE)
+ 
+ 	It("podman run on an image with a symlinked workdir", func() {
+ 		dockerfile := fmt.Sprintf(`FROM %s
+-RUN mkdir /A && ln -s /A /B
++RUN mkdir /A && ln -s /A /B && ln -s /vol/test /link
+ WORKDIR /B`, ALPINE)
+ 		podmanTest.BuildImage(dockerfile, "test", "false")
+ 
+ 		session := podmanTest.PodmanExitCleanly("run", "test", "pwd")
+ 		Expect(session.OutputToString()).To(Equal("/A"))
++
++		path := filepath.Join(podmanTest.TempDir, "test")
++		err := os.Mkdir(path, 0o755)
++		Expect(err).ToNot(HaveOccurred())
++
++		session = podmanTest.PodmanExitCleanly("run", "--workdir=/link", "--volume", podmanTest.TempDir+":/vol", "test", "pwd")
++		Expect(session.OutputToString()).To(Equal("/vol/test"))
++
++		// This will fail in the runtime since the target doesn't exists
++		session = podmanTest.Podman([]string{"run", "--workdir=/link", "test", "pwd"})
++		session.WaitWithDefaultTimeout()
++		var matcher types.GomegaMatcher
++		if filepath.Base(podmanTest.OCIRuntime) == "crun" {
++			matcher = ExitWithError(127, "chdir to `/link`: No such file or directory")
++		} else if filepath.Base(podmanTest.OCIRuntime) == "runc" {
++			matcher = ExitWithError(126, "mkdir /link: file exists")
++		} else {
++			// unknown runtime, just check it failed
++			matcher = Not(ExitCleanly())
++		}
++		Expect(session).Should(matcher)
+ 	})
+ })
+-- 
+2.35.6
+
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 44ee9e3..c714e73 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -24,6 +24,8 @@ SRC_URI = " \
     file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage \
     file://CVE-2025-6032.patch;patchdir=src/import \
     file://CVE-2024-9341.patch;patchdir=src/import \
+    file://CVE-2026-55686-dependent.patch;patchdir=src/import \
+    file://CVE-2026-55686.patch;patchdir=src/import \
 "
 
 LICENSE = "Apache-2.0"
-- 
2.35.6


