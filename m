Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.8422.1575658722798442136
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Dec 2019 10:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RPuRBwYC;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id cy15so6758934edb.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Dec 2019 10:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dqeGIqMAW6Zi146jBhX3JtcPO61ow5cQj2+F+lqH5S4=;
        b=RPuRBwYCt2zzEU3tJYh7uQ4pkbSbLhpHUbuH3P9ycs5QBZive0gYT6ouzkQdUHUBFV
         nQu2VKTJ/KXHtUpOlQKrX9tCLTMltSJNPX+Zf1gtuvobqCVCIxVhtvojihtbQbta1VFJ
         QnWo7Z1SDtI9YHPjNl1OGdiKnGs3vXlZ0LPejnW5q6Lmg9dfht/cbEQdCPiPdH9F8NcU
         qy9Yzx+2nBdgcEnlskR09/tRpyGeA8bqJqjn3O1kOm+Xlde+yBom5rkvy3sz7q7/txJs
         giQa8bHmY49pkSfLTiyi7FQYjf8pZKsFtbrvz4Mq6E1OGvYKveMoMpPY2jrzvaJIOonf
         uI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dqeGIqMAW6Zi146jBhX3JtcPO61ow5cQj2+F+lqH5S4=;
        b=Ixv27uksV7OGyZqMudVP3oei6Qh8WL+LZnhzKLeymeBR9+VRespm7iE4nna2sa5zyz
         ZEj3oDtYaB2Wbm0U9C0u5xXlgjVrfXtZ55eItb/jMwTwodc/EgzKfEZc2EcH2UsIkdI5
         6rz/cZs1gKbjNJYhGYCiIx1iCBX/NTa1oT33yEBdMJsHHfgfM2SSLGCMTMjVLk5RtQNz
         X1VP3F/4KfxHz1S3Ip6vyXKLcn9nXwezhfzkGX1iGZ5lwjMxBP0OHZ7UPaQJZh/+0EYC
         FeM4AMW8W6tD51Lkod/vgYtYeIHOOCTv07nPDo3ZFCXgiSCq7cziOIhUe1yUJjsYVs5P
         D3NA==
X-Gm-Message-State: APjAAAVumsjPml5KQ5Ts+Sf5zzcN9Z64WH2H3p9Qz8++iD3zpbBUAcwM
	Se5lRrbfiKBhY3g0D7LABcrzoXAHB5kNXqdATAU=
X-Google-Smtp-Source: APXvYqx8VPLQ+fVLnoSDuV12Z0fXuRXrQu60GXhypAQfOEpRrIwO7pC14FfDa5+EYn+dAgZ5PjgVxpvEhsdGUpasRTY=
X-Received: by 2002:a17:906:80c3:: with SMTP id a3mr17083467ejx.101.1575658721065;
 Fri, 06 Dec 2019 10:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20191206011454.37368-1-Qi.Chen@windriver.com> <20191206011454.37368-2-Qi.Chen@windriver.com>
 <15DDCE650BD0CB8E.11732@lists.yoctoproject.org>
In-Reply-To: <15DDCE650BD0CB8E.11732@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 6 Dec 2019 13:58:29 -0500
Message-ID: <CADkTA4O=_c0U4h822Dy2uPgYhytfis93w9ecAoD3Qj=BSfLm7Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] layer.conf: use go 1.12 version
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Chen Qi <Qi.Chen@windriver.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 6, 2019 at 9:26 AM Bruce Ashfield via
Lists.Yoctoproject.Org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> On Thu, Dec 5, 2019 at 8:15 PM Chen Qi <Qi.Chen@windriver.com> wrote:
> >
> > kubernetes could not be built correctly with go 1.13.
> > Use 1.12 version in layer.conf.
>
> We unfortunately can't set the version of GO like this, since it would
> impact someone that simply includes meta-virt in their layers.
>
> I see two options for this:
>
>  - create a k8s distro feature and only set the go version when it is
> enabled .. or we re-use the virtualization distro feature (which is a
> better idea)
>  - put the preferred GO version into the meta-virt .inc file that is
> included when virtualization is in distro features
>
> Although, I recall someone saying that the .inc wasn't working
> properly and isn't actually triggering .. I found the email from Mark
> hatle that describes the problem. If you check the list archives for
> the subject:  "[meta-virtualization] conf/layer.conf is broken".
> You'll find a description of the problem.
>
> The fix for that, is to make the .inc work like the one in meta-cube:
> https://github.com/WindRiver-OpenSourceLabs/meta-overc/blob/wr-10.19-20190121/meta-cube/conf/layer.conf
>
> The .inc is the best solution, and this is a good opportunity to fix
> it (it hasn't been working correctly for some time now). I'll try and
> make those changes today, and follow up later with the results.

FYI: I fixed the conditional include and pushed the commit to master
[conf: fix meta-virt version / config include], so we can now use the
.inc to set the go version.

Bruce

>
> Bruce
>
>
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  conf/layer.conf | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/conf/layer.conf b/conf/layer.conf
> > index dfca6da..2d008bb 100644
> > --- a/conf/layer.conf
> > +++ b/conf/layer.conf
> > @@ -41,3 +41,7 @@ PREFERRED_PROVIDER_virtual/docker ?= "docker-ce"
> >  INHERIT += "sanity-meta-virt"
> >
> >  require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'meta-virt-default-versions.inc', '', d)}
> > +
> > +# Use go 1.12 to avoid k8s build failure.
> > +# Remove this after https://github.com/kubernetes/kubernetes/issues/82531 is resolved and k8s is updated to a working version.
> > +GOVERSION = "1.12%"
> > --
> > 2.17.1
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> >
> > View/Reply Online (#4829): https://lists.yoctoproject.org/g/meta-virtualization/message/4829
> > Mute This Topic: https://lists.yoctoproject.org/mt/67394161/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4831): https://lists.yoctoproject.org/g/meta-virtualization/message/4831
> Mute This Topic: https://lists.yoctoproject.org/mt/67394161/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
