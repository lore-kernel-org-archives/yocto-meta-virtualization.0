Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.7911.1618496837532316668
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 07:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=op0aCcaL;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id d23so13278491qko.12
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 15 Apr 2021 07:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=5GbOPjtGpmEhioEpFBC2Vt+Dw9jhhEDPwbXi1xq9Vr0=;
        b=op0aCcaLQsSUpMmXSfhwNrdAoGPdd6YIb0quByd4LowX0TI+NPDhFmoBBfockvGfF4
         y2iLb6HJmxYbelqv+ibylpBndfmueHo5hYzRasjwN1z1OjVibmWOGAxF7SdUIl8ecbky
         UneFplrONTaFBNKvBmszIT8vw5Rs3Dj68rYJSdw2P43wVtLXdXvwWoZhSaw2E38B4Djj
         FDwgBNVDlaHeew8EmXsVwxmW8a72+4DE09/o+Y1A8SKwbFV2kQhkDzv9tm71+F5QnW+/
         0r6iAxs2ghEb7kzrXJQz8oeicbFgE0uFp9RiaC7TC4aunTaaUSqx1tgHqdtCuuLhRxcg
         X21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5GbOPjtGpmEhioEpFBC2Vt+Dw9jhhEDPwbXi1xq9Vr0=;
        b=D2wuUpnoopaC3v2Mo8dVKx7YOT66AgguzSCuVi4DAT2spMh+DbyzDywvTf6OtRQXpm
         iPaIyUsYPJjU/lLASx7+6X9Q5yoVTyHshOqpEnIZz8fiKU7frwvkKOdwghaiEUpCfEJf
         GAcOepPAXFqeP9kjMgz1CisaMqk79KsmIFdML9+aFeqKLJHKWad3rja8+ytErgMP9hR8
         6QHCVyDMMR4dEVysF1R3iglblKNvVseTlPdc+KcX8T5z2dZV9SJvv1V8PDb2Yni6NOEx
         IlylI6Kfew7PCsG8plxH0ZrOFup6i9Ayxttjwvf6jtAK4B2i10JjNAbP7KWmjAHINn6y
         jfbQ==
X-Gm-Message-State: AOAM530PzpnFsfXIioRCkOSgUbEOkhfYHUtlYWM7R/4JWyaPA17aKwa0
	7ic72ARGpyO3P1Usyh2e2pQwxFAW+uG+vg==
X-Google-Smtp-Source: ABdhPJzCHNVw/p3HtW+oq3qhmy3d4lKf/pb5zGZraVxCfOqi3RLmWFdD+2RPYUUkZ7vBZwJH/agQAg==
X-Received: by 2002:ac8:4796:: with SMTP id k22mr2130266qtq.118.1618496267597;
        Thu, 15 Apr 2021 07:17:47 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id v6sm1971516qkf.132.2021.04.15.07.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 07:17:46 -0700 (PDT)
Date: Thu, 15 Apr 2021 10:17:45 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/6] python3-bugsnag: Upgrade 3.6.1 -> 4.0.2
Message-ID: <20210415141742.GA61220@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210414151435.9049-4-leon.anavi@konsulko.com>
 <20210414151435.9049-2-leon.anavi@konsulko.com>
 <20210414151435.9049-3-leon.anavi@konsulko.com>
 <20210414151435.9049-5-leon.anavi@konsulko.com>
 <20210414151435.9049-6-leon.anavi@konsulko.com>
 <20210414151435.9049-1-leon.anavi@konsulko.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged to master.

I've branched hardknott and won't automatically backport version
bumps, unless bugfix only (or other justified reason) and someone
points it out to me (the most important part!)

Cheers,

Bruce

In message: [meta-virtualization][PATCH 1/6] python3-bugsnag: Upgrade 3.6.1 -> 4.0.2
on 14/04/2021 Leon Anavi wrote:

> Upgrade to release 4.0.2:
> 
> - Fixed an issue preventing code being fetched from files in the
>   project root but not in the PWD
> - Fix issue where types were not packaged with the library
> - Added __all__ lists throughout to indicate the boundaries of the
>   public interface. This may affect your integration if using
>   import *.
> - Removed Configuration.use_ssl and Configuration.get_endpoint()
>   in favor of including the protocol in Configuration.endpoint
> - Configuration.send_environment is now False by default. Enable
>   it as a part of your configuration to send the full request
>   context (if any) as a part of each event.
> - Removed bugsnag.utils.ThreadLocals as it has been superseded by
>   the contextvars API
> - Removed bugsnag.utils.merge_dicts, an unused helper function
> - Removed bugsnag.send_sessions
> - Deprecated bugsnag.notification.Notification in favor of
>   bugsnag.event.Event to better align with Bugsnag libraries on
>   other platforms. The Notification class is functionally
>   equivalent and will be removed in a future release.
> - Added a request property to Event.
> - Added type signatures throughout the library.
> - [WSGI] Use X-Forwarded-For header if present to determine the IP
>   address used as the default user ID. The remote address remains
>   available in the request metadata attached to the event.
> 
> License-Update: Check only a single line from PKG-INFO
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-bugsnag_3.6.1.bb => python3-bugsnag_4.0.2.bb}   | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename recipes-devtools/python/{python3-bugsnag_3.6.1.bb => python3-bugsnag_4.0.2.bb} (70%)
> 
> diff --git a/recipes-devtools/python/python3-bugsnag_3.6.1.bb b/recipes-devtools/python/python3-bugsnag_4.0.2.bb
> similarity index 70%
> rename from recipes-devtools/python/python3-bugsnag_3.6.1.bb
> rename to recipes-devtools/python/python3-bugsnag_4.0.2.bb
> index 3238579..96550bb 100644
> --- a/recipes-devtools/python/python3-bugsnag_3.6.1.bb
> +++ b/recipes-devtools/python/python3-bugsnag_4.0.2.bb
> @@ -8,10 +8,9 @@ DESCRIPTION = "\
>    "
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3bc101ebc0815bd849021892cd333dd4"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
>  
> -SRC_URI[md5sum] = "93443091b052130cfe1daf7595249f9f"
> -SRC_URI[sha256sum] = "8878437aa44ec485cecb255742035b3b98a6c7e7d167a943b5fbe597b2f8f7f9"
> +SRC_URI[sha256sum] = "7a49dacf055a8c6dda4ce714acd91fabe9546f1ad826276918a26603a8b5489a"
>  
>  inherit pypi setuptools3
>  
> -- 
> 2.17.1
> 

> 
> 
> 


