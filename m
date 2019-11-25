Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.2431.1574716095979392826
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 13:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M51T+gg5;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id 59so13355901qtg.8
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Nov 2019 13:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=81rJ6L1D02sT0P7kZixmGaf+f6dGR88BOe7+OIgiZ/k=;
        b=M51T+gg54E0WhHwT8l4tTApmiUADYFpwciy8X9yWVm/90gVOmCA2rIMcKMBUjaGlVI
         p1FmwwMBGPndS725uH16G70YHrHZSjtHGqQ56v3QwgSjzGW75bRBPcE+SWmNrFHfhyjz
         4bF8jzx08N/9HaHg/73OeHgN+P24NwMAkLfOwi76+pw8dHne+TRAS6f1i7KynKgLNZ3u
         +zwutYzKgWtHFFG1EATdIfc9AxpDw2fEvbajNYJvuHNCZS/ljgyP5WKR6LOumyGLsgoF
         go2mVtdeCnBU0+PiLobcOsNA4m71oFXGI5w+OOBofCqm9P5b1TELOceamiZ+NL0REXH+
         ptiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=81rJ6L1D02sT0P7kZixmGaf+f6dGR88BOe7+OIgiZ/k=;
        b=TSYkhWHRoASG22XLAU+I1/UdZ1Og8qQpxjwr5S3Rc1pKklVPGjUElUJS5kcpoV23b2
         yCjzWShpEbXJ3YNWhvqjjzWWflRpBOLn3DLZqgc28myyxqBE8kgv+6Fiq2Et75PMW5Bb
         yvW62csPy5lbuEO6TgIk5wnYP31q1o43+EWsP0tDUFlq/oLNcua0bYNbHivX+jMu9VcA
         1U0C9fTqwMLe7MrRUSvxE6u4GGg6GruVVokjLSnVB3ZxaOccCfp4fpdkiWQFXXo224gc
         ivPKwNA2SK4RLFz+vbxlvubvudp8AiCgYdLuUCr92yDghiTvTW1zl8Cw7bfXmxG77Nhe
         9v+w==
X-Gm-Message-State: APjAAAXk2+Yo5RC3KnhU5wFKOP4AiUttaZiuaCdS7PeRcXbrKPdHuRX/
	09g6Tb++S+q7dy+ecnqPflQ=
X-Google-Smtp-Source: APXvYqxZ+5eUYNCv9pz0GTxWrrk2mq4J7OdXM9B+t2wXqJcF1IYig8uL1rpf/1iC0cnA2LnSR1/aTg==
X-Received: by 2002:ac8:2ce1:: with SMTP id 30mr13596707qtx.381.1574716094909;
        Mon, 25 Nov 2019 13:08:14 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id l12sm4656847qtf.93.2019.11.25.13.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 13:08:14 -0800 (PST)
Date: Mon, 25 Nov 2019 16:08:12 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, stefan.agner@toradex.com
Subject: Re: [meta-virtualization][PATCH] python-sqlalchemy: drop 1.0.16 recipe
Message-ID: <20191125210812.GD27677@gmail.com>
References: <1574629325-30122-1-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1574629325-30122-1-git-send-email-liu.ming50@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH] python-sqlalchemy: drop 1.0.16 recipe
on 24/11/2019 Ming Liu wrote:

> From: Ming Liu <liu.ming50@gmail.com>
> 
> Seems no one is referring this recipe, there is already a
> python-sqlalchemy_1.1.5 recipe in this layer.

It's unclear how we ended up with the two versions, and I can't find
a log (and can't remember) about why we did have two of them .. so
I've gone ahead and merged this.

If something breaks, we can revisit.

Bruce

> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  recipes-devtools/python/python-sqlalchemy_1.0.16.bb | 16 ----------------
>  1 file changed, 16 deletions(-)
>  delete mode 100644 recipes-devtools/python/python-sqlalchemy_1.0.16.bb
> 
> diff --git a/recipes-devtools/python/python-sqlalchemy_1.0.16.bb b/recipes-devtools/python/python-sqlalchemy_1.0.16.bb
> deleted file mode 100644
> index 5eb60b5..0000000
> --- a/recipes-devtools/python/python-sqlalchemy_1.0.16.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
> -application developers the full power and flexibility of SQL"
> -HOMEPAGE = "http://www.sqlalchemy.org/"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d7dba1721bc8ce05d421f7279cb87971"
> -RDEPENDS_${PN} += "python-numbers"
> -
> -SRCNAME = "SQLAlchemy"
> -SRC_URI = "https://pypi.io/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "42c81726e7e145c206dac46964b4a167"
> -SRC_URI[sha256sum] = "e2dfdaa0983931ac1b0522dd637f08a52cf3081746513ac79c50843277ebe463"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -- 
> 2.7.4
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4735): https://lists.yoctoproject.org/g/meta-virtualization/message/4735
> Mute This Topic: https://lists.yoctoproject.org/mt/61881654/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-

