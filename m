Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.14240.1602170045506930688
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 08 Oct 2020 08:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XMtUB1MQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id l16so6224862eds.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Oct 2020 08:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2VcYIyMt8DugItTHTFrdbym6/Mp+Qf9xeDnRed70LcQ=;
        b=XMtUB1MQMRABQyhsudfVW8NKvEAgC3FnqYi4qR/K57cYWsmD4jq9lbvEZf1uTT5mQi
         EvlUmIXiT81e7FEDey2kUa0kn4AOXCyM544yFNuJRSGukNj00rhO2GOLjTBFfG8w5PEA
         GU4V8n94wi3Bq5XjhUOZf6HeWp6ylG1amsF42/eB5ojlT+eVY2g7sqU2CK2hoaU6PI4x
         YaaEtH9IMzm7ZjEDFRuoRy1jdwvTv5PvNsCMlCNEDuNFuanfceOefzjWDFXCOrGGfhmH
         fio2lUG+P9e/dUwzJb2i8TCK3DqSFobZjyTb+SaFN6+7AnPS79XWD6qODX8H3cPFWbSE
         Mm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2VcYIyMt8DugItTHTFrdbym6/Mp+Qf9xeDnRed70LcQ=;
        b=rykylmT76DdEe8iGOJfds65R+pLRQOctghQJ6eC1Uk4PpaW6MNT6277DtM1iCfZbwX
         Wwri1d3Ded5PERkfiNI+qpYi18SxC8b7PgV0waSduu9LthzXdVwe/Ou7RxeTrxbuGxyG
         XUfisXubgpp913ZGLvgz+8uDU9Y9e8HMN6RqFvDjoOvGjRfgg6t10Xq86mogXeMuhr9Q
         UBsRXAlUNrwZTFh+9qS1W7WNm1Lz1zsubRpBr6/cBK9rvQIEfvHbVaRxy9RDWEJnImLn
         NFj8fooastSKpzcy4hnE/tond/i0vzMnA4wPPyIqO5ZawAv+1qyvVDShNutyu5d87+YV
         E9Lw==
X-Gm-Message-State: AOAM5320ueI7nnYi/7i4j9gV0niq0PZOlcJGSH2teZh6yoQRxR8evwo1
	k0MKJD678MKCJv0LyuMOvgmajwxPwEbB1bOS7Ps=
X-Google-Smtp-Source: ABdhPJxG5k+/+ijI9o47uRsEy0JUs4S1tHGLvsY4xdB92VIfeMaVel8ualWBCvCzSITI1RODga/onsPu8BBo2QAqi0A=
X-Received: by 2002:aa7:d5c2:: with SMTP id d2mr9881076eds.234.1602170043749;
 Thu, 08 Oct 2020 08:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <QqEr.1602167734052560613.bjmh@lists.yoctoproject.org> <3ec52728-7c70-0e78-c0a5-306a3e2ea0a4@3mdeb.com>
In-Reply-To: <3ec52728-7c70-0e78-c0a5-306a3e2ea0a4@3mdeb.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 8 Oct 2020 11:13:52 -0400
Message-ID: <CADkTA4PwkhC1K0BmVdEAe9Hhej7iX=MN24KU0m3Qe5ZD1-6F=g@mail.gmail.com>
Subject: Re: [meta-virtualization] dunfell/5.8.x kernel/Docker version 19.03.8-ce
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Cc: Robert Berger <robert.berger.yocto.user@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 8, 2020 at 11:00 AM Maciej Pijanowski
<maciej.pijanowski@3mdeb.com> wrote:
>
>
> On 08.10.2020 16:35, Robert Berger wrote:
>
> Hi,
>
> It looks like with a 5.8.x kernel docker is not happy anymore with iptables and kills the socket.
>
> https://pastebin.com/U702eC9G
>
> Are there any suggested fixes for this?
>
> The kernel-module-xt-masquerade is missing.
> Docker could RRECOMMENDS on it.

Indeed.

And I have some other 5.8 related changes that I'm finishing up now,
so I'll take care of adjusting to the 5.8+ kernel

Bruce

>
>
> Regards,
>
> Robert
>
>
> --
> Maciej Pijanowski
> Embedded Systems Engineer
> GPG: 9963C36AAC3B2B46
> https://3mdeb.com | @3mdeb_com
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
