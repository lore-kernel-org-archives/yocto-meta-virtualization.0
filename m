Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.2283.1592354473385106154
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 17:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kn19oivk;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id l12so354143ejn.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Jun 2020 17:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mrK0Hu/kTmiUobVF7HY+lX6eyR17nN5PtlH4ihHxd1c=;
        b=kn19oivkyU5i6/6oPkF8fEO4ijgnlQb5kCrXbwMml1/GM67wb7RhbbwbnvxwAMrqeN
         Gg/ybftorIhyCdVz9HYDACdoquRekOLf+I2XB8cSrfjQnEWllnadbshk1KTNwPb1gfgK
         SNyYgQqLXZ5mLSfh6JtEuAeqrGbiMp7Ov1b8xqfEchl9kYWJ6RuX26/Y4bGLRZJJ6fhj
         Fnha6eKgbYGPRQJepMoFxqCpkS5WeekTKKqc4HbxMpHuhomsDcJxS5IAU/NVx6r9VZfC
         KjR5KOwxCkahFbeaHUjQbKUhE9ALIR+aTz5XLKjzJHQNm0M4kWJsIMU6wOJXU0/NbPao
         qLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mrK0Hu/kTmiUobVF7HY+lX6eyR17nN5PtlH4ihHxd1c=;
        b=Znpb+QTd5VBOD3vIlu6FCZrRzUVdKyQJjrnm+dhSXeiZs44eMG80mxHGEQ1+CkMNh3
         tjmX2eyb7rRZl2+UchIJUcr5dh/OWPa6fHttV3zplRgU2B8TYwWiMVx1bcmvMgFZvpvU
         8PxxenhEA5sRK6Cdqul5UkxHPLWZWN48CZe6uQZHpXaamu8Ep7NpomljBG/o+Lf1ACQ/
         XO/f5qI2p3Vv7buX8yoA74WXH7dvLi/azdOPoGvBmSMrXfsXwZSg2OxoMCVvJaYrX6kc
         yTlmLM2ZyfreJBozohySRgr0S3A6uJb27gJSvo51dujhzReeqySLeUv0yyHQIhbcGwyw
         bIfA==
X-Gm-Message-State: AOAM530IAoWVjUaueIGcXT6SgTC8woyLg/ZePeWDmSTghheKDxdbiBdy
	MmFLGy8Y3YDGv57MeTiGJ4UjcM42aQaIgjqxuI8=
X-Google-Smtp-Source: ABdhPJwlgnTbkp0/s+gyQrFDX/0Wr7/WO6KfbrAa2L95pdnnHfM9/rcB5Y8QT33fBW4aUkTy3Pt2+nk8p8EiXNlQPZo=
X-Received: by 2002:a17:907:9d8:: with SMTP id bx24mr5073244ejc.517.1592354471750;
 Tue, 16 Jun 2020 17:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200608034208.112106-1-Qi.Chen@windriver.com>
 <161692922988E497.22829@lists.yoctoproject.org> <CADkTA4MBGkgVjVSEGapi266R3binp3ToSA8LvV_au-h81JnZKQ@mail.gmail.com>
 <e0874257-f2f6-3e79-065e-4ef5484acf98@windriver.com>
