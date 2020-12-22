Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.13548.1608653764956673885
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 08:16:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OpCl5y4V;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 58A3738C0957
	for <meta-virtualization@yoctoproject.org>; Tue, 22 Dec 2020 16:16:04 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id c7so13423239edv.6
        for <meta-virtualization@yoctoproject.org>; Tue, 22 Dec 2020 08:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8CJ6c/RGCSLwuOPDQpoh9MJGKlg3Y4keKXoBrXxeyq0=;
        b=OpCl5y4VLF/QohWWNpGUe0fPACMeAvtFccG8hZSaISRim+P6dEhlO2t2kCXySxwUAA
         T3NuH595M3w4J6vbpOrmdKnC1f2TkiSeuEWGlTwBQvjpoYwMKoXMMlYBbbRStv9Y+RNW
         TOz9KRDxKkhKLK2zhdlEfD4OXyjoTyM0Z6QlqSf1WyV11U9fj8KARhfATimkTzLWRqM0
         /srufAo+bzcC5IP6fI5KmSbVBCUsrORYFjtwvTIytpSuP2i4aaGMgdCMv51bFsPjTY9m
         pHmB3mnqI5f/d1vDO4U9xsvJ8Ex5qz01c6wrnlGheqZL778LWnTO62zr3znvVl4HTGMX
         1MVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8CJ6c/RGCSLwuOPDQpoh9MJGKlg3Y4keKXoBrXxeyq0=;
        b=i/Xk2Fm8tUYIxoKxcNfnfW7PAWe4F1lLrdBPp7vhlVhUc81DHuDtFANvnpZFrf19NB
         btLayA6Kxk3KZO5HVad/vw6WRtVygzyA9+8uMcJT+HdjytQC4mGN8um1UeQeD6ROIxD8
         3lIiSQN3HjKCRfyByQ4qRURrJQGy8dnlkO84pdQF1FYXz92VlM5Z+s131KVxTdXGXIsg
         7mP4kMAxCOBlAXUruq0GDjO2Iwn5adxl92YA/bEQX2ydBwGR9iZd6ECa8F/2QjlB76Da
         zczJa8NioRrA31fAqwGmbijQUhS3rMXF7cC86BHv9ApCnHYkWYxRnfZjZtVApw5pQ7yp
         DerQ==
X-Gm-Message-State: AOAM533bwiH485tYPuyRhcwStNxv+00FuhaHQPG1/Qb/4X22B4KzM+av
	LxDqict2uf8ios2fgGnz1YXS2AGoOQgprizFOGA=
X-Google-Smtp-Source: ABdhPJwLalw7yHforHta2m8N8kHJp0LpKzTqfhadsQ9Rb6q/clFFC8N3kXx/QGquXpgAOyLsFf0r2/QsB9i++FRl/ps=
X-Received: by 2002:a05:6402:3553:: with SMTP id f19mr7066475edd.129.1608653762924;
 Tue, 22 Dec 2020 08:16:02 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <f7949806-b05e-b81b-75b5-4f76d8fb7049@axis.com> <CADkTA4POf_uUOEQ=P-Me-dFpJaK334nFvSJ_Uq-WW6God3DuOw@mail.gmail.com>
 <0c2289b8-4ce2-ba88-a05d-7204d88f403e@axis.com> <16485135E3A12798.28066@lists.yoctoproject.org>
 <CADkTA4N6C6HdSMhX-+W4L9QcZWOGN+6WcrH0i9f8dO37NhFSVg@mail.gmail.com>
 <6f43ed71-1a4c-f767-aa70-b83010851eb6@axis.com> <1648529A6FD37D30.5807@lists.yoctoproject.org>
 <CADkTA4PntU=xXDHzC6EissVgNf+hVq45qu58fuAr_x-b1Hdnsg@mail.gmail.com>
 <6eaac6fd-21cd-8d06-eeb5-c8a77516bdbe@axis.com> <CADkTA4PwG9_aUk07u=RttdwurGrbP1YPG1g+gE5H=q8r73ANhA@mail.gmail.com>
 <DBBPR08MB4725E5A2E6EFF7A928BCA7AF91CA0@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <CADkTA4Mg_+4Aj216FyYqVA22g4vBSgt6f2zURvXjNikhwMJutw@mail.gmail.com>
 <DBBPR08MB472507C6C2E14C13A773FF2C91C60@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <CADkTA4OOc_dL_8KVDFShHH5AkQXnpFoUAC7VOPEqnAPGH6qwLQ@mail.gmail.com> <24132353-1078-bdbd-5856-3c644d615f1a@axis.com>
In-Reply-To: <24132353-1078-bdbd-5856-3c644d615f1a@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 22 Dec 2020 11:15:51 -0500
Message-ID: <CADkTA4Nrekx9LMEQP4ZJ=6T6Vt1tLMeDEgpY9xW4YY3aZEa83w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 18, 2020 at 9:24 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
>
> On 2020-12-15 19:58, Bruce Ashfield wrote:
> >
> > For now, I'd suggest waiting a couple more days, since I may have it
> > solved shortly.
>
> If there continues to be strange problems, perhaps the Rancher guys
> would be interested in helping out? They are both skilled and friendly,
> and given Rancher's focused agenda on being _the_ Kubernetes provider
> for edge with k3s, I guess having k3s in meta-virtualization would be
> attractive to them.

I have reached out to them, but had to put down my debug on this for a
few days as I prepared 5.10 as the new reference kernel for oe-core.

I'm almost through that, and will cycle back to this shortly.

The bottom line is that only the rancher build k3s binary works with
our constructed rootfs (in my tests).

If I use our built binary, or one that I build outside of yocto
(natively, on my build server), we end up in crashloops on all the
core containers. The binaries are built from the identical hash (for
yocto) and using the official build container images / process on my
workstation .. same result. So that rules out something in the kernel
(and its config), the go version or something in our rootfs being
missing. But as soon as you fetch the rancher binary, restart the
services .. the containers come up just fine.

And that unfortunately means that it is difficult to get help from the
project, since they don't have the right understanding of the runtime
environment (but I'm trying!).

I'm diving deeper to try and sort it out.

Bruce

>
> BR,
>
> /Joakim
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
