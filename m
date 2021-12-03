Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.11924.1638540482385714143
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 06:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TMUWS+fX;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id g14so11897492edb.8
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Dec 2021 06:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Jbo4VodSzy35dWLzN7WqMOHWHlWf2IiumPLFJ1XrE0c=;
        b=TMUWS+fX0CEv4rF4cMWDX1mIkrOUyFwtY7XgbUnM2ckF9hLt5oc+PuYxD9wOWMHy2D
         S8Kju3dBdmM/F0OIKe29mo7DsKvcM14ix9NZ/M68xnKL+Csg+YN0xnwolEbEDsrVLLKj
         YmxXc4v9ZiSjadqjRb0wZeTXNh3GmJCT02R/poxpqUoyrlOxFwGmNA6PGOHLQRk2NUXh
         dLq2YLnVlCQCFbc4MvylrURj6pPkDyseROgfVAQH+zq1g13iGteng5JEFLXBoF7gh1Gg
         WqxuvwKKPGrOswrNVUlSguZT67x/qdxIwkYqUscPCCuAp6w4l0Olr3cLLWshKEuiQS/q
         3arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Jbo4VodSzy35dWLzN7WqMOHWHlWf2IiumPLFJ1XrE0c=;
        b=KPah2Xx+7HwjParOLRmPBCwuz0mO299cpouV7JqNjsEnsISzSjm2UZLIyfWO+SiM2s
         VwfQ401KnWWvcrlUU8dW0dPWWHhgmjhaa/+Fl6oQGwhc3qPazo+w2CTB13+coRHbwE41
         wtr4iP4J41BWGA3ILBjU03hgw3heuirreAjld+xf5Guvt5sbmA7re+JXDBnfp9b4aotr
         6MXfMNVJfmcPJ9Dwd+PMmj8xlvphDBUY1Qd1zgPV4esjgGWO3Zf6Yvg4umJW9ihJQYUF
         gIqmmUHd5IC+eDRzQwP7w7WndQAU6RdyYFEnkwretI2qGqmqLoXvWDdIBixyO7EASRzy
         N0aA==
X-Gm-Message-State: AOAM53145MK9Khthdxx1nmvOJebxMivR7+0d5/+psRaAfPiUgt7AUKD9
	fyH8Utmdf+PK9CmEcgdL/Wcja2UoFq6V0dsls3k=
X-Google-Smtp-Source: ABdhPJyKOXkaY/AzPXhGpcm/8N0kpFWkB+2V79QJTmGH8m5bWNO0QGA0/OIPZguPhNAp4aNqiQoeKhVTDy60R9670w0=
X-Received: by 2002:a05:6402:1a42:: with SMTP id bf2mr25537227edb.64.1638540463381;
 Fri, 03 Dec 2021 06:07:43 -0800 (PST)
MIME-Version: 1.0
References: <20211203130427.8027-1-s.mueller-klieser@phytec.de>
In-Reply-To: <20211203130427.8027-1-s.mueller-klieser@phytec.de>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 3 Dec 2021 09:07:32 -0500
Message-ID: <CADkTA4OWD+Goy7XBZUFaW60fnD-wpFjaBVKLKc1t978g9u+mSw@mail.gmail.com>
Subject: Re: [meta-virtualization][hardknott][PATCH] oci-runtime-spec: fix url
To: Stefan Mueller-Klieser <S.Mueller-Klieser@phytec.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Since we already have these changes in master, this is fundamentally a
cherrypick / backport request.

There are a couple of larger/group patches for the protocol and branch
changes, but there's an individual one for the switch to main.

I cherry-picked and modified everything, and pushed it to
hardknott-next .. have a look and let me know if anything needs
adjustment.

Bruce

On Fri, Dec 3, 2021 at 8:04 AM Stefan Mueller-Klieser
<S.Mueller-Klieser@phytec.de> wrote:
>
> Upstream renamed master to main and github will remove the git protocol.
>
> Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
> ---
>  recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb =
b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
> index c4083c09d818..99f309772310 100644
> --- a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
> +++ b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=
=3Db355a61a394a504dacde901c9
>  SRCNAME =3D "runtime-spec"
>
>  PKG_NAME =3D "github.com/opencontainers/${SRCNAME}"
> -SRC_URI =3D "git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME}"
> +SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps;destsu=
ffix=3Dgit/src/${PKG_NAME}"
>
>  SRCREV =3D "78ab98c0761136f84e6e21b24b4dcd0be68ab782"
>  PV =3D "v1.0.1+git${SRCPV}"
> --
> 2.20.1
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
