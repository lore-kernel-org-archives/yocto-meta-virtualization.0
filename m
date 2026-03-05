Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525A9F33A73
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:27:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45195.1772720815196538023
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 06:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XTC97WiP;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=YAHTkgnI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFnLm936056
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 5 Mar 2026 14:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e9TYkRV5rpLSSKXmI3PGUVywCGMfi5CswQ7g1VRPgUE=; b=XTC97WiPg5XlsXMG
	P452gSQ+fUsfuAltZCL3nueDtLIljyezAPWnryIVoloc7mvvxhuLeZbVQBageoDe
	ePrhXp1w5L76RZ1Lx6w+QmRXvlvUB5aqRKbuLcY6+XMIs/MFRXuS2cyXMsatyTPK
	nupTpHE8TATHjuBXcwci7ls1rfg2ln2KlPDDA5ma4LxoK6Jhu5hrywsfuYaq1Wfe
	F9PvzaKUNme1dNzA+qf58ktLGPuCjwW4AlvBdRY7GnSek+95ho8fhxzxiua5hDad
	BVkKz0IqcXSXuD7/DI4doxlhiwMw6qVNHyVFDGRW7rNgjgy7wDiOgCzCZkoqbKdJ
	GMO0Xw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u2cq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Mar 2026 14:26:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358f058973fso7773466a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Mar 2026 06:26:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772720814; cv=none;
        d=google.com; s=arc-20240605;
        b=R+GLsFoqzmoKdcOdJOFvrCaPAfA909HzzQ/m2DaAtlyPPiP+iR/0C6LRkqzfqO7H7v
         k7SPg4uFxfY+YqxEatJmnoS5lT56l2FEUNl3LauONieArWL3D5dr+Tq7PP/VsLU6Dj8H
         ISdOSoA49dK3HhSOaUis7QmfR3MJiDm2jYLqweWmu+YV6TTsoeem6OL7f+wDvNhv96rF
         bPF2M10+xChQ6lVMM2J91Olcvk3nY74omGdEmQHAzkNRDUYc0qhmQbYgyqnRVO4u8vAp
         RHUc8jcLUPnACNRJxNlzaRXdcUJkDytQYKbNo01iCjlU+U2sYoScVHH699IuU68iFtxp
         u7jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e9TYkRV5rpLSSKXmI3PGUVywCGMfi5CswQ7g1VRPgUE=;
        fh=eCwnOjlv6B8KHYbz1+dR8q8uprCZzyTQ1RaTi1tuuHw=;
        b=F9bwxe4gr6JymGhYHx3xbUtYZQgMLqhNlxdMDc1m7hIZGSomp3yvHmacBY6+2aA2Bz
         Xiei5meCft+S1sYk4VutBDpfuBqbLLfFN+nXDRQHSaFqczdbjyLD13p08bd3zMwg2vj5
         3tAAwk+88QoqRnywUxZcpZCUixa26xDE+92GknQY0j+5XEjzS5lDSH0hG6+2YuiV95PJ
         nyEUOM8R394KC3j+7geUO5p4PSWacz/kcccX/wvrqskyUC7Zjtam3TVMv7YVAjkAZ74h
         /wZdje2H5byD5BDV1Q7dyXVzdQcK826WwW2Da+nI8Kb61Y79bzHPJuR1NoqedMFZVqPn
         7tPw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772720814; x=1773325614; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9TYkRV5rpLSSKXmI3PGUVywCGMfi5CswQ7g1VRPgUE=;
        b=YAHTkgnItR5fF1tx840rqWdTI8G0aKrnCPpZyNYl9oyiNSqCdIYS1mHy9+grDBd4B9
         TtkcWVNb9Pa8v6F/9w6Q0Ad0KXJ1obJi6oJaBkh2mi/0Z9HDBo/pB1JIoZtEZA9sk27V
         /D8fYL1VtgeFenaRUfM0AjuU+t+3RhHY18isG4veSdV5XRXpFVkj7pzaDUqLQ3rF2eeV
         0eZc2PbicryWaT+l9YLomYtUFSSOFB+suZovK6ps8azp2GiavdADVdsnn24itp9L3T6D
         f2PWiQHX/pdH7L9jtJqjqlHh6SEcm7tnEsyEa0Yry+T2Hs0jyo5GdE8aQ+sZKU73k+Oo
         YNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772720814; x=1773325614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e9TYkRV5rpLSSKXmI3PGUVywCGMfi5CswQ7g1VRPgUE=;
        b=KxvENdONVWKrv2ovxqsVgHuWXaZEbvVzL22aKJpYiszsaUwNs9tWkcL+6ql07XkHPs
         T60alymjtZXKfR11SrTo8ul42mEdYRjNKzvAKFtZ5/zjjKVaf1Tgrz5AcKM9D2YFGamf
         dbjqD7ORdTHzaCNuhrWjJXZGR5ltEYGjdQAxRyJv22GzHslECle2tS8S/sETF0lM6woh
         7m73mkvl4ixMkNItjqCoh9cnKLG3XAr9o0NqCZuqsfEZX9lMTTdS57yPT8uCsJl3tXwa
         tmT9f7TnUiFV/2PwywTAjTv/sfjMMAIVHufNk7BkRPcc72fXmeeaWggYP8TKdmEzBrUx
         XXnA==
