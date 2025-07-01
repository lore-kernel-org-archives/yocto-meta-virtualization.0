Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D64C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 10:42:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.7434.1751366520313596248
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 03:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=YQE/266d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619wtMg018912
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 1 Jul 2025 10:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ntMX3ThnQaDDd2l+KS8y2MigaKZMEERSPYc
	/tWIpzaE=; b=YQE/266dLy+ElXrpl7X1Te8cAjqravpifphQqpKJktyvRyR0aiZ
	DHDWNA7U3EjMwHW1CDsPZxVr/RytKvWC46kC3CwHaP3vb6XJglWPFce9PM6WNA67
	pohd/0KS7Hr5tkCMe4ibBmxGmgoNRWgtwMQTWwg5EPN9LTtqTOifq0936rEkh6Mo
	tjILcTx9jyWysFNpVMoSUXz7UlJED1MYae5HklpF8YJdEYoGAU/x15V6SQKxwFOj
	LcU27IcD+ksrPQj56P3B5Nxsr9733V52E1IFDjOvsLMDwZp5aJyEFZs6SC0W2GTm
	iP6EWuYrMsrt5wXjbLOTeaes0eJWkg6ZrUQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxghs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Jul 2025 10:41:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fabd295d12so107234266d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Jul 2025 03:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751366518; x=1751971318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntMX3ThnQaDDd2l+KS8y2MigaKZMEERSPYc/tWIpzaE=;
        b=DsYqDkQkjT543F3XpmnVX5Aofx7CaMDOEBDSQu/44aLsyWaXIak9nD7s7McXTGTtJt
         NG/CKABOa21DMpLiN8fDUdpAiZ9PcrYKKtKkRoo6A7QXn5pCnVm67wSeVoHFSX9iGM0a
         UlDz0AWZB2Sta1lYdI8OH9jlmHhUYQLpGmBQ09CqPhXIVP0JqiZWFVwUFTeFtcPN7Yk7
         3RC1zv0vpJPFqNYksXrmG/upsQTz/iGBo5+0zkLhe7EPzUx79/ovTeEKxHy4bQgAg2WF
         lUDhUdOa+8idw/pLhhW25KQmXEXVmLxpVGxAo9rZKjjAfqRne8xmFWDcMhJmN4FOFSwW
         /NiA==
X-Gm-Message-State: AOJu0YzeKBwhCFAHon+N+W7GPSXeTIGHtCMbic6MpqFDQcwzY/y0prGT
	Z94ieFpXF1raqEeLnae52E8IJ5qeuMOAHevEhWt/KPXmilfP6sLEqKGdZXGC5/wKGtNfJIcpukb
	V0Z9oZGx2vdwdY1tlsfQxOBXdHQGCiJnUMVnORLyxQJTECeAKiM+/y9jPBZN8KzlNkbNdGCyhab
	uBs5sNAPitZnlSRwSKNQ==
X-Gm-Gg: ASbGncu6YrkKf+yzloln/J3fb0RXCUuqyfsNtsvrNO4U4tauHT73/m87ozKnxkadIev
	dKWiMv7qITfPtk3S0asyGuzAJMqLwJBOPsNXokTbq+d++Ecr+QeaWC/GGqtIW0RvRl9g0KZ9+Xg
	2Xt0zDxgiZqx7Xrrj+yYGRdvOGTR6NNj+tobRdWYuOw19rwzNAa2qst4o/VOGMrI72c89e/esC/
	Lnz7SRvnd/aw+0FWqoCpAhrESWM1/O4i28oYPMqU+tK50tVsXvT8oBwZkD/HZOI0qeqZXv384JL
	zFm7qSX1qKETQWV0+pXv4nHCSvMzWDbcXnXjI3xUBzqarrZ24u1ECdB4g0qtFBOk2htOmTIxojy
	Bwmo=
X-Received: by 2002:a05:6214:1305:b0:6f5:40d5:e51 with SMTP id 6a1803df08f44-70002247bc0mr240523156d6.11.1751366518207;
        Tue, 01 Jul 2025 03:41:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDkoWuhg6aqjwLZCf0WMy7JXlq7NhL+cxR4dHLEQqhhm1EHsfiAdvgljJsPouOBcAfTI6/XQ==
X-Received: by 2002:a05:6214:1305:b0:6f5:40d5:e51 with SMTP id 6a1803df08f44-70002247bc0mr240522736d6.11.1751366517750;
        Tue, 01 Jul 2025 03:41:57 -0700 (PDT)
Received: from localhost.localdomain (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8320226fsm7161734a12.71.2025.07.01.03.41.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Jul 2025 03:41:57 -0700 (PDT)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [meta-virtualization][PATCH] docker.inc: add more required kernel modules as RRECOMMENDS:${PN}
Date: Tue,  1 Jul 2025 12:41:55 +0200
Message-ID: <20250701104155.2740-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2NCBTYWx0ZWRfX9e7+1STnoiFo
 eCv+qKycPSWfOt9z3JCyM98ccw+0w8jBLt8GhVDdSsC9yLiYeM5j98EPDNPOPdvTxx+ZRNsXqon
 d0s/hp7CdCuA1Hm8EuaNhrwVWrbx48OF6kgtQuBPjHbDfbOOW0u3eD7ZK479IOOdZWsKEr6uM04
 0vINKSxoc+411cSwzrk0dcEux87ov9ItYAoKSwyA0A4Zb+2Np4g3zvUgaxQr0jSwuCARBpAWYJo
 KkPmLC4Wv+sDhl6wVRVcoAqr3eeqEbrn3BSrWJ6S7IMAMvXwTgazD47ECFu2gApIqVH342DWK3J
 gLxhryW2HBASiH9zlEitPbdVmNb7eOWfdLFOkcdl0LfIt2j73Kid4OIVxVB6y7rYDZGnVCLb/oO
 36tQU6+4GBDSpAVmXOyhhYnuwKiXc4VMfBV8xhG/i4RyfiPqCgEoFddlJVPQkU6NbfKOs2IY
X-Proofpoint-GUID: 8-B_v6IrvpJQBrVJ45-z8qQj7g_NUdGO
X-Proofpoint-ORIG-GUID: 8-B_v6IrvpJQBrVJ45-z8qQj7g_NUdGO
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6863bb77 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IQEsc5u+BqvcbVO/417rXg==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=4Qw2WPkzrlztrcxQjFMA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010064
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Jul 2025 10:42:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9287

With a very minimal image recipe that just pulls in docker, the daemon
won't start due to missing modules, so add the missing ones.

The list of new modules was created by diffing the output of `lsmod`
before installing all kernel-modules and after launching docker with
all modules installed.

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---
 recipes-containers/docker/docker.inc | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 05a14f97..31d3a2de 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -14,7 +14,17 @@ RDEPENDS:${PN} = "util-linux util-linux-unshare iptables \
                  "
 RDEPENDS:${PN} += "virtual-containerd ${VIRTUAL-RUNTIME_container_runtime}"
 
-RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat kernel-module-nf-conntrack-netlink kernel-module-xt-addrtype kernel-module-xt-masquerade"
+RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool \
+                     kernel-module-nf-conntrack \
+                     kernel-module-nf-conntrack-netlink \
+                     kernel-module-nf-nat \
+                     kernel-module-nfnetlink \
+                     kernel-module-overlay \
+                     kernel-module-x-tables \
+                     kernel-module-xt-addrtype \
+                     kernel-module-xt-conntrack \
+                     kernel-module-xt-masquerade \
+                    "
 
 PROVIDES += "virtual/docker"
 
-- 
2.48.1


