Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C70CD98D2
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 18:19:33 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76826.1781288369390350802
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 11:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CqTVYJdG;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9159da9bba5so97443985a.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 11:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781288368; x=1781893168; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLQoV/rtHoxSBGx1pKexnQ0h277NMxD6NteWbBlG9Fk=;
        b=CqTVYJdGP4aYRjd9qrlB3LsVr7vW58xhU0ziyW0qsilaCbHH231IeTIXkfnlNys37A
         e0U2KFvyHS8lmgVW7U9ExTBaHqlYn1SblLQb6LjgZS/gg5W5dJtaxU/p/NW4boRgt0Ps
         C3rQ7XAcbc6QjxM9ppzCV999/ZI8xsXbP05jAWonzgxGxKSB1xo+wlBSGU7Oy0fGDCPX
         RmWy4hv67LCs2pvTuPax+0KQVcTyWiKj52e0Twtl4bsDUayTGbptM8EL3fzHT0hn6/+m
         Z+1CvQvUuoL5ePHFrgmr5EADL6rff3FWsmAbkf+BWPI3dLNUNKNHQdMTewqzc4hbYlBS
         pVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781288368; x=1781893168;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qLQoV/rtHoxSBGx1pKexnQ0h277NMxD6NteWbBlG9Fk=;
        b=EfyCYNV06iq05o/uq0u9hhmNwyM3+pWmSzcpFYn6aY55dHnLSK2HdP6vcn78Hu0QWX
         poy4DueEPJevJYBwNy2p0oG0ifFSS2pK34uNYZg262C9z1y0eG9c9yUru2Nf31Hc8UYO
         NfeRdlqAUsb6G2WZ0OC+gnB1EQGXrWeLU6bOKn5XADt8fok7OPWZk3l5zD8io2FWFzvg
         20gwqM1LlbGe2z74G0n6wPT8cZ1AfkThgOp+cYLt9kKefHjWwB2gjCy45mC08TuLdNuy
         MwgMKAADOKSoCZHLRMJoC3H0Ty2V3TBtWT+LYtobqi+A+WhpBfO/Q/YFKtEnGnDX3I3X
         VmoA==
X-Gm-Message-State: AOJu0Yxc2sz4bkK/LGGfSasyYUgxILUB5adf5v7g0LM7hj0YBL7XF14l
	VDKiqQwDkP4SKtuNedRlDHGYcvaMaAMY2EIJ3uGUR6B90wZczb5a0KQ1
X-Gm-Gg: Acq92OFUT1cBmBmAMO84bUuc62xyJU/Albz/EM6iH4xnpcs0rfrDqibEo6AXDZjrVqr
	8aisNmtHEkhpjNobhTthABhz4sjrmIlqXJ8WpZFNWT0hJuJAQovatGOgmvgC79idxk3uyeJPaBG
	d0bh3MzUXXBzOEIW+YTjZ8sUus+eHg+8tDyex0piiCO3uMxcDyfzJE79TxaOTGNkYR1rN95MA2e
	UwndbNPBnq8ybEP6EqTOCpn0cPVEiI7qXA56KjO8p4vNdhAItRJnAui521PMNbjhLZhX8h7E7Su
	feWkDfLDRB3U7/Ba7e4Z7PSmC2AsaBWJ5Cg48qY2EAg785td0P1W850kFXiMZa4JDqELVVVIRjW
	qh2BEx9C9HCl4QWbpPv5P74iwpk64jD9wka9bFoQC/OYmwD4HPMQYdEILc5F+4rTa++KEjtpiWf
	s6Wuz6zRhTP4ErUGK2dPcM1/r3RyD0igVB/7FcsyjdGDd3xfbhUNG8G4S9C8U03fq7sSaeHDuHc
	rdXtuNHA3Vw3oWuNQdrd4phPN62injG29HZpxYe7IoLIZtmehVUbya9Fs4naUcSV2PZBNt9yipz
	ilqfXqerf4chGrJ9M28LliHSICf6OFt8GDI=
X-Received: by 2002:a05:620a:46a3:b0:915:87ad:d5b1 with SMTP id af79cd13be357-9161bbfca43mr590478185a.15.1781288368230;
        Fri, 12 Jun 2026 11:19:28 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619ed8aa6sm284650885a.2.2026.06.12.11.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:19:27 -0700 (PDT)
Message-ID: <6a2c4daf.3f8fff0e.33b006.22cd@mx.google.com>
Date: Fri, 12 Jun 2026 11:19:27 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 6/7] vcontainer-bbmask.inc: allow
 meta-webserver/recipes-httpd
In-Reply-To: =?utf-8?q?=3C9bdb3d78518c4c8a8247376aec613b23e4628bdd=2E1780104?=
 =?utf-8?q?071=2Egit=2Etim=2Eorling=40konsulko=2Ecom=3E?=
References: <cover.1780104071.git.tim.orling@konsulko.com> =?utf-8?q?=3C9bdb?=
 =?utf-8?q?3d78518c4c8a8247376aec613b23e4628bdd=2E1780104071=2Egit=2Etim=2Eo?=
 =?utf-8?q?rling=40konsulko=2Ecom=3E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 18:19:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9875

Hi Tim,

Small focused change, intent is clear. Two questions, one cleanup.

On Fri, May 29, 2026 at 18:31 -0700, Tim Orling wrote:
> Allow us to build nginx, apache2, etc. multiarch containers.
[...]
> +BBMASK += "meta-webserver/recipes-(?!httpd)"
[...]
>  BBMASK += "meta-filesystems/"
>  BBMASK += "meta-python/"
> -BBMASK += "meta-webserver/"

The mask is right and the regex correctly leaves recipes-httpd
parseable while keeping everything else under meta-webserver out.

A couple of things worth a follow-up:

  1. recipes-httpd contains both nginx and apache2 (and a couple of
     smaller recipes — hiawatha, lighttpd, monkey iirc). With this
     change apache2 also becomes parseable for the vcontainer distro,
     even though only nginx is used by 5/7. Is the apache2 inclusion
     intentional (to enable an app-container-apache2 follow-up later),
     or accidental?

     If accidental, tightening the regex to recipes-httpd/nginx- might
     be safer — fewer recipes pulled into parse keeps the dep graph
     smaller and avoids surprise cascades from apache2's deps.

  2. The companion entry in meta-virt-host.conf:

         BBFILE_PATTERN_IGNORE_EMPTY_<meta-webserver> = "1"
         (or similar variable name — the exact form is what
         meta-virt-host.conf uses for the other fully-masked layers)

     ...was added because meta-webserver used to be a fully-masked
     layer producing the "no recipes in this layer" warning. With this
     change, meta-webserver does parse at least one recipe (nginx),
     so the IGNORE_EMPTY entry is no longer needed and should be
     removed in this same commit. Otherwise it sits as dead config.

  3. Did you run `bitbake -g <container-image>` after this change to
     confirm the dep graph didn't pick up anything heavy you didn't
     expect? recipes-httpd's deps tend to be fairly contained, but
     it's worth a one-time check so we know the BBMASK fence is doing
     what we think it is.

The change itself is fine to apply as-is; (2) is the only thing I'd
ask be folded in before merge.

Bruce

