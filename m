Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9484.1794474115266965918
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Nov 2026 01:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nvkErTDi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: kshakir@qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8lsG9597369;
	Thu, 12 Nov 2026 09:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZHPUgBm1YGlcUhK4HtEsZ0Qgbj1ByCrDmhK
	aUJf48A8=; b=nvkErTDif2SjjGkIXfPXQbcLQ4OGvD1E0UgOUVaG6UIK4JdWLLw
	w+gher8oemk1SIt4wongLe+j3a26GvsZD2VNOp3tkBhQPPuQjkcffZfIYzLwA7py
	OajDTO37eUGzLYE89I239nuyQxam50G2UcFLfTopN7pR0aH2Ao6DAxvXqZ7elh8b
	FnVtLCCK8KaBMX9ISqx+5t4IhHFG8BcVF3+WbJcMkISOipkUwYQVm6Ekmt62nINy
	awFDm6Voy5lNILHe5dus+VqiuJ5hCJtqsrmQHJGiv5+YHMAehgjvPyusPyDWpm+n
	Uqx8AhhCMP5gfFf4AQVHfU2j2C9E1XcQOIA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt153y2x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 09:01:53 +0000 (GMT)
Received: from pps.filterd (nalasppmta02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC91q2I4162670;
	Thu, 12 Nov 2026 09:01:52 GMT
Received: from las-colo41-d19-20.qualcomm.com (las-colo41-d19-20.qualcomm.com [10.37.19.117])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AC91qcS4162652
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 09:01:52 +0000 (GMT)
Received: by las-colo41-d19-20.qualcomm.com (Postfix, from userid 2366661)
	id 50D8141145; Thu, 12 Nov 2026 01:01:52 -0800 (PST)
From: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com, ievlogie@qti.qualcomm.com,
        Kemal Rasim Sh <kshakir@qti.qualcomm.com>
Subject: [PATCH] docker-moby: preserve gids during docker exec
Date: Thu, 12 Nov 2026 01:01:46 -0800
Message-ID: <20261112090146.2915914-1-kshakir@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfXzAsSo8rYzVQt
 9nWKlFYHFgXGSf/WC5JzvcXtyANajXddiIQ2zfFlkpi/xxJGjXShmGqg2sBsTODPVPH2h6E8uBy
 2g9oiBNsoFkzKtMg331Rjy5rg8kNOPw=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af58081 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=mDQB2QH0yGYBf_SB5eAA:9 a=3nWjig0DUKXJB_ZfKOX2:22
X-Proofpoint-GUID: MknnWj8Csnr1lcwV6Wad7UhjmCmZvtip
X-Proofpoint-ORIG-GUID: MknnWj8Csnr1lcwV6Wad7UhjmCmZvtip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfX4TGe/xc3m0ME
 jKxpnBUhYtOSKunq+x3Mjq4Vaj+E629kaF7kYkfgCsHYwPmpm2VO4IKeftqZ2NT+MqWMz11tLWw
 UFuHPu9P2zD4+Pvj6L/SwQWvQb5vcuoffcZLZlZkItba22emuPqOqzmBlK2DNoAtDvof7SX2qJc
 cAZm1LWPGDNy0FoTjyouFEWKnQe03/mC8kht0wo7lZit0H1f4ZxKTcBrxEjIDndbJIh2vLyNLqp
 Iyuwa4ZH06yLbVUSXX+TBsmcBw9JWP6p4l/T1gXG53+BCHqZghETplMuQsonyzW/w5Xwa/+7MxV
 7WZ5lVma85gyv/hAgET6MECj9FV6xLKCeAisRJ8k2kBuisdCwQ+fX0/o96D621bDkUJGhrmkNB+
 4PfOBYI5ls7Dn8phF1AFfkv2GPsc7G9UzbnUuNgAt6Ms+h/hPieahgoIbdkIBQIE68cxr4dsowx
 gUvWGbn2CHTR3Kul/OA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120035
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Nov 2026 09:02:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10164
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

Signed-off-by: Kemal Rasim Sh <kshakir@qti.qualcomm.com>
---
 recipes-containers/docker/docker-moby_git.bb  |  1 +
 ...preserve-OCI-additionalGids-for-exec.patch | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 recipes-containers/docker/files/0002-daemon-preserve-OCI-additionalGids-for-exec.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 271f006e..eafe7a35 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -54,6 +54,7 @@ SRC_URI = "\
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
         file://0001-check-config-make-CONFIG_MEMCG_SWAP-conditional.patch;patchdir=src/import \
+        file://0002-daemon-preserve-OCI-additionalGids-for-exec.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
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

