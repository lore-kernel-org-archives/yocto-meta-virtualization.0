Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.11949.1582119074453762877
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Feb 2020 05:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MKA884a/;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id p23so29115321edr.5
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Feb 2020 05:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Utt8ljNBVN2GJ0z43bRSO3gey+stXobW894NYQyYOuQ=;
        b=MKA884a//wE90DJC7BztoDjJwVn5NUD+1sxzVNIyKV7eVdiNxFkjVBni9FES+JoPDn
         IEjgZHLEparTB0wC9HhF1kSGq44BDubw+2bNa+wOwMW07JjvEPaGXyMW9kv5MmrUOnz8
         69d+8rxvrFqDoEh5BZ1on8OklU4WsquNsqqdFJ4vIjSYjqn68KAEejCUlPamFdSBHqJU
         ZSWLw4ocw2tKdAV7lueRWvzDzaS4B10GLZkN34INCuffCeqOAqUr/OxLsp5xy4lJinN/
         ymgZEB7Mv8PpTjbzVKgH+GL3YG7cHTF9WgIUB3P+IwKxr3CCGauiizxt6dWbRCJUYziD
         mwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Utt8ljNBVN2GJ0z43bRSO3gey+stXobW894NYQyYOuQ=;
        b=OyJaIPmgjD1qocoJlqdy0mqg9b2T15CW4XXiP4xp7V/RKy+uIsJYdBRgZWNh5YYY4c
         TfIabfT2GFMhp1s72N55JqsA726weDFpV0oiTdV5G2lGuYJPf23xJ9FHuACqbPSj0dYH
         NWHFxRE1tNjrQUg7G861pKme8VxsZlxHgkWyEX7SyqznkXeKFTSKNj/49s61XXCG/0EY
         sKzvuoCoji7paYudRf+L5pMPDQ5SNsB6Cb0OrmlV5Z6qq+iwjeZ86ClO2Th9cAOH4OG/
         USlmy58fggoD9ZqwzneFwJP7rg6+5euhPxlcARMTlVMIBHCIRszvhoRsBQ3Mp+xz4aUz
         XzVg==
X-Gm-Message-State: APjAAAWFT1cbZ0uXIV0ji0NeDbdzntnpsQ4ICumYo9xqMnxPtRnzcMRy
	AHeYWgtDIHB+bnFKwBkuaBTpgBSypE+NrQFKMxg=
X-Google-Smtp-Source: APXvYqyLsh+N+On/vjGLFjDZnIvNzdnYCHv1HaYCHtgNduBHooEzyh2I2BnM25LtsTlKMz6fhZ6KvZZHbeCEfHtcag4=
X-Received: by 2002:a17:906:f49:: with SMTP id h9mr25257036ejj.6.1582119072896;
 Wed, 19 Feb 2020 05:31:12 -0800 (PST)
MIME-Version: 1.0
References: <15F33D74C6BC534D.11355@lists.yoctoproject.org> <74D7E070-D2BE-4A70-9394-0DE45CC5E06C@arm.com>
In-Reply-To: <74D7E070-D2BE-4A70-9394-0DE45CC5E06C@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 19 Feb 2020 08:31:01 -0500
Message-ID: <CADkTA4MmNbkXjMQCJGF4NME4Vp0mgH8KUbL2a5c5Q-ZWpMo=ag@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] Xen: fix do_deploy dependencies
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 8:09 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
>
> > On 14 Feb 2020, at 10:17, Bertrand Marquis via Lists.Yoctoproject.Org <=
bertrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
> >
> > do_deploy is using the files installed during do_install and it must be
> > executed after it but before do_build. This is fixing SSTATE behaviour
> > which had previously an empty scene in some cases.
>
> Any chance somebody could check and ack on this ?
>

There's an entire update / re-work of Xen on the mailing list. I won't
be merging any Xen patches until we have that sorted out.

Cheers,

Bruce

> While there, it would make sense to also push this in zeus branch.
>
> =E2=80=94
> Bertrand Marquis
>
> >
> > Change-Id: I04b1f652c697ed0bc7e262571dd03e123ac096f6
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> > recipes-extended/xen/xen.inc | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.in=
c
> > index 36ab78e..41b1983 100644
> > --- a/recipes-extended/xen/xen.inc
> > +++ b/recipes-extended/xen/xen.inc
> > @@ -1099,7 +1099,9 @@ do_deploy() {
> >     fi
> > }
> >
> > -addtask deploy after do_populate_sysroot
> > +# do_deploy is using files created during do_install so force it to be=
 called
> > +# after do_install but before do_build
> > +addtask deploy before do_build after do_install
> >
> > # Enable use of menuconfig directly from bitbake and also within the de=
vshell
> > OE_TERMINAL_EXPORTS +=3D "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
> > --
> > 2.17.1
> >
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
