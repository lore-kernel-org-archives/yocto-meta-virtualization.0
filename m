Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.18078.1604081322353893762
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 11:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YsvNeBld;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id t22so3326150plr.9
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 30 Oct 2020 11:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=BdELeBVoF2WdOYZl2N3iO2r2K4kCA86eYGn24TLV38I=;
        b=YsvNeBldjaMMFfzpaWYC1ohU1AhIUBUEOquyYbQawQ3018sZxKz85y7ym2VBKRmFXV
         L1SeOd+1JMUvEma8PYqybol4t1uz+0nLBsgiF51jQ3BYeJ2bb9mgaJqLxjPFgyY/jIcn
         yuvxozIja605pU6uwMxeFTECj1ivveycuW2sGrCg0X02EUgVH4wJh/HcWF0GOed8XJ8I
         DTiN3yxkRx5NKY/t19BZpClZ/PGmLCCj0lXwKImITp17RXd83kz8gONzhp/wY7dT/Z0P
         qnqV1q4SAiQ5H82R/EKfarSWWbHRVo4O//3dguz3jA2hedeIaQc4K98pcU4nTBhw+BMI
         I7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=BdELeBVoF2WdOYZl2N3iO2r2K4kCA86eYGn24TLV38I=;
        b=IBrMKvW6BalfInzEv0mDNnpWBLpPI4vrXEHoTSobI9oo8eZZWP/Gm2ps/6cgtjNlWY
         EhLcngVaRoaoTYoHSA7nyQW0gDLEf3x2SiEKOIQofLL0QmqPmx72HZThRG4AKQNkoA48
         wHhtGMazlQ0xQsq8Y/yF8D6aj+TFceJL7ZycRvATUEvxOx8ACpjeEvZAD+Bd6nOgBYNt
         /Y6707Qo+oapJHArnmx+830h+/qkE/wDkchhBeREVoGcrN7cCW6+tvWWB56a8aRdpo01
         KsT7tHlCopxvXKfD6K0r3bviodf37B80jo7hpYcewAhJsnaqSmS4nQkJVrDkICul/ezu
         DYUg==
X-Gm-Message-State: AOAM532KDnSfMrpPQ29++7Gi9dethQLyxOeKX4nG3MRHqDmNEgUYv0Sh
	ID1sIoZcGl397Jm7cAnlliWQRsfNAQI=
X-Google-Smtp-Source: ABdhPJyNW/Kxjynxex7OIH/6V7IwSFMPeAPbo1MIkmlvSedIn8EmKGj0OmkW1agFs8Hvty70gciKkg==
X-Received: by 2002:a17:902:8605:b029:d5:a6dc:ad0a with SMTP id f5-20020a1709028605b02900d5a6dcad0amr10368572plo.56.1604081321543;
        Fri, 30 Oct 2020 11:08:41 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from ?IPv6:2600:380:701d:ba96:706b:a0b0:a23b:a07? ([2600:380:701d:ba96:706b:a0b0:a23b:a07])
        by smtp.gmail.com with ESMTPSA id z185sm6388750pfz.32.2020.10.30.11.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 11:08:40 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [meta-virtualization] [PATCH 2/2] xen: extend SYSROOT_DIRS
Date: Fri, 30 Oct 2020 11:08:37 -0700
Message-Id: <E4E29C95-6EE6-4A5C-834F-CC08641C03BB@gmail.com>
References: <AM6PR08MB3461B708E14D6181ADF4993992150@AM6PR08MB3461.eurprd08.prod.outlook.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>,
 cardoe@gentoo.org
In-Reply-To: <AM6PR08MB3461B708E14D6181ADF4993992150@AM6PR08MB3461.eurprd08.prod.outlook.com>
To: Diego Sueiro <diego.sueiro@arm.com>
X-Mailer: iPhone Mail (18A8395)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On Oct 30, 2020, at 1:43 AM, Diego Sueiro <diego.sueiro@arm.com> wrote:
>=20
> =EF=BB=BF
>>=20
>> -----Original Message-----
>> From: meta-virtualization@lists.yoctoproject.org <meta-
>> virtualization@lists.yoctoproject.org> On Behalf Of Diego Sueiro via
>> lists.yoctoproject.org
>> Sent: 27 October 2020 15:56
>> To: meta-virtualization@lists.yoctoproject.org
>> Cc: nd <nd@arm.com>; Diego Sueiro <Diego.Sueiro@arm.com>;
>> christopher.w.clark@gmail.com; cardoe@gentoo.org
>> Subject: [meta-virtualization] [PATCH 2/2] xen: extend SYSROOT_DIRS
>>=20
>> The do_install task also ships files to /boot and /usr/lib64. Hence, exte=
nd
>> SYSROOT_DIRS to include these paths.
>>=20
>> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
>=20
> @Christopher,
> Can you please also review this patch?

Hi Diego,

I started on reviewing this but it took a little longer than I'd anticipated=
 as it requires it digging into what the SYSROOT_DIRS variable does.

The variables you use for the directories being added look ok, given that th=
e recipe does install to there, but I don't quite understand why they need t=
o be added to SYSROOT_DIRS. Does every directory that the recipe installs to=
 need to be listed in that variable? I saw that ${bindir} is not listed as i=
ncluded in it by default in the Yocto mega-manual docs.
What behaviour is this change intended to fix? Could it be described in the c=
ommit message?

Christopher=20

>=20
> Thanks,
>=20
> --
> Diego Sueiro
>=20
>> ---
>> recipes-extended/xen/xen-hypervisor.inc | 2 ++
>> 1 file changed, 2 insertions(+)
>>=20
>> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-
>> extended/xen/xen-hypervisor.inc
>> index 6a75d16..916bd3c 100644
>> --- a/recipes-extended/xen/xen-hypervisor.inc
>> +++ b/recipes-extended/xen/xen-hypervisor.inc
>> @@ -55,6 +55,8 @@ do_compile() {
>> do_install() {
>>    oe_runmake DESTDIR=3D"${D}" install-xen  }
>> +# The do_install also ships files in /boot and /usr/lib64 SYSROOT_DIRS
>> ++=3D "/boot ${exec_prefix}/lib64"
>>=20
>> do_deploy() {
>>    install -d ${DEPLOYDIR}
>> --
>> 2.17.1
>=20
