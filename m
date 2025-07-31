Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A63C87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 14:42:01 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.63897.1753972912933411263
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 07:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KWEJmPcH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VDf2kT018831
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 14:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuYhpINsjlYIz9zYKJyUrBNxmyS1l+S6wFb9hcXYU4I=; b=KWEJmPcH/5nkxlps
	W8tzCUt1DFQY7B+tHuI5i1IftJL/Hs2hPc+uqOJjEIBqW3WfN8Ee0IAkyqGb9Y0e
	h1IrKzWKFTDBNyFOUj+FV/hePPWIgDehSOdgZT1d6KXDZjRrZ27AK8XpllWVxS54
	Bks2W9Y69+EID7q39bYaF4R1R3pB7r1IJRWb3DIG7lPoftwMD8MkOVnklXbSvWm3
	7Cx0dllSYJR8TwnhEbP+bbD9PWvHD2sIVs0QUvVM8T2/MyE2J1cSvWpYNB++TJOt
	5a6Zx5T5pdYXfkMcJMv8p50TtmZ3BcbPTY5041ACmTt78A8nBw5VD164vkq4Mnf6
	DUQ6bw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda81w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 14:41:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-53943d3c9baso75678e0c.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 07:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753972911; x=1754577711;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuYhpINsjlYIz9zYKJyUrBNxmyS1l+S6wFb9hcXYU4I=;
        b=YlAowv1qL9hurAjlprAQDIQLMbzS36RQWDlk5WS+UFqMlBX4cvz4oJU92zHMCplA9b
         JX0lvQe+CEPN/AvId6CMPKJlwFmneXVeAUsTI24RX7Y1h99Pe5m1XHYzOdlvruz/CUzQ
         hXBxeLE2J81BrKHgrG3VMlYEZTP0o3yyYLoxVyMq2iFh+cg7lDL1tHZr5xtIvQNZYzac
         r/DIM3KWaQkeCDBmrqYtNVhDi4k2E4BmMr2/FCDwEuQozF3vnNyq54eTvuiY4TDQSAYO
         1L1qwc9JkpAFHzmQ9+yAanrRH7a+x3AiIcT3fvovyLZnjbEsdPjQ/ER6mvFPlkay9US1
         A9Cg==
X-Gm-Message-State: AOJu0YzCkQ+4hP0SXK0g0U5hbiI5EI6Qan6/+KxAYYd0MX95wASe7M2e
	1Tctrv9rNU9fOFhh/Ic8NGbTL+vMyvfyvXRJmInc7ZB2g8ZzuFCVFZYWGAKbROMQFrilfZYJkQZ
	feoLUVM7ZlkOfRPlzkjz7xc2FKvfDa0t3mDS7fdxpbFWSkIRbDG0pFeneqNvkYujlLL41pkX3qG
	qRhpWPIISZrT/IWYzLWg==
X-Gm-Gg: ASbGncu5CxjLSPndMmytI91cHh9yRM4gG9At3P1YN5eFemKk39qa38M7L+f+QSBUJAr
	zGxT1GMe3ERe74joVmt/4j8X2uxLf7ChaVFoLqH+J3wdCOwthhI+zYWrYUkJsgOdzgYdQuVNdEy
	kPvJh+Kc18k3geMOLLlzbGhwDk+2r8WLLl4ko+IOSktpPNbwS82gg2e+sIVzhNLFeTzXrjbyXp/
	GXqrWOjM3p4fcJMJUHv6VUc682JH/aFsyfemC8gVc2mGNrQ/73aFeh8R/B7eVJimmXEmbALuWu8
	8aCYykD9uDANZO3LoeD97uqbLVYOk6TgPVibMK0KP6hzw0BAXTmG47FyZIZlH4R5XaOpXrF6mQN
	Q9s+XQ2Y/7EFzznZpUn0=
X-Received: by 2002:a05:6122:250f:b0:530:6c3e:4db1 with SMTP id 71dfb90a1353d-5391cf18946mr5203599e0c.6.1753972910675;
        Thu, 31 Jul 2025 07:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxMn4/h/RX/OndloH3wr6FgMfPgQXRJoyEu8lhi5Vea138xykoOGdXDbDJyufaRNN4T5ew/g==
X-Received: by 2002:a05:6122:250f:b0:530:6c3e:4db1 with SMTP id 71dfb90a1353d-5391cf18946mr5203565e0c.6.1753972910092;
        Thu, 31 Jul 2025 07:41:50 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0761f2sm120486266b.11.2025.07.31.07.41.49
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Jul 2025 07:41:49 -0700 (PDT)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [meta-virtualization][PATCH v2] Docker: add more required kernel
 modules as RRECOMMENDS:${PN}
