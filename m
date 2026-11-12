Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9510.1794474235535617245
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Nov 2026 01:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aVrxLiFP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: kshakir@qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZUvQ4149279;
	Thu, 12 Nov 2026 09:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ran5XSnbnCIaLSTBopcJCOu/KhRyzxKISO6
	30Lrnv84=; b=aVrxLiFPGfCDw9yVuuyXEkwWsBMWgyyHQbJKxroqS2UZdjXpAbz
	GXd9/zstNqm7rst1as6u+8gDfhWB60U8bLJjUdkG/6shxOQUqeZtvB6JFZwR9vEL
	0QQG99K+ozhOMq30uDtT4htMi12Keyj4sgxvIr62/lK1IDN+U9ax1GfOjYjsIKFI
	3SgJc2C7zUCA6S8M4atD/qI4wIfPW3S8Pi0UE9z0Rrnhzmf7vakgAvSvYDzWzSTa
	6ds+gcu7xpyKf6DWxJ2+Zk1E197SYk2I+gh4IgEIWREsfzbzYDfck+gmpdaerRds
	ePpdy2eiCec9HrEnok+AhkN2U6UUU/2q3ig==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62p1c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 09:03:53 +0000 (GMT)
Received: from pps.filterd (nalasppmta03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC93q4Q2184113;
	Thu, 12 Nov 2026 09:03:52 GMT
Received: from las-colo41-d19-20.qualcomm.com (las-colo41-d19-20.qualcomm.com [10.37.19.117])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 6AC93qOt2184099
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 09:03:52 +0000 (GMT)
Received: by las-colo41-d19-20.qualcomm.com (Postfix, from userid 2366661)
	id 75F8341145; Thu, 12 Nov 2026 01:03:52 -0800 (PST)
From: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com, ievlogie@qti.qualcomm.com,
        Kemal Rasim Sh <kshakir@qti.qualcomm.com>
Subject: [PATCH] docker-moby: preserve gids during docker exec
Date: Thu, 12 Nov 2026 01:03:50 -0800
Message-ID: <20261112090350.2918098-1-kshakir@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: gdsPv6fz0UJu8tYm2KEp9SFYHDJjLmGv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfXw1tBxmOR8Dzd
 +ktYcWRAVprf2ee3YhF1+GCwrQ3fUxap4hRvnJhlgiulTrI6VcgMTQmPsp8GrTN7v1cr7IdJUfi
 bXRlLdxGBImP+0Z93xQcPq0VPRksNVkFdiAs8pPLh/B6da+PZ/W47CjAz5AEJq9thCAw/NNInAa
 xBk2G/UOiyPCIAhQFxy+rSHv3Ihke3MxGuKAWRly2WK3IXOjEv3gFRRnHatuDtS+xryDly8UflX
 WOB+S9uS2VfrWPORQMp4Up91aw5Pt9dQsO6sdOA/PtLm/N+gUNpje2D1moeZYcsF/M+zZSpI6Yy
 SAJwbTwXmqibs+MzB/Of/8KNQ+fjKL/BsSSJSxci7NssC9Nzt2s43/19vVsAooFTAsdJMbSykRD
 2UTPCScmV3GgC7I+X3M49NhuO/wQCMUjL7IE5V7v8mXYDxm7wkmISzU1OCLGQfhtT5ob9zKXEj9
 n7HFw4TsD6/V1IaIvSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfX8XNXmDzi3cSz
 065I6ANi0K+BIovOWIAQTQEVAICSR907orVmPCcQyQVHMWWzdGl2jwl09Bm9h8GEac1CVhv9/6F
 fhSIAWqgEvU+1aSyDt8nlZ1Ti1L1axQ=
X-Proofpoint-GUID: gdsPv6fz0UJu8tYm2KEp9SFYHDJjLmGv
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af580f9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8
 a=A1X0JdhQAAAA:8 a=GFwbhVXWLe-BoAFTT8IA:9 a=3nWjig0DUKXJB_ZfKOX2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120035
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Nov 2026 09:04:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10165
Content-Type: text/plain; charset="utf-8"

Processes started with docker exec do not inherit all
supplemental groups assigned to the container when it was
created.

When OCI additionalGids are injected through CDI or other
OCI runtime modifications, the container init process
receives the groups correctly. However, docker exec rebuilds
user credentials and drops the original additionalGids from
the OCI process specification.

As a result, exec'd processes may lose access to devices and
resources granted through supplemental group membership,
leading to inconsistent behavior within the same container.

Preserve and merge the original OCI additionalGids into the
exec process specification so that groups assigned during
container creation remain available to docker exec
processes.

Before:

  docker exec <container> cat /proc/self/status | grep Groups
  Groups: 15 44 1000

After:

  docker exec <container> cat /proc/self/status | grep Groups
  Groups: 15 44 981 987 992 993 999 1000

This backport also includes the CDI additionalGids fix
required by the exec path change.

(cherry picked from commit
5c36dadb2543835d79eb4d398cfc9da507f6ff882)

Signed-off-by: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
---
 recipes-containers/docker/docker-moby_git.bb  |  2 +
 ...-daemon-preserve-CDI-additional-GIDs.patch | 96 +++++++++++++++++++
 ...preserve-OCI-additionalGids-for-exec.patch | 61 ++++++++++++
 3 files changed, 159 insertions(+)
 create mode 100644 recipes-containers/docker/files/0001-daemon-preserve-CDI-additional-GIDs.patch
 create mode 100644 recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids-for-exec.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 9768b306..c4c79110 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -54,6 +54,8 @@ SRC_URI = "\
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
         file://0001-check-config-make-CONFIG_MEMCG_SWAP-conditional.patch;patchdir=src/import \
+        file://0001-daemon-preserve-CDI-additional-GIDs.patch;patchdir=src/import \
+        file://0002-daemon-preserve-OCI-additionalGids-for-exec.patch;patchdir=src/import \
         file://CVE-2026-41568.patch;patchdir=src/import \
         file://CVE-2026-42306_p1.patch;patchdir=src/import \
         file://CVE-2026-42306_p2.patch;patchdir=src/import \
diff --git a/recipes-containers/docker/files/0001-daemon-preserve-CDI-additional-GIDs.patch b/recipes-containers/docker/files/0001-daemon-preserve-CDI-additional-GIDs.patch
new file mode 100644
index 00000000..ee4687a9
--- /dev/null
+++ b/recipes-containers/docker/files/0001-daemon-preserve-CDI-additional-GIDs.patch
@@ -0,0 +1,96 @@
+From 704210f9e6d44af1501c7564c82a98653b059b7a Mon Sep 17 00:00:00 2001
+From: Evan Lezar <elezar@nvidia.com>
+Date: Fri, 8 May 2026 00:46:21 +0200
+Subject: [PATCH] daemon: preserve CDI additional GIDs
+
+CDI injection runs from WithDevices and may append supplementary groups to process.user.additionalGids. Docker's WithUser option previously ran afterwards and replaced Process.User, dropping any CDI-provided groups.
+
+Resolve the final container user before device injection so CDI edits append to that user, and add regression coverage for a CDI v0.7 spec that injects additionalGids.
+
+Upstream-Status: Backport [https://github.com/moby/moby/pull/52579]
+
+Signed-off-by: Evan Lezar <elezar@nvidia.com>
+---
+ daemon/oci_linux.go      |  3 ++-
+ daemon/oci_linux_test.go | 40 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 42 insertions(+), 1 deletion(-)
+
+diff --git a/daemon/oci_linux.go b/daemon/oci_linux.go
+index d7a8859d6be30..668891e2672d8 100644
+--- a/daemon/oci_linux.go
++++ b/daemon/oci_linux.go
+@@ -1015,6 +1015,8 @@ func (daemon *Daemon) createSpec(ctx context.Context, daemonCfg *configStore, c
+ 		withCgroups(daemon, &daemonCfg.Config, c),
+ 		WithResources(c),
+ 		WithSysctls(c),
++		// Set the user before CDI device injection, which may append supplementary groups.
++		WithUser(c),
+ 		WithDevices(daemon, c),
+ 		withRlimits(daemon, &daemonCfg.Config, c),
+ 		WithNamespaces(daemon, c),
+@@ -1025,7 +1027,6 @@ func (daemon *Daemon) createSpec(ctx context.Context, daemonCfg *configStore, c
+ 		WithSelinux(c),
+ 		WithOOMScore(&c.HostConfig.OomScoreAdj),
+ 		coci.WithAnnotations(c.HostConfig.Annotations),
+-		WithUser(c),
+ 	)
+ 
+ 	if c.NoNewPrivileges {
+diff --git a/daemon/oci_linux_test.go b/daemon/oci_linux_test.go
+index 9e2c361a83a19..fa0a442a0bc18 100644
+--- a/daemon/oci_linux_test.go
++++ b/daemon/oci_linux_test.go
+@@ -2,6 +2,7 @@ package daemon
+ 
+ import (
+ 	"context"
++	"maps"
+ 	"os"
+ 	"path/filepath"
+ 	"slices"
+@@ -76,6 +77,45 @@ func (i *fakeImageService) StorageDriver() string {
+ 	return "overlay"
+ }
+ 
++func TestCreateSpecPreservesCDIAdditionalGIDs(t *testing.T) {
++	cdiDir := t.TempDir()
++	err := os.WriteFile(filepath.Join(cdiDir, "test-device.yaml"), []byte(`
++cdiVersion: "0.7.0"
++kind: "example.com/device"
++devices:
++- name: foo
++  containerEdits:
++    additionalGids:
++    - 1234
++`), 0o644)
++	assert.NilError(t, err)
++
++	origDeviceDrivers := maps.Clone(deviceDrivers)
++	t.Cleanup(func() {
++		deviceDrivers = origDeviceDrivers
++	})
++	RegisterCDIDriver(cdiDir)
++
++	c := &container.Container{
++		Config: &containertypes.Config{},
++		HostConfig: &containertypes.HostConfig{
++			Resources: containertypes.Resources{
++				DeviceRequests: []containertypes.DeviceRequest{
++					{
++						Driver:    "cdi",
++						DeviceIDs: []string{"example.com/device=foo"},
++					},
++				},
++			},
++		},
++	}
++	d := setupFakeDaemon(t, c)
++
++	s, err := d.createSpec(t.Context(), &configStore{}, c, nil)
++	assert.NilError(t, err)
++	assert.Assert(t, slices.Contains(s.Process.User.AdditionalGids, uint32(1234)), "CDI additional GID not present in OCI spec")
++}
++
+ // TestTmpfsDevShmNoDupMount checks that a user-specified /dev/shm tmpfs
+ // mount (as in "docker run --tmpfs /dev/shm:rw,size=NNN") does not result
+ // in "Duplicate mount point" error from the engine.
diff --git a/recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids-for-exec.patch b/recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids-for-exec.patch
new file mode 100644
index 00000000..8c5c5102
--- /dev/null
+++ b/recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids-for-exec.patch
@@ -0,0 +1,61 @@
+From 6a21aad6ca4fd964672fbf54dd409650a1e05110 Mon Sep 17 00:00:00 2001
+From: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
+Date: Fri, 30 Oct 2026 09:02:24 +0200
+Subject: [PATCH] daemon: preserve OCI additionalGids for exec processes
+
+docker exec rebuilds user credentials using WithUser() and
+WithAdditionalGIDs(), which causes OCI Process.User.AdditionalGids
+defined during container creation to be lost.
+
+Preserve and merge the container's original AdditionalGids into the
+exec process specification so that supplemental groups injected by CDI
+or other OCI spec modifications remain available to exec sessions.
+
+Fixes a discrepancy where the container init process receives CDI
+additionalGids but processes started through docker exec do not.
+
+Upstream-Status: Submitted [https://github.com/moby/moby/pull/54104]
+
+Signed-off-by: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
+---
+ daemon/exec_linux.go | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/daemon/exec_linux.go b/daemon/exec_linux.go
+index 2d2f3d82f0999..014ab2f41c1b9 100644
+--- a/daemon/exec_linux.go
++++ b/daemon/exec_linux.go
+@@ -27,6 +27,11 @@ func getUserFromContainerd(ctx context.Context, containerdCli *containerd.Client
+ 		return specs.User{}, err
+ 	}
+ 
++	// Preserve OCI additional groups from container creation.
++	inheritedGids := append(
++		[]uint32(nil),
++		spec.Process.User.AdditionalGids...,)
++
+ 	opts := []coci.SpecOpts{
+ 		coci.WithUser(ec.User),
+ 		coci.WithAdditionalGIDs(ec.User),
+@@ -38,6 +43,21 @@ func getUserFromContainerd(ctx context.Context, containerdCli *containerd.Client
+ 		}
+ 	}
+ 
++	// Merge inherited OCI groups.
++	existing := map[uint32]struct{}{}
++
++	for _, gid := range spec.Process.User.AdditionalGids {
++		existing[gid] = struct{}{}
++	}
++
++	for _, gid := range inheritedGids {
++		if _, ok := existing[gid]; !ok {
++			spec.Process.User.AdditionalGids = append(
++				spec.Process.User.AdditionalGids,
++				gid,)
++		}
++	}
++
+ 	return spec.Process.User, nil
+ }
+ 
-- 
2.43.0

