Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95717CA100D
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 20:29:35 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.33243.1693945769886389727
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 13:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CWyOYjMY;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-64aaf3c16c2so17473826d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Sep 2023 13:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693945769; x=1694550569; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BvA99Ui3zYmqPCxSZNdi5FoDRsDil5xVBGyBh3T0CV8=;
        b=CWyOYjMYyqap/hyFNDO1keVy29PWF1MC101NKiq7r67jDvZfEqSG6edas0t1eB57jB
         Yvtxef4N+n/uabhRE9SSPDTcRg142aO9Hwk01PpdDkwS8wm37OS4M2e+X9jzo8xYLuEO
         1jjQvHgtEmOo81npeAfkn/FOBQMVrCm7jBp6ZQ/3+QnKgbahZlTNyfbvztnF9QF2oqGM
         QkI5rNbP2hQSGsKn/76QjN7LM43hqwyk/h1px0BJIk9VWrMkeLCIKQoX8FQzofSSplaV
         8Yj83VOe8O574JzcNKdUKqbOkmjKNwCD6j/DHqog8OVtmUhvTvJP8vw7zA5TW1Yhfy5V
         s9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693945769; x=1694550569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BvA99Ui3zYmqPCxSZNdi5FoDRsDil5xVBGyBh3T0CV8=;
        b=ZXmtaM//ZEkumrPLX/tQUI9wwmMB6dlK7KRCVxOcMc/DSkSTisRafIbo5LVFkA8CIT
         Gxfom83f2P7+BAgwAUJa4CgeUPlBQE+TKn1zO4Brsyv67vXF7hG3rPhWuoHhwHobVwtP
         /J6FCh5V79trXMvAFrE3IDpzKQiYxPrtegppzw8HJH58LDnubchNuse6OKbxEHW/zIJG
         mzDwC/yLwKancs9gJObeQCuGViAHgdtOEESrPyQbcLdWP2qlj7b+FcP11FRZsydMkkHw
         glco+CbQEayUS4CzyDYJ0c/OBLzPKsrQAFpaqvMAjUkuRyVMz3QMthneLKIlqiIfbHPV
         5lWw==
X-Gm-Message-State: AOJu0Yw3h/l6zgDBbd5eYqpRGOlRtJ5j6uSBCVbvaUkwAN53Qsiqunyb
	2zmyk4HtAB56hRUjilrmVes=
X-Google-Smtp-Source: AGHT+IGm3gDcuxyMZHWS5eS7kbYtBzMpREFrgKOLtB9NIgbrDJmqXh+JcLxWf2lqR6J9EByvmvw25A==
X-Received: by 2002:a0c:aa1b:0:b0:653:5736:c0b4 with SMTP id d27-20020a0caa1b000000b006535736c0b4mr12121407qvb.54.1693945768851;
        Tue, 05 Sep 2023 13:29:28 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id mx1-20020a0562142e0100b0064f6f9290bdsm3751207qvb.55.2023.09.05.13.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 13:29:28 -0700 (PDT)
Date: Tue, 5 Sep 2023 20:29:26 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Abdurrahman Hussain (fib)" <fib@cisco.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] [kirkstone][PATCH] docker-ce: bump
 SRCREV_docker
Message-ID: <ZPePptxh09fsDwzh@gmail.com>
References: <20230816060932.668438-1-Martin.Jansa@gmail.com>
 <CADkTA4OWMris3ESwrNCcoc5s1r-q_qKO=GvKqWjESy3S94s9iQ@mail.gmail.com>
 <BL1PR11MB6001A97256DB08EB45FAF76AADEAA@BL1PR11MB6001.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR11MB6001A97256DB08EB45FAF76AADEAA@BL1PR11MB6001.namprd11.prod.outlook.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Sep 2023 20:29:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8277

In message: RE: [meta-virtualization] [kirkstone][PATCH] docker-ce: bump SRCREV_docker
on 03/09/2023 Abdurrahman Hussain (fib) wrote:

> Hi Bruce,
> 
> It seems docker in Dunfell is also affected with the same 'http: invalid Host header' issue.
> Can these patches be merged into Dunfell as well?

If the patches were simply cherry picked, that would involve a major
docker version change, which isn't something we'd typically do.

We need a specific / tested patch for dunfell for proper consideration.

Bruce

> 
> Thanks,
> Abdurrahman
> 
> -----Original Message-----
> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.yoctoproject.org> On Behalf Of Bruce Ashfield
> Sent: Wednesday, August 16, 2023 6:36 AM
> To: Martin Jansa <Martin.Jansa@gmail.com>
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization] [kirkstone][PATCH] docker-ce: bump SRCREV_docker
> 
> Thanks Martin,
> 
> This is merged.
> 
> Bruce
> 
> On Wed, Aug 16, 2023 at 2:09 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
> >
> > * fix my prevous commit where I've missed this update corresponding
> >   to SRCREV_moby change in docker-moby recipe.
> >
> > * also re-order the patches in SRC_URI to match docker-moby, so
> >   that they are easier to compare
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-containers/docker/docker-ce_git.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-containers/docker/docker-ce_git.bb 
> > b/recipes-containers/docker/docker-ce_git.bb
> > index 76ac41e..7142060 100644
> > --- a/recipes-containers/docker/docker-ce_git.bb
> > +++ b/recipes-containers/docker/docker-ce_git.bb
> > @@ -31,7 +31,7 @@ DESCRIPTION = "Linux container runtime \  # so we 
> > get that tag, and make it our SRCREVS:
> >  #
> >
> > -SRCREV_docker = "3056208812eb5e792fa99736c9167d1e10f4ab49"
> > +SRCREV_docker = "791d8ab87747169b4cbfcdf2fd57c81952bae6d5"
> >  SRCREV_libnetwork = "dcdf8f176d1e13ad719e913e796fb698d846de98"
> >  SRCREV_cli = "911449ca245308472a3d34a7f1a98b918e65c8c3"
> >  SRCREV_FORMAT = "docker_libnetwork"
> > @@ -39,10 +39,10 @@ SRC_URI = "\
> >      git://github.com/docker/docker.git;branch=20.10;name=docker;protocol=https \
> >      git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork;protocol=https \
> >      git://github.com/docker/cli;branch=20.10;name=cli;destsuffix=git/cli;protocol=https \
> > -    file://0001-libnetwork-use-GO-instead-of-go.patch \
> >      file://docker.init \
> > -    file://0001-dynbinary-use-go-cross-compiler.patch \
> > +    file://0001-libnetwork-use-GO-instead-of-go.patch \
> >      file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch 
> > \
> > +    file://0001-dynbinary-use-go-cross-compiler.patch \
> >      file://0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch;patchdir=src/import \
> >      file://0002-Revert-go-updates-from-1.18.7-to-1.17.13.patch;patchdir=src/import \
> >      
> > file://0003-builder.go-avoid-using-strings.Cut-from-go-1.18.patch;patc
> > hdir=src/import \
> > --
> > 2.41.0
> >
> >
> > 
> >
> 
> 
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

