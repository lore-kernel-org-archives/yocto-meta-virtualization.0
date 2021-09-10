Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.8483.1631277605588477026
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Sep 2021 05:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mpEINCrM;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id u19so2309369edb.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Sep 2021 05:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PgBHdufUwxitoKMTBh5EuAFyTyasPBEchT8mm9bremc=;
        b=mpEINCrMWO7L5W/WNF5whaIY8D6cIhqUq8B68RvCn6nRDBOkEYJD+Bg59KGNEGoA7t
         TvLpMBXWv2eHv2vy9lGd4q7nZgds7NELaVjvoFkX4RvF/j68Rs6GFj6++fCKquHHQLDh
         y6lR7Y7uVTD2N1l5L+JRrDXGTjkJjwMXrb+BNjeMmyouyT9QwqYYKTieHH+sNKDaUqZh
         CEXc32zqJTZN8cEbp31DKPeoh5/mRKEhYdH7pQZdmGIix6uxNEIxIBTKFexJPIaD9o00
         XLB41ZuKxT5XC3aePMeEyqTFUxyvf8zCCqVw3G+8Lo0O+honz2/VAc4AM13OmG18G8xh
         VeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PgBHdufUwxitoKMTBh5EuAFyTyasPBEchT8mm9bremc=;
        b=TUbSL97L1iHwkU6E6vy6RZ01RnKMKWTm7trr2QAWEOhdE8zqZ42ONJjRisOm2MV7tC
         4paYSkxfdv1yxcBWL1Mm6pUUlxu4waRGH5gtgWc/rza2/w+JzqoR/3W6XGKaKNBY6KFl
         2CWmk+FpUrSkdcem39CTYemkNm18FvpxP9OUQZsCBZ5bER17JZnrSNCIFEF2VdrtkVRI
         hEdoNsMLpQKg00agFQnNnIGI7jMec7ZJqK3Fe80uHwR0ObyuSsjs9iSQKzEitUhjpY6Z
         mO1fEKywWANU6nOehBgPEzIUmqyZLZHsGE/oQmZAGDUqxo1cZFneaRRmD8BnBeVfdvBK
         JYRQ==
X-Gm-Message-State: AOAM532PF9KU8yCuVbg10OOVl5b8HCDz/83dfxF7BqUAYFYsy/1Sp2Hj
	CZH4I5BpNbpFNVGR/UFFYr9YRUUtC3NnNBQ5c40=
X-Google-Smtp-Source: ABdhPJwO9Itsk/6T10Z1d+WG+zkLUlkqftDmlcB0t+bo4HGXIZoRvY5Gz4jmfFvdxXJfVo5Y0hnPGrmqzzR843NSUHs=
X-Received: by 2002:aa7:c806:: with SMTP id a6mr4455894edt.354.1631277604169;
 Fri, 10 Sep 2021 05:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <729c3f470eb64e3a8832e3e70c8da768@axis.com> <1631262707367.2520628917.514655614@optimcloud.com>
In-Reply-To: <1631262707367.2520628917.514655614@optimcloud.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 10 Sep 2021 08:39:53 -0400
Message-ID: <CADkTA4MoKmi6B+hBna9-FRjJSjpSKH6_Qx3te5_edo3AOAqhRw@mail.gmail.com>
Subject: Re: [meta-virtualization] thoughts on k3s and supporting builds of more than one k8s version
To: Yocto <yocto@optimcloud.com>
Cc: Joakim Roubert <joakim.roubert@axis.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 10, 2021 at 4:34 AM Yocto <yocto@optimcloud.com> wrote:
>
>
>
> On Friday 10 September 2021 13:49:24 PM (+07:00), Joakim Roubert wrote:
>
>  > Hi!
>  >
>  > I was thinking about k3s, and now that the latest stable k3s is a
> Kubernetes 1.21 version:
>  > Do we want to have recipes for multiple k3s versions? I'm thinking
> someone perhaps wants, say, 1.20 to go with a system with 1.21, while
> someone else perhaps wants 1.21 to go with 1.21 components.
>  > And then have a common .inc-file with everything that is not individual
> for the versions, and small recipes with the source revision and such for
> each version.
>  > What are your thoughts on this?
>  >
>  > BR,
>  >
>  > /Joakim
>
> I would rather see KubeEdge packaged then another specifically k3s, which
> well i feel is pretty useless overall as kubernetes itself does the job
> kubeedge provides more benefit to low resource edge nodes then k3s
> mini-kube would.

And you'll find just as many people with the exact opposite opinion ..
getting agreement on what flavour / combination of k*s people want to
use, is like us all agreeing on an editor.

Packaging another version of k3s isn't really on the radar, but not
for reasons related to KubeEdge.

I actually have some initial work towards packaging it (as I did for
microk8s), but that won't arrive until after the release, and until
after I've completed refactoring the components and gotten rid of some
of the massive duplication we have in the layer (and have a proper set
of tests for all flavours ...).

Cheers,

Bruce

>
>
>  >
> --
> Sent with Vivaldi Mail. Download Vivaldi for free at vivaldi.com
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
