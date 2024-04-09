Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF27CD1284
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 14:14:31 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.137410.1712672068552093868
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Apr 2024 07:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gh3/asXE;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6962a97752eso40030746d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Apr 2024 07:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712672067; x=1713276867; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=150Cync6WGyeDniPHMf0BJE/r2WG4jp4lx7VjsHBUm0=;
        b=gh3/asXEjnxWGtHCB1YzKGD0lLA0MSAdd0GmnDxAtPGlyhLmEiRUlf+rk8k7ivW6tz
         Dj/rZSciy9A7PcQWaYziOYrjZ4WglkOHQ+kN9h2Ymiuq0yq1RW/P5O17RlgEJ+egUnpd
         SOilNUTY4h3BwwfNOvVKF9hRJygbpth5i64GOHzJdB6OSMzksDNtnF2xF1oV0qmsinG8
         hkdQM2ga+ccwGAoqfcaIuThmZrXhhkTxoL3xBn0Iox0nvNmwoIoWurWDQb6DnhAocYUc
         OeKHHq1vdAQXFFX49JPobW01I541yfNJUPihEWRqA5haNXPReQWFrsPXdwia3m4EHKEp
         bnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712672067; x=1713276867;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=150Cync6WGyeDniPHMf0BJE/r2WG4jp4lx7VjsHBUm0=;
        b=XOxSP38avSNT1wm5ZO8NO94IFwAuF2SlLcFJ3XH0nwCiiUQbEJ8qz4Fao/gDoKHFaa
         BBYMSlG+eSRCtPo9HolFF1VD1qVZYgrD3xqlCmlgM7e1yTMSxtTGRYHOaf5l9e+0Ddhs
         2dgWRkgeniSbHtLihkXJOcwpabpsMQ1f/TiJdwh39FPblin00TxcjsKpFsDv4GaGFcpX
         /VCDmw1lurmqnTBkIdxCvZUmTyQZZdq8SDzOC10DaAn+kiSgya2UmQu0GvTJW1yzHYwK
         rk+Wgtvm+TCdI4yIMsMLui/t43rw7yYfDae/2v5iR5TzGMUYEbrF+xPiX04t6TtlqYvF
         9oXA==
X-Gm-Message-State: AOJu0YzH4WAcdZUtms140IwQHXre9Dsl39yUz4L95w/w9lphKoMlLier
	NX1Q3DjVrTu28KKcW/LTzsN+MiWNtsscDjIQXMj6ny6ucvi0NpRzV+6WulLH
X-Google-Smtp-Source: AGHT+IGXbssw3FS0fyXd6FA5HzYphShuKx8NejZyrWQX4D7f2exD/rbzQu5/jxW6KHpXuOIVucrTwQ==
X-Received: by 2002:a0c:bf4b:0:b0:69b:2b33:11b2 with SMTP id b11-20020a0cbf4b000000b0069b2b3311b2mr1503662qvj.35.1712672067427;
        Tue, 09 Apr 2024 07:14:27 -0700 (PDT)
Received: from gmail.com ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id f4-20020a05621400c400b00699416b9d6esm3770802qvs.6.2024.04.09.07.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 07:14:26 -0700 (PDT)
Date: Tue, 9 Apr 2024 14:14:24 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: wangmy@fujitsu.com
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] [meta-cloud-services] [PATCH] layer.conf:
 use scarthgap to LAYERSERIES_COMPAT
Message-ID: <ZhVNQBaB2opDtege@gmail.com>
References: <1712103925-28778-1-git-send-email-wangmy@fujitsu.com>
 <TYWPR01MB118611F3072C3E3F8AE6429A8DC072@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <CADkTA4M9jmSq-=OFniE_S6snoA6pq+Rk96JFNc3uEcgSGEpgQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4M9jmSq-=OFniE_S6snoA6pq+Rk96JFNc3uEcgSGEpgQw@mail.gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Apr 2024 14:14:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8671

In message: Re: [meta-virtualization] [meta-cloud-services] [PATCH] layer.conf: use scarthgap to LAYERSERIES_COMPAT
on 09/04/2024 Bruce Ashfield wrote:

> This is on my list to do, but I'm running into some testing issues, so I
> can't exactly push compatibility until they are resolved.

I sorted out my testing issues, and this is now merged.

Bruce

> 
> Bruce
> 
> On Mon, Apr 8, 2024 at 11:10 PM wangmy via lists.yoctoproject.org <wangmy=
> fujitsu.com@lists.yoctoproject.org> wrote:
> 
> > ping
> >
> > Thanks.
> >
> >   --
> > Best Regards
> > ---------------------------------------------------
> > Wang Mingyu
> > FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> > No.6 Wenzhu Road, Nanjing, 210012, China
> > TEL：+86+25-86630566--8568
> > COINS: 79988548
> > FAX: +86+25-83317685
> > MAIL: wangmy@fujitsu.com
> >
> > > -----Original Message-----
> > > From: wangmy@fujitsu.com <wangmy@fujitsu.com>
> > > Sent: Wednesday, April 3, 2024 8:25 AM
> > > To: meta-virtualization@lists.yoctoproject.org
> > > Cc: Wang, Mingyu/王 鸣瑜 <wangmy@fujitsu.com>
> > > Subject: [meta-virtualization] [meta-cloud-services] [PATCH] layer.conf:
> > use
> > > scarthgap to LAYERSERIES_COMPAT
> > >
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > conf: mark layer compatible with scarthgap
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  meta-openstack/conf/layer.conf | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-openstack/conf/layer.conf
> > b/meta-openstack/conf/layer.conf
> > > index 24768809..b035adf7 100644
> > > --- a/meta-openstack/conf/layer.conf
> > > +++ b/meta-openstack/conf/layer.conf
> > > @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb
> > > ${LAYERDIR}/recipes*/*/*.bbappend"
> > >  BBFILE_COLLECTIONS += "openstack-layer"
> > >  BBFILE_PATTERN_openstack-layer := "^${LAYERDIR}/"
> > >  BBFILE_PRIORITY_openstack-layer = "5"
> > > -LAYERSERIES_COMPAT_openstack-layer = "nanbield"
> > > +LAYERSERIES_COMPAT_openstack-layer = "scarthgap"
> > >  BB_DANGLINGAPPENDS_WARNONLY ?= "true"
> > >
> > >  LAYERDEPENDS_openstack-layer = " \
> > > --
> > > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8663):
> > https://lists.yoctoproject.org/g/meta-virtualization/message/8663
> > Mute This Topic: https://lists.yoctoproject.org/mt/105300002/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> > bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >
> 
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II

