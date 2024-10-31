Return-Path: <lukasz.czechowski@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEF0D767DD
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 15:46:48 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.15734.1730389604492113948
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 08:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=ddcZIViC;
 spf=pass (domain: thaumatec.com, ip: 209.85.218.46, mailfrom: lukasz.czechowski@thaumatec.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a1b71d7ffso155824466b.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Oct 2024 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1730389603; x=1730994403; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4miJ7ImjUNkBl+7j2iOpYYlqCrXi21u905xEycw+jE=;
        b=ddcZIViCcEbtbj03ZOjIcOawbjE7HkpK41cKqm3axDRyN96ZpUGjrkV+IKIw0YmFde
         itbUgtYtY6ugoqYt8hpFb/nsntrYVipe2NJ3fBmC/je0rBCn0qb97Py7ar5o0H97m+8J
         YTEhYz1UPaE26KVzOzXha9DRa0AKBnlBS5OZPoakyNEwFyJYZLd11kckXe2sq2UsSrEz
         UPt9znAIylfrYB9ClATEp8q/wOWjS0F5vukQXD93FT25sXgpxuydfJnJopLLZO5yUNeU
         FG2FzNDPz3Df1Pkoc0dOJHRoZ0gp8Y4iXoVuaj2pA4+LcA/5og1Dy4imWWvjRzJZaIGA
         nIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730389603; x=1730994403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4miJ7ImjUNkBl+7j2iOpYYlqCrXi21u905xEycw+jE=;
        b=tjY3p4qSpktKTg088N+YNjRizh/J2VHAxzrCBjO1pIY6ahRg0emj/sFtdtkxIxdSPD
         6ULTmqilisZ6OqTMrMgq2ljAlAjQo8WjWVtlKvBcwaN+WPCfmQHMx+VLWBRi/BHNykTd
         +4Oi0byoswjhrmdcUoEJSV9yy2RA6FiBrecx5fhpUeth2gqSRLrcVVyIhpYE2obPRa6G
         tO/KaufnVmzd+8gjO49e26nmgz4NJwyXqKR0KCbbxaZTcPIccKZI+W7xbcZEPNOP4Jqw
         oYSta4Eys5X0q9Ku7oMRgJoiTrmSOWFx6rr8l/iZa9QL1nTvEmr8FcxCvhyMr31hyUpz
         2Jsw==
X-Gm-Message-State: AOJu0YzkYRYP4le5cHAexcKgZq5DyE9Ifhxgf+ajB6Pw8L+2EGHcPJmq
	FcVKgTImleOqWedvDWvIqmOA2PuC03D7LsTTo1L0cS0CrZP81no4KfMLL+o/6tv/JuBZ9XIBxNH
	41DsV8w161nRJ6X1spRgSRMm1dbim166fi28OaA==
X-Google-Smtp-Source: AGHT+IFksuh1qrhlSDXLV50scExk+MFM98acxMamm9eWZ+ogNkLsCRlX6CWfPZt3qXlLhimtf4mdb+xXYWSkiGHy2j0=
X-Received: by 2002:a17:907:7e92:b0:a9a:646e:d2f7 with SMTP id
 a640c23a62f3a-a9e3a7f42e9mr733824466b.61.1730389602655; Thu, 31 Oct 2024
 08:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20241021150231.1221025-1-lukasz.czechowski@thaumatec.com> <CADkTA4OrDZ1KO3TtysNT9EopK3gDagh5h3b1F3PPWOsdFksgrg@mail.gmail.com>
In-Reply-To: <CADkTA4OrDZ1KO3TtysNT9EopK3gDagh5h3b1F3PPWOsdFksgrg@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Czechowski?= <lukasz.czechowski@thaumatec.com>
Date: Thu, 31 Oct 2024 16:46:31 +0100
Message-ID: <CABd623tXgkvtziHgUy5xW8-BH6ZTUqwLsJxN--aWmqo8q4=2eQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] container-host-config: Remove centos registry
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Oct 2024 15:46:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8948

Thanks. I hope you get well soon!

Could you also apply this patch into the scarthgap branch?

Best regards,
=C5=81ukasz

czw., 31 pa=C5=BA 2024 o 04:55 Bruce Ashfield <bruce.ashfield@gmail.com> na=
pisa=C5=82(a):
>
> Thanks for the patch.
>
> I injured my hand (so I couldn't type) and then had to do some release pr=
eparation, but will get to merging his shortly.
>
> Bruce
>
> On Mon, Oct 21, 2024 at 11:02=E2=80=AFAM Lukasz Czechowski <lukasz.czecho=
wski@thaumatec.com> wrote:
>>
>> Update registry list by removing 'registry.centos.org' entry.
>> This registry is no longer available.
>> Decommissioning of the registry was announced in the thread:
>> https://lists.centos.org/hyperkitty/list/devel@lists.centos.org/thread/E=
HGCQUHLDQ6LI474ZAB7MPRZFJD77P3S/
>>
>> Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
>> ---
>>  .../container-host-config/container-host-config/registries.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-containers/container-host-config/container-host-con=
fig/registries.conf b/recipes-containers/container-host-config/container-ho=
st-config/registries.conf
>> index ba6c3f6e..926d8c36 100644
>> --- a/recipes-containers/container-host-config/container-host-config/reg=
istries.conf
>> +++ b/recipes-containers/container-host-config/container-host-config/reg=
istries.conf
>> @@ -9,7 +9,7 @@
>>  # and 'registries.block'.
>>
>>  [registries.search]
>> -registries =3D ['docker.io', 'registry.fedoraproject.org', 'quay.io', '=
registry.access.redhat.com', 'registry.centos.org']
>> +registries =3D ['docker.io', 'registry.fedoraproject.org', 'quay.io', '=
registry.access.redhat.com']
>>
>>  # If you need to access insecure registries, add the registry's fully-q=
ualified name.
>>  # An insecure registry is one that does not have a valid SSL certificat=
e or only does HTTP.
>> --
>> 2.43.0
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

