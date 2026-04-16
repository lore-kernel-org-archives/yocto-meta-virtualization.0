Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9D7F8A161
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 11:29:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11623.1776338987599467318
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 04:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=JTECyzBA;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=N0y0E2BI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GAXutc1245152
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Apr 2026 11:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8YT+OgebFiMdkWkqqxyUPHt8k4rWe5TzNbtEvgkG8fw=; b=JTECyzBAiIXRkneo
	UI8NvH25yHcelKqwKGwaTt6k5NRBMszoaZ1xY9VjkSGpyfUhNLyNAaGfqs3Lwvvn
	xejey1/QlZancONC1kls+N/dahcbyf0EUd0pFRG7A1d73L6PSXtx2A3DMxn3D/lP
	V+0Yv6JDxGVY9kBW2kWs5hzddFJvZsAWZZI7+vM/OQRqo/6odDEoTVGASyY1S6s8
	GLbW3sbT9QkAhWxcwWoOecGAJf5lhZ4SW0K7FaM/3ICCpzLwqMg5PWPoOFzWL0V4
	OqTBP2RTdBDmRI93oDpD329+0AxvHMAA9lT92EzvfFa47/oNjJFx1eddTKtf9xLH
	pGUxtg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djx4k858a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Apr 2026 11:29:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4661881eso33989531cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Apr 2026 04:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776338986; x=1776943786; darn=lists.yoctoproject.org;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YT+OgebFiMdkWkqqxyUPHt8k4rWe5TzNbtEvgkG8fw=;
        b=N0y0E2BIYXTn/7IDBIWlDEYdH+Ix4XEvB4yHrw2tSQkFM8pLNMJWIzf+mc80mZNaX6
         LnZXmQgZiVffZ5OlPDr5C1CD863jcEwUvFBmMZ7d/KxIa/ZE0u0E2KGFLjeSG6UnijPr
         Qiwszadb1as8cV86w6QIUKfVi53m/dEoHxo+6H5pl3kHpqVX6NKeOI5TtCJs/zkwWoKy
         cucfxZ3ji1SvuS2Hs0FBxZzuyN9rYY+7K9Hkdw5V7ZODTe7RIv1tGzTQYtc8bBtdWHFd
         TcsjnYKc266bYYlYa/+yr3u+e1+avk9T1eT/7AfYH72yEikeuIpbJehXmfNrTUc99zHb
         4mvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338986; x=1776943786;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8YT+OgebFiMdkWkqqxyUPHt8k4rWe5TzNbtEvgkG8fw=;
        b=cZPlB51t1/SkhVCEQGvb8o9Jd88NTGgrzgf4woZSx4pCEEBUVd9zehIZun6pS8W/qd
         Bois/EpljJxG1mxq9ijursKtMWLD7h14Jjq8fugYGYH1EPOxgRP7wPUUv/g4h9MHMwx5
         eUEpgtRNS2LguITXZ4+HsG8bKsHWyHXoAVtqNpKIBNHwdj0CBOFXCVKT3O9kVMZHQDqR
         AjpPOnso9diTOEDUon4rm8Uk8iLmj2FxlgjCGHS24hbkBjCptGUcbqBoLTO2m9dyNsC/
         KqJ+0iNkLNm9BdtlINh/y3K93Rb33XomPkpYn+6xKwKHwiIz4eF6TnI91aTfvMO4CLth
         Vxkw==
X-Gm-Message-State: AOJu0YwvypVW9yWW0SX3LGxcCZy98Qfno8JYY9hGKuuA7VYP23c9wa3T
	26vUF2rst2Fq1g9Vi43xGSIafbUHuOo4k5X20wk5I6OtkuFrNEMKAw/AU8vyRqD7RONV4nXm+yw
	pzvEbhXT+eDWc4mwWZBXVrAU+mCdZ2u8d+lXau7ug7MiUupXcKXS/kbu4NKEOT+AChThoEBPfgW
	CzlIHD3jt2v8fADQAnAg==
X-Gm-Gg: AeBDieuG0PvcmSpPsQkeLlImYSau0OY3YvoxNtY2Vm6j5Obx+KrzrbN/OC3tqT27EOX
	jjTbFp9h9sjWCawgW+qGlh/N6ERn+p+cAYnYnpJr/afEnounbMpGmDW8nZgJDZsu4ApVnHeZfiD
	hpS1JCdrFOksTivvo/v8CQEw6FqH5dSDgQghI9x/6yTZ11i01x8NCJ2AIJ0LkBuC+O3XG+tRmEI
	JuOZk7pOYDkDWLWCYDjLBzo8OQm8U4MRLDIdqHxreIVjE0KoN/JTsWReZ4oZT3Lk6wkdOn/HhbQ
	dxWTx62vvVSzqeNXqvse4xAoVjjAj/SU22V+TOaSfWNv0nOAiFTspOBHT91ZhjrX2+fcfpzKLYi
	cdL5AXE0B9GD2fbdKFbySX2OPD0dqjIyj0oGau7YJg6S8P8TmYYXBfmWbEFdBLgm/TkYjySc=
