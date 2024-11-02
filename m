Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E35E67815
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 21:21:21 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web10.25274.1730582474506890524
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 02 Nov 2024 14:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Fno8aMKG;
 spf=pass (domain: linaro.org, ip: 209.85.221.181, mailfrom: javier.tia@linaro.org)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-50d4780a24eso960018e0c.3
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 02 Nov 2024 14:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730582473; x=1731187273; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bYrADOthpRCGcU1S9D2LRCGhWgt5gO3aC5het5Z88qE=;
        b=Fno8aMKG1wZKdRgE684JnILTVpIvkzSqedfIXlyoLSu7aIkGT+qGXNEuG98XylVQVy
         bWTKp3vbxCYMFgfIwHdQ66jsKVbocbsbiCVFBKFYBxZ1YSOjBQ/HJheWdNOXFtPyABTt
         fJwKpwAGqGELLT4mPBSZkY9AzS5dyGxvOycpNMcR0FIgJuNw4d14ptLfrmqB0TsWQot5
         2aLz4DvwW/GL+g74Ywc4Dv9hqR/eoZvgDefysJ8Ls9ipbsZ6J/JFVSNwgvNCEnf/wAPX
         4UZxxB4OjvCTeAAa5rQErP6aGCZP3L/RzJzqd96MeA9oOVDHpfRqfwdWwmKiIBxuTGkI
         uVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730582473; x=1731187273;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYrADOthpRCGcU1S9D2LRCGhWgt5gO3aC5het5Z88qE=;
        b=O0lWA2JkVbphzHzHk9VWqxYplBChOHMMALQyOXJIlrRo2ItIG1F2QtWSzSD24+IPOE
         xHa9NnaGamPaN6iMGAY2ZPV0JOLaHX9J1q4X7s5MgJ4z/mHC0kaWBJwFSE/LbrCLV/XS
         MgVuI30hfgeMi+yW8qh3pxoAKomMqzq610Dp61PKvmYzCnywzv0bYEFvDHPKsIcGuMg5
         iJPFYYP3tDBtbzo4flrCODFwoCTLKPsfhj0V4l/EmYB/W2oYEqswRZ5T+c+utWuV9lYZ
         /blU/kdLS3fu+gnyiKM5KFORnkUgTSKXh75PvM8+HUvsWI+RXRDrHYFXwMXID1yRKsRH
         Dq2Q==
X-Gm-Message-State: AOJu0YyM6cfrfcqvyjYklUMFpMqM0fGZvyT0LiY9t6nHXQImuPO5241D
	IMCp+riKsc+Zre5zWh82lnDvvUtpf6z4zuvm8iO4Ct/kCh88NkwMY00fpwSm564=
X-Google-Smtp-Source: AGHT+IEVyMQq8pW8XZKweSarTZwjgVVXgWJRYUf1rz7WRSKUcpkn8P9GjLnJG1pu7ARtuGj87TXsYQ==
X-Received: by 2002:a05:6122:2511:b0:50a:caec:70a2 with SMTP id 71dfb90a1353d-512270eb2b4mr7668320e0c.4.1730582473421;
        Sat, 02 Nov 2024 14:21:13 -0700 (PDT)
Received: from [192.168.8.164] ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5106f2cd5c8sm1256111e0c.17.2024.11.02.14.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 14:21:12 -0700 (PDT)
Message-ID: <3dd1c818-bdad-49ad-b287-015b2a2455b5@linaro.org>
Date: Sat, 2 Nov 2024 15:21:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH v0] upx: Fetch the proper v4.2.4 git
 hash
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20241030-fix-upx-src_uri-v1-1-1a883085936a@linaro.org>
 <CADkTA4OehpRpvtQi73fsG_w29XZU3jfhH+noB5=Q3FppApmsfQ@mail.gmail.com>
 <6f062bbd-7b69-46f7-9f75-e495d3f30101@linaro.org>
 <180391C2E0114A47.6352@lists.yoctoproject.org>
 <1803A46D49AD0D53.1077@lists.yoctoproject.org>
 <CADkTA4N_j57wcmcQ=xESam+V2kbp7E79CVo9+qyi3bVH7ZYBVQ@mail.gmail.com>
From: Javier Tia <javier.tia@linaro.org>
Content-Language: en-US, es-MX
Autocrypt: addr=javier.tia@linaro.org; keydata=
 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
 WdJQjTu3/NJR54YogRY=
