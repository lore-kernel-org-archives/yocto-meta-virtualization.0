Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FE2CEFCFC
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:34:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98587.1767728075184763237
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 11:34:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nzvY/cTD;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bPRdbRnd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606EfoKT322965
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 6 Jan 2026 19:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FC5s7T+h5VZxGsInB0DZ0g17
	mGUHqtrAAjsVYVcz9tI=; b=nzvY/cTD9ZavjMKVvlbaqQgT4txdfFB6h9nKozdP
	ZvrrNyUVPV9D88gkHoIGBxiIWNolnfMnuLxQOxho1d1L2rut7IhETC++sAa0+XGk
	qNUZhZOEkBx0ZvC1y1Ua1f61Cax6wl7lo8SoyXc93RNiQW+xfvNaCvV2RJ8dJfAg
	8kne07QKbTuR3Pvbr1LP7+KgESwDpT/FHOKii8hWRklLk4/mBs3slkoiLTQmWmXs
	L3abQTPPX2ZDPrmZ9w9UGSnG8aEbUu/AKfcFtwgGO2SkzGN/VM6bhLrkqEUxzTZL
	4wCRZtMIgYjnzvu/LnBvKjIPHVuU0CwP9B8n9vIf65t9ew==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh4crgwmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 19:34:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c3dfa080662so67928a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 11:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767728074; x=1768332874; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FC5s7T+h5VZxGsInB0DZ0g17mGUHqtrAAjsVYVcz9tI=;
        b=bPRdbRndL0A4bpXQ2Igjo6VRm6n8mH5Fl9nIDSYYGqJxS2NnMvYxCF8QkQzSJo94Lx
         HCkg60wENEvoY3ofnYiTa8+FVpVK3pAFBXzojgKeZb0jufeaAEoWdSdK8mNcCvd91dfm
         XvtHqBoqk1I4kl9CWRRDfedFLteyocbHwfp3jLe0Dg0zgcy+GJYb82YOwn/0Tqanc+p4
         wF3mdo6XJWbDvqSYoMUHz+4WY+8lNDDQ7sUlpB1wmyVV52s3QOzBKbzg99SybgRb1xEo
         ZomJQrbMmXAbQbQZBE4Al+gN8gx37lfZVePQoM3DQud0jmKysmI+kj96DN9aBQAMklbU
         C4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728074; x=1768332874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FC5s7T+h5VZxGsInB0DZ0g17mGUHqtrAAjsVYVcz9tI=;
        b=ZT9fQgCVXMJlQ0/LnLnEuwQya5K1v0fyXP0/80uILYTa09zparBjay6b0OH6isrkI0
         Q10642kW4Tv3GcPqf5JYxl1jByFTC9bCTbndNbRzx1/72QBRPQIhgj4yuaL05pd2bYQ4
         rB6XszPglTUrNyzDCfgegaABuKIqORpsogT38XCwzfxfueB9vb4SFY+HXKQMtMGT2oxg
         NwPqxNU5WVqdimhoHYfn5ZdsASTkyBJDJUV0LJwR5yguDZ4UxFvgMVODRYJPp/4DPxCg
         R/d3IEj5BJEMs2hYJGYcP8ScZZqZASAGB2wlDvGsCFcDzAolnh3qDZSk/Uva+ORJk/Ba
         13jA==
X-Gm-Message-State: AOJu0Yy5OjmJMArqPiDno9n+CR5kznYidT0vuOH4pD9ybmQLIppepRuE
	8kKsS+9D5HWbY31h57CF6cjez9bBqouHP0/9S2oPMK3QD91P9Oyqap8enQga/dTHA6afS5q7vl7
	uaHJe2+T5s04FlDf9aEns7YCv+A4pVq5NxKfCo7jdUdUv7YfREUOXyhsdmldydKVoE1W+Hq64XA
	9qgll+2EGrrW1MVbuQy79nCZnB2XlnuAybVLsAypAKUwcMqliwHNQXijiQo3d1
