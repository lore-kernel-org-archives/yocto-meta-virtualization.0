Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382EBCE9D6E
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:52:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92889.1767714722447426384
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 07:52:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=BA6PYBRs;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JHarkSAY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606FKZoo184807
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 6 Jan 2026 15:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3Ptx9Uz0HISconKOiLyLyyuBW/hv2OkbNBM
	Xbftdk/U=; b=BA6PYBRsrOINfCmBb6rQIaD6NuXJ4QFI/pxm7iXW/ONFTns6fZN
	KMW8dzAbPfrqYPRtrPRYlzVamLG8lkWVsxS8fjxrOrQjd1h/eQBxlkc4m6yDvdy0
	/fvqpz3Xv4+yPxDbKCivTbdB5zhdTEn1JqPDMtyO5Up5TOrO/8mfCXC17mpFCw73
	1vvjVh200SnZupLUtuCBeUi9fMuQ/TIWc94VzLXEwmjkvXRC7SU0NIlfcqbhMPYL
	hk0R+DwhP5UqoUZViNBcc7kywGDpybdlbSRlh96as+wgBnlsdtWwb6VMNMCtMDPl
	VOwn+dYaRtNAcXZGTx0umZ9HEF0iq1ksPwQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh4y0g2x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 15:52:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaf9e48ecso32347121cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 07:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767714721; x=1768319521; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ptx9Uz0HISconKOiLyLyyuBW/hv2OkbNBMXbftdk/U=;
        b=JHarkSAYJBSFjKzwG2wjVG/rU0KNDbfku07clcml2oLkSBJV9DZNJNHQ6KWYQJJWk1
         RbAqx4wD03IgJCtOgVJUF+p1tevZxPCRW29EpWZwiTrMPubBtbRM8+IyFCOEGxm9h7Lu
         /sayf61FRVSnbl+VFqr6+xFPhVtAav05jwS826hq9VIzocBhaUSeUB8msIy5IltSlY3z
         ZKJINxSFUtCdtazIQtohSPuqmjabh7qVHpeTzHNNAViBTjOehgPqwM2xWgTZKw1PtU7l
         JnKZD87sQ2zSS2U9zyfT4gIWimS7nqk315fW+AwsePTGv5p+2Q9QST1QaRPecVG558v9
         fwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714721; x=1768319521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ptx9Uz0HISconKOiLyLyyuBW/hv2OkbNBMXbftdk/U=;
        b=u03whI7dsOf081HrGmo1cGBfh2+rjJG/SdXs8E32YyN0lMmpM/mRrnieYTjsmy/3cL
         zK9cGHmFGUw7uiBU2hGc++VzIailjPWHWWsbpNOYlqgsLEFxWruoT0Svn2DVfi2lZZU9
         vjg6CfLDkKXe80L1FN3FLwotT7fUNJsJzUckB3ty0sUxwhL4OsPQO2cN8e6mt3QONRz3
         7heb6gMez/yKvKwcfWsRJg46K5O3G1Mz4SAhZPYJZ8ThQ9jp2XuLUf0XvAttT80rFx+k
         ZZb7PwLNO3sn1CtoZPUWM0eq+F8M20YEHEch6qV5yxtcKD4H++CMIHerxoAvodf4t/ir
         4M5w==
X-Gm-Message-State: AOJu0Yy8cZ0BIXGquDmH4m9xKwA1BcNhJXmKjUzcZjE+vEGX0LJC6GtH
	DdwTMmp3hS352IaLhZ3Z9WsdWRWeTfqhelst1a9Z0nTYxNcpCBSKP80MyFEDx3Lro1jekR9EFz2
	Z2H+6eSxPWAekUQecxFAw5WzCMonuGPuAv6VrU+fs3tzLdfarzZv3uLOJ169d+c/yv0bjmv7H7O
	ffzSkJU5itn8FCFtPpBw==
