Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web12.9296.1634648256325870717
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 05:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vrt1Q1jd;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id r18so12692622edv.12
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Oct 2021 05:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0t+ASoo7C6lefW0sMzmuNRM6iY1RJC4bN5BHPKWSlDU=;
        b=Vrt1Q1jdhTIv2JydCzlnwJRw97fiLrJ1cQwfGXtL5LgaNs2Q+JtX0pT8qX7nP1XbWT
         dY2JQ96+bwfyswzbCC7Rg4+Qq7ME6feApSelyqo3I0xXlr2jdvNbIzaIVWgy3OOrNQRK
         nyi1T1TOru3tSgTD+9k3LPjJkUoPHsQ9dkVFwkzGWwWPs0dl8v5Wvq4fIyG22ezzm9KV
         qBhwetIrGLXUEPYaGF2fMHVPg1lrvL6kqVwt+yftMNQfxoGlRaSIUWaItPhujyWjn6//
         v0yu4OCkz2YGZKyyHuquSEcLmqnk8ru7syhEkBjmL6z4msZd4RkYVN+ok0R6BAKCzojH
         DYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0t+ASoo7C6lefW0sMzmuNRM6iY1RJC4bN5BHPKWSlDU=;
        b=rinbxGCeG1cRc/HTMVe4uAv3rwnByEMo0DkQJPvoiTA3r+YbT5V3cyvFp+Xq6X1HJE
         paOyV6+Yoz6BQoN8mCAlGiNUXmGFkbwH8PCucQX1SoO3etE7+HyohHcRCr0j/u+1ka4X
         0PBJDktkpfbwgnj6ukbF/ivPZjuGYvuZtlwCpm8dlhfQGURlE82sur9TJu6yIP92J09C
         IPo19R1WWrPfyU2qbcsqwI5HfuR3MUdW+IoaGhWqqCl/5Os7bzMX+1Q7qsg9yOe8T2tE
         Ph2aqMGCj1Pr3Y8njQecGpIxF06BgLNQ1dlEZawPVOmoAluURi0R9mdoUuoGJQLaUBIJ
         dvZw==
X-Gm-Message-State: AOAM530w5fOLmoxdwQuMPog+gUpkii56hnFefcvYAFdUFmQGYxFzZZ/n
	NvUbT0l+sOggugx+FUerNCsaGdofLjB6ef3Ysf4=
X-Google-Smtp-Source: ABdhPJwDM3t3YNv/0KJl+nexdLxJISHR7GFEAPIvOITRCsnvJXarSTCwh9T+xA5qZi7koQlH509d0DnUPeYSljPyU/I=
X-Received: by 2002:a17:906:d541:: with SMTP id cr1mr39622616ejc.81.1634648254676;
 Tue, 19 Oct 2021 05:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR08MB3461855CC2F90763C0EF3CD792BC9@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CADkTA4P4yE8O4yita6H+vd1Xaz8h-iFJaA6MwHFo-1Fr8gQeBQ@mail.gmail.com> <AM6PR08MB3461304C6D920C9BA19270DC92BD9@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB3461304C6D920C9BA19270DC92BD9@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 19 Oct 2021 08:57:23 -0400
Message-ID: <CADkTA4PCh1b88QY_8AyEst4Z5KMXikjKP1GO9-6A2RLeLfQTZw@mail.gmail.com>
Subject: Re: [meta-virtualization] Issues with Setscene tasks
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 6:51 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
> Hi Bruce,
>
> This is the current fix that I have for docker-moby and cni recipes and I=
 think it is aligned with the patch that you linked since you are also sett=
ing the SRCREV_FORMAT:

Indeed.

I'll take care of the changes, since I can run tests as I go.

What branches are you using ? I can backport to wherever it makes sense.

Bruce

