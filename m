Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12933.1603800482706560103
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 05:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SAZSYovb;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 0D50838C089D
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 05:08:02 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id p9so1876981eji.4
        for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 05:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zPeOyZ34Rs+KsHDB3SzARuOKp0MOSHVnWJ3A1SybPRc=;
        b=SAZSYovbHllAnWyVcqxcZi0r5/nzUUPaSg8NBCOCZvAL3X8nx9BeGlp1iee8A+aKxZ
         pjmbr8nVSB6SgqE6enhQ1SrNRerJR5/GUGMo1GGNd4OF+wuiuuFkloA8WO98YMqHDafm
         59g+oRlPlAo24Dmsc07cwbv9jFljuWWt3P7/JvdV7N5DOJwcaD80SuU1EedsEX5PM/+P
         4a7/lvpaE33rHm0XyarRPiGq+JcTtsiniEA6PLdpb1sLMhWExHcHiSRk+8OmwrpJxtMy
         dKkPjb4fS2uNLCrosTan35Ldqy7HkEz0/nBwWk9JNIdB20xQEv0ubxs2lVNKahvZzoT/
         kLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zPeOyZ34Rs+KsHDB3SzARuOKp0MOSHVnWJ3A1SybPRc=;
        b=WERIq2WoUaiKYH2O33xA8ROGRCZXJCENO3nWpggJ0bJgN5TPKEX/vd2WCzYvRPdXo2
         i2jvH14Uwps0r3us7nnUZyOZ6HKlrdyJeOWakwzzHbz2+MtpYXkoSOSNdcdD18xMDYxG
         dGbgQFmBAlrgH+KyVF6ilweMiUobt+CJaW4FCv6f25C0Q/wWs3X6IvID0+MJG79svkKh
         Qgk8rZ1LMsRAeHOGKGbft+mqKP29XhHJLE7yXAkYzgZp+Nwt0ua9UTI5SIyBU0sIemdE
         NvpzYu4Q+JMcsyWTeYccjxCCVSrdKyHBRt0C30bX5pkKagvrhifQWAzpY5O/1r8Egzn6
         xTkA==
X-Gm-Message-State: AOAM530z8+a9etioGOFRmVGVHmPZ2v0+RJYCRl8rICiy67i9JsKrkBIl
	nzhS5ZGagROSDGxAGCgLmuLROSy7CJ8pPScsVH8=
X-Google-Smtp-Source: ABdhPJxHIoq8cKWFZ2Ipx/uCcvI7q/0/c9igHILZsyMEGVUYE83cPXDqfPuggzSLLeSB21ZmnafyneTGI6qyHb9I3v4=
X-Received: by 2002:a17:906:4742:: with SMTP id j2mr2014197ejs.247.1603800480307;
 Tue, 27 Oct 2020 05:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <b2b268d8-8c1a-2424-2029-7238e52404f8@optimcloud.com>
In-Reply-To: <b2b268d8-8c1a-2424-2029-7238e52404f8@optimcloud.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 27 Oct 2020 08:07:48 -0400
Message-ID: <CADkTA4MwLP4ScGjjZN4uhA=sAj1g2fZefWj71rpotrPrhVdLXA@mail.gmail.com>
Subject: Re: [meta-virtualization] is meta-cloud-services/meta-openstack useable, or a WIP ?
To: Yocto <yocto@optimcloud.com>
Cc: "meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2020 at 5:16 AM Yocto <yocto@optimcloud.com> wrote:
>
> okay reading the doc README it states
>
> There are six openstack layers that are used to build a controller/compute
> node image pair. The dependencies of these layers are also required for a
> build, and are listed in the layers themselves.
>
>    - meta-cloud-services/meta-openstack
>    - meta-cloud-services/meta-openstack-compute-deploy
>    - meta-cloud-services/meta-openstack-controller-deploy
>    - meta-cloud-services/meta-openstack-qemu
>    - meta-cloud-services/meta-openstack-compute-test-config
>    - meta-cloud-services/meta-openstack-controller-test-config
>
> so the question is, is this actually usable to bitbake openstack based images ? or a Work in progress ?
>

They are now a work in progress. They *worked*, but we didn't have a
dedicated maintainer, so we make sure the re-usable recipes work (and
a few have migrated to the main meta-virt over time), but to build and
deploy working controller and compute nodes, they wouldn't be usable
out of the box.

Bruce

>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
