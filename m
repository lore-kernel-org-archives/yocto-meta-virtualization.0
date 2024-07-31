Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189FBC3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 14:03:29 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.43736.1722434600578567289
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 31 Jul 2024 07:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bVBe0dlu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.180, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ef1c12ae23so68097281fa.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 31 Jul 2024 07:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722434599; x=1723039399; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wu8VnpHGm9mFapMl619k+mMQEZiJcZ1g2lN7nQsu+ow=;
        b=bVBe0dlufP7EwQydQeSS7i4kgcrXV/qbGMxyPRirwMgcNYsPGH/mAlCiYF/C1Et+mo
         OErad3hYk7BTbxLrwPA26jiCS9v7DWi+9N4Y1zIOh5SDWeKkZKoAqIjpQVqmJga+tGip
         3rI4C2zBlLYJch+tCRpDKOisgnHi5Fn3tvswM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722434599; x=1723039399;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wu8VnpHGm9mFapMl619k+mMQEZiJcZ1g2lN7nQsu+ow=;
        b=LaiL81AbjkApmgCzbRl9BZWRejr02vgUqH/rjntc2l9ZTrCHRlKbphuN4Wh6urAvTx
         l/yUQWCR6pHjGTKNkPvfRrfcY8MTBu2uFBmZeJ+JSFeMSgKlLmOMMY04mLlDbpR4drOw
         j+Rw01SHyfBtH0Nj7Kj/Ksl6ZGI1FpNGUKGyrJJaVbxKft3JXE0rumryjHng6IdquM/K
         9145CdxcNx/P8AhiWMYyEdmarobLlN+x2nOES7Z3f/NzkRgr8RhXfdi2rxgfvHLYU11c
         FsLrOIhBEXxx/G0v/xVz8EAfxReuNH9Lm4I8jQjlCUEScBuj8ompm8zexkMkXJyJEMZm
         NK8Q==
X-Gm-Message-State: AOJu0Yxbr9CODD/+ZrAI942mvWO26PqxAQ0s7RCYQhzvbN7DFhnNREo3
	09UYIircscRer45jNKE9PMOWLpHB1hVDXRqc0jUWb7qvfQm42vvt+lv0/yXP5QE=
X-Google-Smtp-Source: AGHT+IFkRjNOjD7D4q0fmMrahKoy4XpXOl8zlWQTNWO5sspv+4hnCqxRexsHkolCupTczOzrQDBKAg==
X-Received: by 2002:a2e:80d5:0:b0:2ef:22a4:6415 with SMTP id 38308e7fff4ca-2f12ee2d0cemr96286161fa.28.1722434573272;
        Wed, 31 Jul 2024 07:02:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2932:9b7a:93b7:1fac? ([2001:8b0:aba:5f3c:2932:9b7a:93b7:1fac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b89a878sm23055725e9.8.2024.07.31.07.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 07:02:52 -0700 (PDT)
Message-ID: <a2345595786d017c108093edf4e62ea2b8fbad1f.camel@linuxfoundation.org>
Subject: Re: [swat] Intermittent failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: swat@lists.yoctoproject.org
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>, 
 Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 Jul 2024 15:02:51 +0100
In-Reply-To: <20240715211548e4ad45a7@mail.local>
References: 
	<7f1b586e5defdfbd9b345d47e1a9300c99560df7.camel@linuxfoundation.org>
	 <20240715211548e4ad45a7@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 31 Jul 2024 14:03:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8848

On Mon, 2024-07-15 at 23:15 +0200, Alexandre Belloni via
lists.yoctoproject.org wrote:
> On 25/06/2024 10:46:33+0100, Richard Purdie wrote:
> > Hi,
> >=20
> > In pre merge testing we saw:
> >=20
> > https://valkyrie.yoctoproject.org/#/builders/89/builds/53/steps/12/logs=
/stdio
> >=20
> > but a fresh build of master-next with the same revision worked:
> >=20
> > https://valkyrie.yoctoproject.org/#/builders/89/builds/55
> >=20
> > which makes me wonder if there is some kind of race in there?
> > Reporting
> > in case anyone else can see it.
>=20
> Yes, this is a race I've seen and reported already. I never pressed
> the
> issue as it doesn't happen often and Bruce had other things to work
> on.

I am able to reproduce this one at will.

MACHINE =3D "qemux86-64"
DISTRO =3D "poky"
SDKMACHINE =3D "x86_64"
PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
DISTRO_FEATURES:append =3D ' virtualization xen'

then

bitbake xen-image-minimal -c do_image_wic

I suspect a missing dependency, I'm just not sure where!

Cheers,

Richard=09

