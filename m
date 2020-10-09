Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.10383.1602238238243690026
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Oct 2020 03:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=owf/O1F0;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: robert.berger.yocto.user@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id d81so9259934wmc.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 09 Oct 2020 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y1crhMVlyk2b2/iA8FmQOp16IX04PIlozMlXKqVEPgs=;
        b=owf/O1F0j5QhggJKvQFoRM/aeSIGmsv/6JphbvGTonRT8a6p1QyiR1A9ZjXCyAvL/O
         e51s7swHnGYtUvZjb+8EBP3OXszKZvCX/CVhWCQy+U/1XsALWMQxqG7Vwimw7jVMIGHk
         UguaU+kXSLY4rIxpykl4cHdbdFyieRyGrYBqoh0sgYSckLhbEsk+1Nf1oJlrhuqJM/IY
         9VC5cqnSfPx/U3q2POe5cPMv+72yE6X/N513XhOI1jKbB9Ah2ypQ0lAMXJ9YNw1iKRuU
         IorrB4O8M3lerKj3cnyNcOked8APuXfio/HUZhy0YlIHfFfPJud3Lr1WRDaygRMchni5
         Hk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y1crhMVlyk2b2/iA8FmQOp16IX04PIlozMlXKqVEPgs=;
        b=AY5yf9NozLWTyFxt1EQWLQoXXuYTHx7sHFTUP5MJ3h7jSSjbjOZKzK54NmrrGEJmSU
         WfgzYCyiW1xxE1g4E19mxKoAN6KKYHfoEybW1EU2b2qreWcwbNEqCZqgwdkM7CyZbthH
         En/YdLJL9/UEmlGiYWklZFjJ2DZHXXp+AK3eihN9XwaLG/Ky4dU5htiZEqofLRmiZVPU
         XL+2yoSm2j1A07HYUCqD5s12g7KvoulIba9ZfN3DujMto2Nx1iQLgw7YgN4y7usEGsD2
         d1Rktt2Pgx4EGmYNHVeTG2ys+PgCqwvqDLvGEr2KJtijDJDucVsOMTS3cqBdo26SlZIH
         EMzA==
X-Gm-Message-State: AOAM5327JKGJTwwb/l51hA1kfjKtQ9bQN8UM+1LWJ3nhRLIKwTB0T9Bw
	NGomtu+QgHn5RLnKU8V6f5HOwmqPrqw=
X-Google-Smtp-Source: ABdhPJycl84gGaxRrZgP2+KpHV5Hl+X8gRoHj4tP6IM3Nex+0fAwUM/j3VRhLAYu9upy+A5O15amxA==
X-Received: by 2002:a1c:a949:: with SMTP id s70mr14014666wme.17.1602238236092;
        Fri, 09 Oct 2020 03:10:36 -0700 (PDT)
Return-Path: <robert.berger.yocto.user@gmail.com>
Received: from [192.168.42.52] (ppp-2-84-14-95.home.otenet.gr. [2.84.14.95])
        by smtp.gmail.com with ESMTPSA id p4sm11606056wru.39.2020.10.09.03.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 03:10:34 -0700 (PDT)
Subject: Re: [meta-virtualization] dunfell/5.8.x kernel/Docker version 19.03.8-ce
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>,
 meta-virtualization@lists.yoctoproject.org
References: <QqEr.1602167734052560613.bjmh@lists.yoctoproject.org>
 <3ec52728-7c70-0e78-c0a5-306a3e2ea0a4@3mdeb.com>
 <163C0D2B0E77C0DC.4412@lists.yoctoproject.org>
 <CADkTA4N7n+RiuoGbtqf76i+QbTVOphekhMEG+cjBSE51NQuJEQ@mail.gmail.com>
From: "Robert Berger" <robert.berger.yocto.user@gmail.com>
Message-ID: <1445d1d9-8fad-ff27-49db-c3675076ddeb@gmail.com>
Date: Fri, 9 Oct 2020 13:10:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4N7n+RiuoGbtqf76i+QbTVOphekhMEG+cjBSE51NQuJEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Thanks for the quick reply - I'll give it a try!

On 09/10/2020 01:07, Bruce Ashfield wrote:
> 
> FYI. If you were using the meta-virt fragments (as I hope you were!
> ;), then it was something I did to fix the rpi layer that broke things
> .. and hence why the required modules weren't around.
> 

You mean those in the meta-virt layer?

I am using those, but I guess with my meta-virt is too old - dunfell 
something.

Also I have my own custom kernel recipe and don't use the one from 
meta-virt.

So basically what is do is apply kernel fragments from meta-virt (and 
some others) on top of some kind of upstream 5.8.x kernel.[1]

[1] 
https://gitlab.com/meta-layers/meta-raspberrypi-ml-bsp/-/blob/dunfell/recipes-kernel/linux/config/arm64-ml-base/ktypes/virt/virt.scc

The same fragments work for a 5.4.x kernel.

Regards,

Robert
