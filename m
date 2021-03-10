Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.4061.1615347384690900828
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 19:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M+JqsZdh;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id s7so15510154qkg.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Mar 2021 19:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P30ak5glUOFlVA99dGsI+0aakLC+2e8CdThnc+JjwQA=;
        b=M+JqsZdheS4Ryl6cfRG2OmxCYmYQ+sAHLIzdudumWi6V7uSWM2ni64v5K8m/FnzOjq
         unsmOHnnt74VQjpozRq+53lxNQEoqQTe69aKHmhM7SsVkcTsAbrBKE0SZXeA7gKZqC6W
         IEnly1ZwJXvMggim1/bScnY+0X+bn+scDvNLcMmVrQYNzkes7Je2H+iQZ/M3UZDNrCM9
         cfey4g/4H/TYxv6P2rhgbWVuSKr1ZtvkEPm4U3bVVzXHaodTacG8GMBKMUZ/V9g8BGtb
         dSXt4iJycZ/KANlnvyc2JRQeCWPlFsVWfOGOxmIa2+FHoa87Lx9k3qO3HZGAmVIGfO92
         zUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P30ak5glUOFlVA99dGsI+0aakLC+2e8CdThnc+JjwQA=;
        b=I5g9xgsG94Fetic83XhkGCyyaooU6QoagLMC4WqgBYIIlNAAlnF/8X9hzadUdh/b3i
         wjldoUhFJpXc7A0o01SI8ccoYuuqp1dLxCxc4r7ft+wkXc27QJnlKPC8BKrPZ8bxqaTD
         2exX1949dm24naDrDzFcHXnziS0TIV5qNHCgBH+HBqouLG0kSFEyNn5qgYW8T0ZysyZ3
         N0VPncPB3H/dc5sohUQ27p8aY4g1ti9hEjEmIHhkjdmJSU3Nm/li6DqrQlXM6UpV6a9j
         sJhdZ6QoqnfTcC9iaQyKKaXcni8Ttq1n1BdtFWIRYyma0zi77zIRSfyfL7FjnVkp90UX
         /s9Q==
X-Gm-Message-State: AOAM531zfH7ObgMOkeJEroCvshSsh6fWMhh+HZXzeiG4Pg15NWFbSzPh
	vudxAt97zIDr8yFbzrzRltUpknT/uCV6iuzx
X-Google-Smtp-Source: ABdhPJwuY28QcNf4ci6FiqUPkbGS2g7ngBUhFUry18JuB6LdiJ0KMQ/Q8q92FNHPhpjJLmFBniWp6g==
X-Received: by 2002:a05:620a:1679:: with SMTP id d25mr918325qko.102.1615347383829;
        Tue, 09 Mar 2021 19:36:23 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id z7sm11628440qkf.136.2021.03.09.19.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 19:36:23 -0800 (PST)
Date: Tue, 9 Mar 2021 22:36:21 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	christopher.w.clark@gmail.com, nd@arm.com
Subject: Re: [meta-virtualization] [PATCH] seabios: upgrade to version 1.14.0
Message-ID: <20210310033621.GB15907@gmail.com>
References: <798105b0371a04f3cbfec14966a336b68fcad5e6.1615287248.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <798105b0371a04f3cbfec14966a336b68fcad5e6.1615287248.git.bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] seabios: upgrade to version 1.14.0
on 09/03/2021 Bertrand Marquis wrote:

> Upgrade version of seabios to the latest one.
> This is solving compilation errors happening with newer version of gcc
> introduced in poky which in the following error after some warnings:
> "x86_64-poky-linux-ld: cannot use executable file 'out/rom16.strip.o' as
> input to a link"
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> This change has only be tested to compile properly by building an x86_64
> image for qemu x86_64 with Xen activated.
> I could not check that the generated binaries by seabios are properly
> working.
> ---
>  .../seabios/{seabios_1.13.0.bb => seabios_1.14.0.bb}          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-extended/seabios/{seabios_1.13.0.bb => seabios_1.14.0.bb} (87%)
> 
> diff --git a/recipes-extended/seabios/seabios_1.13.0.bb b/recipes-extended/seabios/seabios_1.14.0.bb
> similarity index 87%
> rename from recipes-extended/seabios/seabios_1.13.0.bb
> rename to recipes-extended/seabios/seabios_1.14.0.bb
> index 4cf4420..1591cb6 100644
> --- a/recipes-extended/seabios/seabios_1.13.0.bb
> +++ b/recipes-extended/seabios/seabios_1.14.0.bb
> @@ -16,8 +16,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504
>                      file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6  \
>                      "
>  
> -SRC_URI[md5sum] = "1dc1725bac1d230bfd6b3204eed4f2f7"
> -SRC_URI[sha256sum] = "37673dc2d6308591b15bdb94e5bcc3e99bdb40198d2247733c43f50b55dbe703"
> +SRC_URI[md5sum] = "9df3b7de6376850d09161137e7a9b61f"
> +SRC_URI[sha256sum] = "eb70cc62b29aa83e10a653233acebf4bb154d00d0c87dc2a2c6e2da75e5e81fd"
>  
>  FILES_${PN} = "/usr/share/firmware"
>  
> -- 
> 2.17.1
> 

> 
> 
> 

