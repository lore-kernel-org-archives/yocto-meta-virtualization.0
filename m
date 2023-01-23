Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709ACC25B50
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 19:05:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.51451.1674500702146579070
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 11:05:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=6HIvnKew;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.42, mailfrom: jdmason@kudzu.us)
Received: by mail-wm1-f42.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so9340263wmc.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Jan 2023 11:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZottWazZWZkd+rYPw/zr8XLQInNePEkdRCyN3Lbft7c=;
        b=6HIvnKewVEpxmHpJBqsRCXNTMDlnkDt8NFYCFZIiI/NVtTatCIELpO5U5isB8Jyg3x
         Fy3PmX6UhXduuoAc3AKeqxjcc+S1I2dVp3R1iP+6WXxWtUvlHO6sB18jBhzNp/KTW92g
         wegUgKSKpPIW84lcJ2uCtsrMEfez1kFkc1/iiEtrV1T/tOJpClmvhCgiWbU49j7RYZtM
         +OMY/ONWHZhQCpmTX601ja0ATxS1EfVdf1Y8SXv759oVvGBRcMR42jzpapz9lLmj7Km0
         qjmR28HI5ykzHdheXmt5HZ9xNeZL2B2H4cD8HGLwpQupakqhXM2Dj3rYUrQRFX2kNDGs
         d0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZottWazZWZkd+rYPw/zr8XLQInNePEkdRCyN3Lbft7c=;
        b=UoxKip5aFaEmt/bSnBAksG09WpIoDl0d0T9WOptGWAR/t/FbEZq6BvuJX9shyUBu8E
         GFswN1YlDcrfmkbJ5//CpBcHis4VKuWmM3U1j4+aLAHpEk6kW7hVqESTO4MDxkKjg/KE
         9EHUKeUzXHWNQt4F9Rm5/vZbVcj1QR2Vnyi9ktg9ufSmwpVcOTwlywOVwyLM3blZmjTK
         mZ4fe/DSSfkOU9MsBpWIBXKGFfPnBx/tvV6D+bK1l9mrR2pEk9ctpLez9BwR6zzQlvgW
         pPK7eBH0UykciNECV2Yl20BLb3KQ6XrArVhByl5toy4MsDgu9Gol/xjvqn6t0LeQo0nU
         BXQA==
X-Gm-Message-State: AFqh2kq3z6aWL1St1ZF4W+9hCbHaYH16ugf0t6PkMqgUZdg40JJg7CL8
	3JsWrnNSNMQuay02OYzQs15pgShLL5OQD0ZIEnqBOA==
X-Google-Smtp-Source: AMrXdXvkT+9DONHMcAW1decXb3q76sfuINKv+fJNv98IK04+DDLn5peGXBbUt+JMPa56lpkrDfSTFFtN4g36RXmyQDM=
X-Received: by 2002:a05:600c:4f88:b0:3db:2567:c8e0 with SMTP id
 n8-20020a05600c4f8800b003db2567c8e0mr992643wmq.177.1674500700388; Mon, 23 Jan
 2023 11:05:00 -0800 (PST)
MIME-Version: 1.0
References: <20230123154454.1514564-1-jdmason@kudzu.us> <CAMKF1srz31kw5nEaPWSvH6RtdS6A2a9miDurDBszYFSemM=Tzw@mail.gmail.com>
In-Reply-To: <CAMKF1srz31kw5nEaPWSvH6RtdS6A2a9miDurDBszYFSemM=Tzw@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 23 Jan 2023 14:04:47 -0500
Message-ID: <CAPoiz9x-mvmUxhfqi4C97tE0YjNWNaxa0oHfESBRh2xUGh4iVw@mail.gmail.com>
Subject: Re: [PATCH] xen: force usage of gcc
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/mixed; boundary="0000000000006c647105f2f3131b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Jan 2023 19:05:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7831

--0000000000006c647105f2f3131b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm attaching the failing logs to this email.  Let me know if it
doesn't go through.

On Mon, Jan 23, 2023 at 11:30 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Mon, Jan 23, 2023 at 7:44 AM Jon Mason <jdmason@kudzu.us> wrote:
>>
>> xen-tools and xen (and possibly others) fail to compile with clang, with=
 the following error:
>>  configure: error: in `/builder/meta-arm/build/tmp/work/cortexa15t2hf-ne=
on-poky-linux-gnueabi/xen-tools/4.17+stableAUTOINC+11560248ff-r0/git/tools'=
:
>>  configure: error: C compiler cannot create executables
>>  See `config.log' for more details
>>  configure: error: ./configure failed for tools
>
>
>
> And what=E2=80=99s does config.log say ?
> Can you post this file somewhere
>
>>
>>
>> Force all of xen to use gcc until this issue can be resolved.
>>
>> Signed-off-by: Jon Mason <jdmason@kudzu.us>
>> ---
>>  recipes-extended/xen/xen.inc | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>> index 5937763a7ddf..dcd281b5a21b 100644
>> --- a/recipes-extended/xen/xen.inc
>> +++ b/recipes-extended/xen/xen.inc
>> @@ -2,6 +2,8 @@ HOMEPAGE =3D "http://xen.org"
>>  LICENSE =3D "GPL-2.0-only"
>>  SECTION =3D "console/tools"
>>
>> +TOOLCHAIN =3D "gcc"
>> +
>>  inherit autotools-brokensep pkgconfig
>>
>>  require xen-arch.inc
>> --
>> 2.30.2
>>

--0000000000006c647105f2f3131b
Content-Type: application/gzip; name="xen-config-log.tar.gz"
Content-Disposition: attachment; filename="xen-config-log.tar.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_ld96fc2z0>
X-Attachment-Id: f_ld96fc2z0

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
f33wexQAkAEA
--0000000000006c647105f2f3131b--

