Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72557E92729
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 03:28:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18765.1766892495549096459
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 Dec 2025 19:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dX/lH8Ms;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=itmPbzBQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS1P2gh1398296
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 28 Dec 2025 03:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xenca8/9N0CKsJtNf+aAJiMo1Urg1wFj2xCKNfjeKDs=; b=dX/lH8MslyUgR4Ql
	yutESUEtMzubsOOLOrBLAWHLCI5EjZRgr9mLTFQmVDCRGqVATmaOGmtv9V5V3tJb
	NeT6/z4zf+ujis26K2voe138e53qr6P6joIikZlrRmbh24T+s2RDkVFwdonBE24u
	y4bdy0mToPS3rBPUp83C4ZeAYTJi+TP0OkR4k2QWehOlW6w8ynThnXZv1SPRsBRc
	W/+9AKsdNPRxNtR1v3V98ugFYk9QfuySollUypZ1fvdMCDvVu8i6/N5eBzQ3ylsI
	wBLO3icmFkTIDnh7nWBpXrDG9++EP+Ev6Tsk0lRSEQH/++KRw/dYVIB9I6Na8OdG
	iRC03w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6dr1qf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 28 Dec 2025 03:28:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso8323002a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 27 Dec 2025 19:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766892494; x=1767497294; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xenca8/9N0CKsJtNf+aAJiMo1Urg1wFj2xCKNfjeKDs=;
        b=itmPbzBQtBBlNLXHbDa0afx0Uubl+uGooXfZ4Qja8dCjOJvGLWwVK1r5ul2RtiriM3
         SqPaAjSvvcQxH3UU6o9FdSJ0LNQdYfzTtf5zDXYovjNkEWwJDBzs6dy7VBEVKUNJ8hD/
         B+Knq6F/G3jHKXG7sFvIuHMzB9erI4zYnrvZ1QGBjJUBRMlvm+vfRjjCaHb1M+9PuSyi
         QylXVP+4eiDPiEUmgkCyr9FCIBlU9dMeOdzV8yG4p3FDNCgSNRrFaOa87gVzIWouVjEb
         bVmyF8PVIK5ukl0z5cE1gY54A4EP7kERc9ZAKK9dDUa5fMJ/+GSo3pzLwxF9kAQoKxkv
         25jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766892494; x=1767497294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xenca8/9N0CKsJtNf+aAJiMo1Urg1wFj2xCKNfjeKDs=;
        b=Hi8skVETUe1KozGXcKjgzFTzytR3KCONuKzUnZnC8X0Jww84tCRP0kPk6RXa/R1Eqy
         9L/k6SMK995UZhXqPQWSkHmtN5ZZU4HcUMS7mQ3mmEj8Y+2SZyIayMVmZvkMfPH4pHbR
         NiErNGVFOVNQbuaavIdUPZbgcCPdO+iuVMYPVQy+WJYIsd2PFOOg/4poD6x+vA8uj/Wx
         vN+pjHRdRHfI6DkMt3dO2WJyfULg0JIV2cxnJaVj6oW1Ed+n99LSgvsxsWE/84Z8CtXy
         yZybY8ucafs7smjYsgN2bH8QgwoqrJHq4ryMHXArSvmsj9ztQPgSUX5NOSjoSTPNOPU4
         QzPA==
X-Gm-Message-State: AOJu0YyeKmdC0nNKPkZ9I/eOL3JKS0G/4YrleXGq66VH03P3gkg6DDbQ
	puh/ASyM+SCwCJLoIfDMu2rMhxVNBylXtMWBTyyhHgCQGzFFTiAlzkV2i85lH3K/Rbkgiloqysc
	p0sec1kD/k9agwxvAast6i9CFWhwEgkiNuLYCEi/Qs8wPAiu5p7wcTZLdwUpn93TJolUvz0CBxM
	VZZAO0n9Gmh/s1+/YIBD+pOS4EFK3LJQfAwsY30ZaUC4k65XvRqM+G0IRUcDml
X-Gm-Gg: AY/fxX667zAhQxE7pf3Byta+i3SGqnduCtZR7/KBz/ulh7HE9UC9j5QN+2tSj0s0M8D
	f8X4yP7M1ydUDSmgH3uEBP8gd8KxK0b3IXjcmvELsDw/ZAusGHBs7llhvABHI00S/DxRLCtfMkg
	98Cm18nLCEkwovJ3bI1Zj5cPd4JoJyzbRmqLYU9ANOEXAB9HeplF4K5eWyzHtNMhg=
X-Received: by 2002:a17:90b:4c41:b0:34c:2e8a:ea42 with SMTP id 98e67ed59e1d1-34e90d6a375mr27634705a91.7.1766892494198;
        Sat, 27 Dec 2025 19:28:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy2BLHOgKZP1AQiaTDqr5w9MpmPrW+DRPDMH98l0NrGWlizCcjtJA0Q1Cy55APYBTmkPSAgDJpSnCEzJnX2GA=
