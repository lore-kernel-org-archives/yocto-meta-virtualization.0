Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E939CEFCFD
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:37:32 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98716.1767728244654394070
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 11:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KqYvYlpP;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8b2d6df99c5so2814285a.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 11:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767728244; x=1768333044; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DqQ0713Hphl6ftUn92wXFa8rC5sFOy3PTEywxdScKL4=;
        b=KqYvYlpPsxY+tkTZnUL49X74oeAUtl3tYRJfw65wOX952RZd4cuQscujPw7TI7rW3O
         dN7Eah7816osfxWwzhyJauND4NYFVHdJ5GEdzW81+BkgiscF4PBdg8AOzc/8WP2bHioB
         HPb7GcN9VzlwzNOnscm/iWgx0b0UwILZL1TzNHkWEvbrHzTgMHO0zWkf0ShGkusjx+OO
         F6KZSH7yMDA70S3G/vhWC0qx7yRLHLbd+8WtYws8qzSPY1g8plp0eULj2zJveyeUZg47
         A4cB9tfvvYf4/Fbc904rCLv0tf0xpLNzrCGnfVAJnI6t35s39hNfpCafv1xq0AC8nfLA
         JSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728244; x=1768333044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqQ0713Hphl6ftUn92wXFa8rC5sFOy3PTEywxdScKL4=;
        b=mb17x24J7cPfKNVxUCY6Etttv3KEqzDKL5PAUHT/0jsp4LM+UaW7/4Iitf2fPF0K7Z
         nN7s/q5H6XrdwEDp90CzSXXLYHdxUbT2ILi9vJ+mv7pke9rXghjAZXcYal8yvx0Ya/Cx
         iZcvCDS5JqtTmSCdsEosZTSCG9bnl5XotdZ/R/kaqw+uHQjSVnpcLLUkw+j3JLRsoVuv
         TV3tjg0hj4kzzevV181YxXfFjZzvDz+0nadFMLvL0w9PQo6AWkzaOTneDYNkOPyRwRWz
         YrQ8D44vC1+nUol6Vwf6hRV8LUxKBnDEQfmGO5bmLQBHPZkLe9/4QvqqO5mFuN9uVeK6
         OiQw==
X-Gm-Message-State: AOJu0Yx/Gn/uV6XhrrFNzj9xI7uf0sR8CN+aPzy79FKRy0XdKQBXT1ip
	OMu+rK3TgC4gzA2BRp/LjgrPAOgRLluoVxAuTeItorcwlUY50DUZxXAIlZXC3onFlQs=
X-Gm-Gg: AY/fxX7AZrmtx7pMf6bVuon/Hu9mcBEi1sEvB/fXL5z8K1Fr5NPmXGnD9Y1g3P6QanN
	2/9csY6RDllLj4o4EywUcLd/2uEIKlnCrHgeulKpVMOtQrb8Y8Zf5wSP2CN3XdsftgeCb4NlDVa
	JIdyiaMPGvHJ7ctvpDh65McGMsImPHehqDPRsz6gNCA1zSH8yZ9wxmA5Zkn2LzxM/N7cAD+n7Yf
	RXF7055NVC+tlShCpLhjSeC5rA8JB3+hubwtVjXGdGjJdscIPAO+T6HDmZjxcDklgZ7WUt/v4Wy
	2YfCy74avBXhs1UsXZkvwzTWfCdhSlkiPQ7kBETgrrCplM3sF0rOJphhE6z7cb0V2Wkrz7mQ0E+
	cUp0Zh2rmLfPMVSjjXlImXjhSuwugN44yoQaiazaWPUOoNOxPqqNmJCrk7gfvVGUCaYMgTJ0Al4
	Uqwh6zhs43npC8Nsvdasxk0P2qDUZqUMmZpvrPEn7bOfMFkD0cVxolg5S49+V+MsfW
X-Google-Smtp-Source: AGHT+IE9jxOUX/LGkj4AhPuj6nXD6v4uAtcAHkYIEx63NU6CBwq/97uZFbVeY1jfpdK4ocGYX5a06A==
X-Received: by 2002:a05:620a:4081:b0:8b2:ed3b:e642 with SMTP id af79cd13be357-8c37f53760dmr523894185a.34.1767728243540;
        Tue, 06 Jan 2026 11:37:23 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4b8573sm219964885a.12.2026.01.06.11.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:37:23 -0800 (PST)
Date: Tue, 6 Jan 2026 14:37:21 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] crun: fix CRUN_AS_RUNC checking
Message-ID: <aV1kcXX5tlH5AkdV@gmail.com>
References: <20251215075204.1048461-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215075204.1048461-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 19:37:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9526

In message: [meta-virtualization][PATCH] crun: fix CRUN_AS_RUNC checking
on 15/12/2025 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> We have in this recipe:
> CRUN_AS_RUNC ?= "true"
> 
> The expected behavior is that if we set it to "false", the symlink
> is not created.

The expected behaviour is that if it was set to
anything the symlink would be created, if it was
not set, or cleared nothing is created.

That is a pattern you'll see in many of my
scripts and classes.

Maybe a comment in the code to indicate that
is the case ?

i.e. # clear this variable to disable symlink creation

Cheers,

Bruce

> 
> Fix the check to achieve this expected behavior.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/crun/crun_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
> index edaf15b8..25e76239 100644
> --- a/recipes-containers/crun/crun_git.bb
> +++ b/recipes-containers/crun/crun_git.bb
> @@ -52,7 +52,7 @@ do_configure:prepend () {
>  
>  do_install() {
>      oe_runmake 'DESTDIR=${D}' install
> -    if [ -n "${CRUN_AS_RUNC}" ]; then
> +    if ${CRUN_AS_RUNC}; then
>          ln -sr "${D}/${bindir}/crun" "${D}${bindir}/runc"
>      fi
>  }
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9480): https://lists.yoctoproject.org/g/meta-virtualization/message/9480
> Mute This Topic: https://lists.yoctoproject.org/mt/116789087/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


