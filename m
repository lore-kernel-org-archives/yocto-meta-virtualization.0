Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.20715.1617388336366734659
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 11:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Puzp1xQu;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id gv19-20020a17090b11d3b029014c516f4eb5so1141640pjb.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Apr 2021 11:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=babiGked4NP99VlUBgGSK0h2Gq7pWr5H/MHReSls0ts=;
        b=Puzp1xQuQkb6Ptt4bziM+ux86BR2ggjeAuPgUhkKtu1hZ4CKowjPlEkfmtKPu5unW+
         WseDETa0n1cWcySr228beG5djFpUFm+/v1BqIvoszerr3zaKvTdOEjUrGeT6dV7EKBKq
         jhwNMvz/ct0ox23NYpU1ffVv3j1QSKLZA/QFNZQIvty1prj2emGIiJNek2rp5R9UCI47
         Wfm4pVtkZqkJcXgaqi7MGZZwcha12aVJjyR/JBDQNLrHRhRv+LltMTHexwVplKEhl01z
         dYFRzbaV4B/zSYjwdy/CESMQNucR5mQraq9uusic2veYnk6CtqDNQ4ITmaD5FRJmSY+L
         bAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=babiGked4NP99VlUBgGSK0h2Gq7pWr5H/MHReSls0ts=;
        b=JZBq4I2tNYcAAR/uEljn3AZES4kSWaf39rJcXEgTsSj/LxYD6Q7E3pFhy+djHxQNdD
         2pL7nvwWY9wbshIqsOk+LDgWx1l8IEdwLlZtofbfc1fMAAFZggzGP8WV33HEvV1iiWoz
         2rsjsIrylXtbPt8hJ2l3q98mYQIRF0B7it/VKhcNQKpAeBEsC2FgMORH2xfVd0mgCtAG
         2oaKQ4uB0RYT0MdNF/YwUZUurBWzQChVaul4nF6K5Rnimbx5Ha7/Ts88D0iaF+Bphkf6
         uEKYEwRtmyPBcymVJT4oDM6O5wC+lJ55fD0IKx+zxzV+RtYOGsbDMcbcKrBCuAUM+TgY
         e3OQ==
X-Gm-Message-State: AOAM530ZZbgzRiV5cU2q0rZeEBa8IDvYfNcOrvS4W8Q2zIbMsr6Nccc+
	TGIzU656Idv/UgPtAzeJaJWjjtUvZ1A=
X-Google-Smtp-Source: ABdhPJxWX41823LNjwOpVjwXnUgMfJgZYdjL5wgMqp/31sJFFzRwZ7XH8rt527lyGbKWaiZlflEZYQ==
X-Received: by 2002:a17:902:a587:b029:e7:347d:4872 with SMTP id az7-20020a170902a587b02900e7347d4872mr14134412plb.2.1617388335670;
        Fri, 02 Apr 2021 11:32:15 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:7050:b686:e2e6:21d4? ([2601:202:4180:a5c0:7050:b686:e2e6:21d4])
        by smtp.gmail.com with ESMTPSA id i13sm8728307pgi.3.2021.04.02.11.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Apr 2021 11:32:15 -0700 (PDT)
Subject: Re: [meta-virtualization][PATCH 2/2] packagegroup-container: skip without meta-security because of podman
To: Martin Jansa <Martin.Jansa@gmail.com>,
 meta-virtualization@lists.yoctoproject.org
References: <20210402070244.2321014-1-Martin.Jansa@gmail.com>
 <20210402070244.2321014-2-Martin.Jansa@gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <7d69bafb-d26d-0d79-2e22-1987911c1500@gmail.com>
Date: Fri, 2 Apr 2021 11:32:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210402070244.2321014-2-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/2/21 12:02 AM, Martin Jansa wrote:
> * copy the skip from podman recipe, because this packagegroup
>   depends on podman
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-core/packagegroups/packagegroup-container.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
> index d425ac5..b3b0d4c 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -44,3 +44,12 @@ RDEPENDS_packagegroup-containerd = " \
>      virtual/containerd \
>  "
>  
> +python __anonymous() {
> +    msg = ""
> +    # ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization/recipes-containers/podman/ DEPENDS on or otherwise requires it).
> +    # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> +    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'podman', 'libseccomp']
> +    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
> +        msg += "Make sure meta-security should be present as it provides 'libseccomp'"
> +        raise bb.parse.SkipRecipe(msg)
> +}

That reminds me that the libsecomp pkg should move to meta-oe so this
other layers don't have to do these kinds of things.

-armin
>
> 
>

