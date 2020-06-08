Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.29181.1591620844830525505
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 05:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BjnyIy2r;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id q13so13350157edi.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Jun 2020 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fVQNVjTS0eL6gxKVYrmD19aM1yzJZ5Xg1VW99o/2GVo=;
        b=BjnyIy2r7xbePGupM81UVJcza1OzCOVIVm7VavzEEKyN3583LKJIMtzn3TsDD0Rkc5
         xcS1kDMtJVY62SeP8RiaSDE6+4k42axs9qAuQHnlmvxei39ZoVK+uUP2HZ/ZHKrNCYO3
         H+KGv/e8oC6/nvra6JEAvsO+L5BNYgeE5UN/3lOVTIQNa3UkWt2u2GuLdJsuq+L2KYfG
         q/9GpGuhq3ivHFWM/cLQrhnbDmU+aLkscPgdcIKTaFXsZV62vTEYplKqMIrqk3kcFCIe
         9r0Sdh8HBkEgdmHZAbn4pXaPMX9CRwQ9xGuLuLNFXIrFh+NOj3CFyJEKTBupcYX04Xlb
         7/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fVQNVjTS0eL6gxKVYrmD19aM1yzJZ5Xg1VW99o/2GVo=;
        b=jBVyMaS93z/ZktWKTvCPNpuya3P2OVi/O4jDF2w2QKKGGfWgxaWbCerh46XWl/fZzI
         BRHgjMOh2dVcV3CuHbpgS7s5KkBtsq1+91wB5KTPSXGUAscn8vPNJSLsG0z34e0ykBfg
         JAG2GI231FLJE4CgywoUJH8KgJu8lCvg6UGeqsPfK/OVsM+Ly/aJBQgVKDSH9fEI7/9B
         oQownJ7QyI/sbVIFOisGN1WcPAoow4MxdfQOLvoG2wYxsqJCDW1PpazEXR5W0nXWY1o8
         BMcSlZ8ONHP6mkho9YPho+BguW6HvEfbxiK4e7W0gJmojvM9IAmL8mypkx6/7YRoOrD/
         Is9w==
X-Gm-Message-State: AOAM531LGszlLY1zZIsdHeowFucqRjbsz+853actn6ZvJ2/l1zDXFLmz
	gRqFU8qjp7F/gU8XgbeVKoFuLZYY037XtckciHnC6ALYJDM=
X-Google-Smtp-Source: ABdhPJyBSipubn5XCB/Dumfyj18PcmGFiR/EYn/IBB8+FJ8JIHRAWdLEn3FtVGlcDufXdddvY9Gli6m+nG6rZCMv9RE=
X-Received: by 2002:aa7:d359:: with SMTP id m25mr21107187edr.365.1591620843170;
 Mon, 08 Jun 2020 05:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200608034208.112106-1-Qi.Chen@windriver.com> <161692922988E497.22829@lists.yoctoproject.org>