Date: Thu, 31 Jul 2025 16:41:39 +0200
References: <184E5D3D5E8ABBD0.8638@lists.yoctoproject.org>
To: meta-virtualization@lists.yoctoproject.org
In-Reply-To: <184E5D3D5E8ABBD0.8638@lists.yoctoproject.org>
Message-Id: <67D35863-DE1B-4D6D-B3DD-7F877B57856D@oss.qualcomm.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-Proofpoint-ORIG-GUID: T2wRAz5bGmDpX1EK1nMOkgj8URItfvVr
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688b80af cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=IQEsc5u+BqvcbVO/417rXg==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=iGHA9ds3AAAA:8 a=EUspDBNiAAAA:8
 a=prsmG29SPLRdaHDYe18A:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: T2wRAz5bGmDpX1EK1nMOkgj8URItfvVr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDEwMCBTYWx0ZWRfXzCZT48LlwnK7
 PacvN3u2/iZ+XdkoBGc0cmFRFKtcoVp6fcdlE60QSokofPEcyCJdKT3AUDCx9hlP8KODigEF0vn
 tXXRn/k4TIT9DMorxhtX/eqtLzxsnAUEF0yjNrpe3fcJVqQe/7no+9KAO488y3/l31iN18pL5SF
 izXrcrvF3yYZl0bI5LSWHP6FWJTSx+WfG3fcJ2zqEMEFgk21S2YD0vVcqpxelZ1QH1WF/NBPUSn
 DyKA+vnUdd4joG/FnySXyoFVfEt/b+L/SKcu5BuC2cDACQXWmj7CZnxRejde8pGEPtyjn84wjYa
 IxtvOMgREYVZDjw3+ollAep+3IbqquMhkXAIk4QX6WxmFTODo0Ka5S/7l47rczqmidP6eeza4tW
 J20kuUrVhNobxkGpSJSFswbS5ipS2DxUWywWeQFeyPxixKq74VH4AQ/zZlkM8W/mJrkiAvO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_02,2025-07-31_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310100
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Jul 2025 14:42:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9333

Ping

> Op 2 jul 2025, om 09:03 heeft Koen Kooi via lists.yoctoproject.org =
<koen.kooi=3Doss.qualcomm.com@lists.yoctoproject.org> het volgende =
geschreven:
>=20
> With a very minimal image recipe that just pulls in docker, the daemon
> won't start due to missing modules, so add the missing ones.
>=20
> The list of new modules was created by diffing the output of `lsmod`
> before installing all kernel-modules and the output  after launching=20=

> docker with all modules installed.
>=20
> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
> ---
>=20
> Changes since v1:
> * Add kernel-module-veth, the docker daemon starts up just fine
>  with the v1 patch, but launching an actual container fails due
>          to missing veth.ko.
>=20
> recipes-containers/docker/docker.inc | 13 ++++++++++++-
> 1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-containers/docker/docker.inc =
b/recipes-containers/docker/docker.inc
> index 05a14f97..3a9d6865 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -14,7 +14,18 @@ RDEPENDS:${PN} =3D "util-linux util-linux-unshare =
iptables \
>                  "
> RDEPENDS:${PN} +=3D "virtual-containerd =
${VIRTUAL-RUNTIME_container_runtime}"
>=20
> -RRECOMMENDS:${PN} =3D "kernel-module-dm-thin-pool =
kernel-module-nf-nat kernel-module-nf-conntrack-netlink =
kernel-module-xt-addrtype kernel-module-xt-masquerade"
> +RRECOMMENDS:${PN} =3D "kernel-module-dm-thin-pool \
> +                     kernel-module-nf-conntrack \
> +                     kernel-module-nf-conntrack-netlink \
> +                     kernel-module-nf-nat \
> +                     kernel-module-nfnetlink \
> +                     kernel-module-overlay \
> +                     kernel-module-veth \
> +                     kernel-module-x-tables \
> +                     kernel-module-xt-addrtype \
> +                     kernel-module-xt-conntrack \
> +                     kernel-module-xt-masquerade \
> +                    "
>=20
> PROVIDES +=3D "virtual/docker"
>=20
> --=20
> 2.48.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9288): =
https://lists.yoctoproject.org/g/meta-virtualization/message/9288
> Mute This Topic: https://lists.yoctoproject.org/mt/113944045/9418801
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: =
https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[koen.kooi@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


