Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC40CD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 06:08:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86572.1781330885389673433
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 23:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=YrLAVRtB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D3Z1Ij1375218;
	Sat, 13 Jun 2026 06:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+HgQDBGAZFJk7uvTeCX/C0
	3n588xa3I6KFUfimfRFfM=; b=YrLAVRtBOAPmF5cIVlNgIUuHFbX57Zl0hst3SR
	avHAwmFjMd/UAiK7Ql03IW1K9f+5PlBKJjJ4GzxACdzmGDJeqzqB0GZ85MHkR5gS
	mbdFBl1drNknly3xHMXoB2gmzsSErtPr9DXS22vUZfbsyIQ9RZRFTu8dhReNCgbI
	dxoAoVIN+DT8vjCw5jwglnl+tnlhdirzViNqXMejaJLWGu9uAK5BMt4OdkW+ILCW
	JW1eLKeUC4oSaUqCEesUZfwEPaDchMxr0ijE3f79zTk4mkZFkcsKM7+NttjAt+aN
	oZGMWg87KB0av0oJ/Z8f+SWXT5JzHQu23TQSx29qSL+pijgg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye108yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jun 2026 06:08:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 65D683Ie021088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jun 2026 06:08:03 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Jun 2026 23:08:01 -0700
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: <vkraleti@qti.qualcomm.com>, <anujmitt@qti.qualcomm.com>,
        <sbanerje@qti.qualcomm.com>, <bruce.ashfield@gmail.com>,
        <meta-virtualization@lists.yoctoproject.org>
CC: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Subject: [PATCH v2 0/2] Add crosvm recipe to meta-virtualization
Date: Sat, 13 Jun 2026 11:37:41 +0530
Message-ID: <20260613060743.3120135-1-kraghava@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-GUID: RmX8GFmjnK_DWn6jH5eQw9-mtoR69A2z
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2cf3c4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=SNBtLHB7kIJVENQPx90A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA1OCBTYWx0ZWRfX+P79qYrwTkzP
 gFnsLIHJ1uOmF8DKVVGh2dpEL+/17MY/ecgQLLDCFVdD9SjVW0fl4QFOPW3nqktQY7WnpmWtjBo
 fX2skeOVaFN1qQWMa/VAvR3mkG5BGoI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA1OCBTYWx0ZWRfXwvZXcZz6/44A
 FfPwwUhkjKoYIBh/ug3UWN4oqdBFNdAnRscfajjV4kSjRrpeicTcnOE3bgETxYgPj8aXbzm+c0v
 U/SVHu2EaTBBIAXxm6hzMnpf6LieI5xJopA74YpT8no+60/zR1no8Xk9JElnBm2VvU8qC9fKi4k
 LsiGnmLpqbvlxpk9WKtrQ+LrmkS4fOFoJJcqxDszq6TopkDMpTzn7xO8Z2pO+82CA6rGyPUPXEI
 aqY00eDBaYgVFVcnVnyC2UxVP/CJ1Lt+sNkgp5Iq4oXrm+bua0gmV/QAQmhM2yIq/Ks74JvMV+G
 g+xyqEyihReiWucjt54iw4VZFzipH0uYc/KS/Xh/OMDGDr2WouYs3GtdzBAwJ8v1sf1QHPqlcMo
 BEXxTdcNsNKAQPy6cZcMfMv2OoNUJrbocyZpvFcCDgtM10pjsILIKOnH0XbPJZJi/MmEzUY7qAk
 +PY2nfcNKN1L1OiB/lQ==
X-Proofpoint-ORIG-GUID: RmX8GFmjnK_DWn6jH5eQw9-mtoR69A2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130058
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 65D3Z1Ij1375218
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 13 Jun 2026 06:08:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9887

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
 recipes-extended/crosvm/crosvm_0.1.0.bb       |  62 ++
 recipes-extended/images/README-crosvm.md      |  68 ++
 .../images/crosvm-image-minimal.bb            |  82 ++
 4 files changed, 1178 insertions(+)
 create mode 100644 recipes-extended/crosvm/crosvm-crates.inc
 create mode 100644 recipes-extended/crosvm/crosvm_0.1.0.bb
 create mode 100644 recipes-extended/images/README-crosvm.md
 create mode 100644 recipes-extended/images/crosvm-image-minimal.bb

--=20
2.34.1