X-Gm-Gg: AY/fxX6NFIWpocbHZdTzUctV0JQeWk+I+fhdv0S0Ppl2bPvQN+/7tsCxeDxd3X7S/wW
	9LO9h/cxmAFP1tL5/PoINK++RdypEdwRVwfmfpf/P0NtOAshhdze2ZqJweaWfndu4pDhv9CHyuT
	nrbHIgmH0H6ExozOSwHNfJEMGDJrbscfVRUSEyqWgkIUpHsk1My4lyQuvhtkeZcs34ghoacComq
	M8LkwEq2/taBMGve0Qp3S3zB6ygFpYjbPPfJNOvR9z4VMqYUFDLwrug8sRwNm8w09nniT40HdhT
	Ox617S0o1EBubpaNma59ixSfr/vt5g5qacoeXYUjjAqfI40TMFC5r67u23ddxJjIsPUwEbcYpsx
	mUHPompjOayvQZbSHtP72+zw+c5aUjt9z0WfjPb6QYY6wSCIkn0EBcdoyT7Wn6/6/vlDWSAuL4d
	w7cQwx0j6TpEIuYhfwa7RIMTE=
X-Received: by 2002:ac8:7d8d:0:b0:4f3:5835:e946 with SMTP id d75a77b69052e-4ffa782df8amr47800921cf.55.1767714720687;
        Tue, 06 Jan 2026 07:52:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZTE/MafxGyxh+S67PqzepBIoe2zdoL7d1L64GUH6sNmvr8U/fghJbgg7AcK+ASQNHJYvRhA==
X-Received: by 2002:ac8:7d8d:0:b0:4f3:5835:e946 with SMTP id d75a77b69052e-4ffa782df8amr47800611cf.55.1767714720269;
        Tue, 06 Jan 2026 07:52:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea253sm651106e87.7.2026.01.06.07.51.59
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:51:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH v2] nerdctl: add textrel to the list of skipped QA checks
Date: Tue,  6 Jan 2026 17:51:58 +0200
Message-ID: <20260106155158.3714544-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wHQaZzRSxuZ8y1I_RPquyzurmSLuygLj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEzOCBTYWx0ZWRfX85NSBKtPbmOh
 JIhWvXNoN/2bu/NevJIwYnspuZvlOljd/UHgpqAbQrKZxvnCWZpEAvSqbYBjnk9PgRAbsErBsWX
 TyxQEalUn+ZIMTUTv74F9hxekdYkvUDn4eOJnDT85xx4W8bYb1q2BBpM61rzTemP66qCpblpF8Y
 UbYVm0tD7Xae373OBr4yYccbxrmmuueJ1YNEni3Z8xMV4DP8SVqHiHEOFZ8Ck6SK7XMCRSbRZ73
 5Kobv5MnVOJ8KxYdw03Rj2t7RlD+GkBt93zH/v+Zh2CzRPV5/yJlD8Gn60nAHN/Q+c1v4sLTS9r
 7s0uzLfQJDcYQEhIwS6wzQMQBNCL1rlIt47ysOVQFSfGsk1S8VGQkcQA9BjEDqhJk/nWF3yegdP
 XDkBoB0ersd/14Suzs/1FRjc7Qwq6Lu191v7tMuAo5wOYWP+WjIyY0QUcGzxV6AF7MorZtvHPnL
 kcW17e5oB6NZ+9kcTxw==
X-Authority-Analysis: v=2.4 cv=eqnSD4pX c=1 sm=1 tr=0 ts=695d2fa1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=XHGolbqs-B_IjpySioYA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: wHQaZzRSxuZ8y1I_RPquyzurmSLuygLj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060138
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 15:52:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9520

On ARMv7 building of nerdctl fails with:

ERROR: QA Issue: nerdctl: ELF binary /usr/bin/nerdctl has relocations in .text [textrel]

Add "textrel" to the skip list.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 recipes-containers/nerdctl/nerdctl_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 8f63b48c7256..bfd7c3af8356 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -88,4 +88,5 @@ do_install() {
 
 INHIBIT_PACKAGE_STRIP = "1"
 INSANE_SKIP:${PN} += "ldflags already-stripped"
+INSANE_SKIP:${PN}:append:arm = " textrel"
 
-- 
2.47.3


