Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC212CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:46:48 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.216097.1697550403592407340
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 06:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kpMJw6GI;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-507ad511315so3098970e87.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Oct 2023 06:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697550402; x=1698155202; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoV6XGwoBnWNKcAtRa6T1mPYDb6IsZcKS5PUgjt7wrI=;
        b=kpMJw6GITqpFEzTvzrY4QDngJXlEkDOy0NapkEJCLuGFAhSB3hKt9IH5KTgqtsrsWw
         GZPGFtuxVg0PhZPLfcSwfs4xuK0jnCYeabhitB2SvGDj4j0nfr0VRhZmd0duQZPQT2kV
         MQBjeURSzRS/IfkFHxFW2tjb8VlVdgY/+9fHN2ASbNgBnqM78+qU2nW5O94mRDA8Jhio
         qcqyN5CTJNgaRZSMjaeJCxFOmTrYouw0U4j4RkqkVw2Ifb69nWmWbu+WSSozYQZfvIfU
         EvMc0GnfHqP9clsUQpR1sBIkNxKLPHtanpK42sFcxo81QZwYReP+r7cEmLQ5H3AdOHwn
         cGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697550402; x=1698155202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoV6XGwoBnWNKcAtRa6T1mPYDb6IsZcKS5PUgjt7wrI=;
        b=eng6ss7AG/GmkcyrzAISY0NVBlquP6I5/Xko0z6Y2RHW5COpsD85lHE2D566oDJi9c
         nR4FP8k2XFpPQ44yQHivTtYpaMJr+goB/7tMl6RV6GUDFh1713oaBiX0v0IDReJ+Gd2+
         TTCT7r/B+hqoM64lor5hws25WvMk5C+kK3mG6mBWq3vvRTmdl6Vox8HaYzoBd4OPEitq
         Fr4n5TXleVC7IfuzG0DerE3y3dMwoQ8F3ogSmBhRF2zv3PkhDU6CSkwBLX6eOVL8L/nl
         +1B3q23j2O9i6to3XSk5ueTx55XI/QomboIQURCEYoVOJcR+kzDPlEoKwCvPulqCAeN5
         koDA==
X-Gm-Message-State: AOJu0Yyqn5Qi84KWSL6YI9nLwLWMCzlQH2ovr8ToKryIfQk5Pp7X82A5
	TCVTqQfuOI9ZuPwKyhIKL3AxkHe3TTEaglOYGU0=
X-Google-Smtp-Source: AGHT+IHnq6PURdanIpEQ5R2ARV/REOoH0H9kgR/UtrFes+liU+RbfmvjtHB2V5abwNVIt6E1dNnF5O+gLlsGp9vVEDM=
X-Received: by 2002:a19:4f57:0:b0:507:b35d:833b with SMTP id
 a23-20020a194f57000000b00507b35d833bmr1890596lfk.14.1697550401528; Tue, 17
 Oct 2023 06:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231016212626.2146963-1-JPEWhacker@gmail.com> <CADkTA4P_isu6k8b=jp37=2BdfO6ka_WziiPTT0+__qAnPsa4pw@mail.gmail.com>
In-Reply-To: <CADkTA4P_isu6k8b=jp37=2BdfO6ka_WziiPTT0+__qAnPsa4pw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 17 Oct 2023 07:46:29 -0600
Message-ID: <CAJdd5GaLzmxW9gA8oy7iH428Pmw7GCh6r6wfRukUg5j4qHra+w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] classes/image-oci: Map x86_64 -> amd64
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Oct 2023 13:46:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8379

On Mon, Oct 16, 2023 at 7:35=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> On Mon, Oct 16, 2023 at 5:26=E2=80=AFPM Joshua Watt <JPEWhacker@gmail.com=
> wrote:
> >
> > OCI requires that the architecture [1] be a valid GOARCH [2]. "x86_64"
> > is not a valid GOARCH so map it to the correct "amd64" value.
> >
>
> It may require it, but I've never had any issues with a container running=
.
>
> Are you seeing a warning or something else ?

I haven't, but I noticed it was wrong

>
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> >
> > [1]: https://github.com/opencontainers/image-spec/blob/main/config.md#p=
roperties
> > [2]: https://go.dev/doc/install/source#environment
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  classes/image-oci.bbclass | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
> > index 9ddb88b..3370f86 100644
> > --- a/classes/image-oci.bbclass
> > +++ b/classes/image-oci.bbclass
> > @@ -52,7 +52,7 @@ OCI_IMAGE_AUTHOR_EMAIL ?=3D "${PATCH_GIT_USER_EMAIL}"
> >  OCI_IMAGE_TAG ?=3D "latest"
> >  OCI_IMAGE_RUNTIME_UID ?=3D ""
> >
> > -OCI_IMAGE_ARCH ?=3D "${TARGET_ARCH}"
> > +OCI_IMAGE_ARCH ?=3D "${@oci_map_arch(d.getVar('TARGET_ARCH'))}"
> >  OCI_IMAGE_SUBARCH ?=3D "${@oci_map_subarch(d.getVar('TARGET_ARCH'), d.=
getVar('TUNE_FEATURES'), d)}"
> >
> >  OCI_IMAGE_ENTRYPOINT ?=3D "sh"
> > @@ -74,6 +74,13 @@ OCI_IMAGE_ENV_VARS ?=3D ""
> >  # bundled into a tarball.
> >  OCI_IMAGE_TAR_OUTPUT ?=3D "true"
> >
> > +# Map architectures to a valid container arch. Note that the container=
 archs
> > +# should be a valid GOARCH
> > +def oci_map_arch(a):
> > +    if a =3D=3D "x86_64":
> > +        return "amd64"
> > +    return a
>
> If it is supposed to match to the goarch, why wouldn't we just use the
> goarch.bbclass mapping ?

Ah, that's a good idea. I think I'll move those functions to library
code though so that they can be used without the bbclass.

Thanks

>
> Bruce
>
> > +
> >  # Generate a subarch that is appropriate to OCI image
> >  # types. This is typically only ARM architectures at the
> >  # moment.
> > --
> > 2.34.1
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8378): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8378
> Mute This Topic: https://lists.yoctoproject.org/mt/102006091/3616693
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/1=
2677403/3616693/1765413136/xyzzy [JPEWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