X-Gm-Message-State: AOJu0Yylybl8P5JZ2WgxTFzB4hpatJCmgEtLl1IBhjw3MAHT4lKlCMsc
	oseblKHWtJmAi5XNarju4beUJMCUb+CWTlH0yOyxZirkWlmcQHnX7XA+dDPbhUCtIB4RI0rpQGI
	++Wg4WPGdYbfr1nY5pUwhDDaC9FL71jxCS8LtDrpVnXCHTGIrBT03NARg0zm4oBRzve5wKTOdai
	Ba2t9BuWReZLNL+eJe61p9/VvuGaW37S5MlYtXbT1AubPTaklueJyKfO1EWQqO
X-Gm-Gg: ATEYQzyvQzAc40++zQ5apZvkiq+ziB2Fogok754CUU/clHv3Vz4ZvFfhCivaiSJdp2A
	M4XvMArd5x3VJ+ims8Sm2GOt/Z83v04iBzjzjdV3OIp5B3I/4Znj33q9jv28+C644n/vCzZEb+Z
	nufDkddHkwyBCqYqenyT18pWzfr+sq2CM4vnN2USU0uDCLx5gD0d8MAq30wRhsmoKk3cCR35w7d
	ozVNM7CQ72+QJmpmH/k
X-Received: by 2002:a17:90b:2e4e:b0:359:8abc:b348 with SMTP id 98e67ed59e1d1-359a6a3d24bmr5601748a91.18.1772720813672;
        Thu, 05 Mar 2026 06:26:53 -0800 (PST)
X-Received: by 2002:a17:90b:2e4e:b0:359:8abc:b348 with SMTP id
 98e67ed59e1d1-359a6a3d24bmr5601729a91.18.1772720813089; Thu, 05 Mar 2026
 06:26:53 -0800 (PST)
MIME-Version: 1.0
References: <20260305043012.1186651-1-dmitry.baryshkov@oss.qualcomm.com> <CADkTA4PUr4idtuhR784CP_GEtUjsaz12rk69JZHCC8zhqSgR_g@mail.gmail.com>
In-Reply-To: <CADkTA4PUr4idtuhR784CP_GEtUjsaz12rk69JZHCC8zhqSgR_g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 16:26:42 +0200
X-Gm-Features: AaiRm509i3XE2rKsyZD_Mc6o501eXuM0HfafEuhvrBSrkoJjNIbo0oBOo8zyuDA
Message-ID: <CAO9ioeW95p_ot-jDUgot=1VcRhLAaYdwg8-jW_hjo+NE3SmO7w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen-guest-bundle: require "xen" DISTRO_FEATURE
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: iwDZVl89DSnlcx6VTaHY51ALL5d3n_nG
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a992ae cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=iGHA9ds3AAAA:8 a=JAO8n7geXZtbu1nPMswA:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: iwDZVl89DSnlcx6VTaHY51ALL5d3n_nG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNSBTYWx0ZWRfX++fqw/ssbBsL
 kyJqEocnIZF2dbLXJ2YGD1YYfKIr2nei9rd738KmmHsyBpc55R6QkCyqfBabpnXe9NnvbplSuYG
 CkFal+W8nBMiwUsNnnjp4HTPyq7Z2hljvlH7k3yrp/fIW1oODNzrVyWM7d8vk9F9vyMVYsbVSR/
 1uWi6vZepM06dNgwvMmG18A42vOLvYb8fKstuu7rH8m61d+3D1xjeOk9dEe9EAh9DaXCDYCxzYL
 b/zLm0UMnJdecFwE58q3dbsw5KwRsM0ytFcGh0x6A5M5MZhFCz8H70eOCDo3gbe7u48lvXg79Hs
 sAoYbPw+wFUOlX2uo4rH/fmgqvyz41am4gRdfbwpQ4MJ7YF4H3Ix9zb4/X50YPAr93F+Gk+sz+r
 g3f69I0w328BEb1eq8NfQyOTGVf3y1PVLUOE7hqL5gp8puQtx9LWoZhBtzsi7EkBpCpNR4GJ04H
 UzqW0DPBGrUsOxOZrDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050115
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Mar 2026 14:27:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9620

On 05/03/2026 06:46, Bruce Ashfield wrote:
>
>
> On Wed, Mar 4, 2026 at 11:30=E2=80=AFPM Dmitry Baryshkov via
> lists.yoctoproject.org <http://lists.yoctoproject.org>
> <dmitry.baryshkov=3Doss.qualcomm.com@lists.yoctoproject.org
> <mailto:oss.qualcomm.com@lists.yoctoproject.org>> wrote:
>
>     Building guest bundles makes sense only if "xen" feature is enabled i=
n
>     DISTRO_FEATURES. Skip all Xen guest bundle recipes if it is not a par=
t
>     of the DISTRO_FEATURES.
>
>
> Sure, but you are just describing what is in the patch.
>
> What problem was this actually causing ?

When building world (or when running yocto-check-layers against a
layer depending on meta-virtualization):

Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'example-xen-guest-bundle', 'xen-guest-image-minimal']



--
With best wishes
Dmitry