X-Gm-Gg: AY/fxX4sK9Hn8BYotSU3yOWApwl3J+smWQR/m9tVLEeTHFRth3vvu32FyhTcu3rxyCN
	81zCpKPQj+LBaPAgpgBVusa1//6vJd1Wwbc3jqWTxpY3rCohTPGkSAmGUz/woyRsrO4BbqvxVvG
	0akVzsS8Coj5uunjTNdRQTGPpI20gYraomikzBLhvph1JZo8bHYTlaSZDBeeQCsA==
X-Received: by 2002:a17:90b:2e8f:b0:343:3898:e7c7 with SMTP id 98e67ed59e1d1-34f68c010d0mr202593a91.12.1767728073923;
        Tue, 06 Jan 2026 11:34:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQgx4ikoifqPqvvi5cuTgSb06t60p/c4a55x27lFRDiC4U55xf/liZvw07/QeX1ko7/pgh+q44qCWB5Bxz1dU=
X-Received: by 2002:a17:90b:2e8f:b0:343:3898:e7c7 with SMTP id
 98e67ed59e1d1-34f68c010d0mr202577a91.12.1767728073287; Tue, 06 Jan 2026
 11:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20260106155158.3714544-1-dmitry.baryshkov@oss.qualcomm.com> <aV1f+h059rYKChfi@gmail.com>
In-Reply-To: <aV1f+h059rYKChfi@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 21:34:22 +0200
X-Gm-Features: AQt7F2qgyJ6dHtE5_LGlXvM8F1_1LCoEI1AZ7-xDQ3Jhwc2pYmGUmc_ZG2ZLSKw
Message-ID: <CAO9ioeUC4OJ0o9hfMLG6qL0nb_yrVq12NmF1RxMXV=KfaSm4yw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] nerdctl: add textrel to the list
 of skipped QA checks
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=V9FwEOni c=1 sm=1 tr=0 ts=695d63ca cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8
 a=930T33EcQvC1Y93n0UYA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: VsRIX9ju8qVpNbyv6aaBsC2njomwwtYs
X-Proofpoint-GUID: VsRIX9ju8qVpNbyv6aaBsC2njomwwtYs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2OSBTYWx0ZWRfXy5lVFeqCQSkI
 KOOUiYmOIGC4mNdFfjHrt3K8DtiP6PYL2xOnex6AFIcbqBOJIP5PvW5yXHgwbOfUqFyRuKeE5nN
 SMpFn51eXM2VKPkPOcIEnBHYoLlbgHvRh6dMgkc86UtvfcVlP8RqbLYunz0Cn+9Q/+lgO8Al9w1
 WJAwNNg/5uQAcZ/Rg1ISCTLo0UWdc04VPfIO46XqSGZOPOk91ytGuQGrLAr1CC5Y73Vh6INK+Qn
 QYkE7w8IKso2nPXNSK8l5+oLx9zzSMS8KXHVbsQUBCeOqLsubkl+iBlubpqCprDasA2y3oRbkTj
 XmYqnS5SJJ+fZdksg7+hKL2geTM9bHCFGPLv5I6l75Vla5D7ju2C7HjRFYA1voLO+9ELrtuMWrc
 3BTr2Ka4dcnckcbt/LFv+7nOXI1Vql8C9XnKvsrI4Hj87CkprQqkG/4y9c1jlKKksjBAjTNR3Aw
 L/IKElkpDvH1wrD13Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060169
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 19:34:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9525

On Tue, 6 Jan 2026 at 21:18, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> I might have a try at fixing the relocation issues.
>
> What is the machine you are building for that shows the
> issues ?

it's qcom-armv7a, which has:

DEFAULTTUNE = "cortexa15thf-neon-vfpv4"
require conf/machine/include/arm/armv7a/tune-cortexa15.inc


-- 
With best wishes
Dmitry

