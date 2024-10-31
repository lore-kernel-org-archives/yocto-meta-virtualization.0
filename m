Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6286DD7495C
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 13:26:37 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web10.12461.1730381192123488021
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 06:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NDcKYdFo;
 spf=pass (domain: linaro.org, ip: 209.85.217.44, mailfrom: javier.tia@linaro.org)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4a5ad828a0fso225260137.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Oct 2024 06:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730381191; x=1730985991; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BPlBaMGbSEnnDUc4Fti+KpgCQl/fR9vxlgxIKF359pM=;
        b=NDcKYdFo8EgLmFqk1X+5wzUjzu1hB/+rDaT8BCup9/8IzY6107VkpBIHaeosxgtTRB
         wJbE0srrXmE6TKDiH/KIQ9Q+Z6M0zitGN81w4pgSd6RHcqwaBlBveTFN27jiLEmrLEN+
         IWU3n4lOneirqtCQZKyr2bisuJLmNooW7avCCJsIzXcJ2Sw6jNK0PeHaU8SlBcc1cztv
         zUBtLAlltyNK1L1lZgwdUfbjryeRYGJONhhWDuCQcpYWhe32kFkNPEw9Ive547AQhEag
         0xWm2YmUeGDLyS7/tuQcMrVQFmMmHVBfcEq3lXzu05fs9CYjgfPacWOqbYzCiAnxkV6j
         EEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730381191; x=1730985991;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPlBaMGbSEnnDUc4Fti+KpgCQl/fR9vxlgxIKF359pM=;
        b=HATyScEU9DXyEPor8Cn9FKsWhnDFl4LNpFz4zZRVkDWzdbCfB4E/TltORoka5MoBmZ
         CKuYBXYIaUTYj/UdizlFvIWrPGqUC1YP2XvN6K/erG/LYdXKpddigROu2ogZ2DKCN+63
         vihXao/RBVVl9A1A7IeMgcXoxGc5QvThvwHw/EsodOtlgGElze8XWMkxZdmL2z9o1ALZ
         3TgkYmuoaxhsnDhy2ju+EA2NB+vTjJUdWhpTQP86I4FEJWvFnOLihjyiwFKx1n/Ik0Vq
         MqZMJh88cyNrVr/pX19XkKEHx2qXubGil8T3zmDAatPesBQ+rP13yg8ZBSVa8DyJN3zI
         f8fg==
X-Gm-Message-State: AOJu0Yy8HAxPLievHwNpsb9i28/zb11/CROt5O76ZF5BugI7eXF0EeDm
	Jb/r44zMfpBew8Lf3/hhLHrpYfkPhOlxNzas82Pl9lLNDiOhQ5fCGQOh2h2cCsU=
X-Google-Smtp-Source: AGHT+IHfnVMPT7kjatdw0zf2TYHl/oHo3lJUsUFuRJs0FBqYnpuqIcF6Tq3/GSNN+rP64mWVShrJ6A==
X-Received: by 2002:a05:6102:358c:b0:4a3:a137:b9b with SMTP id ada2fe7eead31-4a8cfb4b371mr19425086137.11.1730381191005;
        Thu, 31 Oct 2024 06:26:31 -0700 (PDT)
Received: from [192.168.8.164] ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-855dad28d7fsm278115241.7.2024.10.31.06.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 06:26:29 -0700 (PDT)
Message-ID: <6f062bbd-7b69-46f7-9f75-e495d3f30101@linaro.org>
Date: Thu, 31 Oct 2024 07:26:27 -0600
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
From: Javier Tia <javier.tia@linaro.org>
Content-Language: en-US, es-MX
Autocrypt: addr=javier.tia@linaro.org; keydata=
 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
 WdJQjTu3/NJR54YogRY=
In-Reply-To: <CADkTA4OehpRpvtQi73fsG_w29XZU3jfhH+noB5=Q3FppApmsfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Oct 2024 13:26:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8946

Hi Bruce,