In-Reply-To: <161692922988E497.22829@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 8 Jun 2020 08:53:51 -0400
Message-ID: <CADkTA4MBGkgVjVSEGapi266R3binp3ToSA8LvV_au-h81JnZKQ@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH] meta-openstack: be compatible with dunfell
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Chen Qi <Qi.Chen@windriver.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 8, 2020 at 8:51 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> Hmm.  I already did a patch for this, it looks like I forgot to push it :(
>

oh wait, I see my dunfell patch.

I excluded those layers on purpose, since the deployment hasn't been
tested in quite a while. Did you confirm that the layers build when
bumping the compatibility. I honestly expect runtime errors .. but did
anyone try booting with them enabled ?

Bruce

> Bruce
>
> On Sun, Jun 7, 2020 at 11:42 PM Chen Qi <Qi.Chen@windriver.com> wrote:
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta-openstack-aio-deploy/conf/layer.conf             | 2 +-
> >  meta-openstack-compute-deploy/conf/layer.conf         | 2 +-
> >  meta-openstack-compute-test-config/conf/layer.conf    | 2 +-
> >  meta-openstack-controller-deploy/conf/layer.conf      | 2 +-
> >  meta-openstack-controller-test-config/conf/layer.conf | 2 +-
> >  meta-openstack-qemu/conf/layer.conf                   | 2 +-
> >  meta-openstack-swift-deploy/conf/layer.conf           | 2 +-
> >  7 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta-openstack-aio-deploy/conf/layer.conf b/meta-openstack-aio-deploy/conf/layer.conf
> > index f3d2c5f2..c8bdaff5 100644
> > --- a/meta-openstack-aio-deploy/conf/layer.conf
> > +++ b/meta-openstack-aio-deploy/conf/layer.conf
> > @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
> >  BBFILE_COLLECTIONS += "openstack-aio-deploy-layer"
> >  BBFILE_PATTERN_openstack-aio-deploy-layer := "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_openstack-aio-deploy-layer = "6"
> > -LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "thud warrior zeus"
> > +LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "thud warrior zeus dunfell"
> >
> >  LAYERDEPENDS_openstack-aio-deploy-layer = " \
> >         core \
> > diff --git a/meta-openstack-compute-deploy/conf/layer.conf b/meta-openstack-compute-deploy/conf/layer.conf
> > index e25cf3e0..3d700330 100644
> > --- a/meta-openstack-compute-deploy/conf/layer.conf
> > +++ b/meta-openstack-compute-deploy/conf/layer.conf
> > @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
> >  BBFILE_COLLECTIONS += "openstack-compute-deploy-layer"
> >  BBFILE_PATTERN_openstack-compute-deploy-layer := "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_openstack-compute-deploy-layer = "6"
> > -LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "thud warrior zeus"
> > +LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "thud warrior zeus dunfell"
> >
> >  LAYERDEPENDS_openstack-compute-deploy-layer = " \
> >         core \
> > diff --git a/meta-openstack-compute-test-config/conf/layer.conf b/meta-openstack-compute-test-config/conf/layer.conf
> > index dfa5f31b..b082d609 100644
> > --- a/meta-openstack-compute-test-config/conf/layer.conf
> > +++ b/meta-openstack-compute-test-config/conf/layer.conf
> > @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "openstack-compute-test-config-layer"
> >  BBFILE_PATTERN_openstack-compute-test-config-layer := "^${LAYERDIR}/"
> >  # We want this layer to have higher priority than any other meta-openstack layers
> >  BBFILE_PRIORITY_openstack-compute-test-config-layer = "100"
> > -LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "thud warrior zeus"
> > +LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "thud warrior zeus dunfell"
> >
> >  LAYERDEPENDS_openstack-compute-test-config-layer = " \
> >         openstack-compute-deploy-layer \
> > diff --git a/meta-openstack-controller-deploy/conf/layer.conf b/meta-openstack-controller-deploy/conf/layer.conf
> > index e8be8321..e9786313 100644
> > --- a/meta-openstack-controller-deploy/conf/layer.conf
> > +++ b/meta-openstack-controller-deploy/conf/layer.conf
> > @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
> >  BBFILE_COLLECTIONS += "openstack-controller-deploy-layer"
> >  BBFILE_PATTERN_openstack-controller-deploy-layer := "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_openstack-controller-deploy-layer = "6"
> > -LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "thud warrior zeus"
> > +LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "thud warrior zeus dunfell"
> >
> >  LAYERDEPENDS_openstack-controller-deploy-layer = " \
> >         core \
> > diff --git a/meta-openstack-controller-test-config/conf/layer.conf b/meta-openstack-controller-test-config/conf/layer.conf
> > index b81f21e0..695767d1 100644
> > --- a/meta-openstack-controller-test-config/conf/layer.conf
> > +++ b/meta-openstack-controller-test-config/conf/layer.conf
> > @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "openstack-controller-test-config-layer"
> >  BBFILE_PATTERN_openstack-controller-test-config-layer := "^${LAYERDIR}/"
> >  # We want this layer to have higher priority than any other meta-openstack layers
> >  BBFILE_PRIORITY_openstack-controller-test-config-layer = "100"
> > -LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "thud warrior zeus"
> > +LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "thud warrior zeus dunfell"
> >
> >  LAYERDEPENDS_openstack-controller-test-config-layer = " \
> >         openstack-controller-deploy-layer \
> > diff --git a/meta-openstack-qemu/conf/layer.conf b/meta-openstack-qemu/conf/layer.conf
> > index 98a35b40..8f6378d9 100644
> > --- a/meta-openstack-qemu/conf/layer.conf
> > +++ b/meta-openstack-qemu/conf/layer.conf
> > @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
> >  BBFILE_COLLECTIONS += "openstack-qemu-layer"
> >  BBFILE_PATTERN_openstack-qemu-layer := "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_openstack-qemu-layer = "6"
> > -LAYERSERIES_COMPAT_openstack-qemu-layer = "thud warrior zeus"
> > +LAYERSERIES_COMPAT_openstack-qemu-layer = "thud warrior zeus dunfell"
> >
> >  LAYERDEPENDS_openstack-qemu-layer = " \
> >         core \
> > diff --git a/meta-openstack-swift-deploy/conf/layer.conf b/meta-openstack-swift-deploy/conf/layer.conf
> > index e9675e28..e48aa601 100644
> > --- a/meta-openstack-swift-deploy/conf/layer.conf
> > +++ b/meta-openstack-swift-deploy/conf/layer.conf
> > @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
> >  BBFILE_COLLECTIONS += "openstack-swift-deploy-layer"
> >  BBFILE_PATTERN_openstack-swift-deploy-layer := "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_openstack-swift-deploy-layer = "6"
> > -LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "thud warrior zeus"
> > +LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "thud warrior zeus dunfell"
> >
> >  LAYERDEPENDS_openstack-swift-deploy-layer = " \
> >         core \
> > --
> > 2.21.0
> >
> >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
