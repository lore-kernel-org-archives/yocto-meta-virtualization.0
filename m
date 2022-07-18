Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E4DC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 12:44:12 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.26448.1658148243191681962
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 05:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yjp4oJpN;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id e16so10471358pfm.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 05:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gkwpIyebZ1ljGEscNRcz6BNQEln0BFHO1HOFjNTlsQI=;
        b=Yjp4oJpNRFqn7W5x9faPGxtt+lyh+EzR9GrZS1/ABLyrtOiSyNMKs64A7b+zeJXWHT
         DsWxeo0ffldnEYu080SwdIgsvOLovMhM943u1rZlvWLSeiJ6K2ExXUF1hHXVRlOaWf6+
         4O0SBuomflTKIQIEZGLy2NbK1TecP726LHMK4bszHGhcRSrYU9zhVnxr9194XffYd3/k
         sZEtBVgxu3QC8m4xfzkwE8ai0hKGciwOKl06hn9FS6x1EEiL4/wam/HkavaLmv6Z+vll
         5ZaZ9CPo9mOGt+CmGFCZYLtAkKao2WLvOxHg7/EzLuZN0KkS06zNLV9DxmgEySsFf8Pa
         KphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gkwpIyebZ1ljGEscNRcz6BNQEln0BFHO1HOFjNTlsQI=;
        b=vITD77lGIDJ5JZv+nBbAhNkG/bWpQjFN6b17Taxv9RvsimajqxllnVl3guJmRaNzDI
         zxrIZbpKrfaZJPqPzzhuVxIhtcfoDswBvIPkZO75k7GCRC9s3tNJ67cEC8mxVyw+Dsvr
         Mmwrz+1LiKi0oxaD5TwN3nrzr5kjHnV6WYwIN0MDmtyE+3L6gii+Zgc+IUiFjDBmx4T7
         IfNke7Ncrqt+jXrWZF0NtEUevL3+z4OuIsr9HC+6HKjNZnahj2u9paRXy4CotNO+pSGc
         Own6DdKQedxNP44mQZsNTedNTEkDAmpBM1vw29wZa8uT7qW8g3Rh5KeizTxwtiyk8Q3N
         C+7g==
X-Gm-Message-State: AJIora+2zNv27n3bgZ1xq7EgN6PcFX2JKwuyAP2fiRichu9DeYQQyBvM
	HV4v2VFmDwIXtPE4M6sPtAZdBRzEUm9p9lapYwY=
X-Google-Smtp-Source: 
 AGRyM1uZROv71yr2OafSXsY7CJQIxyBMrutnJ2E5drxlp8+Y5q3TLPtXHTJ4DlCGCrzcg/3yc1BeUQaB2+Rc397Apxc=
X-Received: by 2002:aa7:888a:0:b0:52b:17e8:fd1 with SMTP id
 z10-20020aa7888a000000b0052b17e80fd1mr24809464pfe.46.1658148242264; Mon, 18
 Jul 2022 05:44:02 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CADkTA4PZ6rMBUAF1Q23C6ov9OzjByCjvDQ+dMMxumyJL2fzaUg@mail.gmail.com>
 <12926.1657696750463147139@lists.yoctoproject.org>
 <CADkTA4NzkovYyu_b-pJCFjoKwpCb+q-mQKkRZVQ7mkkxsf389g@mail.gmail.com>
 <17019F65456D67C8.559@lists.yoctoproject.org>
 <DB6PR1001MB12850350F80F2A045592CC51FA8C9@DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <DB6PR1001MB12850350F80F2A045592CC51FA8C9@DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 18 Jul 2022 08:43:50 -0400
Message-ID: 
 <CADkTA4P5f+12Ws9QFuVg562eex+XuMyJxCggHWt8h1CWeGtFVw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 3/3] image-oci-umoci: skip parent
 directory in tar
To: "Anagnostopoulos, Vasileios" <vasileios.anagnostopoulos@siemens.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Jul 2022 12:44:12 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7467

