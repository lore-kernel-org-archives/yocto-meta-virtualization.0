Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AC0109192C
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 22:42:15 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.818.1773960125513874640
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 15:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Hq9yINf5;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=b6evsZgQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JH8KPb338782
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Mar 2026 22:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jqJBs6MGak3YfB7xjFOwRVXXJazCgXJxnoLFNp8G44I=; b=Hq9yINf54bxW/oi3
	sNrhuwwQKz7KLOL5dZb1J7lKsL2OwNo4cB8Aq/oxVkPLbUPhu7UPFa5IDZM7sDga
	PQe7dnSJ2Nw4yiVaulHUgK9fMoDRGx4ja7Tmxp8gmQVzkfKlB9kw8kMjsQuIL7zx
	OdR3IiZEhFt0YsQ8eK1tkRyjvfjg8fTSpB9DGLAzd/v2hBxDpPuoxvwZdoBndj3a
	IvrGICPH9VK0c0FGTggmUpj0p5JKF54+k5es1jdXSbl4AlmUgsOmM7RGCKnCggB/
	IXsnS+40QMdBI3WMqnQqgQYdiZBcgImSexnu+oPGvb5dVFKsswxvzBQVgCIMD4CU
	dwqysA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0jt91hys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Mar 2026 22:42:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c50acdd4eso58038456d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Mar 2026 15:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773960124; cv=none;
        d=google.com; s=arc-20240605;
        b=DSmVfv0Ag+oipk0CO6apFnIuNU+ePQOV3KaNGEEUqhuVfKx6N8xYAltjmZJn43Ado5
         o5lXK16kSMOl9WpPMuM/3mkak8bCuQf00Wj2i6KGD2zlhWmN+iB6gbgXIYSHz2mWWX+k
         xWdZJhoyEZk9bHJ30f5pXJK+1kxDaGxxwwhlePQQZsP9GVYQ01TbnBifSkWzob8QP8iv
         /t0C7kpYWstU4mjsl+5a12Pf40rF4+UVUuxsvykHApbcCzfVMKwmjnETEwl/GjdsMYba
         nm7J/3E36q34bk6ryESL6O8uodbQ16AcfmNh84aTK6siYaJhLy+prO4hLjT6h9fIVSwB
         4FSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jqJBs6MGak3YfB7xjFOwRVXXJazCgXJxnoLFNp8G44I=;
        fh=w9fi3JcCIjSGfAkUA7megzrgSDOwFtPt9yxDU9/wNU0=;
        b=I512Gp3l5hXA4fC/hb1YqgyXrqbh6754kTrDrp2p+ymxxhFTmiy+1Zw5ZHpbG9QepC
         b/eMvfLKqr9UA2y/F+s4vuds2qFYHsTNbFLVOd6V49mtfwlKT84rPB7AsKQu+ksaEI/R
         sSRMv5KvajbFiV/D3gcxlQObZO5G8upYgfVfSXUTnn67SmR0hemAcjFYz+Bh0e1gtKIi
         KPA1ULjSYGJTUtMgtjUw6uA4vf4RwEFY/5dfgci2srplIfngKbRxZVCSh3nn1YqRoGoV
         CdypNsW1ZgRF5JPc5JqXUE+WZwtfjYSjbvkb84o2h5jCB92wRfEdV5GenWeBjMvbG0uN
         /qzA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773960124; x=1774564924; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqJBs6MGak3YfB7xjFOwRVXXJazCgXJxnoLFNp8G44I=;
        b=b6evsZgQ3BdkXY+DaeUFhLCuramry3RqFZ7K7WiwO7FQ4vpMrgHHcDAl7yQMeknNNJ
         NZLRwL87rZfAChmXfUyKfTqXPXxoLToV6CsS4P5UzKTs3XFygmePREwzOyTp7TTlXX/I
         3MIJOmMy0MP1yC8aqIkOtuXw5hOSKe6Pcc4Ep8StUSDWPDAVXWrYkDPuNurUTV+0ETbF
         rIlyjMUfatKHro8gzhfLBS69tkEBRXeCQgnrIEclimBbcXChY3LG40jDGpMiHZgLtyPs
         NRk4BB4OEvFBJod4JzHvPWi+CNZ0hJDPa2oUwC9DunZSnE9qo8o7YqLQ2fe/veK3XMot
         eBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773960124; x=1774564924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jqJBs6MGak3YfB7xjFOwRVXXJazCgXJxnoLFNp8G44I=;
        b=lAhtH0UNmFpWwPp0AQ7IUycmccSCy98n7VVLEtA9JF1oMoLLDIZT6hxMUOVBkp/XKw
         WgE2jYcxBcE6K7VJej8btdJnHOVRTyHGY/RJk5yHACcuUCtanfTJzHKDPDS3oUkkEsaG
         1ou2SIPGl3FO+dbgZ6VVba2ZN3HXZqLvg3C30YgZp16IXuCydJP7gP6HQjzTxZK8Mw1j
         mGAf5EZDz+j1jV3PnF6rzzjOWkp/TU+AuOu258qLE3Hkdsx+FGjngEX/pNB4o2+wjjk7
         LGKy9tVN09BsxVemqUcNZmdB5Yckq3CCDdp/C+L03SD/mzYiHSRclMX6gbmMaLrRpREx
         mbeA==
