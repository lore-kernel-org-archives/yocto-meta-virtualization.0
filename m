Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F727CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 15:25:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.424.1757345123921568188
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 08:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PpDNsbXH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888w81T016206
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 8 Sep 2025 15:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dZ91n9mNlWJjOEgex5iHUdeUohin/OHLBHSU2aYHdeA=; b=PpDNsbXH1gFn2bzP
	vd8xVZQonSMI3iolxHeVzIQ7Gv9LFrGSZ/UnQO4REfvaLJtsRzm3+Mlp+JFNRAAH
	TDWAtXkLbzFkQYMX0BuRQj9S7rlpp4Nqw7RdjYtniwyo/uz7OAe5bSCIGgDGZ6c7
	+UsimCRDVBQw1e95oeqIZ1ZX3aNhhkIqoxNY2hxrtfMTKhMKJrDVewtIOpEg3soe
	XtzRwtwhw+dBWK9H9zHNfHO55Tb9JpExHneGDV6e6G2gfmeT06+PKZOM18qYUO+L
	XkGRf2vZolV5QXzfCSl9DPxUGmuLNxNvPC8Xj3QWZorpLaC9rWFOXqTCgC6pPCCu
	UJoiqw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfvwbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Sep 2025 15:25:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5ee6cd9a3so81935941cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Sep 2025 08:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757345122; x=1757949922;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZ91n9mNlWJjOEgex5iHUdeUohin/OHLBHSU2aYHdeA=;
        b=baSBovBzDnHFQpb6RgwBsXGxgXbs9LodoGwjWIo5A1LnjMblw0Igc3V3xH3pYcHEYP
         3cbd3Z1Z0lmEBXG+I8b8Au2OO100IpK6pL35KDoExHnUmyLn5nuqbY6FuuPKMabkphVu
         gP7KlkjtCXKJrZgjyo8HURXYpsXR4GvnllWizCWU/+SCZ2umkU/VxRMaJFCm+CWsTtQ9
         17fFTpjzIUoZicxKum9FqKFkRlL7WdW8bJxXLFeQH+GSExX46HNw/+2quG0g+rfsgnz+
         mvr3XqtBZLWlSuHGPnzqOtTS3ZsQWG+itOfl75g543aBq93sdgu2Kgfo1VFEWa/pxpFn
         y9sw==
X-Forwarded-Encrypted: i=1; AJvYcCVxGgw19vino6wR5UXKjgoQcFnPIghsxQyOFW9LG/mYK740YgcwTbIYZ7EQxzuG13ayHT/0d57MKWQKETVj5G2OS1fx@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwkKS6I0tBS6LdGJ3eR5TSUYCVGIo5NZerbidXze9MT6D+7yZTh
	73T6ULt8JyUkyB5EAmRPDYjdByLPeKO2w4BCMeVQXbc3ClONG666NYjZhpE37jaV53gXzNHNlmd
	goAlQn6fI/jkKi7qzqHhnN4pClIryiimtkc3FNfMMv9spEilWvAmNRNZHqMjhQeb27IikxEZpha
	TC30z1AZgBcw==
X-Gm-Gg: ASbGncu3GL8dPdRxaAk9BDI3jGEADTy7XgQzoftRoU9jwinjyyo2Bttk1gh3gVQ0+zA
	NmEseEH/NU/qelP8ey0F2+Q6O+y5t/2o5rfuKul0Ihvj6KpFjkZc7o/4rvKypDV1NTUIG/QkT17
	8Gn+SVdSw+3cI2+76NlbQiiHlqj7lINi+ULtDw32v5SIbtG/W1gaanZyo9KIbXgnes8TpwxCL+S
	6iyeRDbqIyXH0guEiA2N+GR1ZaLulHCPyolQ3LTKvs+tOwDQYtFUQ2O8RudsFSLdJAYmQxhi3Pl
	/7xi4nOEyaE86+fAOfJm3/j7yPkV9IyYM4skq5B6XtXhyBAEWXOWnLmdXuzVqQlAS0zXM8mECao
	nsc3eYCwys1NmRg==
X-Received: by 2002:ac8:5796:0:b0:4b5:f1e0:2a6 with SMTP id d75a77b69052e-4b6172dd078mr13466221cf.58.1757345121986;
        Mon, 08 Sep 2025 08:25:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG09R/Tt/aBEoqL25rYC1EtGXbSR31UVRqEWnspHZQHwGLHqLymKcPWHnSQgPcbIZXxdkGucA==
