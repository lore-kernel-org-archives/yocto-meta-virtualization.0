Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web10.10706.1589974002357139504
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 May 2020 04:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=k061EPoi;
 spf=pass (domain: konsulko.com, ip: 209.85.167.195, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f195.google.com with SMTP id b3so2553166oib.13
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 20 May 2020 04:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vsf7LmdOKckCDL0PkjtE9mlPap1LA9PKiQdMRebtTgc=;
        b=k061EPoioMVoM23V+3xJobgK/0hVB3rhdErdNn59UJ/y3s9u+Vdacgr//6aBxW1Frz
         VoTlLahPMqC2wVpS08JdorXaZIRWbakeP9uu/aLEMqdw0wO/G+zPKfy0nDINEu0MbI/A
         hK05e4VM8Wbyqp+4977dEPUPTirAl9/PIwpQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vsf7LmdOKckCDL0PkjtE9mlPap1LA9PKiQdMRebtTgc=;
        b=gmXrGOmvxG7m/JLM+S/g2CGP+KL5fQl7R65LwH5GEjiAGyvnATVUgyBsoJiGbfFoVL
         erZUZOuhcGLnSauflUig64VLndBMCDsutwNhKDM4WqpmnH1bpZ/2LuB14hhN9cGcKMBq
         e8A8jM6R2Os3T/icgr0v6NkdM8MbpHtfgdcNedpnM4z4zlse9v7JeC5urmR+lU3e44+2
         SHYlFg1wiIGSa/oPiFTuLqWM6pb0c3npRrQg5C1dtG8Zj1Cw7GVlkHozMcShWaTlUiU6
         vBUmzWDAYHyBETHfcz/kOtJr2MFJycI6PJWMqEyZA/jVNBtO8KZQfLjbdiuxOz1ffFLv
         1c0g==
X-Gm-Message-State: AOAM533S3ObLdF77IYb6sdriWpARg07ItBuf+mK8aq7W0ZnsvHluJt5H
	21pmW32xfAYF0tizmV26u+K7WO0igp/Xj0dkiyKgeQ==
X-Google-Smtp-Source: ABdhPJwCGkNiax2Yox3ON2i2PYnuianUWbyZjaD70/9Je8P4Xu7bl6HC2Qi9xoFqXgBQkJttcRCdmNCGpbdC34UIsVE=
X-Received: by 2002:aca:cd4b:: with SMTP id d72mr2631255oig.6.1589974001720;
 Wed, 20 May 2020 04:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200520082737.76973-1-liezhi.yang@windriver.com> <3873.1589968841005157960@lists.yoctoproject.org>
In-Reply-To: <3873.1589968841005157960@lists.yoctoproject.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 20 May 2020 12:26:30 +0100
Message-ID: <CAM9ZRVvppkewhy94Gq2XHLReJnAQC8nSVCKpLKeu+YZ+-RRO8Q@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/1] notary: Define SRCREV_FORMAT to make it work with archiver.bbclass
To: Robert Yang <liezhi.yang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 May 2020 at 11:00, Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Hi Bruce,
>
> Please ignore this patch, I found more recipes in meta-virt have this issue, we need fix all of them or find a better solutions.

I think the issue should probably be logged against the archiver
itself in the Yocto bugzilla. If the archiver is changing SRC_URI it
should handle any consequences, not require recipes to adapt for it.

-- 
Paul Barker
Konsulko Group
