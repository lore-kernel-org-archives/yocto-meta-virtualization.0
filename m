Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA66ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 12:25:15 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.69498.1661775914517993927
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 05:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PdrZmuQb;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id fa2so163077pjb.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=NlZeVHJ++E0UH1bFNULpz2YQ/BxNl+AiVNT84rQryaU=;
        b=PdrZmuQb96GMlDbUbpNFORf/c/LX339jPYF2f8XLiKXO+5MszwAFhqeQ2x8t/ozsqN
         lxzCvhomQduHG2NegmoATVem1CkpcGev9aU5mux6Oq2PlvKcjDuu3M7bCm39sFZUBBKM
         L6L7+dNKJ53YnMJ+Ow7YrEMLkxcRsg6EmjyGuXkD9emwef0EGS/IKSpbtLOWpeVSLAz8
         vhXnPPbhr5VY7+4JxTClg6Gri4FrA/TQOxhFW70Ny0WKaxlQfSU+yw0DWK1ZQCAF/dP9
         pZT/opLTsW93OgHIYEDaSTc+fxczuL22uq8ecDVOJ6gScVU+v8ztaK+rD95UAN5zV5vK
         DomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=NlZeVHJ++E0UH1bFNULpz2YQ/BxNl+AiVNT84rQryaU=;
        b=xGCdLzD3MTrfb96cUsng5KG7Adz4QmZrU1xNKRfmSu5+w9qXdv7vJz7xbUA5DSwtEq
         C6nD5CVHAmSzCdJykugO5n36XY33xobVeixU0NzCOZX2Ikcp3hd4SbvgGWYRNl/J0dkE
         QEhgw8Fxq2Op9fIg3TP0zGzjNyRLo/DWTfz5iUXutrx9pr0w78ZMGlUhGR8ynzHYcu9e
         0+OV/QbJI86nDiFWIn422V8y+7NLeM/PQmw3zYRu8xSFtkJeBMviBisFnMif5FHpdmRM
         u8aqKENys9NuE5fWXCKGqMF0aurVPieZ4wuPgpF+RQu8HHV0LpZnBk7sHrAr4KiA/vwi
         J0lg==
X-Gm-Message-State: ACgBeo2WpSuSe2jEJSkOqQMjaJxyu4gkVqUbYXUrbROqA1G2ARSuyvbh
	Z4Rc6MGjMLbbMQMSi3CxVqpnUXNowYaJyWQyOFo=
X-Google-Smtp-Source: 
 AA6agR4np5MwtdDh5vMJ6LX7WXQZi6wPEoWNlNBvqH3zmxxYJQ6J9caRTL7D2qvHZM9Z0Oz0DVLmjUMJOXLpLVzcJm4=
X-Received: by 2002:a17:902:cecf:b0:174:8caa:247d with SMTP id
 d15-20020a170902cecf00b001748caa247dmr8719713plg.37.1661775913840; Mon, 29
 Aug 2022 05:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220829034054.12730-1-Qi.Chen@windriver.com>
In-Reply-To: <20220829034054.12730-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Aug 2022 09:25:02 -0300
Message-ID: 
 <CADkTA4OXPnv40PUYwUvPtwpmuy4_u0RzPfLoKdjLFObgAP4hMw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] nerdctl: add -trimpath build flag
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Aug 2022 12:25:15 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7578

We are getting build paths warnings from ALL go programs. -trimpath
doesn't actually work everywhere, which is part of the complexity of
the fix.

I have a wider scope fix in progress, but I'm out of the office, so it
won't appear in the tree until next week.

Bruce

On Mon, Aug 29, 2022 at 12:41 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> We are get 'buldpaths' QA issue for nerdctl. We need to add
> '-trimpath' build option to it. As the docs (go help build) says:
>
> """
> -trimpath
>   remove all file system paths from the resulting executable.
>   Instead of absolute file system paths, the recorded file names
>   will begin with either "go" (for the standard library),
>   or a module path@version (when using modules),
>   or a plain import path (when using GOPATH).
> """
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...1-Makefile-allow-external-specification-of-build-setti.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch
> index 0661dd8..fd9c8eb 100644
> --- a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch
> +++ b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch
> @@ -18,7 +18,7 @@ Index: nerdctl-v0.17.0/src/import/Makefile
>
>  -export GO_BUILD=GO111MODULE=on CGO_ENABLED=0 GOOS=$(GOOS) $(GO) build -ldflags "-s -w -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)"
>  +#export GO_BUILD=GO111MODULE=on CGO_ENABLED=0 GOOS=$(GOOS) $(GO) build -ldflags "-s -w -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)"
> -+export GO_BUILD=$(GO) build -ldflags "-s -w -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)"
> ++export GO_BUILD=$(GO) build -ldflags "-s -w -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)" -trimpath
>
>   ifdef VERBOSE
>         VERBOSE_FLAG := -v
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7577): https://lists.yoctoproject.org/g/meta-virtualization/message/7577
> Mute This Topic: https://lists.yoctoproject.org/mt/93319851/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

