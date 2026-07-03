Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33657C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 15:28:47 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95662.1783092524663060738
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 08:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C5dV+j9D;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c8b49639fbaso505442a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 08:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783092524; x=1783697324; darn=lists.yoctoproject.org;
        h=message-id:date:references:in-reply-to:cc:to:subject
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Th8lhKgj345GotT/P2RLZX2dO8I/TVQhww7HEpj01sQ=;
        b=C5dV+j9DkX3G2pSFagsrcUD+SC6eOEQamsSG1ec+UTQZuMq6P903clRKrE3gn9A/sq
         3EDLCKAZ/0PhkGp1KPE04Je7CcPsCnzzv2A7j0Ait9DM4d0upYgWL5C/u6Xpi3BJMYMT
         T02b9I7HKbJn28GYFH4KWabkvpP5fS/+rW2H3jhwpK2uDIl8Sjd7gi5PiPHWcKMO7x86
         PFPRufpWsfOkoI2hXaOHYe0Rscp3ECtrGJi84E6PEfU6vYowS5SnQu0w2r8IGx8cA+CM
         OVC3UGDk/uvM8s04yMNZtI6+l4A0relu/5+Szifk4pd+t+NLTn5Lzk6PW987uZlNGwyI
         1u/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092524; x=1783697324;
        h=message-id:date:references:in-reply-to:cc:to:subject
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Th8lhKgj345GotT/P2RLZX2dO8I/TVQhww7HEpj01sQ=;
        b=pQFlx4h6/10Qzpgv9zo2cj+nZ1OSS0bkrFyhNPvzW4/7ESSQI7jO88NQhDxyqyRD/1
         wq7BDE9k9OsZ1XhDwGYuDVDpjXIeByRNL4Z0GzZzkCKtIjNvpPiuKaKCdCXiIkFi6SZd
         YqaqfAotqddUoYaCaI4H5pDEIzh3TaxuZ8wNPcuK9E59pwTTD77Pxo8eXPEygcwLpB3q
         iRKCFxwBaC/SkXbNK1aSBE1GGP6px1E4nySqEALreH+7NkNFxS0vf0aM8a6wbqIjPPUZ
         lLSHgNtgGINSif7r/xUb066Qrq3TWaHicftsJH8I2tnGp5LZvnrHL9ejdAKZT7SCIAdu
         d8mQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DGqKArWxeoSeIWqxxELPmJJqXeHrctI4eFC7N8fG/Oa6eqNbJG/72q4gFxERmQO3ViHWJuPHNwidixhQp1QrmY8VU@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxLA6pnSj3OZHPzVgb0m0yfqMr3OLcsYPU9hav4fJfqMaFF1oLB
	R1P12kr3Umuhr8wdBQ4IDmwcLv1wTTPtFu7TzdYTe3QhvUMULglcEakhUOZgsA==
X-Gm-Gg: AfdE7cmiBiE8LkfgTMSniQEOGLDUk9PT+zlYdnMRDj7uxVgi5h+4xk37EsPkj17Ft7z
	eGMYkxxJu0y/Aci56TaxXGHdCEpfI5sCSzJBY7D2u5e31VYwwJHu8oxqsdasog+9AV4btMGuRU1
	fmZHaxUGpm4ECQKPgZuRRHZq+l0+YdnhD/KnsVegbeHapccurx2oel/SwhjSL1dTv5291bxkcRf
	7JCQxqc1GzBJu6/nchHzvKl3FdI1TzimwYZcU2z1VB6weq9ZcEdF3Ps2+csFW24UClXk5Z3sx9n
	EdOHvxLcaq3KsrTqAMHYoUzSPHu6o8JFS67fG3QQSQE36gRgTkajLhmY3/0rTzfeSnyvdg2DuRG
	8CTtAxGX66XimywODM92QrpyJyZuTR1/WEKncyVZTjmUF0uQstb8WbkhgvcNuDzc+VOInEE6l5Z
	H9/pi7BfkW6VpypenSCHggjQUVme1CwltAYeHVqjtoLwYS7w==