On Mon, Jul 18, 2022 at 7:51 AM Anagnostopoulos, Vasileios
<vasileios.anagnostopoulos@siemens.com> wrote:
>
> Hello Bruce,
>
> Thank you for merging the changes for the image-oci-umoci in the master b=
ranch! I was wondering, if it makes sense to also back port these changes t=
o the kirkstone branch? If yes, should I send new patches for the kirkoston=
e branch?
>

I can do cherry picks. the tag change could easily be described as a
bug fix (since I did have other tag support already in sloci), the
stop signal is technically a "new feature", which I avoid backporting
.. but it is a new feature with no ability to impact existing
functionality.

To summarize the rambling first paragraph, I can cherry pick the two
changes to kirkstone :)

Bruce

> Vasileios
>
> -----Original Message-----
> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lis=
ts.yoctoproject.org> On Behalf Of Vasileios Anagnostopoulos via lists.yocto=
project.org
> Sent: Thursday, 14 July 2022 08:50
> To: Bruce Ashfield <bruce.ashfield@gmail.com>
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization] [PATCH 3/3] image-oci-umoci: skip pare=
nt directory in tar
>
> Hello Bruce,
>
> Ok. Thank you for the extra info! Let me know if I can help in any way.
>
> Vasileios
>
> -----Original Message-----
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: Wednesday, 13 July 2022 22:37
> To: Anagnostopoulos, Vasileios (SI BP R&D ZG FW ITW) <vasileios.anagnosto=
poulos@siemens.com>
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization] [PATCH 3/3] image-oci-umoci: skip pare=
nt directory in tar
>
> On Wed, Jul 13, 2022 at 3:19 AM Vasileios Anagnostopoulos <vasileios.anag=
nostopoulos@siemens.com> wrote:
> >
> > Hello Bruce,
> >
> > How do you generate the images and import them? Could you describe a bi=
t more the use case?
> >
> > With podman for example you can load the image by using `podman load
> > -i
> > build-oci/tmp/deploy/images/capricorn-64/name-of-the-image-capricorn-6
> > 4-20220713063601.rootfs.tar`
> >
> > Usually, the tools that support the oci image format also support the o=
ci-archive image format. An exception is docker that does not support the o=
ci image format and I have first to transform it using skopeo.
> >
> > What is the advantage of first un-taring the image and then doing the i=
mport?
> >
>
> There's no advantage, it's just the support for the OCI image format when=
 I added it, was around the oci image, not the oci-archive, and it was desi=
gned around oci-image-tools, runc, and directly executing / manipulating th=
e images. The tgz version was something I added after, to make it easier to=
 copy them around, stage them, and otherwise collect artifacts.  docker, po=
dman or any other specific runtime wasn't the target.
>
> skopeo was from the beginning the tool that was used to copy/import the i=
mages, and that was with the oci: type .. not with the tarballs .. in those=
 flows as well.
>
> I'm just pondering the right way to not break existing layouts and flows,=
 and that will take me a bit longer.
>
> > Probably the other 2 patches that I send it with this one (https://eur0=
1.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.yoctoproject.=
org%2Fg%2Fmeta-virtualization%2Fmessage%2F7442&amp;data=3D05%7C01%7Cvasilei=
os.anagnostopoulos%40siemens.com%7C45180cb757f947e2f63008da656510d4%7C38ae3=
bcd95794fd4addab42e1495d55a%7C1%7C0%7C637933782366613603%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000%7C%7C%7C&amp;sdata=3DOnmF%2BmqKwRl0uBfYVswDG7Ko3f62BOMwFyzqQ3zOwjU%3D&=
amp;reserved=3D0, https://eur01.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Flists.yoctoproject.org%2Fg%2Fmeta-virtualization%2Fmessage%2F744=
1&amp;data=3D05%7C01%7Cvasileios.anagnostopoulos%40siemens.com%7C45180cb757=
f947e2f63008da656510d4%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C6379337=
82366613603%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D%2Bo56q8uJz5WdxSdKh=
3rzpdw4n9EguCgbgihXmlNPBIM%3D&amp;reserved=3D0) are still relevant, because=
 they are fixing other minor issues.
> >
>
> Yep, I still have those tagged in my "to-review" and "to-test" queues.
>
> Cheers,
>
> Bruce
>
> >
> >
> > Vasileios
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

