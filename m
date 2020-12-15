Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.461.1608058720765200236
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 10:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AfFDpZUO;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	by mail.yoctoproject.org (Postfix) with ESMTPS id E2F5438C0823
	for <meta-virtualization@yoctoproject.org>; Tue, 15 Dec 2020 18:58:34 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id cm17so22221657edb.4
        for <meta-virtualization@yoctoproject.org>; Tue, 15 Dec 2020 10:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x/L9Ta7cynXmdBhKqqaXjHtfa+IH3VfKjaJVpeDpRTc=;
        b=AfFDpZUOoAtbm4Uak6O+5+S9evMbeyxcbYGVt83siZJLFLMAnhIF1zRUeNF5Gplz3A
         ElxAu1f13FPTaf1Ut9qzZ3SI5rce9H/1krak5IvbOr9KCi5OSUsMNPqlnOlimdEkta0g
         czrWgGZemVavLXzSU7hVCZSSOrjgs8SQ30ltZntJDeK9+LmzwhtR8QcRjG02Faag40ME
         qLPg0Q8oeKZg8wtrnRffh187fBt5hhfeoPs+8pyMgefzxeLqu5Va5OrksPdtNSZQ3vxf
         fk2K0Xy/F3AtFC5HOHYjkgfL6s6kn3eWfeVf082sBhocwOHSCWjoF3nGrMXZFSv9cS7B
         HyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x/L9Ta7cynXmdBhKqqaXjHtfa+IH3VfKjaJVpeDpRTc=;
        b=jiaGbf2949c6Eu0Bxw+WgnhJ6FONZqsBWL4y+myDV8fH0mEujdVwKwfruBrJ1Pvz4A
         NrJe1bsDq873s9CL8JmSAJn3lKarEAcQPRZ+qn3iFxYpm4cTKsXs62KfMXvIReUaaFak
         b/Hag1uRaD4xqrb5KrJ8d9Pdn2VgSHaR5aNWEJf7Kf9hZa3lywcWulGvDwN9FgXlSMK1
         LNZanVJnuStFfZ3ivX/imey4iec3ugLHilggdj7bWN7t38gUyo9Vu1Q2OHk8kHxPTuoA
         kM91gsrJwUs9iYWIaMA79SjFcbBCTzmVcTqN6Y70hKzUzBe/Y94YWxg16dapxutEdsCu
         clPA==
X-Gm-Message-State: AOAM53283Y8a8FQQfmEwsUbEpf6a0uFv4YndrPBScieEMW4DKgtgtP8K
	JKUilDgZvEUFjYIfEl6OvGASd5egl2MWDbhcxq4=
X-Google-Smtp-Source: ABdhPJzBBBu2tJ8sHdHf5uP3E8ozooYGphEZPZ9WGqf/Ft++J3fpsZndeQ2pMF/TUKTAEPqP72/yafmYuxvmLneQh9Q=
X-Received: by 2002:a50:e688:: with SMTP id z8mr31576312edm.129.1608058713314;
 Tue, 15 Dec 2020 10:58:33 -0800 (PST)
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
 <CADkTA4Mg_+4Aj216FyYqVA22g4vBSgt6f2zURvXjNikhwMJutw@mail.gmail.com> <DBBPR08MB472507C6C2E14C13A773FF2C91C60@DBBPR08MB4725.eurprd08.prod.outlook.com>
In-Reply-To: <DBBPR08MB472507C6C2E14C13A773FF2C91C60@DBBPR08MB4725.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 15 Dec 2020 13:58:22 -0500
Message-ID: <CADkTA4OOc_dL_8KVDFShHH5AkQXnpFoUAC7VOPEqnAPGH6qwLQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: Lance Yang <Lance.Yang@arm.com>
Cc: Joakim Roubert <joakim.roubert@axis.com>, Michael Zhao <Michael.Zhao@arm.com>, 
	meta-virtualization <meta-virtualization@yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 4:57 AM Lance Yang <Lance.Yang@arm.com> wrote:
>
> Hi Bruce,
>
> Thanks for your quick reply.
>
> Yesterday, I pulled meta-virtualization master-next branch to my local se=
rver and trying to build k3s with qemux86-64 image.  In master-next branch,=
 I found you had created DISTRO_FEATURE check for k3s and some package grou=
ps for k3s. E.g. packagegroup-k3s-node, packagegroup-k3s-host.
>
> I configured my local.conf to install k3s with following configurations:
>
> DISTRO_FEATURES_append =3D " k3s virtualization"
> IMAGE_INSTALL_append =3D " packagegroup-k3s-node packagegroup-k3s-host cg=
roup-lite kernel-modules"
>
> However, when I use:
>
> bitbake core-image-minimal
>
> to compile a minimal image to test k3s.  I encountered the following erro=
r message:
>
> gcc: error: unrecognized command line option =E2=80=98-fmacro-prefix-map=
=3D/path/to/build/tmp/work/core2-64-poky-linux/libvirt/6.3.0-r0=3D/usr/src/=
debug/libvirt/6.3.0-r0=E2=80=99
> | error: command '/home/lance/repos/build/tmp/hosttools/gcc' failed with =
exit code 1
> | WARNING: exit code 1 from a shell command.
> | ERROR: Execution of '/path/to/build/tmp/work/core2-64-poky-linux/libvir=
t/6.3.0-r0/temp/run.do_compile.162048' failed with exit code 1:
>
> It seems the error was related to libvirt. I two three questions here. If=
 you need more log details, please let me know.
>
> 1. Do I mis-config anything so that the error above appeared? Could you p=
lease share your configuration when you compile the image with k3s?

