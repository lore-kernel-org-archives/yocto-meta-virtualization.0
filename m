Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.10285.1593706232315452117
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Jul 2020 09:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ij8D7+zL;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id d18so18908343edv.6
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Jul 2020 09:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AuPCyZXXG2VKqdyV7tCmM6uzF5ex3oGqpC+hc4g6cIQ=;
        b=ij8D7+zLNYhcHyDAPAVcG+KSnBJ/6/PxCTCjbGSHfFLD/QDJ9wi2aAh9xngeS2ncs0
         7do2Awz9gEy4MEEVa4XzPiMWQIlRT7AXRGaFcK4BH5KZ+WiZvO+wrKXOPC1ercAnVFnN
         OY7IRfVBx4Wc0dOep/rvK3oHATatU/EsYzphysx2IiFcXzEkVa5QJD2m4XhyWY5PUHuw
         7bOGsmB/w9Y/cy6cgF5hI9MgKxYvZny9plRz7iSfgokwQIKhmm1sveocVRNZ2U5+I0W8
         V2JCDxv2zMtinnxKBaNpV1ZOTKgo0DpKUXp7FRMobpsxzEv5reb53hXq2SbnPL40I1iS
         btxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AuPCyZXXG2VKqdyV7tCmM6uzF5ex3oGqpC+hc4g6cIQ=;
        b=l0MKALCZBJrQ6GN/jT6gLwAaxXFwU7QC6scL9aj5Ab1xV1VejebVvnWnDRGVsUqBT/
         T9KsQl3FIRd2CzO3tohMSMgVDTFkAEnNdr8UJBiMuD3nFSLzn3xVAESf2j3J+KcuOeWL
         ihMkDfEqSE1S1LriMSFKOzxFS8nG5/9iU21xwOQby1OUVOyibJ5LWpVIpTwWWaHtrpSN
         geaZqvAdwtcQ105G5Lhc45q6VN9EbKp5NNQXiZCmxIzvApzHqPEcCtZMhnBHgfrzlhq1
         aKX7udyjEwTGUmXD33KMvayyOiKiuPo3zIiqdCIRejwWRZd0pIONvvhcMxVC4OP6JUy7
         3YrQ==
X-Gm-Message-State: AOAM5310GdEltUOnKE3/iOUsfULF79XpAaUwfmpjRL7IvSUxkJ0UEK+k
	8rYq1HzYdFJhkzPEk4F3YZdwSxk7lplsq3JyByC7oUoi3Y4=
X-Google-Smtp-Source: ABdhPJyhfCJBlldbZIcHp8rZ7rlnMzWe9K8NGf/mk77OgNoiS5gIwLcC2/XcoLsf2bncmT7Fx6qqTlbgazYcJtIWOb0=
X-Received: by 2002:a50:f385:: with SMTP id g5mr34269015edm.347.1593706230888;
 Thu, 02 Jul 2020 09:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200702153907.75805-1-Martin.Jansa@gmail.com> <20200702153907.75805-2-Martin.Jansa@gmail.com>
In-Reply-To: <20200702153907.75805-2-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 2 Jul 2020 12:10:19 -0400
Message-ID: <CADkTA4NvVO4_1e_5XpMEhM1AN2yYzj01BAvUpgmwKv1kF+JvXw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] docker: move docker.init back to files directory to use it from docker-moby
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Martin Jansa <martin.jansa@lge.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 2, 2020 at 11:39 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> From: Martin Jansa <martin.jansa@lge.com>
>
> * it was moved for some reason in:
>   http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=929372946aeb85953d1ca6acc428d73fbac52a56

None of the patches are really common anymore, and there were some
duplicated once (I was hacking an unused one for a while).

Thanks for fixing up that miss on the one common file.

merged.

Bruce

>
>   but docker-moby uses it as well and now started to fail with:
>   ERROR: docker-moby-19.03.12+git9dc6525e6118a25fab2be322d1914740ea842495-r0
>   do_fetch: Fetcher failure: Unable to find file file://docker.init
>   anywhere. ..
>
> Signed-off-by: Martin Jansa <martin.jansa@lge.com>
> ---
>  recipes-containers/docker/{docker-ce => files}/docker.init | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-containers/docker/{docker-ce => files}/docker.init (100%)
>
> diff --git a/recipes-containers/docker/docker-ce/docker.init b/recipes-containers/docker/files/docker.init
> similarity index 100%
> rename from recipes-containers/docker/docker-ce/docker.init
> rename to recipes-containers/docker/files/docker.init
> --
> 2.25.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
