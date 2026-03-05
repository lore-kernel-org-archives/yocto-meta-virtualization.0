Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7434BEB7ED8
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 04:30:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37179.1772685017347058112
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 20:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=afFtAOCe;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=NI75YvwJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BkgO628689
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 5 Mar 2026 04:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fhyRUesfNVm1CZ1Ow8ncFVZ7xYTaq3xhszw
	9XNNg5iE=; b=afFtAOCeoJ50idFPQ1RD1LqCVs6Twj9Rdgm077s27H1HnNUkRcY
	FUYm/RzIWeohP5a2SYamm3LH746jPdkuewdPOnFjCzAlxEBEJQbWsOSkynOE2LOB
	AA9QBh5c5bf/VI6Lqxqs4CGj9gyCpnkOkza0RSp5kscFzySQzSHUwNCR0rPqyHm2
	zk+h3h0CjoFew8oXrYGfdhQ7YDt4lxGu/+4UjW7d7sikMXt7MODstUPKdavGOV/J
	2f/jvjCURfuD3Xq0cyykebHeyQQ4VoAqNNFf85NeiiYe1CLZyyAOCAAFdXbh7Vqb
	h7SFsxkroB/7tLh99Bc3jZZImpoSkyj7cGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m1r5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Mar 2026 04:30:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so6644697885a.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Mar 2026 20:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772685015; x=1773289815; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fhyRUesfNVm1CZ1Ow8ncFVZ7xYTaq3xhszw9XNNg5iE=;
        b=NI75YvwJ/BTEgVG24R9P4+Tp6DC7CcccCBNqHRCOLSou0z0Eg+lMiV+jgfSjWGke65
         dyvrPXGphcSzjR+4bVFIjTBZW4uAZ3Lswz64h7ttpQYVHSrg266IlVUl1lAla+NsprWu
         abTlj5S5Z0jl1jKbjIdt9ORSXjUcim7P6gku70XFhEKm+GyVMYqpype64oEAGhxefLT7
         4vGZ3LkYFJwaYy8p5t1WD8i2201QdMdiXbW9Z20hzYoJXCai2haqnF7+PJA/XabvpwGt
         6Xra3UPN3i0Kxv7ow8gbDgsAE4DiVvzTNW6B4MQgRgrwS9V9uNlL6BqjfhZDe4Ga+ynS
         cNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772685015; x=1773289815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhyRUesfNVm1CZ1Ow8ncFVZ7xYTaq3xhszw9XNNg5iE=;
        b=HDkmAEEdggAHLrr2r9EIc90Wv+LmortAaT8k4GAd21U549ZVGO8bCMHQnMDmgFZxY8
         c3YCfI9krKvruWk5lizydAPjCyQnjugzDsLTN5Jit58Fvx/BAXMg482TrHV4ObBrKFTU
         UiH+zrMKhBccPsFoxWS4x9bsGVuKeJ44/37ih4UpqYwmIpcwW+jQ/dQrixpoqlltcRlM
         3+RKB7Pyx+p967+XBB8IVg0jEeb79hV5JF7A1f4Ex94YlrGJcw09eMnuKaSbyT+7+E+n
         6p7/koY3PJ8w1fZp+9ylqbnRXin80N8JAk8Ocw1X87gEGzXYjALDEPZC4xF5FiM34HZY
         c4cw==
X-Gm-Message-State: AOJu0YwKhp30NizZ6DTQRWHo91ByIq2AJVav3QsL4J9chj8sAgruZN+3
	zs6Abq3nT7/of0MG3BJk67xfn6duxHJy6T9/2dIqqF87EoccrFMJFXAmW0r1qINT54oie55sZAa
	n/UjjQYVoROYIMJwA1cq2/UsBiI6r15U4Qnnbe7LfT0XUhFonEvR3x/a8NTRiguWXqV1KDgRH3e
	UVeyNDb99MlWcD2VYAHQ==
