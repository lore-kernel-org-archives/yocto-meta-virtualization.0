Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCC2C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 11:49:20 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.6080.1743594553141224250
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 04:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SimVl5aF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0618746bso46366015e9.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 04:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743594551; x=1744199351; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ROUtONxOkpbgVfLazJVGJBlAOhON6j8jRZB+BsLI1XI=;
        b=SimVl5aFxEnvTXhXyn1sZyyRyQCUz9u66X8ovm976izpZkzitkNogcxh8rRHwl9u1D
         U336xzqrGI9cR0GWXDwiRemjbXMyn6kjWBdgNYo+U0E2zJdLILGJMS28pbpD3kVtVUNb
         vQPtyhjVZxF9I78PLW/dYUGftKdOLTmTmg+x8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743594551; x=1744199351;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ROUtONxOkpbgVfLazJVGJBlAOhON6j8jRZB+BsLI1XI=;
        b=fx9dg9zJ+5FpOhKSqFyHdGsJ+OGM0gHO5vCt8JgNX3Q7LN0nnOMW5ZhnIIrNPvye1C
         OGwxbXVlrezzdyrROEvUWUgO8OvEgOZmBbQYnCyunU9EeyfbN2pwXaFmred92McryrQz
         e6irF1bBC9lYYPr0PJ0znrRLTeu5HaSL6/phiLFHSUYqDIfG97mzntjyOIJmMj43DImm
         aoXgtElJIfwlzJ0B76pJI53AkJx2vUxZBwCw/qRdYjg8K8D5eGHPN9ouSC7QA2JInduD
         Rp1FdpkRlhKFKgCjcI9542ZATehDOBptUbzWlj3tUwH9+LLCBhMWfT77GaqkMETgG3fP
         0+Qw==
X-Gm-Message-State: AOJu0YzIZKMrtNt4LNrn5fogZ0jKVmSAPvzrew8xwCtCCsoJkRmlOdrs
	cl0E7DENOHk0y7JdwxlgVwHmy/xC+E0e9umPxHyeoti/Sr1BRNvs3EbpZO3xc/o=
X-Gm-Gg: ASbGncsBZ4HYww7hv/67ZthpATajBMqDMdIrPwko+X0hXT6rvf1Vm2MyeU21IlCvp8r
	JUT4WTLJrvGKnsVp5rP6Qteh+uP0KfQOv3ow+sd2heLxdKm0wJkfrQKSxGFnmINLpFkd4nw8Jig
	TIRB9jmb37gJ5YxXf1nJ8cWUnuuV8PgBMH+93K5ePGeqIoVlYAS1sWs415HhO11I/9JQPgfFug3
	5u4HPJSjxfl80Gv4qsFVVkYM6kCQF77Vf0EOh6tYWTa+GVR/pFh1iP2dwc2o0/WI0jmJuroBBDg
	OSbMN3t0d51N3EB+NA8lsCikwz7I8Lpx/pqm35GqaAv9UO29tL6xF/jrWpjbjA7ZIYZuDeu4lOT
	K0wOZU8JayamzjHu0fqRrEzKqUEcMNsKl+w==
X-Google-Smtp-Source: AGHT+IFpAxhdFNscwo8jNE5Y691xq47aJHs67e+tGICwZ9ekfYbLdZnGoOBIDURZ/BP+lJH58rHMDA==
X-Received: by 2002:a05:600c:811b:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-43e8f73a9bcmr139719835e9.14.1743594551542;
        Wed, 02 Apr 2025 04:49:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:24b8:b374:749c:8558? ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm18075255e9.29.2025.04.02.04.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 04:49:10 -0700 (PDT)
Message-ID: <1314cba6bb89fdc1e066d1d693b2b47cdb99cf68.camel@linuxfoundation.org>
Subject: Re: Whitespace syntax warnings for meta-virtualization
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Date: Wed, 02 Apr 2025 12:49:09 +0100
In-Reply-To: <CADkTA4OhVfOX0VPz_JcV3FzJ553Smd8OOAMb6xkHzD-cSGSsGw@mail.gmail.com>
References: 
	<a5b5e19262e51cd9b14e65f42efc3367b1af99e2.camel@linuxfoundation.org>
	 <CADkTA4OhVfOX0VPz_JcV3FzJ553Smd8OOAMb6xkHzD-cSGSsGw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 11:49:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9190

On Wed, 2025-04-02 at 07:24 -0400, Bruce Ashfield wrote:
> On Wed, Apr 2, 2025 at 7:01=E2=80=AFAM Richard Purdie <richard.purdie@lin=
uxfoundation.org> wrote:
> > I just wanted to give a headsup that there is a patch for bitbake that
> > adds warnings for whitespace syntax which we're likely to deprecate:
> >=20
> > https://lists.openembedded.org/g/bitbake-devel/message/17508
> >=20
> > I've posted it so people can start seeing how bad some other layers
> > look. I did sort out OE-Core/meta-oe, at least on the most part.
> >=20
> > For meta-virtualization, this results in ~1300 warnings:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/1253=
/steps/12/logs/warnings
> >=20
> > Most of these look like they might be script generated, so a small
> > tweak to those generator scripts might address many of them (he says
> > optimistically!).
>=20
> =C2=A0Yes, very much script generated for the go recipes. I'll fix them i=
n tree and
> then fix the script after.

Ok, I wasn't sure which way around you'd prefer to do it but it helps
to know that.

>=20
> > I do appreciate we're in the middle of release. Personally, I'm in a
> > lull while core is in testing so I've switched to trying to clean up a
> > few different ongoing development threads that were deferred until post
> > release. I appreciate I'm therefore a bit ahead of where others are.
> > This isn't meant to be any kind of pressure, just a headsup and a
> > question about if/whether/how any help makes sense, partly to avoid you
> > getting a load of patches you might not want.
> >=20
>=20
> I'll do a mass conversion myself to fix up the whitespace issues,
> unless you already have one that you are locally testing in that case,
> feel free to send it, and then I'll fixup the stragglers.

I don't have any patch yet. I think Martin Jansa is working on a more
automated fixup script as I've just done things manually so far. It may
be worth waiting for that to run against the layer when it is ready.

> I assume this will land in master of bitbake shortly ?

I'm flexible on that. I wanted to post the patch so that people could
see what state different layers are in. meta-virt seems to be one of
the more badly affected. I've sent email since I wanted you to be aware
of it and that I know many people use the layer as a dependency so
they're going to start reporting this when they test their own layers.

>  I haven't
> branched meta-virt for release yet, and won't for a bit. But I don't
> mind a patch like this in both as it isn't changing functionality and
> will make backporting fixes easier.

Agreed, I did fix oe-core and meta-oe before release for similar
reasons, I had the patches ready.

Cheers,

Richard



