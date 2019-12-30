Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.27408.1577675368537134294
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 29 Dec 2019 19:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mCIaC9AZ;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66C3BE0138A; Sun, 29 Dec 2019 19:09:28 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9915E00963
	for <meta-virtualization@yoctoproject.org>; Sun, 29 Dec 2019 19:09:27 -0800 (PST)
Received: by mail-ed1-f67.google.com with SMTP id b8so31544656edx.7
        for <meta-virtualization@yoctoproject.org>; Sun, 29 Dec 2019 19:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fPTChVdwLi24wQRxe4y1zd5+AzVHopbd6GdsL4LJn5U=;
        b=mCIaC9AZLnNOeXntrLZiGn25TmNtp6Kn3JPnDaW24tq5445h4hxulVaz/rjKHEWNT9
         Q6xC6Mwh6HJibOnqa+ycMR8AKoFG5ed+OZkyzOaZ3EHLe9Nj8D2iyQXp/pr0gty5mej5
         OpkiMWi6HNp3x4Wm0pBheXzGBdIKhgXSJCg1YGL8SuB7nd0S1Z7p7tthENnBmH3MIo2i
         SOcsE+ErmrEimNENPTCThPVBdOcASMI2v2RWHdqTJ70p2i6Hh6aS+yV7OMgigGEvRugj
         0HchldCtGtlb/4Y1UH99gcem1FdZAiik4qYV0aCOQkdSof+roESHkDrM7kIwC2eHGVp6
         Ji7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fPTChVdwLi24wQRxe4y1zd5+AzVHopbd6GdsL4LJn5U=;
        b=kgXcixJ2jghaTZ/0wjS0oRlE7dnPYdM2adYrOaIecwEDxMbecXYmPiOVYKESIhFmAr
         lwhCa3PCoqXo0OvhPeDC0qOgDIfX+xgtRouCJOhtHLZZjV5PqXceTz1Ytis+uEyHD1M1
         IXYBMP3do5o9htH+bhhW3S+OZ+r0thsJREtGgIvS6vGMSNPa9tluRTpho0fTG8pYLMnD
         kaDcTXPFI/YDVerPNobzqL+g9BqFNl6+IF8/CuZjJ8DQWAVW5v8sPqaOtDcxzMzvLIXf
         iX3XJsYlqHxgIJ3nn3cEoKKJpj9crnRzKrKw2YKEZiUytiOoK0k6v+fNM+hQNHBN2Fkv
         +7JQ==
X-Gm-Message-State: APjAAAWFjzruZBSrKSFtdpeeOfutG6pzeJm8GpNE7mYM8pt4cPSbMz/j
	6lw0cutBTP5KyvdLihalfrKK3Ju5dPPpd/sQjFTCAqs3
X-Google-Smtp-Source: APXvYqzyytT3JUiFrfQc70G8sd//FeFIJQEpXj14cSAW/7oL2xGuhCLpAU+eFKXySF/s6TyLIWZkh2x7CeWhY27LIRY=
X-Received: by 2002:a50:ef17:: with SMTP id m23mr67337024eds.106.1577675366842;
 Sun, 29 Dec 2019 19:09:26 -0800 (PST)
MIME-Version: 1.0
References: <20191226045736.28952-1-kai.kang@windriver.com>
In-Reply-To: <20191226045736.28952-1-kai.kang@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 29 Dec 2019 23:09:15 -0400
Message-ID: <CADkTA4NeqyPemtFT4oKSweZdkTptYtoq6_WP_UVCnLe4PwKgtA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] nagios-nrpe: fix compile error when packageconfig ssl enabled
To: kai <kai.kang@windriver.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Dec 26, 2019 at 12:57 AM kai <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> It fails to compile nagios-nrpe when packageconfig ssl enabled:
>
> | ./nrpe.c:45:12: fatal error: ../include/dh.h: No such file or directory
> |    45 | #  include "../include/dh.h"
> |       |            ^~~~~~~~~~~~~~~~~
> | compilation terminated.
>
> Header file include/dh.h is created by native openssl called by
> configure script. If no native openssl exists, no header file is
> created. Add openssl-native to dependency for packageconfig ssl.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-extended/nagios/nagios-nrpe_3.2.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb b/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
> index 04917f7..9e1f02c 100644
> --- a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
> +++ b/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
> @@ -39,7 +39,7 @@ EXTRA_OECONF_SSL = "--with-ssl=${STAGING_DIR_HOST} \
>                      --with-ssl-lib=${STAGING_DIR_HOST}${libdir} \
>  "
>
> -PACKAGECONFIG[ssl] = "${EXTRA_OECONF_SSL},--disable-ssl,openssl,"
> +PACKAGECONFIG[ssl] = "${EXTRA_OECONF_SSL},--disable-ssl,openssl-native openssl,"
>  PACKAGECONFIG[cmdargs] = "--enable-command-args,--disable-command-args,,"
>  PACKAGECONFIG[bashcomp] = "--enable-bash-command-substitution,--disable-bash-command-substitution,,"
>
> --
> 2.17.1
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4907): https://lists.yoctoproject.org/g/meta-virtualization/message/4907
> Mute This Topic: https://lists.yoctoproject.org/mt/69268508/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