X-Gm-Gg: ATEYQzwe9Np5VU9LgFJ2Jo4qMiFwUnba7ET+vFekGDuEJj8CWxvcqBxhfCKhM5yc4/g
	v0nGdRPms04+dbpsA6PCPIFRh3/FIVFBEe0/zDU6SnhXkHubfVVqJLdfempDRgWqha+AyC5fc9l
	RDUqPP+wgRtKwRCa3y1DMokKayegv7IyeCuo8Fo9ai/dsCoOY7XH83lzl/Dig5VD1QXQO68I2Lc
	DsF0KAmlC7nomnhi1fVFVIQnjSrb+UITpJaZBJH+L3BFzI8hx8TDATB9fRyeaMCJHEVbtDIgPCI
	AnHHyST+9yj+DZlpLFWdp246p2fLCDWXJQoQUemk/0JPKSBMApErPQ2Kp1HjeSULZH4qN2bjWb/
	LlYkxnyDqhrYrXIRgo2RcIuo9lNPa4fH2LH7Qk0vAIaq45LxwFBNJz7Orksj4C8eFy4VCu/ewnF
	0+rBhI/bjU5FI8VIz3f5g6C20mm73LWS61
X-Received: by 2002:a05:620a:4891:b0:8ca:41af:32cb with SMTP id af79cd13be357-8cd5afd3b56mr534194085a.77.1772685015414;
        Wed, 04 Mar 2026 20:30:15 -0800 (PST)
X-Received: by 2002:a05:620a:4891:b0:8ca:41af:32cb with SMTP id af79cd13be357-8cd5afd3b56mr534191585a.77.1772685014831;
        Wed, 04 Mar 2026 20:30:14 -0800 (PST)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a31e77273sm3763481fa.28.2026.03.04.20.30.12
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 20:30:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] xen-guest-bundle: require "xen" DISTRO_FEATURE
Date: Thu,  5 Mar 2026 06:30:12 +0200
Message-ID: <20260305043012.1186651-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a906d8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=CE-IEbv0z7dK-woqCOoA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ZlOiMWrduBmKiBGsmbIPnodgcv8w_Y7A
X-Proofpoint-GUID: ZlOiMWrduBmKiBGsmbIPnodgcv8w_Y7A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzMSBTYWx0ZWRfX4nQvC2dcGXTB
 cvbvt2O1gJK6tJ3ikXJEcQvmazcuARiae/ZKxOPTGKfPUPyBzFSt9OPp85+aalLp7QnWiuWKLHz
 Jej/iUGK/t3i3AYI6pBlTpCOjGYxJvd5a136YD1B6qiSLTckm2pCAd9rAqw/oRFnOo01eGigh3e
 hKiUUJ7ygsc2575URJbLYJFVpZYt6FWqPIkL/fECbPyloc9yiEPzbEk1SIUYI7slU8DxBr4PxLb
 yq996gppz/3uw7HdPzCZvFLrxFlwmXBw7lav8o9XJPcrWTGz8B8bDkTF9luCU/1n9lYIfHoAUtM
 wOOI1mtsbOcGdXWu4B0at1FTd2Zfiv4/gvRy2EZwkNv0uYyHfxuIi9924Qy1eHqnI/UBJdkUNzm
 dTl/+28ZNWL1HLkluDa7wUd/efoAJz75FamYQDy/eGB+bKXv+RTIIesXh6m0kfaW/ksd3au/PJC
 Y3aWXsu/GX/Abad8tbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050031
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Mar 2026 04:30:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9618

Building guest bundles makes sense only if "xen" feature is enabled in
DISTRO_FEATURES. Skip all Xen guest bundle recipes if it is not a part
of the DISTRO_FEATURES.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 classes/xen-guest-bundle.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/classes/xen-guest-bundle.bbclass b/classes/xen-guest-bundle.bbclass
index 3fe7754e61bb..da131c373de4 100644
--- a/classes/xen-guest-bundle.bbclass
+++ b/classes/xen-guest-bundle.bbclass
@@ -269,6 +269,9 @@ python __anonymous() {
         d.appendVarFlag('do_compile', 'depends', ' virtual/kernel:do_deploy')
 }
 
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "xen"
+
 S = "${UNPACKDIR}/sources"
 B = "${WORKDIR}/build"
 
-- 
2.47.3


