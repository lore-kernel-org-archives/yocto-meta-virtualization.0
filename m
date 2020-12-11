Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.6799.1607694238495935106
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 05:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NeWmkkCg;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 91E7E38C13A4
	for <meta-virtualization@yoctoproject.org>; Fri, 11 Dec 2020 13:43:57 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id f23so12418597ejk.2
        for <meta-virtualization@yoctoproject.org>; Fri, 11 Dec 2020 05:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T8VLgig/xxmdfHnpnnwkrFFFEEXxZDwjmYaJMsl81D0=;
        b=NeWmkkCgLIgwxaReaBT+3enGpUtteXcy3FhG8OckYDzP3rhyCEIsPsa3n3bbWZCD4p
         /g5yYymL7aGPad47dqK56x6UmY2DioXGbf09mW60QPAL6YtIvtEuyYBVr+WGkxFIoz1b
         s+3YLytNwVyMz1YoK/OHtUC5OglpVtgOxsJuqtt14+gQLq44c1u6MHRPxDu8ys29MQoo
         H1f01H2SxbEtoLIARPiXVzPxnMWsivt5xmEfiV3AyveEs+y63DgCVQ19yFinqjmFImbK
         zC7fR5LWCwB3CkODqesHt3/Twy/7xm4ILHAhYcfTadLR5sv+UErOruUfG0lbowBxy9y3
         gtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T8VLgig/xxmdfHnpnnwkrFFFEEXxZDwjmYaJMsl81D0=;
        b=If1HuJtyLfT0YDsQZt28P5aO+sFgoiQ/4L/63ibyDNa9Jbic+PXFTIqXCz0DxRye9t
         an2WGpYriu0nopdOQP/vefLF7impMfMSGdN8j51MctwRB3xnb/E3Xdl2GC1WZaxa2Bbq
         /croqzakqup/OjZk9LX9770Z9pFgp8S7eb2DvxoeklBKAk/De2ZlScIeuQjkApg/ZXW9
         oP+bhGHcXF5EkDl28tWBsPgU7vlqvCm0XLbC6GDeCsYxPBrh/4H86c11lYO2IiOA3lGF
         KnghLJzs8AkdVTumQovMUQf0uS4XJiL/eKkHXX955D9yCLSgBVdOrEsiwZRG7BG85+U5
         CNMw==
X-Gm-Message-State: AOAM53082jAQI6zpnnIG0e6BqigoTN25Yq7Z8l/UBbqURlQcWkFhxUDx
	I+bjej6FfEDNfQGXaESUn8JHdj8E4IOBAYzArUY=
X-Google-Smtp-Source: ABdhPJyGgQOL0/pzT+VK5tAYI2Vrw0HVnEjvzFbNp46IfLcKbReu8xya0g2LKGL5p0Z62DxITcU7TrROT+eqKPc9EY4=
X-Received: by 2002:a17:907:373:: with SMTP id rs19mr10451864ejb.298.1607694235833;
 Fri, 11 Dec 2020 05:43:55 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <20201117123957.12607-1-joakimr@axis.com> <CADkTA4NWRcaOhgPO14H2qhgq_HP=dX4VUVT_uBXq5matGNGwag@mail.gmail.com>
 <f7949806-b05e-b81b-75b5-4f76d8fb7049@axis.com> <CADkTA4POf_uUOEQ=P-Me-dFpJaK334nFvSJ_Uq-WW6God3DuOw@mail.gmail.com>
 <0c2289b8-4ce2-ba88-a05d-7204d88f403e@axis.com> <16485135E3A12798.28066@lists.yoctoproject.org>
 <CADkTA4N6C6HdSMhX-+W4L9QcZWOGN+6WcrH0i9f8dO37NhFSVg@mail.gmail.com>
 <6f43ed71-1a4c-f767-aa70-b83010851eb6@axis.com> <1648529A6FD37D30.5807@lists.yoctoproject.org>
 <CADkTA4PntU=xXDHzC6EissVgNf+hVq45qu58fuAr_x-b1Hdnsg@mail.gmail.com>
 <6eaac6fd-21cd-8d06-eeb5-c8a77516bdbe@axis.com> <CADkTA4PwG9_aUk07u=RttdwurGrbP1YPG1g+gE5H=q8r73ANhA@mail.gmail.com>
 <DBBPR08MB4725E5A2E6EFF7A928BCA7AF91CA0@DBBPR08MB4725.eurprd08.prod.outlook.com>