X-Received: by 2002:a17:90b:4c41:b0:34c:2e8a:ea42 with SMTP id
 98e67ed59e1d1-34e90d6a375mr27634687a91.7.1766892493577; Sat, 27 Dec 2025
 19:28:13 -0800 (PST)
MIME-Version: 1.0
References: <3pakbkmf474bma2anwabz4e6t674vsqr6lpksnqy3ix6d33i7e@4lrzjpkmt6kw>
 <18853C3B26E55FCF.1706869@lists.yoctoproject.org> <CADkTA4MvRWxn3OhQnEAsJ5W6jneZks=3PE0T=WijYw=EGLoJ5g@mail.gmail.com>
In-Reply-To: <CADkTA4MvRWxn3OhQnEAsJ5W6jneZks=3PE0T=WijYw=EGLoJ5g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 05:28:02 +0200
X-Gm-Features: AQt7F2ozSLOrDSQ666B4hpx-Vx_8JE8u9hlC0hUC7WTNzTkR3dg-Ug8zFr97CmU
Message-ID: <CAO9ioeU1cHLRNhrjxLaOzOPht6_V01Lp1kNtg2BiTNzykGzPww@mail.gmail.com>
Subject: Re: [meta-virtualization] nerdctl fails in rm_work
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzMCBTYWx0ZWRfXxjoisdpJryza
 +RplmFtzJ/7oMoBOrLuBcyFOH0e3A5Y+swV9Jmgrf6NhqCCAbwCYvzWUf+f0uP2SEOGY2yDAw75
 jBgZY03zN0iWOog7l+2X8Q1h3KVMMO7FRIrazNyWmDyrV4YhOIVOiE9wp6KF9lCGkMp45rJzmMk
 7yRDNIM9dE56w4MWmiYhyui0E1Tof3n7TfdCEjOPLAUGcD/JbVn1igJ84HdpgdtmFUq2nr4/EPQ
 4AiScs4u+Bz22qDSFy67NHLa2JWP93+xZfLXcBfsjqpNXYXnBasobCSYa1u53UrbrouXcZg9e21
 DfPOlw6CBqIVUnPNuInIIm7Nl4jfXvWWeo8IgHuXHVRDCOpwz19kqE60Apv/4Eg34lT0g/rZ4pD
 e9e8SYbKeRy8fA+CYOPSUs0nuODflsmabKkzGcHVFHPS4pkxVo5LCLYNeDlgLrd3GCSHV2U/C83
 sMrTCkR0mAC3JBJzajQ==
X-Authority-Analysis: v=2.4 cv=VdP6/Vp9 c=1 sm=1 tr=0 ts=6950a3ce cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8
 a=MbkroF7KOcb-jk90RKkA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: 91Zp-aHGT0Zha5BuCgzH0HTTb4qQfj4t
X-Proofpoint-ORIG-GUID: 91Zp-aHGT0Zha5BuCgzH0HTTb4qQfj4t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280030
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 28 Dec 2025 03:28:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9508

On Sun, 28 Dec 2025 at 03:21, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
>
> On Sat, Dec 27, 2025 at 9:17=E2=80=AFPM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Sat, Dec 27, 2025 at 7:37=E2=80=AFPM Dmitry Baryshkov via
> > lists.yoctoproject.org
> > <dmitry.baryshkov=3Doss.qualcomm.com@lists.yoctoproject.org> wrote:
> > >
> > > Hello,
> > >
> > > Our builds stopped to work because the updated nerdctl recipe fails t=
o
> > > remove the sources in do_rm_work, because all the source files now ha=
ve
> > > 0444 permissions (0555 for the directories). Could you possibly take =
a
> > > look and fix that?
> >
> > I don't run with rm work enabled, but there are functions that deal wit=
h
> > permissions.
> >
> > I'd recommend looking at the classes and what they are doing and why
> > it might not be firing (or finding a non rm-work use case), as
> > I'm still working on release items and won't be switching / using / tes=
ting
> > rm_work any time soon.
>
> I have started a few build cycles on nerdctl here since I'm waiting for
> some long running tests. If I can reproduce an issue (I had many while
> developing the new feature), I'll follow up and throw together a fix.

Thanks!

While we are at it, building for armv7a (tune-cortexa15) fails with:

ERROR: nerdctl-v2.2.0-r0 do_package_qa: QA Issue: nerdctl: ELF binary
/usr/bin/nerdctl has relocations in .text [textrel]


>
> Bruce
>
> >
> > Cheers,
> >
> > Bruce
> >
> > >
> > > --
> > > With best wishes
> > > Dmitry
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#9506): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/9506
> > Mute This Topic: https://lists.yoctoproject.org/mt/116966533/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
With best wishes
Dmitry