X-Received: by 2002:a05:6a21:1f8a:b0:3bd:203b:982b with SMTP id adf61e73a8af0-3c03c542101mr353757637.16.1783092523830;
        Fri, 03 Jul 2026 08:28:43 -0700 (PDT)
Received: from macbookpro.home.local ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0ec6bsm2801751a12.7.2026.07.03.08.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:28:43 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [meta-virtualization][PATCH 6/7] vcontainer-bbmask.inc: allow
 meta-webserver/recipes-httpd
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: ticotimo@gmail.com, meta-virtualization@lists.yoctoproject.org
In-Reply-To: <6a2c4daf.3f8fff0e.33b006.22cd@mx.google.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
 <9bdb3d78518c4c8a8247376aec613b23e4628bdd.1780104071.git.tim.orling@konsulko.com>
 <6a2c4daf.3f8fff0e.33b006.22cd@mx.google.com>
Date: Fri, 03 Jul 2026 08:28:42 -0700
Message-Id: <178309252207.29524.2505848881416378603.b4-reply@b4>
X-Mailer: b4 0.16-dev
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 15:28:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9922

On 2026-06-12 11:19:27-07:00, Bruce Ashfield wrote:
> Hi Tim,
> 
> Small focused change, intent is clear. Two questions, one cleanup.
> 
> On Fri, May 29, 2026 at 18:31 -0700, Tim Orling wrote:
> 
> > Allow us to build nginx, apache2, etc. multiarch containers.
> 
> [...]
> 
> > +BBMASK += "meta-webserver/recipes-(?!httpd)"
> 
> [...]
> 
> >  BBMASK += "meta-filesystems/"
> >  BBMASK += "meta-python/"
> > -BBMASK += "meta-webserver/"
> 
> The mask is right and the regex correctly leaves recipes-httpd
> parseable while keeping everything else under meta-webserver out.
> 
> A couple of things worth a follow-up:
> 
>   1. recipes-httpd contains both nginx and apache2 (and a couple of
>      smaller recipes — hiawatha, lighttpd, monkey iirc). With this
>      change apache2 also becomes parseable for the vcontainer distro,
>      even though only nginx is used by 5/7. Is the apache2 inclusion
>      intentional (to enable an app-container-apache2 follow-up later),
>      or accidental?
> 
>      If accidental, tightening the regex to recipes-httpd/nginx- might
>      be safer — fewer recipes pulled into parse keeps the dep graph
>      smaller and avoids surprise cascades from apache2's deps.

I don't currently plan to support apache2 (I'd rather focus our energy on
Caddy). Tightened up the filter to (?!httpd/nginx) in v2.

> 
>   2. The companion entry in meta-virt-host.conf:
> 
>          BBFILE_PATTERN_IGNORE_EMPTY_<meta-webserver> = "1"
>          (or similar variable name — the exact form is what
>          meta-virt-host.conf uses for the other fully-masked layers)
> 
>      ...was added because meta-webserver used to be a fully-masked
>      layer producing the "no recipes in this layer" warning. With this
>      change, meta-webserver does parse at least one recipe (nginx),
>      so the IGNORE_EMPTY entry is no longer needed and should be
>      removed in this same commit. Otherwise it sits as dead config.

Removed that line in v2.
However, warnings are still produced in vruntime-bbmask-meta-oe.inc
Move the BBFILE_PATTERN_IGNORE_EMPTY_webserver = "1" there.

> 
>   3. Did you run `bitbake -g <container-image>` after this change to
>      confirm the dep graph didn't pick up anything heavy you didn't
>      expect? recipes-httpd's deps tend to be fairly contained, but
>      it's worth a one-time check so we know the BBMASK fence is doing
>      what we think it is.
> 
> The change itself is fine to apply as-is; (2) is the only thing I'd
> ask be folded in before merge.
> 
> Bruce