X-Received: by 2002:a05:622a:124a:b0:509:1470:d3b2 with SMTP id d75a77b69052e-50dd5c2cab8mr354264771cf.60.1776338985873;
        Thu, 16 Apr 2026 04:29:45 -0700 (PDT)
X-Received: by 2002:a05:622a:124a:b0:509:1470:d3b2 with SMTP id d75a77b69052e-50dd5c2cab8mr354264071cf.60.1776338985253;
        Thu, 16 Apr 2026 04:29:45 -0700 (PDT)
Received: from smtpclient.apple ([2a01:90a0:1ff:d600:c61:6bc6:7546:2c29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c3826sm156300766b.33.2026.04.16.04.29.44
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:29:44 -0700 (PDT)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [meta-virtualization][PATCH] cdi: add container-device-interface
 commandline utility
Date: Thu, 16 Apr 2026 13:29:34 +0200
References: <18A6CC4939671E5E.1570320@lists.yoctoproject.org>
To: meta-virtualization@lists.yoctoproject.org
In-Reply-To: <18A6CC4939671E5E.1570320@lists.yoctoproject.org>
Message-Id: <F0208C5E-847D-45B3-AF28-8E3B4B5781DC@oss.qualcomm.com>
X-Mailer: Apple Mail (2.3864.500.181)
X-Proofpoint-GUID: Z9Bl06zR1o1LPd0lQi4M5c9aRUzhA3ok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEwOCBTYWx0ZWRfXwVxyL6zw39ht
 Bd2293dBbgJ7oZ1iZZzTBEn7roaJhYdVGo2tQZqSoQodjfS7tdIaZqmaEEbzD7zsdb9gIjmKllh
 ZymbJyg1JsbyZczWZQ5Lz1AEKABvthqjxWIy5qjRTMx8UVsRBkHkuNnWFxtDTw2K+RSTRME9gxi
 HhiEdMhVZAAOt64gK9lYJAPM/aF3lE+3Gzg45Upv62vYm52oVmWHMxJGpUqeH+0FLU53XYqNuyq
 NWLFiXnfI/ZKhY6FuhoIe9AIQojh0JNmFPmgTKVC7QS1On2obvG5aekpjCntJOJYT64BR77EFI1
 fgxfEtr+rZNnU/pwpnpY6oOgPnmZ9qJLGGIVC7HCN1e6xMVuUAhi/HOH1LTEsSo+dni7eG7maTS
 v+pD9brdfUro6FW+1254NX6d0iuz1x6W85gz8sfqByC5yikCUG8Ky4VUzim/8nMZBz3ckfVF15o
 4LCh8WVdDL9EdS3yhAg==
X-Authority-Analysis: v=2.4 cv=H47rBeYi c=1 sm=1 tr=0 ts=69e0c82b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=EUspDBNiAAAA:8 a=b8YH3975mJnV1p5wLuMA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: Z9Bl06zR1o1LPd0lQi4M5c9aRUzhA3ok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160108
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Apr 2026 11:29:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9706



> Op 16 apr 2026, om 11:28 heeft Koen Kooi via lists.yoctoproject.org =
<koen.kooi=3Doss.qualcomm.com@lists.yoctoproject.org> het volgende =
geschreven:
>=20
> [...]=20
> diff --git =
a/recipes-containers/cdi/files/0001-makefile-add-GOBUILDFLAGS-to-go-build-=
call.patch =
b/recipes-containers/cdi/files/0001-makefile-add-GOBUILDFLAGS-to-go-build-=
call.patch
> new file mode 100644
> index 00000000..b5222ade
> --- /dev/null
> +++ =
b/recipes-containers/cdi/files/0001-makefile-add-GOBUILDFLAGS-to-go-build-=
call.patch
> @@ -0,0 +1,31 @@
> +=46rom 53853d00a0d24fae8ebb975dea1b342c0b25a2c0 Mon Sep 17 00:00:00 =
2001
> +From: Koen Kooi <koen.kooi@oss.qualcomm.com>
> +Date: Tue, 14 Apr 2026 13:45:45 +0200
> +Subject: [PATCH] makefile: add GOBUILDFLAGS to go build call
> +
> +We may need to specify things like -trimpath, so add $(GOBUILDFLAGS)
> +to allow them to be passed from the recipe to the Makefile.
> +
> +Upstream-Status: Inappropriate [embedded specific]

Replying to myself here, sorry about that. Jose pointed out that the =
above Makefile patch might actually have a chance upstream, so I changed =
it a bit and sent it upstream: =
https://github.com/cncf-tags/container-device-interface/pull/313
If that gets accepted I'll rework the recipe to make use of =
GO_EXTRAFLAGS. For the time being, it has no impact on this patch to =
meta-virtualization.

regards,

Koen=

