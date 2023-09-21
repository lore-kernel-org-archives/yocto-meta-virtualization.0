Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9633E71069
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 13:07:16 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.16467.1695301626572971621
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Sep 2023 06:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rHnPqu+L;
 spf=pass (domain: linaro.org, ip: 209.85.208.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so1093583a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Sep 2023 06:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695301625; x=1695906425; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nk7WOaRM7WmcqogKDTGKAq4a3eEMr9LU/Pcm7tOaTj8=;
        b=rHnPqu+LvFeeZ5NkkzidIeIqsasS8ObWAXyYbtkesZajIrjUGBbiJSm44YiEjPIq1B
         JkWI/QZGnyyPZE9GsSFQcvNTwC3IXpfS3yCTnpQHi7PXPvfLeOD+ru77Eqksat0Pgokc
         qnVV3qx6PfOJwpg/4axylXc764Z86QsVoWz5AcjgwelFExynaFBPkRZdjwnbEcKq4USq
         ejDwE2Q0Jb+VzkO8/uYyGHf4i/hz3u+7w2JEh4DTi/untRR5ydSMRVEAfu8qj4oNrgrm
         YYqU4byl531VUsm5gc+jCb750aAshXzRA4im37iSL66kHfIm3LYJc8BwWBsR1ua9S7gW
         +Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695301625; x=1695906425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nk7WOaRM7WmcqogKDTGKAq4a3eEMr9LU/Pcm7tOaTj8=;
        b=Ficj9npqiXwiXULMsZXzp6CsU7FB5iZC4yqQyBMtD75Nuq0wOLrZRg9QjL03nAD/6C
         z1qRepUMMndQhhMBTztwvFsM4MsXo67771pZe7ZgqIGbs67cvl4DpEnfUkn8+kfbkj6F
         Mh9Mc8bkrdaSsmppm5yabYluePHCuG909S3c2GOC5+R4oAwztrgaCp5XDxKCK/Hdw2Cs
         Pr0qdNw7UWcxC5Icuo7Vg57AaALqdYX8Nvfvrd8QinLxfJz9qZlXJdMcDe+tsZ96LW4w
         xBXoId+siprav524ucn9la1RjbfBZy77JXtC16MO8+wj8ZKVXhXXHINyW8dUH/nJYoWH
         avOg==
X-Gm-Message-State: AOJu0YwpOQURS4jDDQ1IMBhvqiLk9iNwyJxUDyH2AdHHcmJ+Atyh7oXj
	X/qZxjhrlJFH5g7BNI8bOnRVxA==
X-Google-Smtp-Source: AGHT+IFuQVrCBoioUSO+RpCCLMnrFCnVa9UwAPZC+KcYrIS52jg2kVt1cltM1vCrXvQvp2Ceuhw9kA==
X-Received: by 2002:a17:906:b044:b0:9a1:f73b:90ce with SMTP id bj4-20020a170906b04400b009a1f73b90cemr4235137ejb.54.1695301624886;
        Thu, 21 Sep 2023 06:07:04 -0700 (PDT)
Received: from nuoska (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id y16-20020a1709064b1000b0099b7276235esm1044040eju.93.2023.09.21.06.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 06:07:04 -0700 (PDT)
Date: Thu, 21 Sep 2023 16:07:02 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Adam Johnston <adam.johnston@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] docker: update from 24.0.2 to
 24.0.5
Message-ID: <ZQw/9kbKangmiM34@nuoska>
References: <ZNolT+ee+Lo0yZYP@nuoska>
 <10621.1695295222847012079@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10621.1695295222847012079@lists.yoctoproject.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Sep 2023 13:07:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8315

Hi,

On Thu, Sep 21, 2023 at 04:20:22AM -0700, Adam Johnston wrote:
> We also see the "invalid Host header" on mickledore
> 
> Looking into it but not figured out (yet) which combination of docker 23.x.x and patches fixes it

I think switching to docker-moby and adding these patches to mickledore is the way to go:

49fdcebf5b28d0661313bc34361f031f28db194e moby: update to v24.0.2
23373571e71f951b16defae9dbee589168753322 moby: update to v24.0.5

Maybe you can test and submit these to mickledore?

Cheers,

-Mikko

