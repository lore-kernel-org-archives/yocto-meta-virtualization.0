Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.150.1634586311984194586
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 12:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CSwmDagx;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id a25so3488487edx.8
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Oct 2021 12:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zRGBsV7DasUBa+e0hAfIPOYZXODEs5ktQKS9uxaHMQw=;
        b=CSwmDagx+2PKZaNlIUh4AxBopAzxLpgxLNlGe7RrlY7ZwCF7QciRRlmUh43XUYiyxU
         uDgRjjURX2J6NJj7eUsfRxIPAuDHh9+O+tR6BmawVWewb3i4Rt2nNKuK0dPVxGe8BVQ1
         PY8gXdge1xxNDERJlOWEmRCM3cLbq4uRRzTsbgsxKkw+DkK1qx/RDC3yDG5Z09lpEuhK
         JtSilQ7fHRXhudHMlRylep8cFRKGusZSA+B7WCrmlwi4MJdzurBMr7k4VA8FqVRRpBwL
         4cb3Zobis0Zsii3DM2eqB9s3pT8141MZF/tHFkbwqxsfNC9O9HtUJbBE/LHzThH9jMrw
         hUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zRGBsV7DasUBa+e0hAfIPOYZXODEs5ktQKS9uxaHMQw=;
        b=sNIFiEn0hK8hDSetiFBRohCgNNJuoAxOrYTGHClqQVvbiJLESUjTo1BZie3/9LoQS0
         JtBlUM2BAZNtNGTy5apbvXt2yX/PWYTL2QgaEkPm6ECWgnI/NgYTmeN7i0BmSSf9EJpn
         s6uvmAAQ6lo1YGcZrUU6E+aQJ5vxqlTbP0FIb1mBUK4H1ooZNgyaVK8eqY8W48XYjQhd
         j5ow+pIE+qgVthpWUeGcIS4uoxvtvkRpM4cduwBoKj31fzZgv1JuvGNrqcwQ2UyjWXJt
         d7RubvNU++NeOX+GwETOw9Z45OIzb2o+2ANkKzIxgJy4kuC4vdiknC1DUEmBPgEq/pVX
         8jYA==
X-Gm-Message-State: AOAM532fpz+0xgcdVE0zwtihhziG9xg0KZ4N9yS3AkMPYs9/HrUeXG82
	bVmdI1c0Bj0AOmb3cvuuE7ckTaZZa4+Pzch5sI8=
X-Google-Smtp-Source: ABdhPJyctsgvBzimQnSihiHOpW/tz9dngbNoOkRZgm0flVOEgHR4neQrFrmrJE1qsHtJs/zV6ez8qlHKbMOMVnrlGG4=
X-Received: by 2002:a17:906:d541:: with SMTP id cr1mr33760846ejc.81.1634586310374;
 Mon, 18 Oct 2021 12:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR08MB3461855CC2F90763C0EF3CD792BC9@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB3461855CC2F90763C0EF3CD792BC9@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 18 Oct 2021 15:44:59 -0400