In-Reply-To: <CADkTA4N_j57wcmcQ=xESam+V2kbp7E79CVo9+qyi3bVH7ZYBVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 02 Nov 2024 21:21:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8956

Hi Bruce,

On 11/1/24 10:13 PM, Bruce Ashfield wrote:
> 
> 
> On Thu, Oct 31, 2024 at 4:44 PM Bruce Ashfield via lists.yoctoproject.org <http://lists.yoctoproject.org> <bruce.ashfield=gmail.com@lists.yoctoproject.org <mailto:gmail.com@lists.yoctoproject.org>> wrote:
> 
> 
> 
>     On Thu, Oct 31, 2024 at 11:02 AM Bruce Ashfield via lists.yoctoproject.org <http://lists.yoctoproject.org> <bruce.ashfield=gmail.com@lists.yoctoproject.org <mailto:gmail.com@lists.yoctoproject.org>> wrote:
> 
> 
> 
>         On Thu, Oct 31, 2024 at 9:26 AM Javier Tia <javier.tia@linaro.org <mailto:javier.tia@linaro.org>> wrote:
> 
>             Hi Bruce,
> 
>             On 10/30/24 9:37 PM, Bruce Ashfield wrote:
>              > On Wed, Oct 30, 2024 at 8:38 PM Javier Tia via lists.yoctoproject.org <http://lists.yoctoproject.org> <http://lists.yoctoproject.org <http://lists.yoctoproject.org>> <javier.tia=linaro.org@lists.yoctoproject.org <mailto:linaro.org@lists.yoctoproject.org> <mailto:linaro.org@lists.yoctoproject.org <mailto:linaro.org@lists.yoctoproject.org>>> wrote:
>              >
>              >     upx recipe fails with:
>              >
>              >     ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure: Unable to find revision 5221596a608acbc8efed1e54f758bab1908ce7a8 in branch  even from upstream
>              >     ERROR: upx-4.2.4+git-r0 do_fetch: gitsm: submodule download failed: FetchError Fetcher failure for URL: 'gitsm://github.com/upx/upx-vendor-valgrind.git;protocol=https;name=vendor/valgrind;subpath=vendor/valgrind;nobranch=1;lfs=True;bareclone=1;nobranch=1 <http://github.com/upx/upx-vendor-valgrind.git;protocol=https;name=vendor/valgrind;subpath=vendor/valgrind;nobranch=1;lfs=True;bareclone=1;nobranch=1> <http://github.com/upx/upx-vendor-valgrind.git;protocol=https;name=vendor/valgrind;subpath=vendor/valgrind;nobranch=1;lfs=True;bareclone=1;nobranch=1 <http://github.com/upx/upx-vendor-valgrind.git;protocol=https;name=vendor/valgrind;subpath=vendor/valgrind;nobranch=1;lfs=True;bareclone=1;nobranch=1>>'. Unable to fetch URL from any source.
>              >
>              >     Likely, upstream rewrote the Git history.
>              >
>              >
>              > I'll wait until I can reproduce this one myself:
>              >
>              > bitbake -c cleanall upx; bitbake upx
>              >
>              > I can also clone upx, reset it to the revision I'm currently using in meta-virt and do a git submodule init without issues.
>              >
>              > Just worked fine here. Were you doing anything different than a regular build when you hit it ?
> 
>             No, I am aware of it.
> 
>             For me, is easy to reproduce. Clone poky master, add meta-virtualization layer, add virtualization to DISTRO_FEATURES, change MACHINE to 'genericarm64' and `bitbake upx -c cleanall && bitbake upx` will do it.
> 
> 
>         Exactly the same thing works fine for me.
> 
>         I'll continue to debug it here. I'll likely just update upx to tip, but until I see the failure in my builds, I can't be sure I've fixed anything!
> 
> 
>     It looks like I was being fed a cached repository from a mirror. When I switched configurations (I switched builders), I can see it now.
> 
>     Although, I have no idea why my manual clones were working, since they don't use that infrastructure. I'm going to debug that a bit more.
> 
>     I'll get this fixed on Friday (assuming I satisfy my manual clone curiosity).
> 
> 
> I went a different way with this. I've had "issues" with this git repository in the past (failing fetcher tests, etc)
> 
> I've already done one switch from gitsm to individual git fetches and then back to gitsm.
> 
> I've gone back to individual fetches, since I tested the tip of the tree and it is still broken with gitsm fetching.
> 
> This worked on all my builders, let me know if you still see issues.

No issues so far. Thank you!

» Javier Tia 🖋