In-Reply-To: <DBBPR08MB4725E5A2E6EFF7A928BCA7AF91CA0@DBBPR08MB4725.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 11 Dec 2020 08:43:44 -0500
Message-ID: <CADkTA4Mg_+4Aj216FyYqVA22g4vBSgt6f2zURvXjNikhwMJutw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: Lance Yang <Lance.Yang@arm.com>
Cc: Joakim Roubert <joakim.roubert@axis.com>, 
	meta-virtualization <meta-virtualization@yoctoproject.org>, nd <nd@arm.com>, 
	Michael Zhao <Michael.Zhao@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2020 at 1:31 AM Lance Yang <Lance.Yang@arm.com> wrote:
>
> Hi Bruce and Joakim,
>
>
>
> I recently saw a new branch master-next has been created in meta-virtuali=
zation. It mainly related to k3s and I saw k3s had been bumped to v1.19. I =
would like to know if the k3s patch will be merged into master branch soon.=
  I remembered you mentioned k3s v1.18 has some agent registration issue an=
d some had crash loop issues.
>
>
>
> What is the current status of the k3s patch? Is there any further issues?

It is just in master-next, to show that some cleanups have been done,
and the supporting component version bumps that I've done, but no, it
still doesn't work under qemux86-64, so it can't actually merge to
master.

The node becomes ready, but all the core containers go into a
crashbackoff loop, kubectl logs doesn't work, and we still can't
register a client with it (likely because of symptom #1).

I'm also chasing down an iptables issue (that I had previously fixed),
but should have that sorted shortly.

Bruce

>
>
>
> Best Regards,
>
> Lance
>
> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lis=
ts.yoctoproject.org> On Behalf Of Bruce Ashfield via lists.yoctoproject.org
> Sent: Thursday, November 19, 2020 4:39 AM
> To: Joakim Roubert <joakim.roubert@axis.com>
> Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
> Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
>
>
>
>
>
>
>
> On Wed, Nov 18, 2020 at 1:27 PM Joakim Roubert <joakim.roubert@axis.com> =
wrote:
>
> On 2020-11-17 20:39, Bruce Ashfield wrote:
>  >
> > root@qemux86-64:~# kubectl get pods -n kube-system
> > NAME READY STATUS RESTARTS AGE
> > local-path-provisioner-7ff9579c6-bd947 0/1 CrashLoopBackOff 822m
> > coredns-66c464876b-76bdl 0/1 CrashLoopBackOff 822m
> > helm-install-traefik-mvt5k 0/1 CrashLoopBackOff 822m
> > metrics-server-7b4f8b595-ck5kz 0/1 CrashLoopBackOff 822m
> > root@qemux86-64:~#
>
>  From my own experience with CrashLoopBackOff situations is that there
> may be serveral different things causing that. Can you trace down what
> is causing the CrashLoopBackOff here?
>
>
>
> Not really. The build seems to have some sort of misconfiguration and no =
logs are created (and hence can't be accessed via kubectl).
>
>
>
> Running the server on the command line just gets us reams of messages and=
 a lot of false leads (too many nameservers, iptables --random-fully not su=
pported, etc ).
>
>
>
> I've tried a few variants today, but can't get any really simple logs out=
. I'll do more tomorrow.
>
>
>
> I've been able to confirm that my packagegroup/image type runs docker, co=
ntainerd, and runc launched containers just fine, so this is just some quir=
k/idiocy of k*s that is causing the problem.
>
>
>
> Bruce
>
>
>
>
> BR,
>
> /Joakim
>
>
>
>
>
> --
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