Message-ID: <CADkTA4P4yE8O4yita6H+vd1Xaz8h-iFJaA6MwHFo-1Fr8gQeBQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Issues with Setscene tasks
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2021 at 3:30 PM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> Hi,
>
>
>
> Recently I realized that we are having issues with setscene tasks (for do=
cker-moby and cni recipes) where the packages were rebuild even already hav=
e their tasks in the sstate mirror and bitbake-diffsigs not showing any dif=
ference.
> This is the sample of the output that I was getting:
> ```
>
> WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neove=
rsen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r0/=
temp/log.do_package_qa_setscene.3335
>
> WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-networ=
king/cni/cni_git.bb:do_package_qa_setscene) failed with exit code '1' - rea=
l task will be run instead
>
> WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neove=
rsen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-0/t=
emp/log.do_package_write_rpm_setscene.3336
>
> WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-networ=
king/cni/cni_git.bb:do_package_write_rpm_setscene) failed with exit code '1=
' - real task will be run instead
>
> WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neove=
rsen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r0/=
temp/log.do_populate_lic_setscene.3337
>
> WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-networ=
king/cni/cni_git.bb:do_populate_lic_setscene) failed with exit code '1' - r=
eal task will be run instead
>
> WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neove=
rsen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r0/=
temp/log.do_populate_sysroot_setscene.3338
>
> WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-networ=
king/cni/cni_git.bb:do_populate_sysroot_setscene) failed with exit code '1'=
 - real task will be run instead
>
> WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neove=
rsen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r0/=
temp/log.do_package_qa_setscene.3339
>
> WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-networ=
king/cni/cni_git.bb:do_packagedata_setscene) failed with exit code '1' - re=
al task will be run instead
>
> WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neove=
rsen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r0/=
temp/log.do_package_setscene.3380
>
> WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-networ=
king/cni/cni_git.bb:do_package_setscene) failed with exit code '1' - real t=
ask will be run instead
>
> WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neove=
rsen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r0/=
temp/log.do_deploy_source_date_epoch_setscene.3383
>
> WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-networ=
king/cni/cni_git.bb:do_deploy_source_date_epoch_setscene) failed with exit =
code '1' - real task will be run instead
>
> ```
>
>
>
> After some debugging I found that the =E2=80=9Cfailed with exit code 1=E2=
=80=9D comes from this line http://git.yoctoproject.org/cgit/cgit.cgi/poky/=
tree/meta/classes/sstate.bbclass#n764:
> ```
>
> localdata.setVar('SRCPV', d.getVar('SRCPV'))
> ```
>
>
> The root cause is because the cni and docker-moby recipes are using named=
 SRC_URI (a.k.a http://...;name=3Dfoo), setting the PV with it and were not=
 setting the SRCREV_FORMAT which consequentially not set the SRCPV accordin=
gly.
>
>
>
> Setting the SRCREV_FORMAT for cni and docker-moby recipes fixed the issue=
, but I also suspect that the following recipes are potentially having the =
same issue:
>
> ```
> $ grep -r PV | grep SRCREV_
>
> recipes-core/runx/runx_git.bb:PV =3D "v1.0-git${SRCREV_runx}"
>
> recipes-core/runv/runv_git.bb:PV =3D "0.4.0+git${SRCREV_runv}"
>
> recipes-containers/docker/docker-ce_git.bb:PV =3D "${DOCKER_VERSION}+git$=
{SRCREV_docker}"
>
> recipes-containers/docker/docker-moby_git.bb:PV =3D "${DOCKER_VERSION}+gi=
t${SRCREV_moby}"
>
> recipes-containers/cri-o/cri-o_git.bb:PV =3D "1.22.0+git${SRCREV_cri-o}"
>
> recipes-containers/kubernetes/kubernetes_git.bb:PV =3D "v1.22.2+git${SRCR=
EV_kubernetes}"
>
> recipes-containers/cri-tools/cri-tools_git.bb:PV =3D "1.21.0+git${SRCREV_=
cri-tools}"
>
> recipes-containers/crun/crun_git.bb:PV =3D "0.18+git${SRCREV_crun}"
>
> recipes-networking/cni/cni_git.bb:PV =3D "v0.8.0+git${SRCREV_cni}"
>
> recipes-devtools/yq/yq_git.bb:PV =3D "1.13.1+git${SRCREV_yq}"
>
> recipes-devtools/go/go-build_git.bb:PV =3D "0.1-git${SRCREV_runx}"
>
> ```
>
>
>
> I can send a patch to fix cni and docker-moby but unfortunately I don=E2=
=80=99t have resources to test the other mentioned recipes.
>

I've actually been going through and fixing these as they pop up, and
just had to do it for kubernetes:

https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=3D=
master-next&id=3D45e5f2e821784f0b55a41ee5f08d7acb98f8f288

If you were doing anything other than what you see that I did in that
recipe, let me know. Otherwise, I'll make a similar change globally to
the layer.

Bruce

>
>
> --
> Diego Sueiro
> Staff Software Developer =E2=80=93 Automotive and Industrial Solutions (C=
E-OSS)
>
>
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
