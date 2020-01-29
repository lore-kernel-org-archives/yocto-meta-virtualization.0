Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.6609.1580312345097748662
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 07:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R8BvyYJu;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id p2so8192961qvo.10
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jan 2020 07:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7BQMIQUFt6MyURCMgTk/LxcYTAIaFZEozVpNxKpGPjM=;
        b=R8BvyYJuw6My8P7F7GR1qrn29i37OW0jATvvWtWv3z4J+F9qWa/rr48wFKiW32c9ZD
         Hw8bsCndJ3EpA2rpAZ+/5d0/HIFJr/91kDLiOdpFOk73HzfMR70SgTVO0Mj/H3mzk+Nw
         D/C48yxHvts1ue3/aCYBBs/N+u2x8y/HdFVXfvknQyfLOESRTnNoA1GRuX60D8CXWMQT
         PCDiPe3H7aq01IZQrBgTJDWprjxyuPEDAHaRpJNFGdKoKLnYE9A/mE75CHbZL4c26Y2o
         F7TNi3tFMpl55nWlnfAM9uVL/XnU9fWUUu3zItv/L+xgfzE8sCpGwFKbkJJGIoHmIO/+
         xSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7BQMIQUFt6MyURCMgTk/LxcYTAIaFZEozVpNxKpGPjM=;
        b=iK6c90Birel9iJP0NFUHI1ZqwHS4hYImwPpl8GEFadi3KC4f0Uts/FwbB/m28CWhDm
         U5LRoY5TDsqERBE5OLoZLmDgb4jyBzBsOC+UPii1sTrG5j603gerD0VW2GEK13YZV9ht
         VaAimdmSuNvWsII/Mig03jHgVQ84vJEScrDZb79w/+FRdcnq+v6UZRKFyjCs0JPafpkN
         Bsbfmar1anljuzIEfL1vD+OQe7yV4X601TU9oVYam4onRsw1VpgzX4Jr9RMWCP56sqjx
         FHkA68Jr17EBqW5tVY+ZRrvQCWe1SVsXoPVHcUG1Uf30OTrCJx2eZLV71YcyQmt7a4M/
         yAjA==
X-Gm-Message-State: APjAAAXo5cxKI1f9FJ0sjEHpo4DbCUBH5Ii1TdCSeAACiH99fykgJ7nK
	GokNgb/xtOk6MJoBrIyGTGc=
X-Google-Smtp-Source: APXvYqyWN+VcAG5gb3WBw4PluANJem763wpaOKwIRhUm8Ws5Pn7Om/JLt0sA+6Vz7/aQ4BE/9zRbPg==
X-Received: by 2002:ad4:4f47:: with SMTP id eu7mr28296126qvb.69.1580312344142;
        Wed, 29 Jan 2020 07:39:04 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id v55sm1277393qtc.1.2020.01.29.07.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 07:39:03 -0800 (PST)
Date: Wed, 29 Jan 2020 10:39:01 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@lists.yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-virtualization][PATCH v2] conmon: compile with journald support if systemd is enabled
Message-ID: <20200129153857.GA54261@gmail.com>
References: <20200127214854.29367-1-stefan@agner.ch>
MIME-Version: 1.0
In-Reply-To: <20200127214854.29367-1-stefan@agner.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce


In message: [meta-virtualization][PATCH v2] conmon: compile with journald support if systemd is enabled
on 27/01/2020 Stefan Agner wrote:

> From: Stefan Agner <stefan.agner@toradex.com>
> 
> Currently conman is compiled without journald support which leads to
> this error message when trying to use it (e.g. --log-driver=journald
> with podman):
>   [conmon:e] Include journald in compilation path to log to systemd journal
> 
> Make sure to build with journald backend compiled-in when systemd is in
> distro features by adding systemd to DEPENDS (through PACKAGECONFIG).
> 
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  recipes-containers/conmon/conmon_2.0.9.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-containers/conmon/conmon_2.0.9.bb b/recipes-containers/conmon/conmon_2.0.9.bb
> index fc76f15..af7847b 100644
> --- a/recipes-containers/conmon/conmon_2.0.9.bb
> +++ b/recipes-containers/conmon/conmon_2.0.9.bb
> @@ -20,6 +20,9 @@ inherit pkgconfig
>  
>  EXTRA_OEMAKE = "PREFIX=${prefix} BINDIR=${bindir} LIBEXECDIR=${libexecdir}"
>  
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
> +PACKAGECONFIG[systemd] = ",,systemd"
> +
>  do_install() {
>      oe_runmake 'DESTDIR=${D}' install
>  }
> -- 
> 2.17.1
> 

> 

