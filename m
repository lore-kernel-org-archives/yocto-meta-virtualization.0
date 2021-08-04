Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.11072.1628092539611361232
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 08:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gkPCJEWQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id l18so2804686wrv.5
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Aug 2021 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EKErBJoyOWxr5iCjz+4ejn+g7OinkFC3FIMICcIdpec=;
        b=gkPCJEWQq4tX1j8EJFHWDDKj3v397aSFWMVzhh5qj+EnU8tYCixFZN6QyB/VM2qQXs
         KX1gljZQkcgj6iS2rVmoBljkOfOzSyqET//tzvzrdM5Ln/pSt+HNkJvz0XLn6WPOcQXq
         ieAL9iKlxRud4EFHc2Avz2igup8sIW6l0q9co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EKErBJoyOWxr5iCjz+4ejn+g7OinkFC3FIMICcIdpec=;
        b=R5GlJZX5hVNUhBoB8gtaRF5ZFucvGTUaxLenpwT5CEIbTJJAihhKPYFtdvimBbi08x
         91koGdbzsSLzdMCxzvHGenjBQgqoLH9GKuETiYAHsB3CWe6wvEZBUPZo1mHH23u8UUk8
         6HbkPIwsXeBZ1qkVwjX7soC3VzebpqFywOx0ohAUlufy3KChXGHeFD/ZOusrleRLvDlP
         HN1goO43r/GGg6Lp1SDPDglfBRUxMFDUVoGLJrtftotxyMWQsZ+eiJBygIS34g3wHvrc
         wit1tNRGkrFASs6pycnV1kPKj7Va6fkAkwk+O6HxHWyq3tQLybMxb/YxjTPURfQQKeXD
         k8tA==
X-Gm-Message-State: AOAM531RFlFlDeru025acRf71Ur9Pyz+LWUkA1kk5RlUp/m2YT1S6OR+
	vMEdWuZB+Pdz/Ds5whfUaJsxIg==
X-Google-Smtp-Source: ABdhPJw9nylQvQOdksDu0OjAH8zciufzg9v2wHxtEums7ufk4L5kFAjA/TpwTxfafY6FmVVuSq4AFQ==
X-Received: by 2002:a05:6000:100a:: with SMTP id a10mr88600wrx.42.1628092538255;
        Wed, 04 Aug 2021 08:55:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa? ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id u11sm3019565wrp.26.2021.08.04.08.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 08:55:37 -0700 (PDT)
Message-ID: <94612571ef4dc3a19736b14f571e068b295c098a.camel@linuxfoundation.org>
Subject: Re: [meta-virtualization][WIP][PATCH] docker-distribution: manually finish override syntax conversion
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Martin Jansa
	 <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Date: Wed, 04 Aug 2021 16:55:37 +0100
In-Reply-To: <CADkTA4M7gGWdQdsuu8PLuu1Mb_JxqDK4ki0AvHTnHeK_QaY5tw@mail.gmail.com>
References: <20210730151319.54916-1-Martin.Jansa@gmail.com>
	 <CADkTA4M7gGWdQdsuu8PLuu1Mb_JxqDK4ki0AvHTnHeK_QaY5tw@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-08-01 at 23:39 -0400, Bruce Ashfield wrote:
> Thanks!
> 
> I've added this to the master-next queue for the overrides conversion.

I know Bruce is on vacation, I just wanted to give a heads up that the override
changes merged in master for OE-Core and now several other layers. The two layers
left the autobuilder tests and that haven't been converted are meta-virt and 
meta-arm. Anyone using meta-virt with master will need the master-next branch now.

Cheers,

Richard

