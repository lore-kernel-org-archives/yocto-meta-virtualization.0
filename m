Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.13156.1602248734786171972
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Oct 2020 06:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fq4UM4KX;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id x7so2808056eje.8
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 09 Oct 2020 06:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e5vJ2xPiGdWrFQL8+T+17MWiXywMiJOJNmeWMe+4fPE=;
        b=Fq4UM4KXfQQLE7aKqRmmzose3v/zgCPig95dgqRDL6A6PJGFFr9aa7HYb4/XzTND57
         07VLVMFzT+E775PIeUn6rnDc0LOmV3YG5lioSkFvjOVoR1pLJ5Qka24wd4GQO1cTZ9Ny
         scFBVpQKctPASBieHSLxwG4hnNTxOd1YrWrcfqWk6Rpn4PL2S79TNJIhdyUlR/x+JgqM
         ukH8iHGGbx8cirXhQUFtlmVhAXeMKsIqTu9fXy4t4QiYWVJgQJrdhZSwZ2BI8Qwb0uvK
         cYHGoxirZs5zRbi70yc3RaSIJkxupqGbfT9h5xhbhoYW5vCxU8xm1kpBOZZ1ERRUmhR1
         Omqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e5vJ2xPiGdWrFQL8+T+17MWiXywMiJOJNmeWMe+4fPE=;
        b=KtpX5DVrSeJiqu7lrNHTINc0gLJ88FMOXYJb4HhmVN/1T6BZBNtvX+C3zI3tNb0g2v
         84yulhONUkeOEHAUowygR90D/Slz1JRQEO6nDaSg4HPO29j7gLGaG03R9AcB0VMVhsyP
         tusRu4BRqb9RaXTlmkX8qbncWGzEt9g4bJZ5UeiH3fFX9o4UE4UYIJNOlWPv7BGZ3zHx
         7+IMM3nu/Z+3MLfkv6fBjfAdIoX+Ra/9kw9TPBK9I35XaP4YOV2q5rQ2Zdv9NiwvkiE3
         Kx/AKOIH2aFpLQTnPeXdZpAhs0a9Ocgph31Z+/gOjjV9nncy1NAGG8j6+7PkhXWusQy3
         0P+Q==
X-Gm-Message-State: AOAM533dDTSW0rEOG0IC1AxbhZN8/RWoJRVxfHEO2OEITofgfl948v3w
	N702kbZ7X1FjI44UVOIimPDkoO7HLdK5jhcwyW4=
X-Google-Smtp-Source: ABdhPJy63z80PHmP7vknmtHDQBkq+sK5hizffRnzi2Sj8CxnTgDA3170pdwzKJYtvZcS1JsYl0NhA1rzQkdgTmE9IpM=
X-Received: by 2002:a17:906:53d6:: with SMTP id p22mr14011689ejo.517.1602248732997;
 Fri, 09 Oct 2020 06:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <QqEr.1602167734052560613.bjmh@lists.yoctoproject.org>
 <3ec52728-7c70-0e78-c0a5-306a3e2ea0a4@3mdeb.com> <163C0D2B0E77C0DC.4412@lists.yoctoproject.org>
 <CADkTA4N7n+RiuoGbtqf76i+QbTVOphekhMEG+cjBSE51NQuJEQ@mail.gmail.com> <1445d1d9-8fad-ff27-49db-c3675076ddeb@gmail.com>
In-Reply-To: <1445d1d9-8fad-ff27-49db-c3675076ddeb@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 9 Oct 2020 09:05:20 -0400
Message-ID: <CADkTA4NwLxT2oRJL6Dtv_xwHpUrijPeUenYzM-6_THhfUpXcoA@mail.gmail.com>
Subject: Re: [meta-virtualization] dunfell/5.8.x kernel/Docker version 19.03.8-ce
To: "Robert Berger@yocto.user" <robert.berger.yocto.user@gmail.com>
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2020 at 6:10 AM Robert Berger@yocto.user
<robert.berger.yocto.user@gmail.com> wrote:
>
> Hi,
>
> Thanks for the quick reply - I'll give it a try!
>
> On 09/10/2020 01:07, Bruce Ashfield wrote:
> >
> > FYI. If you were using the meta-virt fragments (as I hope you were!
> > ;), then it was something I did to fix the rpi layer that broke things
> > .. and hence why the required modules weren't around.
> >
>
> You mean those in the meta-virt layer?
>
> I am using those, but I guess with my meta-virt is too old - dunfell
> something.

Aha. Right, I missed that. I wouldn't have broken dunfell, but I can
confirm that with the right modules loaded, docker works fine with a
yocto built 5.8

Bruce

>
> Also I have my own custom kernel recipe and don't use the one from
> meta-virt.
>
> So basically what is do is apply kernel fragments from meta-virt (and
> some others) on top of some kind of upstream 5.8.x kernel.[1]
>
> [1]
> https://gitlab.com/meta-layers/meta-raspberrypi-ml-bsp/-/blob/dunfell/recipes-kernel/linux/config/arm64-ml-base/ktypes/virt/virt.scc
>
> The same fragments work for a 5.4.x kernel.
>
> Regards,
>
> Robert



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
