Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.1481.1582841946773834320
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2020 14:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q0DBjmpX;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id z12so1074448qkg.12
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Feb 2020 14:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=381G077zkRDyAP6HQKZsifeS3QAZ9ROaVmGNVBztyso=;
        b=Q0DBjmpX/58MIUT5025GthFPuJvDXuu4/OP3wwa3NsipZyGw9fr+WnJnR+zwPePf5a
         yO1qbrPd+iDnrS/1XPhXNSCOnJ4xl01Y7kq9XZo6eGQDD9YL4smXKJbtKSdtQydA80td
         RJHG4AEYg5ScwyPPxwi5toRrVEz3RX2QI3nsVlyiMy4EHAKoeFXZpkuPt4X5Xl17JcNs
         fPT3BpMJujla6LA8oglsepoF8XNaZV5FSEvK7C//OVa3yXWEDydPSULW2Kt3Epg1747U
         tTPrK37KcWenMc5u+GZjnjBZLJuc/aCJqkR7o0zVhqQFgpmxru/rXAanRFh+Qxc+yf1d
         xq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=381G077zkRDyAP6HQKZsifeS3QAZ9ROaVmGNVBztyso=;
        b=EoW70sahHFhdGdc59kpXukSDUNyvOB+lBjB9DkkL6p3yXOttq7tVq6W5boOhdVzb97
         yOz2Nyr7K7UBh74LB88i8gd1TNZszNEfbCiyRkDxVZvbWUDbTyyueyKpfYu0VW/bHeZJ
         wva/qqZnMFhFx86AGbKYG7r9Rm8uiL2hvU41SgxpNIO5KFjivRCtNrh58TwVafjGSgb5
         qq+q5FdaP/+BiEpb8k9G9OsXb32r63jAYGb0KWLhRdL0Lv7lRrXt0Nyw0angZ8QmQ5Qk
         DFXWKfMNhVEJQAAJ9S1cMHQpmGSWXDOeKhP0d5AOPAM6gfT25SylwVddzGk9NhyI+DbL
         rPLA==
X-Gm-Message-State: APjAAAVLMTu13qg4clsrTyvjw86RcAKFdIyE3jkgjPGuJceYa3QqtH4g
	flFiN1tNbCSLNGpZQ0Tf3bR8b9zHLsSYmQ==
X-Google-Smtp-Source: APXvYqzcisqt16K1WsL9gUMC7S4bLu80JFSDRwVrdZE8TIuC9h3zaQTPG+s/z9aZsBokFO1NVPpZ3g==
X-Received: by 2002:a05:620a:1262:: with SMTP id b2mr1793278qkl.430.1582841945928;
        Thu, 27 Feb 2020 14:19:05 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE98dac44fc29f-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.255.134])
        by smtp.gmail.com with ESMTPSA id u2sm4066334qtd.72.2020.02.27.14.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 14:19:05 -0800 (PST)
Date: Thu, 27 Feb 2020 17:19:03 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: "Fagundes, Paulo" <paulo.fagundes@opengear.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [[meta-virtualization][m-c-s][PATCH]] salt: bump 2018.3 -> 3000
Message-ID: <20200227221900.GA38669@gmail.com>
References: <20200224200705.3445460-1-paulo.fagundes@opengear.com>
 <22510.1582580756302855054@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <22510.1582580756302855054@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: Re: [[meta-virtualization][m-c-s][PATCH]] salt: bump 2018.3 -> 3000
on 24/02/2020 Fagundes, Paulo wrote:

> hey everyone I've uploaded a patch for upgrading salt to the latest v3000
> version (codename: neon)
> 
> this patch includes the following changes:
> 
> - upgrade to salt 3000
> - use systemd
> - make the set_python_location_hashbang.patch also change from python to
> python3
> - reworked do_install_append()
> - removed the tornado dependency whereas it is now vendored upstream
> - removed most files in the files/ directory whereas those are already present
> in upstream salt/conf and salt/pkg directories
> 
> After uploading the patch I've noticed that as a result of the changes in
> do_install_append(), the following config files are no longer installed
> automatically to /etc/salt/
> - cloud
> - roster
> - cloud.conf.d
> - cloud.profiles.d
> - cloud.providers.d
> 
> I could add back the above config files and upload a new patch, but I think
> I'll wait on feedback before uploading a new patch.

The update looked fine to me, so I went ahead and merged it. I'd rather
have something in the tree versus iterating on it out of tree.

Cheers,

Bruce

> 
> I'd be happy as well if someone else picked up from where I left off :)

> 

