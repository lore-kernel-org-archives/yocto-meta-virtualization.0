Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.13602.1612889717675556312
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Feb 2021 08:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QPvFssl7;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id y18so24652908edw.13
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Feb 2021 08:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qxoAzwMegp0G1GEHxmVK7KiB5UKDFLaFhPtODW8qKR4=;
        b=QPvFssl7dzFr5vb1T4u3hmRB/CSqgvQQEgPgAXjF2QALtwND28RkEjC0xl4rVWX75a
         wyfixlMghLzrc1EU+AW9FCo5rs76lwvhg6C8luHMG28j3VPcwVLciZINauAEqQLkjPrM
         go4obg1Y7jemt+VjnWndBlAoGHuemlHxLqh8pc7oGp+p4mkFsQrF6OvtJy+DlNlk0BMV
         j+3gl7s8EV2rsLIVzZ1/cTfD1tm+Wmk8Eyp3QMC5LM3cKpS4rMt5Z21WYemHn2olpsFa
         vbjBSOGfZSA1Y/+m4JRqS0wN+9ehRCQIGQf/M41XGLARjSBGRbzov3XsFwVpz3aHNObE
         /Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qxoAzwMegp0G1GEHxmVK7KiB5UKDFLaFhPtODW8qKR4=;
        b=p86qE72apdX610iYkYKdTKApy9EDMAWh08w6Vq+l+MJ1jOqXjydU10T9KBI0pbol1U
         tQkvNPJ2gpTLocYvS4G3joIXDW1eoZ+hzh8ujBD/5IIYcZAmT9yBUXJALe2qpHOzVKWI
         GWctKZOd9XmPAvFSWCqaCumbW6uMJMfvbi/mr83vMsJztCbJPr91EjkaQ6zNOSZ+9Ggc
         ayPmMXzFdPyNpVAB91tfOSfp3ACEbUelOoNPfSs4ZR+t9Q689UwkgnRoxEsoqwLtWGuG
         TeBUVJPn9ZA3T7GLYO8r5dvC6ayAsfgqdZZVPfHXweN8xLpvEpOnEDnGy01NhJS+5Xan
         53bg==
X-Gm-Message-State: AOAM531RIwvzxy8fORR5kJXMrhbLgLhDZWlj7XxU0qxbI2+AsS/WaWXb
	1Jahb7BKyQegHgts0Ashbvk7MMfywK6PwVdJTMA=
X-Google-Smtp-Source: ABdhPJxOiL+9fyOJx3h3YWUeKaxqGnzrS01iAfeuibiBiq6AmpI3x370IJbqrcqCLvwCW6CJLfGzirrJYl+2g8Oqxt0=
X-Received: by 2002:a05:6402:4389:: with SMTP id o9mr23893271edc.164.1612889716248;
 Tue, 09 Feb 2021 08:55:16 -0800 (PST)
MIME-Version: 1.0
References: <PR3PR08MB5785F492BD5994B7E472DFD18D8E9@PR3PR08MB5785.eurprd08.prod.outlook.com>
In-Reply-To: <PR3PR08MB5785F492BD5994B7E472DFD18D8E9@PR3PR08MB5785.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 9 Feb 2021 11:55:05 -0500
Message-ID: <CADkTA4PJbhTb9kvaB5DxQC0wf=+u+FdAD_69Qid9rNsOaw1Mmw@mail.gmail.com>
Subject: Re: [meta-virtualization] Importing Docker Images
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	Diego Sueiro <Diego.Sueiro@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 9, 2021 at 11:22 AM Nathan Dunne <Nathan.Dunne@arm.com> wrote:
>
> Hi,
>
> I am looking for some community feedback on whether it would make sense =
to add support in meta-virtualization for including custom docker container=
 image tarballs. These container image tarballs would have been generated m=
anually by using a "docker export" command.

This is something we've talked about multiple times on the mailing
list and at various conferences, and it really doesn't fit properly
into the workflow.

We run into licensing, reproducibility, development and compatibility
issues very quickly.

I am working on extending the image-oci bbclass to use natively (OE)
based images and pre-populate them to be runnable via
podman/docker/runc at boot. That way, we have an integrated solution
that leverages all of the OE advantages.

(podman is actually easier than docker to do this on the build/cross side)

>
> Currently in meta-arm-autonomy we have:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm-autono=
my/recipes-containers/import-docker-image
> Which allows a single image file to be included, then imported at boot t=
ime. I am currently extending this to allow a list of image files rather th=
an only one, and to use docker-compose for easier control of multiple conta=
iners. This could live in meta-virtualization rather than meta-arm-autonomy=
 if the community believes this a good idea.

There are some points of collaboration, but as it currently sits (and
is designed), there are the issues that I mention above that are a
problem, before we'd want to endorse it as a supported / suggestion
option.

I'll work on getting my WIP image class pushed to master-next as soon
as possible, but I have some other pending issues to resolve first.

Bruce

>
> Let me know what you think,
> Nathan
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