> ```
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-conta=
iners/docker/docker-moby_git.bb
> index defb321..f2ccfcd 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -47,6 +47,8 @@ SRC_URI =3D "\
>          file://0001-dynbinary-use-go-cross-compiler.patch \
>         "
>
> +SRCRV_FORMAT =3D "moby"
> +
>  require docker.inc
>
>  # Apache-2.0 for docker
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/c=
ni_git.bb
> index cb8d6ff..385d170 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -24,6 +24,8 @@ LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3Df=
a818a259cbed7ce8bc2a22d35a464
>
>  GO_IMPORT =3D "import"
>
> +SRCREV_FORMAT =3D "cni"
> +
>  PV =3D "v0.8.0+git${SRCREV_cni}"
>
>  inherit go
> ```
>
> ________________________________
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Sent: 18 October 2021 20:44
> To: Diego Sueiro <Diego.Sueiro@arm.com>
> Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org>; nd <nd@arm.com>
> Subject: Re: [meta-virtualization] Issues with Setscene tasks
>
> On Mon, Oct 18, 2021 at 3:30 PM Diego Sueiro <diego.sueiro@arm.com> wrote=
:
> >
> > Hi,
> >
> >
> >
> > Recently I realized that we are having issues with setscene tasks (for =
docker-moby and cni recipes) where the packages were rebuild even already h=
ave their tasks in the sstate mirror and bitbake-diffsigs not showing any d=
ifference.
> > This is the sample of the output that I was getting:
> > ```
> >
> > WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neo=
versen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r=
0/temp/log.do_package_qa_setscene.3335
> >
> > WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-netw=
orking/cni/cni_git.bb:do_package_qa_setscene) failed with exit code '1' - r=
eal task will be run instead
> >
> > WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neo=
versen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-0=
/temp/log.do_package_write_rpm_setscene.3336
> >
> > WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-netw=
orking/cni/cni_git.bb:do_package_write_rpm_setscene) failed with exit code =
'1' - real task will be run instead
> >
> > WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neo=
versen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r=
0/temp/log.do_populate_lic_setscene.3337
> >
> > WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-netw=
orking/cni/cni_git.bb:do_populate_lic_setscene) failed with exit code '1' -=
 real task will be run instead
> >
> > WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neo=
versen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r=
0/temp/log.do_populate_sysroot_setscene.3338
> >
> > WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-netw=
orking/cni/cni_git.bb:do_populate_sysroot_setscene) failed with exit code '=
1' - real task will be run instead
> >
> > WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neo=
versen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r=
0/temp/log.do_package_qa_setscene.3339
> >
> > WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-netw=
orking/cni/cni_git.bb:do_packagedata_setscene) failed with exit code '1' - =
real task will be run instead
> >
> > WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neo=
versen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r=
0/temp/log.do_package_setscene.3380
> >
> > WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-netw=
orking/cni/cni_git.bb:do_package_setscene) failed with exit code '1' - real=
 task will be run instead
> >
> > WARNING: Logfile for failed setscene task is /<snip>/build/tmp/work/neo=
versen1-poky-linux/cni/v0.8.0+gitb5ab16f010e822936eb974690ecec38ba69afc01-r=
0/temp/log.do_deploy_source_date_epoch_setscene.3383
> >
> > WARNING: Setscene task (/<snip>/layers/meta-virtualization/recipes-netw=
orking/cni/cni_git.bb:do_deploy_source_date_epoch_setscene) failed with exi=
t code '1' - real task will be run instead
> >
> > ```
> >
> >
> >
> > After some debugging I found that the =E2=80=9Cfailed with exit code 1=
=E2=80=9D comes from this line http://git.yoctoproject.org/cgit/cgit.cgi/po=
ky/tree/meta/classes/sstate.bbclass#n764:
> > ```
> >
> > localdata.setVar('SRCPV', d.getVar('SRCPV'))
> > ```
> >
> >
> > The root cause is because the cni and docker-moby recipes are using nam=
ed SRC_URI (a.k.a http://...;name=3Dfoo), setting the PV with it and were n=
ot setting the SRCREV_FORMAT which consequentially not set the SRCPV accord=
ingly.
> >
> >
> >
> > Setting the SRCREV_FORMAT for cni and docker-moby recipes fixed the iss=
ue, but I also suspect that the following recipes are potentially having th=
e same issue:
> >
> > ```
> > $ grep -r PV | grep SRCREV_
> >
> > recipes-core/runx/runx_git.bb:PV =3D "v1.0-git${SRCREV_runx}"
> >
> > recipes-core/runv/runv_git.bb:PV =3D "0.4.0+git${SRCREV_runv}"
> >
> > recipes-containers/docker/docker-ce_git.bb:PV =3D "${DOCKER_VERSION}+gi=
t${SRCREV_docker}"
> >
> > recipes-containers/docker/docker-moby_git.bb:PV =3D "${DOCKER_VERSION}+=
git${SRCREV_moby}"
> >
> > recipes-containers/cri-o/cri-o_git.bb:PV =3D "1.22.0+git${SRCREV_cri-o}=
"
> >
> > recipes-containers/kubernetes/kubernetes_git.bb:PV =3D "v1.22.2+git${SR=
CREV_kubernetes}"
> >
> > recipes-containers/cri-tools/cri-tools_git.bb:PV =3D "1.21.0+git${SRCRE=
V_cri-tools}"
> >
> > recipes-containers/crun/crun_git.bb:PV =3D "0.18+git${SRCREV_crun}"
> >
> > recipes-networking/cni/cni_git.bb:PV =3D "v0.8.0+git${SRCREV_cni}"
> >
> > recipes-devtools/yq/yq_git.bb:PV =3D "1.13.1+git${SRCREV_yq}"
> >
> > recipes-devtools/go/go-build_git.bb:PV =3D "0.1-git${SRCREV_runx}"
> >
> > ```
> >
> >
> >
> > I can send a patch to fix cni and docker-moby but unfortunately I don=
=E2=80=99t have resources to test the other mentioned recipes.
> >
>
> I've actually been going through and fixing these as they pop up, and
> just had to do it for kubernetes:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?h=
=3Dmaster-next&id=3D45e5f2e821784f0b55a41ee5f08d7acb98f8f288
>
> If you were doing anything other than what you see that I did in that
> recipe, let me know. Otherwise, I'll make a similar change globally to
> the layer.
>
> Bruce
>
> >
> >
> > --
> > Diego Sueiro
> > Staff Software Developer =E2=80=93 Automotive and Industrial Solutions =
(CE-OSS)
> >
> >
> >
> >
> >=20
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
