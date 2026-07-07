Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F10C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:23:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.174309.1783430596088224443
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jul 2026 06:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=IYz7Rzao;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C92uA3590124;
	Tue, 7 Jul 2026 13:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k9FW8AXKW6X3+nHOyyq5Gw
	hSgaWnAD97507KeVLkIWQ=; b=IYz7Rzaoc9IqRN0n4cu/YQHd7mrKmkrhh3bLgM
	G/vrd5V+RBfHHRLWUyr0VpLAhu3cJvp3pkJDLeLTx3vXYzHGLSPzo553i71JYnKT
	8i+aRzDoOwg2/FWOgNL7KXdUsoHCCtrQLObI5P8vDPE5YOeo/DN8kL52/Mb8VD78
	uFZMs2mq4CiB6Rck8HaesEJ4hJlS9Bd/clkFXS/Fo5Rsvwk+JOPOmpmCtE/6Q87a
	AfGcPec33xyK6eegV/wGVoqd2YRdWZ6O7rAbjs5sWuRHJs3/vTyq3c4GE8xrBVxS
	KqPKSnZlFwWqy//4Ul13ktiDlQLJZ/rS7pH7CZSbCSk5Ty3Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u9cqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 13:23:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 667DNDAO030239
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jul 2026 13:23:13 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 7 Jul 2026 06:23:10 -0700
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: <anujmitt@qti.qualcomm.com>, <vkraleti@qti.qualcomm.com>,
        <sbanerje@qti.qualcomm.com>, <bruce.ashfield@gmail.com>,
        <meta-virtualization@lists.yoctoproject.org>
CC: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Subject: [PATCH v3 0/2] Add crosvm recipe to meta-virtualization
Date: Tue, 7 Jul 2026 18:52:47 +0530
Message-ID: <20260707132249.677711-1-kraghava@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMSBTYWx0ZWRfX9cd0RT2Hk1XE
 6FOL9W3GRqnPCF5GGAwfrch90Xq1nEtYPO4JYGYjYYQnI8Xy3lgeKjtudSUl+wNkpoyq4iIO5sY
 FhDu67mgV5Hl+RxS1kZqiGCUg82OK1c=
X-Proofpoint-GUID: uCW9w8jwF3GnCJTnqtP-9qeVuWOKpZnf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMSBTYWx0ZWRfXwl594Ucm6RWo
 huBPDr2xlhP3H/YNXuuKwz/gCBGo/AbPOukYSKylzxUPsG2iigsDhEZjLqsL/fk5mVkRNXveNY9
 TL4Dm93WP8E9Gr3g87YKw2tW7PxezAPq8RNi1soIfZ3yof/x8mV0VnqMtRcUQIR9wS4/YItdyMX
 jc/DR5oALSIKgc5+rwkAFOwsKbwmfvjHH1vMCTjGcp+2FMQpvOyHOT95E00QoWx1ICI2LRHJisK
 krotZkMbBtNDklgkEHWzgMjbIpMsdbSDgj6dc/y81RDjHkH8KwhtqW/NY0l1hqESSANjrZeAny8
 FpmbzjeiVnFxyVr57VVpfbLGTMnCEQJ8HiNbsWPSZ2uNULWYBN6hlIBB67Xk+5r1RslL/pJjclf
 dSGpstKFMrHPA+tMOg8LSus3ocjQ2L0+W6xdc2CReFb5YpLtA/vpAJCHx5PPJsl5rB+MUZMrRx3
 L6U4IgOqPaMb/4XXK/g==
X-Proofpoint-ORIG-GUID: uCW9w8jwF3GnCJTnqtP-9qeVuWOKpZnf
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cfdc2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=PK_8ZCYWYZ_ABf4E2OYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070131
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 667C92uA3590124
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jul 2026 13:23:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9940

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

 recipes-extended/crosvm/crosvm-crates.inc     | 966 ++++++++++++++++++
 recipes-extended/crosvm/crosvm_0.1.0.bb       |  61 ++
 recipes-extended/images/README-crosvm.md      |  68 ++
 .../images/crosvm-image-minimal.bb            |  80 ++
 4 files changed, 1175 insertions(+)
 create mode 100644 recipes-extended/crosvm/crosvm-crates.inc
 create mode 100644 recipes-extended/crosvm/crosvm_0.1.0.bb
 create mode 100644 recipes-extended/images/README-crosvm.md
 create mode 100644 recipes-extended/images/crosvm-image-minimal.bb

--=20
2.34.1