In-Reply-To: <e0874257-f2f6-3e79-065e-4ef5484acf98@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 16 Jun 2020 20:41:00 -0400
Message-ID: <CADkTA4MmPTfyFsPk18eswNyhb=2f7mz-b58p_KhrMmSPEQB8Eg@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH] meta-openstack: be compatible with dunfell
To: ChenQi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 8, 2020 at 9:10 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
> On 06/08/2020 08:53 PM, Bruce Ashfield wrote:
> > On Mon, Jun 8, 2020 at 8:51 AM Bruce Ashfield via
> > lists.yoctoproject.org
> > <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
> >> Hmm.  I already did a patch for this, it looks like I forgot to push it :(
> >>
> > oh wait, I see my dunfell patch.
> >
> > I excluded those layers on purpose, since the deployment hasn't been
> > tested in quite a while. Did you confirm that the layers build when
> > bumping the compatibility. I honestly expect runtime errors .. but did
> > anyone try booting with them enabled ?
> >
> > Bruce
>
> No. I didn't do any test. These layers are included in my bblayers.conf,
> I have to add 'dunfell', otherwise bitbake errors out.

I was going to merge this today, but when I applied it to master and
dunfell, they don't have zeus in the compatible layer list, but yet
your patch does. I had done the same thing with zeus (skipping the
compatibility bump, until someone asked).

Are you seeing the same thing ? or am I somehow seeing the
layer.conf's wrong in my merge layers ?

Bruce

>
> Regards,
> Chen Qi
>
>
> >
> >> Bruce
> >>
> >> On Sun, Jun 7, 2020 at 11:42 PM Chen Qi <Qi.Chen@windriver.com> wrote:
> >>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>> ---
> >>>   meta-openstack-aio-deploy/conf/layer.conf             | 2 +-
> >>>   meta-openstack-compute-deploy/conf/layer.conf         | 2 +-
> >>>   meta-openstack-compute-test-config/conf/layer.conf    | 2 +-
> >>>   meta-openstack-controller-deploy/conf/layer.conf      | 2 +-
> >>>   meta-openstack-controller-test-config/conf/layer.conf | 2 +-
> >>>   meta-openstack-qemu/conf/layer.conf                   | 2 +-
> >>>   meta-openstack-swift-deploy/conf/layer.conf           | 2 +-
> >>>   7 files changed, 7 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/meta-openstack-aio-deploy/conf/layer.conf b/meta-openstack-aio-deploy/conf/layer.conf
> >>> index f3d2c5f2..c8bdaff5 100644
> >>> --- a/meta-openstack-aio-deploy/conf/layer.conf
> >>> +++ b/meta-openstack-aio-deploy/conf/layer.conf
> >>> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
> >>>   BBFILE_COLLECTIONS += "openstack-aio-deploy-layer"
> >>>   BBFILE_PATTERN_openstack-aio-deploy-layer := "^${LAYERDIR}/"
> >>>   BBFILE_PRIORITY_openstack-aio-deploy-layer = "6"
> >>> -LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "thud warrior zeus"
> >>> +LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "thud warrior zeus dunfell"
> >>>
> >>>   LAYERDEPENDS_openstack-aio-deploy-layer = " \
> >>>          core \
> >>> diff --git a/meta-openstack-compute-deploy/conf/layer.conf b/meta-openstack-compute-deploy/conf/layer.conf
> >>> index e25cf3e0..3d700330 100644
> >>> --- a/meta-openstack-compute-deploy/conf/layer.conf
> >>> +++ b/meta-openstack-compute-deploy/conf/layer.conf
> >>> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
> >>>   BBFILE_COLLECTIONS += "openstack-compute-deploy-layer"
> >>>   BBFILE_PATTERN_openstack-compute-deploy-layer := "^${LAYERDIR}/"
> >>>   BBFILE_PRIORITY_openstack-compute-deploy-layer = "6"
> >>> -LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "thud warrior zeus"
> >>> +LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "thud warrior zeus dunfell"
> >>>
> >>>   LAYERDEPENDS_openstack-compute-deploy-layer = " \
> >>>          core \
> >>> diff --git a/meta-openstack-compute-test-config/conf/layer.conf b/meta-openstack-compute-test-config/conf/layer.conf
> >>> index dfa5f31b..b082d609 100644
> >>> --- a/meta-openstack-compute-test-config/conf/layer.conf
> >>> +++ b/meta-openstack-compute-test-config/conf/layer.conf
> >>> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "openstack-compute-test-config-layer"
> >>>   BBFILE_PATTERN_openstack-compute-test-config-layer := "^${LAYERDIR}/"
> >>>   # We want this layer to have higher priority than any other meta-openstack layers
> >>>   BBFILE_PRIORITY_openstack-compute-test-config-layer = "100"
> >>> -LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "thud warrior zeus"
> >>> +LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "thud warrior zeus dunfell"
> >>>
> >>>   LAYERDEPENDS_openstack-compute-test-config-layer = " \
> >>>          openstack-compute-deploy-layer \
> >>> diff --git a/meta-openstack-controller-deploy/conf/layer.conf b/meta-openstack-controller-deploy/conf/layer.conf
> >>> index e8be8321..e9786313 100644
> >>> --- a/meta-openstack-controller-deploy/conf/layer.conf
> >>> +++ b/meta-openstack-controller-deploy/conf/layer.conf
> >>> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
> >>>   BBFILE_COLLECTIONS += "openstack-controller-deploy-layer"
> >>>   BBFILE_PATTERN_openstack-controller-deploy-layer := "^${LAYERDIR}/"
> >>>   BBFILE_PRIORITY_openstack-controller-deploy-layer = "6"
> >>> -LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "thud warrior zeus"
> >>> +LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "thud warrior zeus dunfell"
> >>>
> >>>   LAYERDEPENDS_openstack-controller-deploy-layer = " \
> >>>          core \
> >>> diff --git a/meta-openstack-controller-test-config/conf/layer.conf b/meta-openstack-controller-test-config/conf/layer.conf
> >>> index b81f21e0..695767d1 100644
> >>> --- a/meta-openstack-controller-test-config/conf/layer.conf
> >>> +++ b/meta-openstack-controller-test-config/conf/layer.conf
> >>> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "openstack-controller-test-config-layer"
> >>>   BBFILE_PATTERN_openstack-controller-test-config-layer := "^${LAYERDIR}/"
> >>>   # We want this layer to have higher priority than any other meta-openstack layers
> >>>   BBFILE_PRIORITY_openstack-controller-test-config-layer = "100"
> >>> -LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "thud warrior zeus"
> >>> +LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "thud warrior zeus dunfell"
> >>>
> >>>   LAYERDEPENDS_openstack-controller-test-config-layer = " \
> >>>          openstack-controller-deploy-layer \
> >>> diff --git a/meta-openstack-qemu/conf/layer.conf b/meta-openstack-qemu/conf/layer.conf
> >>> index 98a35b40..8f6378d9 100644
> >>> --- a/meta-openstack-qemu/conf/layer.conf
> >>> +++ b/meta-openstack-qemu/conf/layer.conf
> >>> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
> >>>   BBFILE_COLLECTIONS += "openstack-qemu-layer"
> >>>   BBFILE_PATTERN_openstack-qemu-layer := "^${LAYERDIR}/"
> >>>   BBFILE_PRIORITY_openstack-qemu-layer = "6"
> >>> -LAYERSERIES_COMPAT_openstack-qemu-layer = "thud warrior zeus"
> >>> +LAYERSERIES_COMPAT_openstack-qemu-layer = "thud warrior zeus dunfell"
> >>>
> >>>   LAYERDEPENDS_openstack-qemu-layer = " \
> >>>          core \
> >>> diff --git a/meta-openstack-swift-deploy/conf/layer.conf b/meta-openstack-swift-deploy/conf/layer.conf
> >>> index e9675e28..e48aa601 100644
> >>> --- a/meta-openstack-swift-deploy/conf/layer.conf
> >>> +++ b/meta-openstack-swift-deploy/conf/layer.conf
> >>> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
> >>>   BBFILE_COLLECTIONS += "openstack-swift-deploy-layer"
> >>>   BBFILE_PATTERN_openstack-swift-deploy-layer := "^${LAYERDIR}/"
> >>>   BBFILE_PRIORITY_openstack-swift-deploy-layer = "6"
> >>> -LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "thud warrior zeus"
> >>> +LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "thud warrior zeus dunfell"
> >>>
> >>>   LAYERDEPENDS_openstack-swift-deploy-layer = " \
> >>>          core \
> >>> --
> >>> 2.21.0
> >>>
> >>>
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >> 
> >
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
