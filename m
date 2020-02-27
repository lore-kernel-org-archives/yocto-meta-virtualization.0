Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.1283.1582840667504625561
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2020 13:57:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mF6m08GO;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id ci20so409647qvb.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Feb 2020 13:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MTXnMArVLIi3o4u5rz5N+vl8UvHip+FoVJnPD+tBu28=;
        b=mF6m08GOA/dqCXxRAL6BgJiFZoNCRsQtrYzEnEoDwDnwqULxhr/3AOly3DJukaQjUP
         7n7YKJ3/es+Lx5+8rhNpu0xijIVwfoP82RSKV0NWveA0o3hBUgcA2HVYWrosxSCQ9Xyw
         px5ZZ+5nYWvs/MRZwXD02vpMmNMuQqTzymLPd5FNFbC1/LJ6tx16WKToeoSBQHW8d+8Q
         xVyNGw4Uw/oxuNCzwgrQbg+ubwC24R68CBA82G65IOeiRtZ3XBcW5CNzAe2AEj5BYur7
         6yk257Q3I0xbrGTCeU8VMaKybzuUun+dPhWn5197rI4wHWI1We07jSDzAFY62B5nDMCa
         lTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MTXnMArVLIi3o4u5rz5N+vl8UvHip+FoVJnPD+tBu28=;
        b=p72YREp9paD+X+v/FibuenKXA4lbkRGUcpyWIdF45I9RObvsZJAk/xOWgLF+C4HLwr
         H3XOREGLArkHe9bV/6gciJScyBA62cEJcgmiKuThK/PDT9iZ1VKg7uaBXacum6WKZBRj
         OMKE6sVFKh/cRtWpsY3MrzQUK2vUYLEpMYEiTyl7vhuZWRqfsV5u9utB5I84cIXERzZo
         aYbOpUwN3c9GSf3Mf+DP5/Imixil9MKihXRluFrmlxMYUwi+OanlWyOWtBKweLSXH0by
         pzgIOEYWdzKT94xXabdk1MVkxSa8u0XhPGnnrPaQ1Wt86hd4qK0fmswUllNw4ZNNhu0s
         G1NA==
X-Gm-Message-State: APjAAAVXipL+Fv0S9gQXGkKSFqOajfkSD1Go7IwDZJhraRLHSjyyyoSm
	aPz53XXEisNjXofkZ8fHrgFJWc4S1O4i6g==
X-Google-Smtp-Source: APXvYqyfbeFPLQcJhcQp7Z9gK/ZmLKEeXx+mb/ZGKpMBrsDiCHZOfgtKiQ6Pq5aQa9kTNX9hxwJNiw==
X-Received: by 2002:ad4:4e46:: with SMTP id eb6mr1182524qvb.64.1582840666549;
        Thu, 27 Feb 2020 13:57:46 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE98dac44fc29f-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.255.134])
        by smtp.gmail.com with ESMTPSA id w134sm3847323qka.127.2020.02.27.13.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 13:57:45 -0800 (PST)
Date: Thu, 27 Feb 2020 16:57:44 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Phil Coval <rzr@users.sf.net>
Cc: meta-virtualization@lists.yoctoproject.org,
	philippe.coval.pro+meta-virtualization-lists.yoctoproject.org@gmail.com
Subject: Re: [meta-virtualization] docker: fix init script for busybox
Message-ID: <20200227215743.GC36079@gmail.com>
References: <20200222085456.8144-1-rzr@users.sf.net>
MIME-Version: 1.0
In-Reply-To: <20200222085456.8144-1-rzr@users.sf.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization] docker: fix init script for busybox
on 22/02/2020 Phil Coval wrote:

> Observed issue using BusyBox v1.30.1 not supporting bashism
> 
> /etc/init.d/docker.init: line 43: syntax error: unexpected redirection
> 
> Change-Id: I9f73564cfb56352fbf7d80723ea938b66eceb5c7
> Forwarded: https://lists.yoctoproject.org/g/meta-virtualization
> Signed-off-by: Philippe Coval <rzr@users.sf.net>
> ---
>  recipes-containers/docker/files/docker.init | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/docker/files/docker.init b/recipes-containers/docker/files/docker.init
> index b37ddc9..24f8fea 100644
> --- a/recipes-containers/docker/files/docker.init
> +++ b/recipes-containers/docker/files/docker.init
> @@ -40,7 +40,7 @@ start() {
>      if ! [ -f $pidfile ]; then
>          printf "Starting $prog:\t"
>          echo -e "\n$(date)\n" >> $logfile
> -        "$unshare" -m -- $exec $other_args &>> $logfile &
> +        "$unshare" -m -- $exec $other_args >> $logfile 2>&1 &
>          pid=$!
>          touch $lockfile
>          # wait up to 10 seconds for the pidfile to exist.  see
> -- 
> 2.20.1
> 

> 

