Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.6663.1588432342355663515
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 02 May 2020 08:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pDgcQunN;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id 71so10271493qtc.12
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 02 May 2020 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qjLEWlmWOZp2L+zbkg3ubtL4YQCPCo0+NQvHAov1fw0=;
        b=pDgcQunNlhNtMuF6E+ft3i1dN5ijTUklsjAOdkIQDR4IAob85jmIeO2lSx4PY/uzPv
         8NJUdS80UtDGVQF7evDsX77b5JrDPKsyCkkDxTbBVXlCHbA7f2fk3gRmvog+JjNO+Nyp
         D//28+mT/SPCK03zMm9XkdieYbOzwqlpkbT4e37g/V1RDuA994Y7HaD2HbtuFCkZRfpv
         Jgk3pk25cl30nyK9rXxBcrxfytGcHw029tUACJ6rVj/pBwiZqg0b3ogVWlWKWa9fEz6I
         vhVL1npITPgCP0aKTivn/bboH7bmr17iNOGydZSDE+ZBYmJhNn0h/4sLQyoF3gJBzvq3
         5LcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qjLEWlmWOZp2L+zbkg3ubtL4YQCPCo0+NQvHAov1fw0=;
        b=LPMrWeLbHpC6uygxszAJVcivi19wI6JDOxSSvG8WZPlquU0bBgsoLkLHTL7faHjv+w
         aUayJWf/0oeVn0y3NkAmnR5N75LahACNl97F3QX0e15yaAMKp2mae6e+KStcXhYcfITE
         Th+eX62zJInYi+AeHuOWs2LnW9XKp8zhjNurR2W3cPhHWse7yEZMq0HN3Gse+2OvfC+Z
         PpFPY+ul5aQuOC8UH4F2vJhnj/uJRw92+TsKmLYC9hbJZ3vzYaxrN2GWZaWhFMhiUuyE
         4/XP+boAaUb1Gkz+j+AK7VI/WrhrlJZU58W0j9BVIwm0/+ozUUlo748mSijm57R3wK6N
         q9nw==
X-Gm-Message-State: AGi0PuZil/ZwwM0RmNn5ZOh+uGV5aDqe5LxXGWmo+RZO/Nh92eEBpRZm
	6UfMzk6nokZ5w5rsy7V3u5tZbE9txCY=
X-Google-Smtp-Source: APiQypL7ChPbZC5sK/MOxSZmagqeJa1Sg3sgMW6tal6kDUu0M1WsIraaoS3P3FBBoMuRQsnDjn5uCw==
X-Received: by 2002:ac8:5057:: with SMTP id h23mr8855502qtm.287.1588432341148;
        Sat, 02 May 2020 08:12:21 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id d69sm5355663qke.111.2020.05.02.08.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 08:12:20 -0700 (PDT)
Date: Sat, 2 May 2020 11:12:18 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] ruby: Add sysroot dir to the ldflags and process all the existing extconf.rb
Message-ID: <20200502151216.GA10315@gmail.com>
References: <20200429103120.10716-1-psaavedra@igalia.com>
MIME-Version: 1.0
In-Reply-To: <20200429103120.10716-1-psaavedra@igalia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged!

Bruce

In message: [meta-virtualization][m-c-s][PATCH] ruby: Add sysroot dir to the ldflags and process all the existing extconf.rb
on 29/04/2020 Pablo Saavedra Rodi?o wrote:

> * add lib path of the sysroot directory [1] to avoid ld errors during
>   the installation
> * ruby_do_compile() find the extconf.rb file in the sources instance of
>   assume a single file.
> 
> [1] https://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#var-STAGING_LIBDIR
> 
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  classes/ruby.bbclass | 34 +++++++++++++++++++++-------------
>  1 file changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/classes/ruby.bbclass b/classes/ruby.bbclass
> index 15ac9f4..5fb8e6b 100644
> --- a/classes/ruby.bbclass
> +++ b/classes/ruby.bbclass
> @@ -104,23 +104,31 @@ EOF
>    system("perl -p -i -e 's#^arch =.*#arch = ${ruby_arch}#' Makefile")
>    system("perl -p -i -e 's#^LIBPATH =.*#LIBPATH = -L.#' Makefile")
>    system("perl -p -i -e 's#^dldflags =.*#dldflags = ${LDFLAGS}#' Makefile")
> +  system("perl -p -i -e 's#^ldflags  =.*#ldflags = -L${STAGING_LIBDIR}#' Makefile")
>  EOF
>  }
>  
>  ruby_do_compile() {
> -	if [ -f extconf.rb -a ! -f extconf.rb.orig ] ; then
> -		grep create_makefile extconf.rb > append2 || (exit 0)
> -		ruby_gen_extconf_fix
> -		cp extconf.rb extconf.rb.orig
> -		# Patch extconf.rb for cross compile
> -		cat append >> extconf.rb
> -	fi
> -	for gem in ${RUBY_BUILD_GEMS}; do
> -		${RUBY_COMPILE_FLAGS} gem build $gem
> -	done
> -	if [ -f extconf.rb.orig ] ; then
> -		mv extconf.rb.orig extconf.rb
> -	fi
> +    EXTCONF_FILES=$(find . -name extconf.rb -exec ls {} \;)
> +    for e in $EXTCONF_FILES
> +    do
> +        if [ -f $e -a ! -f $e.orig ] ; then
> +            grep create_makefile $e > append2 || continue
> +            ruby_gen_extconf_fix
> +            cp $e $e.orig
> +            # Patch extconf.rb for cross compile
> +            cat append >> $e
> +        fi
> +    done
> +    for gem in ${RUBY_BUILD_GEMS}; do
> +            ${RUBY_COMPILE_FLAGS} gem build $gem
> +    done
> +    for e in $EXTCONF_FILES
> +    do
> +        if [ -f $e.orig ] ; then
> +            mv $e.orig $e
> +        fi
> +    done
>  }
>  
>  
> -- 
> 2.11.0
> 

> 