On 10/30/24 9:37 PM, Bruce Ashfield wrote:
> On Wed, Oct 30, 2024 at 8:38 PM Javier Tia via lists.yoctoproject.org <http://lists.yoctoproject.org> <javier.tia=linaro.org@lists.yoctoproject.org <mailto:linaro.org@lists.yoctoproject.org>> wrote:
> 
>     upx recipe fails with:
> 
>     ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure: Unable to find revision 5221596a608acbc8efed1e54f758bab1908ce7a8 in branch  even from upstream
>     ERROR: upx-4.2.4+git-r0 do_fetch: gitsm: submodule download failed: FetchError Fetcher failure for URL: 'gitsm://github.com/upx/upx-vendor-valgrind.git;protocol=https;name=vendor/valgrind;subpath=vendor/valgrind;nobranch=1;lfs=True;bareclone=1;nobranch=1 <http://github.com/upx/upx-vendor-valgrind.git;protocol=https;name=vendor/valgrind;subpath=vendor/valgrind;nobranch=1;lfs=True;bareclone=1;nobranch=1>'. Unable to fetch URL from any source.
> 
>     Likely, upstream rewrote the Git history.
> 
> 
> I'll wait until I can reproduce this one myself:
> 
> bitbake -c cleanall upx; bitbake upx
> 
> I can also clone upx, reset it to the revision I'm currently using in meta-virt and do a git submodule init without issues.
> 
> Just worked fine here. Were you doing anything different than a regular build when you hit it ?

No, I am aware of it.

For me, is easy to reproduce. Clone poky master, add meta-virtualization layer, add virtualization to DISTRO_FEATURES, change MACHINE to 'genericarm64' and `bitbake upx -c cleanall && bitbake upx` will do it.

For future reference here is the complete log:

```
$ bitbake upx
Loading cache: 100% |###########################################################################################################################| Time: 0:00:00
Loaded 4974 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "genericarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "aarch64 armv8a crc"
TARGET_FPU           = ""
meta
meta-poky
meta-yocto-bsp       = "master:c83c0600f67b0806e571d9fcd6c1c267d756f54c"
meta-oe
meta-python          = "master:793557a317dd0393d9a68d0aa79e041d7bfdcdda"
meta-networking
meta-filesystems     = "master:793557a317dd0393d9a68d0aa79e041d7bfdcdda"
meta-virtualization  = "master:72ea52031c045bb6b4e13856f324b3ec28e333df"

Sstate summary: Wanted 245 Local 0 Mirrors 0 Missed 245 Current 0 (0% match, 0% complete)##########################################             | ETA:  0:00:00
Removing 10 stale sstate objects for arch armv8a: 100% |########################################################################################| Time: 0:00:00
Removing 4 stale sstate objects for arch genericarm64: 100% |###################################################################################| Time: 0:00:00
Removing 96 stale sstate objects for arch x86_64: 100% |########################################################################################| Time: 0:00:00
NOTE: Executing Tasks
WARNING: upx-4.2.4+git-r0 do_fetch: Failed to fetch URL gitsm://github.com/upx/upx-vendor-valgrind.git;protocol=https;name=vendor/valgrind;subpath=vendor/valgrind;nobranch=1;lfs=True;bareclone=1;nobranch=1, attempting MIRRORS if available
ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure: Unable to find revision 5221596a608acbc8efed1e54f758bab1908ce7a8 in branch  even from upstream
ERROR: upx-4.2.4+git-r0 do_fetch: gitsm: submodule download failed: FetchError Fetcher failure for URL: 'gitsm://github.com/upx/upx-vendor-valgrind.git;protocol=https;name=vendor/valgrind;subpath=vendor/valgrind;nobranch=1;lfs=True;bareclone=1;nobranch=1'. Unable to fetch URL from any source.
WARNING: upx-4.2.4+git-r0 do_fetch: Failed to fetch URL gitsm://github.com/upx/upx;protocol=https;;name=upx;branch=devel, attempting MIRRORS if available
ERROR: upx-4.2.4+git-r0 do_fetch: Fetcher failure for URL: 'gitsm://github.com/upx/upx-vendor-valgrind.git;protocol=https;name=vendor/valgrind;subpath=vendor/valgrind;nobranch=1;lfs=True;bareclone=1;nobranch=1'. Unable to fetch URL from any source.
ERROR: upx-4.2.4+git-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'gitsm://github.com/upx/upx;protocol=https;;name=upx;branch=devel')
ERROR: Logfile of failure stored in: /yocto-dev/build/tmp/work/armv8a-poky-linux/upx/4.2.4+git/temp/log.do_fetch.54216
ERROR: Task (/yocto-dev/meta-virtualization/recipes-extended/upx/upx_git.bb:do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 328 tasks of which 0 didn't need to be rerun and 1 failed.
```

» Javier Tia 🖋