X-Received: by 2002:ac8:5796:0:b0:4b5:f1e0:2a6 with SMTP id d75a77b69052e-4b6172dd078mr13465771cf.58.1757345121358;
        Mon, 08 Sep 2025 08:25:21 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0467f47d4csm1357374266b.11.2025.09.08.08.25.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:25:21 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [meta-virtualization] [PATCH] containerd: Remove leading "v" from
 PV
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <CADkTA4OVOM-GXK1+asL1gFgk4CJ+LVoKWnHYdLjafzpgkrks=A@mail.gmail.com>
Date: Mon, 8 Sep 2025 17:25:10 +0200
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, peter.kjellerstedt@axis.com,
        meta-virtualization@lists.yoctoproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C80B2295-D511-45A1-A86F-1D5773A0C340@oss.qualcomm.com>
References: <20250907105926.1650992-1-pkj@axis.com>
 <CADkTA4OnwS3Bxsfg6R2uEo6-9gpZSZTvaOHEWRvUbjLmxO6weA@mail.gmail.com>
 <CADkTA4NKwaetHMUvbRian4m1Po1CYTXb7V+avOW1Fwj-RWLnsw@mail.gmail.com>
 <aL6C3y52Dg1Rmwxa@nuoska>
 <CADkTA4OVOM-GXK1+asL1gFgk4CJ+LVoKWnHYdLjafzpgkrks=A@mail.gmail.com>
To: bruce.ashfield@gmail.com
X-Mailer: Apple Mail (2.3826.700.81)
X-Proofpoint-ORIG-GUID: Of7XtTFxu3NF8NV_l07B5Qk96Cfk-RDX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX2mtrp+9WVdrc
 Z9Vj9B5lAAmju5YpdeYZEvqdTOhxFguXThQq0Vej2lNbhIroJxWf01QTWPWXr5Mx/zF8/W3Nuin
 PyYD+qNAzqBOe0cShZVyaW31iLWYJ35cy9X68WSbdfIg+gi8dg7SmD+fLqLqNWwY1C8VgSoBpFV
 uKNVr3jPiEo0ugNjdO1L8r9SukHrNGbl3sVzMLk6u508SLFanBab4GdhMHyoPmXbK3LdkzJMupb
 +UOmYTIL568/lH+DWIvftyiZNWtMLZ7ai1H/MLosr0vXk4rUePWzVzaAn4vQpRjBSWxDf4KDPZ6
 T6hfvPXoUiDhJVq+a8gqDbM9oARAWoRST0zpm9+VpO1IxR0/d5NPmjbaI6dgDYRloYCHICEEirM
 qjQTrRnq
X-Proofpoint-GUID: Of7XtTFxu3NF8NV_l07B5Qk96Cfk-RDX
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68bef563 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IQEsc5u+BqvcbVO/417rXg==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=iezoRA1tAAAA:8
 a=iGHA9ds3AAAA:8 a=2F63j3yhcOSqn__ppT4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=2XXCWAlJ4itMBEcWitwa:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1011 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Sep 2025 15:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9384



> Op 8 sep 2025, om 14:52 heeft Bruce Ashfield via =
lists.yoctoproject.org <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org>=
 het volgende geschreven:
>=20
> [...]
> The policy I have, and have always had (when possible, mistakes
> happen) is that PV matches the tag format of the repository. So in
> most of the projects that means "v". [...]

I've noticed that projects that use 'v2.1.4' as a tag won't use the 'v' =
in release notes, documentation and announcements. For containerd =
specifically:

* Tag notice: =
https://github.com/containerd/containerd/releases/tag/v2.1.4 <- has 'v'
* Tag title "containerd 2.1.4" <- lacks 'v'
* Release note text "Welcome to the v2.1.4 release of containerd!" <- =
'v'!, followed by 'The fourth patch release for containerd 2.1 contains =
various fixes and updates', which has no 'v'!
* Downloads list: https://containerd.io/downloads/, the tarball itself =
lacks the v, the list lacks the v, but the release folder does have the =
v.=20

So containerd, at the high levels, doesn't use the v, but the closer you =
get to the code, the more it will leak through. Personally, I'd go for =
PV=3D"2.1.4", and ;tag=3Dv${PV} in this case.

regards,

Koen=

