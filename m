Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.12981.1583335801793654733
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Mar 2020 07:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AAGwLBzX;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id a141so2305758wme.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Mar 2020 07:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2NCmcvThChv09U6iQLQy6bWJb5Px2I0HUAnqAdeKtyg=;
        b=AAGwLBzXJyBTQJzVfkBnAqLmUi3JZLNxm0eYDONQ8cFgZeh3q8reK/5C72ruI7A+ss
         bbJcl7tdO4pV3xi1jgY6My8jUfXsVrD7+bqB3h/ziweCE13/jvMmj7puL1i4cxsTrQr+
         GXM4C79hi0wXhk6JuUKpc1y+pZquk7TynYMmpNuXzjqHnIoqFPFhjz/M8+6ugC5aGhVZ
         rbFkNROZ+k+HvmriBCJ3Df1xVfwrrtTWQS93hyhW1cQa2d+hOxDbF3xb5J7yVCo2jLQN
         niud0hsS3sP5wPdGyJlxYKCyWrMZi7//p22lol+pe/yxMLe3NA1YmYsxG3cdPH5uIaHl
         dO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2NCmcvThChv09U6iQLQy6bWJb5Px2I0HUAnqAdeKtyg=;
        b=K8TmrgugSy2v9jmZqnG4qWJfGWMMPocyGVwJtMQuUoT74q3qvhWdotMsD3JvGaGrCg
         n0o1hRUbnn9nGwMB7gDyFJd0+uZ10L/aK9VBFbASf4qprHDeTw8imnYaCpH7fhaAEb2h
         ersGSgDsowMZB8XXUKK2ZtZI+DWMrs9kEUbmevyxAR6LEMGUiWL8/11B9cDAuO5nm4cG
         K8f1zKidzKIaj2zOoVoN3rUrEc1AoepSv7duAPpte5CjUXPZFY9hvRMHG1lxb2XK2+og
         SxdNorJQqEO4EKkJzWH8OMpwIjBYNWooMAanE1yDyqjYf3M1lI5tcfLSM4lspjCKMmtP
         9z7Q==
X-Gm-Message-State: ANhLgQ3UyYZCy0hwQO0vS+0xMFfBOIotNtnEeIIWz0rQdkBJJazTyHGm
	3aEhp02iKYyJZmEfVYhmCZyKJ6SH
X-Google-Smtp-Source: ADFU+vvtUk2VM9nzdS2TFVrD10qKO2ujKIzN6ydcsIEWrXhWWSCXzgl31auaBmQz1cZizFtuWK23OQ==
X-Received: by 2002:a1c:1b86:: with SMTP id b128mr3954776wmb.64.1583335799878;
        Wed, 04 Mar 2020 07:29:59 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b24sm4658908wmj.13.2020.03.04.07.29.58
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 07:29:58 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 4 Mar 2020 16:29:58 +0100
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/2] xen-tools: fix COMPATIBLE_HOST restriction for i686
Message-ID: <20200304152958.vnvz4t66ln2xyijl@jama>
References: <15F8D09CD90CE2BE.3586@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <15F8D09CD90CE2BE.3586@lists.yoctoproject.org>
User-Agent: NeoMutt/20180716
X-Groupsio-MsgNum: 5197
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fpbwu6a6k6knddg3"
Content-Disposition: inline

--fpbwu6a6k6knddg3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2020 at 03:10:35PM +0100, Martin Jansa via Lists.Yoctoproje=
ct.Org wrote:
> * let TARGET_VENDOR to be set to something else than the default:
>   meta/conf/bitbake.conf:TARGET_VENDOR =3D "-oe"
>   like other architectures use
> ---
>  recipes-extended/xen/xen-tools.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/x=
en-tools.inc
> index 8bdbfec..8b86f7b 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Xen hypervisor tools"
>  DESCRIPTION =3D "Tools and utility software for the Xen hypervisor"
>  
> -COMPATIBLE_HOST =3D 'i686-oe-linux|(x86_64.*).*-linux|aarch64.*-linux|a=
rm-.*-linux-gnueabi'
> +COMPATIBLE_HOST =3D 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux|a=
rm-.*-linux-gnueabi'
>  
>  inherit setuptools3 update-rc.d systemd deploy
>  require xen-blktap.inc

Not really caused by this change, but now when the build can be started
it fails for me with:
error: mapfile-GNU:1:9: invalid use of VERSION in input file
Makefile:52: recipe for target 'libxenfsimage.so.4.12.0' failed

Anyone else seeing this? It's actually raspberrypi4 world build, so the
COMPATIBLE_HOST above isn't related at all in this case.

> --=20
> 2.20.1
>=20

>=20


--fpbwu6a6k6knddg3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXl/JdQAKCRA3VSO3ZXaA
HFsVAKCUT2uv2TymVT86ONCKg9N+dEKN/ACfVSPnLwARptmNiOYD9/LbCgB5kjQ=
=aNDz
-----END PGP SIGNATURE-----

--fpbwu6a6k6knddg3--
