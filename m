Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.1511.1582841785091051899
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2020 14:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oof9qAYt;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id m2so1104064qka.7
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Feb 2020 14:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eRYu9nymk6uLHS4+mEntB3Nb7Vo3asS/4uXY3ZU1sgM=;
        b=oof9qAYtq0yIlImhlhwXVJ0NPWQGx1tVyboKy9bJOIepp4OgeGfGXO3CAyRTe1N7Ru
         bd9TS8HsGU3JLWl4pNQfTLrdjIky4UieV6p7i5f8wVA2FyJu7ARwJSLkky1BZQunCNkS
         R+RqRuo89hW9h7bEEejcl3vyZ3axxRwOA/bLcIKaMjgzQXRruKkbGGs+rSeej96gB480
         nXkcVf2qN8mtwdj7stUMFlWu7rFxnYdpeR+S0v4Zeuib4ePoXSdrzQ4IU8PzS39aWutb
         zC5Q5aZ+79z3xYwLSJfh1Kik2PI+rCb94NGMyMsaAyuD5sfZzT+7NWZyYMI0wV+fkys9
         Ju2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eRYu9nymk6uLHS4+mEntB3Nb7Vo3asS/4uXY3ZU1sgM=;
        b=OgSvyQhKoG1DYRtlfiHMv8bZFJyKY6A28sFA+VOAiI6aJ+SqUHeOSnUAW2rBUkTkli
         iSSTbsm7mP4lRMgDZhtVKXfAL/7jJenmCEnRCVAfkpp+FxwzWU7cPNk3f9gGi+G1Rh2q
         fvuz5ZYCZCzHsNdumLcGMtJv9hCuoGmSn18/q2puMu4G/fpBoJPwAy5ucxMWWmNgVyfN
         J8MVUGIzVyNyTUIz6b5+g3MLIV07wGa65VVYabeIUKLjJcuR2pOE02gZKg5KPv5RJ7S0
         Q8p6g9c+KJsL2luyXSJRHwNuy2JvJWLW5BHuRkLdIXoZKXw1oVII4uxJcpfEvnwJHTEb
         heNw==
X-Gm-Message-State: APjAAAUuepxB/a4w4/VuNITHUPrzGa5PgjcZR2+4ULb3bh/4DbeWGPlR
	SGKRG5AqriFhZ+6LphrzWqo=
X-Google-Smtp-Source: APXvYqwZGSetdzVMRnwdnhsuPKIqQ2u81FAyCugkDduR3+EWf2PQOpVg9dpVzBBxxQr67fWsYLZLeA==
X-Received: by 2002:a37:4e89:: with SMTP id c131mr1863005qkb.5.1582841784157;
        Thu, 27 Feb 2020 14:16:24 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE98dac44fc29f-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.255.134])
        by smtp.gmail.com with ESMTPSA id g6sm3898236qki.100.2020.02.27.14.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 14:16:23 -0800 (PST)
Date: Thu, 27 Feb 2020 17:16:21 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] python-novnc: typo from distutils sed fix
Message-ID: <20200227221620.GA37799@gmail.com>
References: <20200215060655.7821-1-jpuhlman@mvista.com>
MIME-Version: 1.0
In-Reply-To: <20200215060655.7821-1-jpuhlman@mvista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged!

Bruce


In message: [meta-virtualization][m-c-s][PATCH] python-novnc: typo from distutils sed fix
on 14/02/2020 Jeremy Puhlman wrote:

> ---
>  meta-openstack/recipes-devtools/python/python-novnc_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-novnc_git.bb b/meta-openstack/recipes-devtools/python/python-novnc_git.bb
> index 4898bae..3f36ef5 100644
> --- a/meta-openstack/recipes-devtools/python/python-novnc_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-novnc_git.bb
> @@ -11,7 +11,7 @@ SRCREV = "3b8ec46fd26d644e6edbea4f46e630929297e448"
>  PV = "0.5.1+git${SRCPV}"
>  
>  SRC_URI = "git://github.com/kanaka/noVNC.git \
> -           file://python-distutils3.patch"
> +           file://python-distutils.patch"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.13.3
> 

> 

