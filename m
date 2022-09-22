Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351E8C6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 12:39:46 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.6611.1663850378106652048
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 05:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WrcbHCTC;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id v4so8966071pgi.10;
        Thu, 22 Sep 2022 05:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8aNDl+dV0DZDrixKYtZUn1yOSEIQvpNj1h8IG+9oIMk=;
        b=WrcbHCTCje47VJak0Z9CPO1X5AVRpicPdxOkTF93n22CAjTWaS4XVMT2iJADPngmXq
         FkpvJyYGF/fRXf/AGD2R+nIYdR70SCjq/kGd55BzeGRrE2BNf//7z7MCjD/bYlub5TkQ
         dLEc/D/2epucso1yjb6qzT3rr47OTijdlwLGIllroEFL7oFJaazEg0DWWwsrnSksUb2P
         fe6/6ueIo/EIqeT3b/TgD01X7EBtb9CqjeohqCFIFE7u/uHBqdy5n8mQ8yuSP72cMiqh
         VsdN1N5zCL8OhZ00JUELgop5tVK8HIyl7zfamsHc+963zUW6ayn8ubhZ6Xemd4w5Fnr+
         PT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8aNDl+dV0DZDrixKYtZUn1yOSEIQvpNj1h8IG+9oIMk=;
        b=6ux/rDfnuOUy9NHcPuU2EpQ0WL+kI6nmqysetMfxKkoyiTDWnc0HFGp3FXr28ZXMdf
         A9AkcJGZOUXr3FjfkvkuU/aty1kBAQ6zVcgz0SDNikc1i3M2ZE2sv8eV5ae9PQZFo10z
         jzHSIa8TJcgm9o0rY6TP8R4KN5VTy5OCMY+6TOpppQXM2Q/zRJkKZcvUpiAoM7uRghI/
         Mo0d/b8FTsnOe5KJ5izh+HNGQSn2jXpOS7hJYDs0fbA8ncY4jhWDoeqbqa5+1O2toIHC
         CZkUp+zdV9KaAB4jt53/ykEAx0x4z5G7HGLbSf6Yd9FMszGMF8bAI1nkSs3Y56+Tk+gP
         2zkw==
X-Gm-Message-State: ACrzQf0Ttk+ZcqaH+ILwpuplmr3JoSZTKQDNJS9qQ1xnzYErqeilGrBX
	e5Vb5X1LlMgWRya72VeM3aDnJtMuk5QbK7gqoLM=
X-Google-Smtp-Source: 
 AMsMyM4QyBX1kCKkZVm+e2dKhhsE9pRx9mqiYhjDAEc9YAO2qlbDprwHa2qZ2SYeQHFAblnN05sMGEe6gLYAvDImExE=
X-Received: by 2002:a65:538e:0:b0:434:aa53:2244 with SMTP id
 x14-20020a65538e000000b00434aa532244mr2730518pgq.343.1663850377345; Thu, 22
 Sep 2022 05:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <YyxV3RRta/U+P04d@mail.local>
In-Reply-To: <YyxV3RRta/U+P04d@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Sep 2022 08:39:26 -0400
Message-ID: 
 <CADkTA4Pqu9s1vrEZqhOMGLGawGNd43BM41FZPs4Yhp5dpCMYuQ@mail.gmail.com>
Subject: Re: check-layer-nightly failures
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	meta-virtualization@lists.yoctoproject.org, swat@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Sep 2022 12:39:46 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7626

On Thu, Sep 22, 2022 at 8:32 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> check-layer-nightly is currently failing with:
>
> ERROR: Nothing RPROVIDES 'selinux-python' (but /home/pokybuild/yocto-worker/check-layer-nightly/build/meta-virtualization/recipes-devtools/python/python3-udica_git.bb RDEPENDS on or otherwise requires it)
>
> I guess we need to add meta-selinux to have that work again

That is correct.

meta-selinux has always been in the README as a dependency, it just
isn't in the layer.conf file.

I'm still deciding if I'm going to add it in the .conf or do a skip
recipe like we did for cri-o

Bruce

>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

