Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD76BCD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 06:36:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14077.1781073408191250477
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 23:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=fYh6lmWc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A5TAF2689979;
	Wed, 10 Jun 2026 06:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JVxqsaidYIVT2Ct/9VVgo6
	/+wPAIv+MUmbw8vaMskT4=; b=fYh6lmWcdsA2GRH5ZdiklTEJ1uMVA2K2DmuREU
	+cukUiJjK84nSHCFWXkNW9XOV4k0QZiIV4D6EFuxM2lh1hsqt3RuBSl4JbzgTkzP
	SU1yfNHCqgB4jOY/ZKeVcANKCkRu6q8qtnHYhp9afnzGM5OHLkBqRkoWEw9taedM
	tgtJbYAaHj8Blmx43qIuhZT/Hba8zE7ht/OAdvm00Rtk98VSZgquLae9ahER0SJ0
	HKzTA5+apXFEqklTHNGFmQyNuLxHiWjCDQfl/MCEzr0swAt3PWZ9djgw94Xy17gm
	EDLPRGeYDb79Lk4tBwqrAifPyWFFYoui1b/oy43lNh2GDvKg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg07qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 06:36:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 65A6ajRp030899
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 06:36:45 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Jun 2026 23:36:42 -0700
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: <vkraleti@qti.qualcomm.com>, <anujmitt@qti.qualcomm.com>,
        <sbanerje@qti.qualcomm.com>, <bruce.ashfield@gmail.com>,
        <meta-virtualization@lists.yoctoproject.org>
CC: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Subject: [PATCH v1 0/2] Add crosvm recipe to meta-virtualization
Date: Wed, 10 Jun 2026 12:06:22 +0530
Message-ID: <20260610063624.3420495-1-kraghava@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-GUID: TRj1UnKvmBWu6FIHaCYKJ2Kl3H11eYou
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a2905fe cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OyQi2Pe2dI8AOGXDtJgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA2MCBTYWx0ZWRfXwZpEoOzRFHT/
 huHv6TQypQklglGtZr1ZF5EEKoxGR00mbAqLXR4hGw71k0HB28jJAhUsP0GXum0xsYLLwdQw7ov
 9mx+Tzw0rjSWj835M5eKYSDASoEWFamYDobPJ1uvkc1NnNaLmVnItoLRyD+CYPODcAM2toXIDCE
 X8oPkwBy5NSj3ZewTfTnPWCeuUJ4e+J8mNZypL31CBgHj1J10WDUA8OKN9Skl68/EMtYapc0VTK
 FxctLKH6f20lSuW5FMmT1VLHMzCXU9vJFvoGXKtMLKLk+O/BNb8VfZlJ6SyVHhsWJ6AL0HKLQH+
 pjkXrB1U+Bb4zVhV3N9Q7/iACnzVov/j1ZbkexwV1np200h4o+nlGu8Ue/WTXAwfKg9apxdbKGr
 cMJLUd3GQu8ZCcUgrK+zgk4B8w5bI//24wGElEM4WSWbAPtwvvK5IFl1NJBjJTdO2u/+bAyALZl
 FXvN6ip1AP8iTUsaDqA==
X-Proofpoint-ORIG-GUID: TRj1UnKvmBWu6FIHaCYKJ2Kl3H11eYou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100060
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 65A5TAF2689979
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 06:36:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9857

This patch series introduces support for crosvm, the ChromeOS Virtual
Machine Monitor, into the meta-virtualization layer. The goal is to
provide a modern, security-oriented alternative to QEMU for
virtualization workloads.

QEMU continues to be the industry-standard VMM, offering extensive device
models, multi-architecture emulation, and a highly flexible subsystem
architecture. However, QEMU's strength and breadth contributes to a
large and complex monolithic codebase. As documented in QEMU's own
security guidance, the system architecture places numerous components
within a single process. This increases the trusted computing base and
expands the range of possible exploit surfaces. Maintaining device models
and legacy emulation paths further adds to complexity and potential
vulnerability exposure.

crosvm approaches virtualization from a different perspective. Its design
principles center on minimalism, isolation, and security. Instead of
supporting full-system emulation, crosvm relies exclusively on KVM for
hardware-assisted virtualization. It is implemented in Rust, enabling
strong memory safety guarantees and eliminating many classes of bugs that
commonly arise in large C codebases.

A key architectural distinction is crosvm's process separation model.
Each device backend is offloaded into its own tightly sandboxed process
using seccomp filters and Linux namespaces. This =E2=80=9Cprocess-per-dev=
ice=E2=80=9D
layout shrinks the trusted computing base and prevents a compromise in on=
e
device model from affecting the rest of the system. These isolation
boundaries align closely with secure-by-design principles and provide a
more predictable attack surface.

For embedded, edge, and containerized environments=E2=80=94where minimali=
sm,
stability, and strict isolation are essential=E2=80=94crosvm offers a com=
pelling
VMM alternative. By integrating crosvm into meta-virtualization, we allow
Yocto users to choose between a feature-rich, broad-emulation platform
(QEMU) and a streamlined, security-hardened VMM (crosvm) best suited for
KVM-first workloads.

Patches follow.

Keerthivasan Raghavan (2):
  crosvm: add recipe for ChromeOS Virtual Machine Monitor (VMM)
  crosvm-image-minimal: add a reference image for crosvm demo

 recipes-devtools/crosvm/crosvm-crates.inc     | 966 ++++++++++++++++++
 recipes-devtools/crosvm/crosvm_0.1.0.bb       |  57 ++
 recipes-extended/images/README-crosvm.md      |  68 ++
 .../images/crosvm-image-minimal.bb            |  68 ++
 4 files changed, 1159 insertions(+)
 create mode 100644 recipes-devtools/crosvm/crosvm-crates.inc
 create mode 100644 recipes-devtools/crosvm/crosvm_0.1.0.bb
 create mode 100644 recipes-extended/images/README-crosvm.md
 create mode 100644 recipes-extended/images/crosvm-image-minimal.bb

--=20
2.34.1