X-Gm-Message-State: AOJu0Yxqq0onb6S4Zgr3YhycZWsNccHcD9ythPgmfNd3CoXC8IoDmGkH
	oh8YQhHf5KN8siBCNvuSmcd8b3Pv8Soqic/meYOwWc+trMb4ogPPK6OgQomgtFdJUlFsd2FGojQ
	feA3xT2v0egTgFpofjIuM8Z9fXuibqM85NL+18gZi1zH5D/5Ufp7dhPhrdbjYvDfzyM5ohhBi05
	LV9I8nJ20YDxV3hfOZ/JsJbosFpBxlddFqMFeVrN15d2/VHfTwCXsRSfywf93c
X-Gm-Gg: ATEYQzzHbEfgeYoUQhd4uAqbgcYkluY5JfjL8evy/zPGuaVO/PD2C18rocSAJ2v1S3s
	AtsxgV79GS4cw3wl04u2jANYnoaONArdHRGZ7DEzyZ+aXds6we6F65PMIVrBcE4XghAYy+YRKM0
	G7RPADMI+7XZ3OsGwRdrQj0dOmJ1b1XZ/gra3VVwk33PujQ6e3H7ryzg5uilEB8y/UZpVZ1lDJV
	Fm/
X-Received: by 2002:a05:6214:212a:b0:897:190:c26c with SMTP id 6a1803df08f44-89c85a57bc1mr15311666d6.31.1773960123893;
        Thu, 19 Mar 2026 15:42:03 -0700 (PDT)
X-Received: by 2002:a05:6214:212a:b0:897:190:c26c with SMTP id
 6a1803df08f44-89c85a57bc1mr15311326d6.31.1773960123398; Thu, 19 Mar 2026
 15:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260319151552.313063-1-f_l_k@t-online.de>
In-Reply-To: <20260319151552.313063-1-f_l_k@t-online.de>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 06:41:53 +0800
X-Gm-Features: AaiRm50iFQTpe1Uy2uWMN-H-uIuJuGK2TYCR4bF6J8XXMgjmwniUS6plM_HFJJw
Message-ID: <CA+s=J=y_yVE3OtjYVn6cF7V4TgO6AhAHfjjfG5LsHTP_aLoONg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: disable netcf backend by default
To: f_l_k@t-online.de
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: SrMho2oIWglvfVnLyEF1NXecibI7jg6E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE4MyBTYWx0ZWRfX7nREe+wCo4zS
 pUP9WtBv7kqdFrZBfQUvx0eVuicCENomd/uEL6WuRzNH5rLZe9I3NGYpoF85PfbpZHiuazXBuqf
 iGaidWvOmcs5jljlJ+R2JWB6ILFfalkIPlDsor60iEjIsJL3nKOFh09CVo22rlzaKqzq/80ccGp
 Mg24bOs8c73ZL1bkYKai0v0IeekF0rj9xFUxaIEDTu+Lmxh9Xv3ZfkHrrlpM50SJaYoM/3XCpci
 +5uq4RCFaGkt5bfofSSg9+jocPld9aG59Vwzmnu83Ek+UA1OarlfcOdzVuPLYG6cfqVC3FhhCSI
 6xJwi5IRgZmlAhtRB1dQsLmlS6U9DO+XUVEnQRZiOFfY9YvtNpegaeC7vYiXpML0MG1OS1jEj+a
 JIphxn61PFkx+Leig8SyNU74wgM9h4LS3J2z6iMI8zhgcwSUJRc218EVT5cfZwKdRgFtQ+XXn0X
 UyZUjo/TeF6+NQlBrLA==
X-Proofpoint-ORIG-GUID: SrMho2oIWglvfVnLyEF1NXecibI7jg6E
X-Authority-Analysis: v=2.4 cv=FKMWBuos c=1 sm=1 tr=0 ts=69bc7bbc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=SqMvC5kiAAAA:8 a=iGHA9ds3AAAA:8
 a=3HkgA0HffsBNGSlIhNUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=_o8VnCo6Hb5Oqlm6Mk7M:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190183
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Mar 2026 22:42:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9669

On Thu, Mar 19, 2026 at 11:16=E2=80=AFPM Markus Volk via
lists.yoctoproject.org <f_l_k=3Dt-online.de@lists.yoctoproject.org>
wrote:
>
> I see a failure in netcf:
> | ./bootstrap: .gnulib/gnulib-tool  --import --no-changelog --aux-dir bui=
ld-aux --doc-base doc --lib libgnu --m4-base gnulib/m4/ --source-base gnuli=
b/lib/ --tests-base gnulib/tests --local-dir gl  --lgpl=3D2 --with-tests --=
makefile-name=3Dgnulib.mk --libtool --import ...
> | python3: can't open file '/home/flk/bitbake-builds/poky/build/tmp/work/=
corei7-64-oe-linux/netcf/0.2.8+git/sources/netcf-0.2.8+git/.gnulib/.gnulib-=
tool.py': [Errno 2] No such file or directory
> | ./bootstrap: gnulib-tool failed
>
> Since the code hasn't been updated in over seven years, and after reading=
 this discussion, perhaps the best solution would be to disable netcf suppo=
rt by default?
>
> https://lists.libvirt.org/archives/list/devel@lists.libvirt.org/message/7=
55CCFUFUW6OTN7CAHB77H7YXQNE5WGG/

Thank you, I was going to propose this as well along with netcf
removal from meta-networking. Debian and Fedora have it disabled as
well and removed netcf.

Thanks,

Anuj

