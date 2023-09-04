Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B45EC88CB2
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 13:59:04 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.48411.1693835938918230769
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Sep 2023 06:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OX0ZZIR+;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7927952ca67so44982439f.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Sep 2023 06:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693835938; x=1694440738; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8qCJLTog32lY8Yk/sgNxSVI2uYNEZbIUsaXZxkN1q4=;
        b=OX0ZZIR++pvf90xrbJAUqNKMZCI4yDIez+tHQU6Fr9rYcIzWh4MtrDhRvixDI4tFYt
         2L4mt+UGQgNyFDJwLNPvptOsru7fg9S/kGw9pqS72y7DVf3C1cPbQ9Di58s6Yhzd9goh
         wvaGlFMvHR/HkVWWwT5qI31SgjpQAxQQcNEBayAFvqUJm+zUFvQzqBfVrUATXp6Bq8NX
         HnbkWkZ5Fg7/BmFMqfryoVqoOrcvwi2nyUa1oeSLP+P7VEoF/Ql+n5+cI2njVQb4oAaU
         sS4f1GitmE+89eZzr2OMXZfMuLMTu6vcSsuf7V+HtW/Q5KBBoHlwr8FOtkQCKI5a7LhG
         AFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693835938; x=1694440738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8qCJLTog32lY8Yk/sgNxSVI2uYNEZbIUsaXZxkN1q4=;
        b=OqjnYaTBaj+tANFKwfl6wEZUbLngSvSS3YmHicGV/3je3r7i6tXuF37BQGULtTQlQZ
         QElR6ultNRc2klvzI8ixQFHOUrnQK83ccPmQQ5xbRDqXaLRV3mbWVnRwt44jQVq2bBwY
         tE7iszgHTOkCZNtzaqBFxjOXrvG0J5XGwwpAxGDdys4ofdTQQzJmaYQ6P8ebbPEkrGVD
         4Giii1i6CmTnVOsyqUCqVEJcKa32QTEopLeSUWzN0ryr7MDyyW3r/oScZRjHZO0jcq9g
         i7AtnYSp9Cl5yZGuHt9kRztFT0bQq1CW7a+tPgto4NoZa0zmVLzI7zlKsp0AkJI12V9i
         20mw==
X-Gm-Message-State: AOJu0YyKoge45YoHm7VG0UE2rNbIERTHD1uk+BqbUM42fFVIOp/YAyS1
	T2ZYiOzs+84fvYmlyqFKV+hDtQpwsJ6GrSPhLUc=
X-Google-Smtp-Source: AGHT+IGoltMQ3ukDIT7fXzTgqEnLoRlRE5wvpL7ivvf2ljkfdeGyVv7wre4zy3qQKfCd6bD4FJS1M/xe4IizN9nP5KI=
X-Received: by 2002:a6b:6a19:0:b0:790:a211:b95a with SMTP id
 x25-20020a6b6a19000000b00790a211b95amr10998533iog.4.1693835938074; Mon, 04
 Sep 2023 06:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230828202834.2981605-1-javier.tia@linaro.org> <ZPV7letLuc9IeUJs@nuoska>
In-Reply-To: <ZPV7letLuc9IeUJs@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 4 Sep 2023 09:58:46 -0400
Message-ID: <CADkTA4PbmCp9uFpe0Jgi=0WnrGwuk2MzW0qoOjhYKRGOA1-apw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] go-build: add SRCREV_FORMAT
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Javier Tia <javier.tia@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Sep 2023 13:59:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8270