The packagegroups are still a work in progress, and I actually have
some changes to them that aren't on that branch yet. In particular
docker has been removed as a dependency and libvirt has been shuffled
to an optional packagegroup.

That being said, I just built libvirt on two different machines on an
up to date master branch for all layers, and didn't get that same
error. So

You don't need the packagegroups for testing, but once I have a
working configuration, it will be split and captured into package
lists for re-use across many of the different configurations.

So I'd suggest dropping it and ignoring that failure for now (since) I
can't reproduce it.

> 2. Do we need libvirt when we install k3s? From my own experience, libvir=
t is for virtualization. When I run k3s on bare-metal, I don't think I inst=
all a libvirt component. And before, I ran a k3s successfully without libvi=
rt on aarch64 Yocto Linux.
>
> Once I successfully built the qemux86-64 image, I am willing to spare som=
e effort to reproduce the bugs you mentioned in the previous email. Would y=
ou mind sharing your config to me?
>

I've actually tracked this down to something in our build of the k3s
binary. I can bring up a node by substituting just the k3s all-in-one
executable. There have been issues with the go compiler reported in
master, so I'm doing a full rebuild now, in case the linker is causing
the problem. I've looked all through the build instructions from the
k3s repository, and nothing obvious is different between the two
(except possibly the compiler) .. I'm building the exact same git hash
of the one that works.

For now, I'd suggest waiting a couple more days, since I may have it
solved shortly.

Bruce

> Best Regards,
> Lance
>
> > -----Original Message-----
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Sent: Friday, December 11, 2020 9:44 PM
> > To: Lance Yang <Lance.Yang@arm.com>
> > Cc: Joakim Roubert <joakim.roubert@axis.com>; meta-virtualization <meta=
-
> > virtualization@yoctoproject.org>; nd <nd@arm.com>; Michael Zhao
> > <Michael.Zhao@arm.com>
> > Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
> >
> > On Fri, Dec 11, 2020 at 1:31 AM Lance Yang <Lance.Yang@arm.com> wrote:
> > >
> > > Hi Bruce and Joakim,
> > >
> > >
> > >
> > > I recently saw a new branch master-next has been created in meta-
> > virtualization. It mainly related to k3s and I saw k3s had been bumped =
to
> > v1.19. I would like to know if the k3s patch will be merged into master=
 branch
> > soon.  I remembered you mentioned k3s v1.18 has some agent registration
> > issue and some had crash loop issues.
> > >
> > >
> > >
> > > What is the current status of the k3s patch? Is there any further iss=
ues?
> >
> > It is just in master-next, to show that some cleanups have been done, a=
nd
> > the supporting component version bumps that I've done, but no, it still
> > doesn't work under qemux86-64, so it can't actually merge to master.
> >
> > The node becomes ready, but all the core containers go into a crashback=
off
> > loop, kubectl logs doesn't work, and we still can't register a client w=
ith it
> > (likely because of symptom #1).
> >
> > I'm also chasing down an iptables issue (that I had previously fixed), =
but
> > should have that sorted shortly.
> >
> > Bruce
> >
> > >
> > >
> > >
> > > Best Regards,
> > >
> > > Lance
> > >
> > > From: meta-virtualization@lists.yoctoproject.org
> > > <meta-virtualization@lists.yoctoproject.org> On Behalf Of Bruce
> > > Ashfield via lists.yoctoproject.org
> > > Sent: Thursday, November 19, 2020 4:39 AM
> > > To: Joakim Roubert <joakim.roubert@axis.com>
> > > Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
> > > Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > On Wed, Nov 18, 2020 at 1:27 PM Joakim Roubert
> > <joakim.roubert@axis.com> wrote:
> > >
> > > On 2020-11-17 20:39, Bruce Ashfield wrote:
> > >  >
> > > > root@qemux86-64:~# kubectl get pods -n kube-system NAME READY
> > STATUS
> > > > RESTARTS AGE
> > > > local-path-provisioner-7ff9579c6-bd947 0/1 CrashLoopBackOff 822m
> > > > coredns-66c464876b-76bdl 0/1 CrashLoopBackOff 822m
> > > > helm-install-traefik-mvt5k 0/1 CrashLoopBackOff 822m
> > > > metrics-server-7b4f8b595-ck5kz 0/1 CrashLoopBackOff 822m
> > > > root@qemux86-64:~#
> > >
> > >  From my own experience with CrashLoopBackOff situations is that ther=
e
> > > may be serveral different things causing that. Can you trace down wha=
t
> > > is causing the CrashLoopBackOff here?
> > >
> > >
> > >
> > > Not really. The build seems to have some sort of misconfiguration and=
 no
> > logs are created (and hence can't be accessed via kubectl).
> > >
> > >
> > >
> > > Running the server on the command line just gets us reams of messages
> > and a lot of false leads (too many nameservers, iptables --random-fully=
 not
> > supported, etc ).
> > >
> > >
> > >
> > > I've tried a few variants today, but can't get any really simple logs=
 out. I'll do
> > more tomorrow.
> > >
> > >
> > >
> > > I've been able to confirm that my packagegroup/image type runs docker=
,
> > containerd, and runc launched containers just fine, so this is just som=
e
> > quirk/idiocy of k*s that is causing the problem.
> > >
> > >
> > >
> > > Bruce
> > >
> > >
> > >
> > >
> > > BR,
> > >
> > > /Joakim
> > >
> > >
> > >
> > >
> > >
> > > --
> > >
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > > IMPORTANT NOTICE: The contents of this email and any attachments are
> > confidential and may also be privileged. If you are not the intended re=
cipient,
> > please notify the sender immediately and do not disclose the contents t=
o any
> > other person, use it for any purpose, or store or copy the information =
in any
> > medium. Thank you.
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee
> > at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
