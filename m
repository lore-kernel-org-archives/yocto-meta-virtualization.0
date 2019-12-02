Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.94.1575260338106432925
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Dec 2019 20:18:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eT4krWe3;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2C3DE010ED; Sun,  1 Dec 2019 20:18:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.65 listed in list.dnswl.org]
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7783E010EB
	for <meta-virtualization@yoctoproject.org>; Sun,  1 Dec 2019 20:18:55 -0800 (PST)
Received: by mail-ed1-f65.google.com with SMTP id v28so5588671edw.12
        for <meta-virtualization@yoctoproject.org>; Sun, 01 Dec 2019 20:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y/t32gZV2/2TWnMAnap/K5OM59ZSRy/+UtRZwnlmsDM=;
        b=eT4krWe3lMEMblnEpOqWFfl+y6XbTA/VJ0SNe1+l70+r72YgBeKDBYQQztVYSey9DQ
         s0GGX5+sd4izOVMprBhz3foFEnxIY+HA8GZTwHyOnZZdfYomu4iV/844mULFUaakwR2h
         I7DykLiaB4fH6WboUPVjGp8/mBALINnvoOe6M3e//WT3UFhLlZMKQhjN0uHFu18c99qK
         j84qCemFkhnPfewVTDN9oWjpKZcBs+ey2jnYPBtQMFOaByBvkMHgRuJZGlFYSXb5c+dK
         9RRmkgp2Del08wT4whBZHYtJ390hdDMktfzHDuSfuSacMk29f5Qv8Zgut5GacBAircH9
         DXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y/t32gZV2/2TWnMAnap/K5OM59ZSRy/+UtRZwnlmsDM=;
        b=BTPp22IVKNnEy1927R6p62A0BMhk8MXIAB9dBuQBqQdgzwkeQlOt7BAYUOK0uALVHk
         tJymwbuJCh2hyeJDuAyCU5ndEOc1zzV12FE0ju96rql5QzW9pq9fymtyrWds70+ivQ7X
         MC/dwXT+ryTtussYLeSyAPolUu5NjjGorXTlocBozkU9P/GFtRIeakp4mXtE7AKVE/eI
         VV6fOm0FmJEf+rRHpMqXEXHoCaTz6ecdVg+vj9YZzGH7luV6eWAhSAHV2snRwUCmDAFC
         E3cdyafwECCNBV6AO5dj1FGVXypU2/OO23zwwgxFEyAF9CnsCfLW9eUuCnB1VxWQ/TpO
         1mdQ==
X-Gm-Message-State: APjAAAWCf6IU9PM1F95msxEL1/tIf7uSGpTcZ3WNGLYAo+AUfoOGvG2g
	UWkIRT+atMT1vRMNuTuo2owjjNKEq81N7vQiSo9jn3ch
X-Google-Smtp-Source: APXvYqyhxA6B226W6l612zYLq8SNMvxV2BvpvGIOzfSTPSCd9iJ84SeSd23/FIm4610h9ldRdbFLUKHepTUw59WkZWw=
X-Received: by 2002:a17:907:217b:: with SMTP id rl27mr17058431ejb.133.1575260334880;
 Sun, 01 Dec 2019 20:18:54 -0800 (PST)
MIME-Version: 1.0
References: <1574970170-3244-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1574970170-3244-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 1 Dec 2019 23:18:44 -0500
Message-ID: <CADkTA4NeoO2vwCjGZriS4on=Cb0_GPJEPMN8pQqsp_s4y4dyrQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] layer.conf: Update PREFERRED_VERSION
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Nov 28, 2019 at 5:42 AM zhengruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Update PREFERRED_VERSION for following recipes:
>   python-sqlalchemy
>   python-eventlet
>   python-warlock
>   python-jsonschema
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/conf/layer.conf | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
> index b6f8dba..a61bf25 100644
> --- a/meta-openstack/conf/layer.conf
> +++ b/meta-openstack/conf/layer.conf
> @@ -27,10 +27,10 @@ PREFERRED_VERSION_python-sqlalchemy = "1.0.8"
>  PREFERRED_VERSION_python-pexpect = "3.3"
>  PREFERRED_VERSION_python-django = "1.8.6"
>  PREFERRED_VERSION_python-netaddr = "0.7.19"
> -PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
> -PREFERRED_VERSION_python-eventlet = "0.20.0"
> -PREFERRED_VERSION_python-warlock = "1.2.0"
> -PREFERRED_VERSION_python-jsonschema = "2.6.0"
> +PREFERRED_VERSION_python-sqlalchemy = "1.1.17"
> +PREFERRED_VERSION_python-eventlet = "0.25.1"
> +PREFERRED_VERSION_python-warlock = "1.3.3"
> +PREFERRED_VERSION_python-jsonschema = "3.0.2"
>  PREFERRED_VERSION_python-networkx = "${@bb.utils.contains('DISTRO_FEATURES', 'openstack', '1.11', '', d)}"
>  PREFERRED_VERSION_python-oslo.i18n = "3.17.0+gitAUTOINC+f2729cd36f"
>
> --
> 2.7.4
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4773): https://lists.yoctoproject.org/g/meta-virtualization/message/4773
> Mute This Topic: https://lists.yoctoproject.org/mt/64062248/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
