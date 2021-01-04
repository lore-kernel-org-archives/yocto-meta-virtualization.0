Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.13707.1609767666190747940
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Jan 2021 05:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fF+k3cnn;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 45F3638C058A
	for <meta-virtualization@yoctoproject.org>; Mon,  4 Jan 2021 13:41:05 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id qw4so36796790ejb.12
        for <meta-virtualization@yoctoproject.org>; Mon, 04 Jan 2021 05:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p9OzOxi00DRw8mVGk4OZ1yRu8UmnivH4Bq4+7s2Pt18=;
        b=fF+k3cnnyPKXOO2yHlU34ukbSvp2BO2A1Rk/6DgzqsA/KursWGxxA1u2jvAeSbw/cN
         UubHgKmawVU8QnLkC395daYs6ZCxukJRv3s3HqzG+m03A3zpgoXoW1vJ3JIi9Di883I4
         V3qYfCJURKNe7izQVj01OrYgK4cLlQcQwbpx2MT7Vq+0UJppykH+f8sPWZnmwtLMrceX
         THmqYQGJOFpOYdD1uPkFhfek0Tyir8BNirytCk5n1YaAMbwj3DLnqN/Vo1xiRWBiujgr
         CLWxXHICzTWcCxKSOO0P34pAPTLKedFC/Rw63A2pig4b1NI7mOevWQMdPjJttbFUhhzH
         Tkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p9OzOxi00DRw8mVGk4OZ1yRu8UmnivH4Bq4+7s2Pt18=;
        b=djP8kMYROQof/2s/iYKmTT4nhvcw/kVzgl9VM/2WoZkK7DlJO1T7iIAK4mdfAhaDsP
         W7l0/N1qkawyU7MAYPzEl3KplD0+/sxhTOOrHyot3vm4GbQwS2zExP8kXUirG6KZF9nY
         mvvNZztCYnmLXkh0Y1Z1VqnUIs0C9h5YgRfGitqMpfbA+V0fYxJX2gxrV3zRPDErSSYh
         Sqzoe9jJPJGUJ0ID8FND1jHknl4FVH/T3fAJiI0gxoi26AQf/sWw3DTotZ70qs2lgh5X
         xxHdnkTkiapXPEcMyBLcIGK3Mv+w8qoCAhxKBDKJ1vcpENpcw7jyoj6E/k0bbUjvCc/r
         Do6A==
X-Gm-Message-State: AOAM5325feaLS/VfZ/ohuO+2mMw1NioYeLYaYU6a1nW5gLMoMEHWJsNo
	YWh8dr1Pl65am2cc2/YQDphnGBO0XKBphpfH7kg=
X-Google-Smtp-Source: ABdhPJy780oFj5Rkrk4USe5jEmrI0bOfkB8yHzD3nMYoraCkQP/dZr67yOI8EGodMwwE+4wj8FnfgK4InC8UfRKnkCA=
X-Received: by 2002:a17:906:edc8:: with SMTP id sb8mr67009140ejb.247.1609767663627;
 Mon, 04 Jan 2021 05:41:03 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <0c2289b8-4ce2-ba88-a05d-7204d88f403e@axis.com> <16485135E3A12798.28066@lists.yoctoproject.org>
 <CADkTA4N6C6HdSMhX-+W4L9QcZWOGN+6WcrH0i9f8dO37NhFSVg@mail.gmail.com>
 <6f43ed71-1a4c-f767-aa70-b83010851eb6@axis.com> <1648529A6FD37D30.5807@lists.yoctoproject.org>
 <CADkTA4PntU=xXDHzC6EissVgNf+hVq45qu58fuAr_x-b1Hdnsg@mail.gmail.com>
 <6eaac6fd-21cd-8d06-eeb5-c8a77516bdbe@axis.com> <CADkTA4PwG9_aUk07u=RttdwurGrbP1YPG1g+gE5H=q8r73ANhA@mail.gmail.com>
 <DBBPR08MB4725E5A2E6EFF7A928BCA7AF91CA0@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <CADkTA4Mg_+4Aj216FyYqVA22g4vBSgt6f2zURvXjNikhwMJutw@mail.gmail.com>
 <DBBPR08MB472507C6C2E14C13A773FF2C91C60@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <CADkTA4OOc_dL_8KVDFShHH5AkQXnpFoUAC7VOPEqnAPGH6qwLQ@mail.gmail.com>
 <24132353-1078-bdbd-5856-3c644d615f1a@axis.com> <CADkTA4Nrekx9LMEQP4ZJ=6T6Vt1tLMeDEgpY9xW4YY3aZEa83w@mail.gmail.com>
 <244150c1-c21d-9339-d189-ed9e80d79a37@axis.com>
In-Reply-To: <244150c1-c21d-9339-d189-ed9e80d79a37@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 4 Jan 2021 08:40:52 -0500
Message-ID: <CADkTA4MBq1u09ZYSoMjhuTCW0o0OdgA1RCXsoOuPd=No=eLTHQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 4, 2021 at 2:12 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
>
> On 2020-12-22 17:15, Bruce Ashfield wrote:
> > So that rules out something in the kernel (and its config), the go
> > version or something in our rootfs being missing.
>
> That surely narrows things down.
>
> > But as soon as you fetch the rancher binary, restart the services ..
> > the containers come up just fine.
>
> Is this the same thing that happened for the k3s v1.18.9 build too?
>

Yep. It is consistent with all versions that I've built, including the
pre-release master branch as well. I was hoping for some "uprev magic"
to fix it, but that wasn't the case :)

I'm back from the holidays now, and will be back into this shortly.

Bruce

> > I'm diving deeper to try and sort it out.
>
>
>
> BR,
>
> /Joakim



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