On Mon, Sep 4, 2023 at 2:39=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.or=
g> wrote:
>
> Hi, would be nice to get this applied as it fixes this parsing
> error from latest poky master branch:
>
> Parsing recipes...WARNING: /oe/build/../meta-virtualization/recipes-devto=
ols/go/go-build_git.bb: Exception during build_dependencies for fetcher_has=
hes_dummyfunc
> WARNING: /oe/build/../meta-virtualization/recipes-devtools/go/go-build_gi=
t.bb: Error during finalise of /oe/build/../meta-virtualization/recipes-dev=
tools/go/go-build_git.bb
> ERROR: ExpansionError during parsing /oe/build/../meta-virtualization/rec=
ipes-devtools/go/go-build_git.bb
> Traceback (most recent call last):
>   File "Var <fetcher_hashes_dummyfunc[vardepvalue]>", line 1, in <module>
>   File "/oe/poky/bitbake/lib/bb/fetch2/__init__.py", line 834, in get_has=
hvalue(d=3D<bb.data_smart.DataSmart object at 0x7f0fd64ce640>, method_name=
=3D'sortable_revision'):
>      def get_hashvalue(d, method_name=3D'sortable_revision'):
>     >    pkgv, revs =3D _get_srcrev(d, method_name=3Dmethod_name)
>          return " ".join(revs)
>   File "/oe/poky/bitbake/lib/bb/fetch2/__init__.py", line 804, in _get_sr=
crev(d=3D<bb.data_smart.DataSmart object at 0x7f0fd64ce640>, method_name=3D=
'sortable_revision'):
>          if not format:
>     >        raise FetchError("The SRCREV_FORMAT variable must be set whe=
n multiple SCMs are used.\n"\
>                               "The SCMs are:\n%s" % '\n'.join(scms))
> bb.data_smart.ExpansionError: Failure expanding variable fetcher_hashes_d=
ummyfunc[vardepvalue], expression was ${@bb.fetch.get_hashvalue(d)} which t=
riggered exception FetchError: Fetcher failure: The SRCREV_FORMAT variable =
must be set when multiple SCMs are used.
> The SCMs are:
> git://github.com/lf-edge/runx;nobranch=3D1;name=3Drunx;protocol=3Dhttps
> git://github.com/opencontainers/runc;branch=3Drelease-1.1;name=3Drunc;pro=
tocol=3Dhttps;destsuffix=3Dgit/src/import/gobuild/go/src/github.com/opencon=
tainers/runc
> The variable dependency chain for the failure is: fetcher_hashes_dummyfun=
c[vardepvalue]
>
> ERROR: Parsing halted due to errors, see error messages above
>

As I mentioned several times ... just use master-next. I'm more than
aware of what the patch does, and what it means.

I'm on holidays and without access to my normal build infrastructure,
so I'm only queuing changes until I return to the office tomorrow.

Bruce


> Cheers,
>
> -Mikko
>
> On Mon, Aug 28, 2023 at 02:28:34PM -0600, Javier Tia wrote:
> > Recipes that use multiple SCMs in the SRC_URI, must supply SRCREV_FORMA=
T
> > to avoid an expansion error.
> >
> > Signed-off-by: Javier Tia <javier.tia@linaro.org>
> > ---
> >  recipes-devtools/go/go-build_git.bb | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/recipes-devtools/go/go-build_git.bb b/recipes-devtools/go/=
go-build_git.bb
> > index 2337c9e1..2a78be01 100644
> > --- a/recipes-devtools/go/go-build_git.bb
> > +++ b/recipes-devtools/go/go-build_git.bb
> > @@ -4,12 +4,12 @@ DESCRIPTION =3D "Xen Runtime for OCI"
> >
> >  SRCREV_runx =3D "f24efd33fb18469e9cfe4d1bfe8e2c90ec8c4e93"
> >  SRCREV_runc =3D "1e7bb5b773162b57333d57f612fd72e3f8612d94"
> > -
> > +SRCREV_FORMAT =3D "runx"
> >  SRC_URI =3D "\
> > -       git://github.com/lf-edge/runx;nobranch=3D1;name=3Drunx;protocol=
=3Dhttps \
> > -          git://github.com/opencontainers/runc;branch=3Drelease-1.1;na=
me=3Drunc;protocol=3Dhttps;destsuffix=3Dgit/src/import/gobuild/go/src/githu=
b.com/opencontainers/runc \
> > -          file://0001-build-use-instead-of-go.patch \
> > -       "
> > +    git://github.com/lf-edge/runx;nobranch=3D1;name=3Drunx;protocol=3D=
https \
> > +    git://github.com/opencontainers/runc;branch=3Drelease-1.1;name=3Dr=
unc;protocol=3Dhttps;destsuffix=3Dgit/src/import/gobuild/go/src/github.com/=
opencontainers/runc \
> > +    file://0001-build-use-instead-of-go.patch \
> > +"
> >  SRC_URI[md5sum] =3D "0d701ac1e2a67d47ce7127432df2c32b"
> >  SRC_URI[sha256sum] =3D "5a26478906d5005f4f809402e981518d2b8844949199f6=
0c4b6e1f986ca2a769"
> >
> > --
> > 2.42.0
> >
>
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8269): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8269
> Mute This Topic: https://lists.yoctoproject.org/mt/101018420/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

