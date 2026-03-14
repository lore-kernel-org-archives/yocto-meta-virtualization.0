Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EAF10706E4
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 15:18:45 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11667.1773501517915253099
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 14 Mar 2026 08:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aFjgEfv9;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-509164dce91so27597561cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773501517; x=1774106317; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PMbP7VZWIes4x9BYveJ24F6r8Ztp373P7wfUe/GiVA0=;
        b=aFjgEfv9+n7dsMqyFxg3uw6JQ2qXoQwgYDlrfHq0b3VnFSNerkd0T2R4o4xKrcTQWC
         KLPVBUh01JWNHpyVe2bdjFYlMF3/l3S/V380n1r3hbkNnPPDdcb0TCBZZb7TANEUQ9Hh
         Ay0f+8SqPo+F7widzMvYk8RcaA4o8JKiLrt9s43xhv8jPrSadDbnEu6TKhRMJoNCmOj5
         xKibsQK5AOH3rCMysImlOnYMtxii4sa13bd36wexeOl6xC8tsLmdfaNqdDQF9VKPespc
         mRzl6uz+9UeQXB1EsdlgNkDJ2csHvyu9nsIwdQliTwlbmeBhH4Fy7meyzZLJKFJ+clgj
         bzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773501517; x=1774106317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMbP7VZWIes4x9BYveJ24F6r8Ztp373P7wfUe/GiVA0=;
        b=Ck/FeCp+e7CsTMeMDYdTuNYlkLzys3/0786c/fQ76mZ8LHVNmcG6LuFRATMR6/6hgm
         /kQHsZrl/DbyAZhcGwACWrUrBcPj3LjPliVUj0nJ2brKl+JvzeQ3JVdoT6IoNW+T1uh7
         8ZXFNrfQBXCV9+1jxXhkPfFyrjW9VA5t7t0XhiRcoW6TE6404UeJHCWOHfAcvK+ONQ2V
         rlUZGYcMeO+xgFG8Hp348SAc0K753UayBrQ5YDD2DgLvULoKie3ixx0JBBxJGQuixYj+
         4rjxyngEWOVBmdIQja6fjNHy5xG9Em/QXc5RS+GV0nLAbvD9p1KIO/NChL0g+wDOt9FE
         f6Dg==
X-Gm-Message-State: AOJu0YzVufKsVX3cN8q+jsrDFIkGK1MemZ5TteXya+URZJ3xn17oXKhm
	JZOkUUWGuGnFLJE2OxlA/7p8LR2NrVuSswcVWLeAZVOLwRq9pNXtxW0Y
X-Gm-Gg: ATEYQzxyIkHwXM26uyLko77aiJYYyPJ7PHODDf+K2ARIIC+cQit4OFzcptFse5NOCoT
	FDSZyebUyX6Jp1kK6BFOWVPDQx3ZV1u2618q0fnNOR2tPktNoEiS4JXHjkb2eOBFSwui6sEcGKj
	puiJboNy8XjijQh8SoHd+2ARgu3+hkyEH9AynIF8RcAbKe8JsUYcGOG3ziviE2V6veZWA/LfER5
	40CCz/AH5+jaQUYyNzf79HEWed6cdrNtBqHWtuC2A9ekdq42ogXX91lN+8QUIfUH0D/BzZOYcVB
	fy13vVao3wM5cEQXZSLPU4SE99fz8SCYORw2Jhy0iP92m9ohV/xXdXbBhk7A/TGQqwkgkMyPh5V
	JybEAJ0YaDOjhybd3G3+IL8+UHN0qCHVNopWQ2dhjHqhLiVl15I+xQbqiPCvsDl6oa8I6AVKQz1
	pJ1+BkAMrp4GSnfANgEkXJ3/uN5OnI4iRHw9skd4t39C8AVDfc7mnAInOFiykWR0B9IdR478v/j
	hrUREw8af7VD8Cx7Ees6sUPExUre9M3vGISi2XV7mawxIE=
X-Received: by 2002:a05:622a:48f:b0:509:2d83:5acd with SMTP id d75a77b69052e-50957e2df21mr85086201cf.63.1773501516807;
        Sat, 14 Mar 2026 08:18:36 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65bd318fsm79208886d6.8.2026.03.14.08.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 08:18:36 -0700 (PDT)
Date: Sat, 14 Mar 2026 15:18:34 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] container-dummy-provides: Update
 to match changes in oe-core
Message-ID: <abV8SmQXZZB1xO80@gmail.com>
References: <20260314103109.3942620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314103109.3942620-1-richard.purdie@linuxfoundation.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 14 Mar 2026 15:18:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9658

merged.

Hopefully this is ok without your corresponding oe-core change.

I didn't see any issues, so I've pushed it to master.

Bruce

In message: [meta-virtualization] [PATCH] container-dummy-provides: Update to match changes in oe-core
on 14/03/2026 Richard Purdie via lists.yoctoproject.org wrote:

> OE-Core made changes to the way dummy providers work, update the
> container-dummy-provides to match them. It now needs a hint in layer.conf
> to make the core components aware of the presence of the dummy recipe.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  conf/layer.conf                               | 2 ++
>  recipes-core/meta/container-dummy-provides.bb | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/conf/layer.conf b/conf/layer.conf
> index cbf95e6a..a387d35e 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -75,3 +75,5 @@ HOSTTOOLS_NONFATAL += "getent"
>  DISTRO_FEATURES_NATIVE:append = " ${@bb.utils.contains_any('DISTRO_FEATURES', 'vcontainer virtualization', 'virtualization', '', d)}"
>  
>  NON_MULTILIB_RECIPES:append:x86-64 = " kubernetes"
> +
> +DUMMY_PACKAGE_ARCHS_TARGET += "container-dummy-provides"
> diff --git a/recipes-core/meta/container-dummy-provides.bb b/recipes-core/meta/container-dummy-provides.bb
> index 2ab42be3..1d58c672 100644
> --- a/recipes-core/meta/container-dummy-provides.bb
> +++ b/recipes-core/meta/container-dummy-provides.bb
> @@ -3,4 +3,6 @@ DUMMYPROVIDES = "\
>     /bin/sh \
>     /usr/bin/env \
>  "
> +DUMMYSDK_PKGDATA_VARNAME = "PKGDATA_DIR"
> +DUMMYSDK_EXTRASTAMP_VARNAME = "MACHINE"
>  require recipes-core/meta/dummy-sdk-package.inc

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9655): https://lists.yoctoproject.org/g/meta-virtualization/message/9655
> Mute This Topic: https://lists.yoctoproject.org/mt/118311700/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


