Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.305.1591385578208043375
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 12:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PpAcNaKI;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id w1so10923264qkw.5
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Jun 2020 12:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+n38mlUU8ET93udIH0s1z38+/1xJ9UPQWh3ARldl5as=;
        b=PpAcNaKI9sb6HWcbQsKB470U+E/PufJM/xBKRG2gODUQyL8yH7slCasEBZQCu54ZFl
         /LERJxsJRZ6gLWaNs1V1+43JBfVA/JU13TdHMqzjKnmr/2izNdAVu4mBZdhBIycXxprL
         5C8dgHw124qFsnA/8JeGpMpfoFe7WsV6ZEnH1aX+A7vT6bbM3utkzYT7BdZpZX8vahAz
         QAuZXClqoKZQxfzGDBLDWMrrA4HSaZULnHndOt6slYOtfL/flmuaU3K6SE3ZEAo7uKPf
         KK/C1VxuoX9dk0H/bDi4XI2lY2Il3nu1EnAT1tvmN1REWi+Uve4Tb68EvZYhCvrTNJoa
         /hbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+n38mlUU8ET93udIH0s1z38+/1xJ9UPQWh3ARldl5as=;
        b=UOuoCAzuHp2NMXoPf+9Hrx6dL83GO3Tv+Fo82E+5VVCyqQJvcIMyP2jxeXw5dsr8l7
         88FvYgPiHpA1lPYmf/szy4J/ixx+7M8W6/FsiFjDYNiUrO83kzlxwnX+CJpxgP2WcbQN
         m2tNYFKVbBmOV8CgtDDeT/Uli0a6BQiR9ZZGYVxlQQsmI07JgSjCumzZUx8WDXcr4TCu
         h63fo+wv67S9QiaEQ6GNzod+DbOFB1rXbTUXW6wdX2cndsDfseZUMB66kqQuQQuEomyS
         +SX7vP1n8UhfBwyNw0cyRvCvJaofhRlH056Qg3+t1XJcEi4vC5hfBUNayjkU6xApfCBD
         infA==
X-Gm-Message-State: AOAM533+L9zEp/mhz7sDkUd2OlDaoIU6EqNbL6oFi8SNSJz3OBRL/ept
	qb038S4xixcEI7nwFYgG/P78iA+da4bGFw==
X-Google-Smtp-Source: ABdhPJz2ghk+Q4GrY2g1r3kxcjiRjqt76V4gwZ7oA8LP5H1quq81SOV54sxV9LKEgAod7VEUmKX4AQ==
X-Received: by 2002:a37:a388:: with SMTP id m130mr4178905qke.226.1591385577329;
        Fri, 05 Jun 2020 12:32:57 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id s70sm563888qke.80.2020.06.05.12.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 12:32:56 -0700 (PDT)
Date: Fri, 5 Jun 2020 15:32:54 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Dan Callaghan <dan.callaghan@opengear.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] docker: enable docker.socket instead of docker.service
Message-ID: <20200605193251.GA57767@gmail.com>
References: <20200603043245.604769-1-dan.callaghan@opengear.com>
MIME-Version: 1.0
In-Reply-To: <20200603043245.604769-1-dan.callaghan@opengear.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Looks fine to me.

Merged.

Bruce

In message: [meta-virtualization][PATCH] docker: enable docker.socket instead of docker.service
on 03/06/2020 Dan Callaghan wrote:

> The docker daemon supports systemd socket activation. If we enable
> docker.socket (and not docker.service) then the daemon will be started
> when it is first used.
> 
> Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> ---
>  recipes-containers/docker/docker.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
> index 32d4a2e..4bcb409 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -49,7 +49,7 @@ PACKAGECONFIG[transient-config] = "transient-config"
>  inherit systemd update-rc.d
>  
>  SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
> -SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker.service','',d)}"
> +SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker.socket','',d)}"
>  SYSTEMD_AUTO_ENABLE_${PN} = "enable"
>  
>  INITSCRIPT_PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','${PN}','',d)}"
> -- 
> 2.25.4
> 

> 

