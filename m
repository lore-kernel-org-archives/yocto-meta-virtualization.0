Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.27332.1605015286224341525
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 05:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nql9l5Vu;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 7B48638C0693
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 05:34:45 -0800 (PST)
Received: by mail-ej1-f66.google.com with SMTP id w13so17559732eju.13
        for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 05:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Uv4KxBe00CAYnu6OXC6d/NKs3bXxbA6kYvXK9cJiZfg=;
        b=nql9l5VuzHU4R9vvf02hv6MCJH3ye2C+zIvDwyjXDMTunhn0i55xXHv9zTUfE8knDK
         YcFl+QXYNxAMNH+o3gu2rjSTU7SkopQW+1cl3neiVgj/vBDL9a3N4nTZUvXuEejJ5xe7
         umIoaCluWW3C0TQg3V0zkH+wrjh4ZXHJXqwx6GxZaeUXa+Iusk79tVNCuUHxnhyUGwPV
         rFm7pixM5fS9DGlW5ezxcw4wyEAbFJBMIQnWIdE7A0eKz2bIRgorMxF/59P9ZoSN7V1C
         BNhtfYSHYMUbAx4FVHKdFDRm+0h4YSmQm1ABXt68UqPtCTo5ydh53xQltKC/lzL2jLfh
         R1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Uv4KxBe00CAYnu6OXC6d/NKs3bXxbA6kYvXK9cJiZfg=;
        b=j4Eu3tNaFjyUOnxz+Kclmv0+IlmfRavfx6tcZYsETo/eB8ga06iV0HLEGJeLbOnUik
         kf9k1Bmcmf/9bGkAzpEQLcQRxjzOTKJJATEWUGOeW3HQpC1pMRK2FPJBf6AAv+wfXCDL
         ZtsF12p0Yr3orjyKQxkiQifVEDwuBuYyfhY3DypIRigPJMlwOugS0Mhd2TdidlKNGO57
         XBya7eeYvktsp3kq33gumkPeXb1/J6Co83KlFRgcBLKTtlwumPbOX/sBLkn7zdmDw2NX
         XCVMq3aDXUtDfqgkudD0ELNkX5dbVOxFxiN3XFQep/3NPbYZDBSM6hyn2SaNLCmZSnZA
         YI3w==
X-Gm-Message-State: AOAM530RudE7mV07eHZ3BU+XXtRGpTjSKEt3aY2fYew/kN9jQdfcni3o
	9zcL87kPUXuMEH6dlKUoCqn4iLJ6YwdK+UqZeSA=
X-Google-Smtp-Source: ABdhPJxE+/ge+TocQ5zEq34eJz2MJnD3L/eFNwlu09hlonwDktW4iI366ido8uK6e1BxQc4xudgThG7sFlL/vse1xJw=
X-Received: by 2002:a17:906:4742:: with SMTP id j2mr19686382ejs.247.1605015283949;
 Tue, 10 Nov 2020 05:34:43 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com> <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <DBBPR08MB4725E54DC414E2CBE8E84D0D91E90@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <16462648E2B320A8.24110@lists.yoctoproject.org> <164627F27D18DB55.10479@lists.yoctoproject.org>
In-Reply-To: <164627F27D18DB55.10479@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 10 Nov 2020 08:34:32 -0500
Message-ID: <CADkTA4MKnhDuf85C3X=CxqrMkCKy1ka3fWxVNfSN9U=m2cJWaw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Lance Yang <Lance.Yang@arm.com>, Joakim Roubert <joakim.roubert@axis.com>, 
	"meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>, Michael Zhao <Michael.Zhao@arm.com>, 
	Kaly Xin <Kaly.Xin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 8:17 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Tue, Nov 10, 2020 at 7:46 AM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Tue, Nov 10, 2020 at 1:43 AM Lance Yang <Lance.Yang@arm.com> wrote:
> > >
> > > Hi Bruce and Joakim,
> > >
> > > Thanks for sharing this branch: k3s-wip. I have tested against my yo=
cto build.
> >
> > The branch will be more functional shortly, I have quite a few changes
> > to factor things for
> > k8s and generally more usable :D
> >
> >         modified:   classes/cni_networking.bbclass
> >         modified:   conf/layer.conf
> >         modified:   recipes-containers/containerd/containerd-docker_gi=
t.bb
> >         modified:
> > recipes-containers/containerd/containerd-opencontainers_git.bb
> >         modified:   recipes-containers/k3s/README.md
> >         modified:   recipes-containers/k3s/k3s_git.bb
> >         modified:   recipes-kernel/linux/linux-yocto/kubernetes.cfg
> >         modified:   recipes-networking/cni/cni_git.bb
> >         container-deploy.txt
> >         recipes-core/packagegroups/
> >
> > >
> > > My Image: Linux qemuarm64 by yocto.
> > >
> > > The master node can be ready after I started the k3s server. However=
, the pods in kube-system (which are essential components for k3s) cannot t=
urn to ready state on qemuarm64.
> > >
> >
> > That's interesting, since in my configuration, the master never comes =
ready:
> >
> > root@qemux86-64:~# kubectl get nodes
> > NAME         STATUS     ROLES    AGE   VERSION
> > qemux86-64   NotReady   master   15h   v1.18.9-k3s1
> >
>
> Hah.
>
> I finally got the node to show up as ready:
>
> root@qemux86-64:~# kubectl get nodes
> NAME         STATUS   ROLES    AGE    VERSION
> qemux86-64   Ready    master   112s   v1.18.9-k3s1
>

Lance,

What image type were you building ? I'm pulling in dependencies to
packagegroups and the recipes themselves.

I'm not seeing the mount issue on my master/server node:

root@qemux86-64:~# kubectl get pods -n kube-system
NAME                                     READY   STATUS      RESTARTS   AG=
E
local-path-provisioner-6d59f47c7-h7lxk   1/1     Running     0          3m=
32s
metrics-server-7566d596c8-mwntr          1/1     Running     0          3m=
32s
helm-install-traefik-229v7               0/1     Completed   0          3m=
32s
coredns-7944c66d8d-9rfj7                 1/1     Running     0          3m=
32s
svclb-traefik-pb5j4                      2/2     Running     0          2m=
29s
traefik-758cd5fc85-lxpr8                 1/1     Running     0          2m=
29s

I'm going back to all-in-one node debugging, but can look into the
mount issue more later.

Bruce

> I'm attempting to build an all-in-one node, and that is likely causing
> me some issues.
>
> I'm revisiting those potential conflicts now.
>
> But if anyone else does have an all in one working and has some tips,
> feel free to share :D
>
> Bruce
>
> > I've sorted out more of the dependencies, and have packagegroups to
> > make them easier
> > now.
> >
> > Hopefully, I can figure out what is now missing and keeping my master
> > from moving into
> > ready today.
> >
> > Bruce
> >
> > > After the master node itself turned to ready state, I check the pods=
 with kubectl:
> > >
> > > kubectl get nodes
> > > NAME        STATUS   ROLES    AGE   VERSION
> > > qemuarm64   Ready    master   11m   v1.18.9-k3s1
> > > root@qemuarm64:~# ls
> > > root@qemuarm64:~# kubectl get pods -n kube-system
> > > NAME                                     READY   STATUS             =
 RESTARTS   AGE
> > > local-path-provisioner-6d59f47c7-xxvbl   0/1     ContainerCreating  =
 0          12m
> > > coredns-7944c66d8d-tlrm9                 0/1     ContainerCreating  =
 0          12m
> > > metrics-server-7566d596c8-svkff          0/1     ContainerCreating  =
 0          12m
> > > helm-install-traefik-s8p5g               0/1     ContainerCreating  =
 0          12m
> > >
> > > Then I describe the pods with:
> > >
> > > Events:
> > >   Type     Reason       Age                  From               Mess=
age
> > >   ----     ------       ----                 ----               ----=
---
> > >   Normal   Scheduled    16m                  default-scheduler  Succ=
essfully assigned kube-system/coredns-7944c66d8d-tlrm9 to qemuarm64
> > >   Warning  FailedMount  5m23s (x3 over 14m)  kubelet            Unab=
le to attach or mount volumes: unmounted volumes=3D[coredns-token-b7nlh], u=
nattached volumes=3D[coredns-token-b7nlh config-volume]: timed out waiting =
for the condition
> > >   Warning  FailedMount  50s (x4 over 12m)    kubelet            Unab=
le to attach or mount volumes: unmounted volumes=3D[coredns-token-b7nlh], u=
nattached volumes=3D[config-volume coredns-token-b7nlh]: timed out waiting =
for the condition
> > >   Warning  FailedMount  11s (x16 over 16m)   kubelet            Moun=
tVolume.SetUp failed for volume "coredns-token-b7nlh" : mount failed: exec:=
 "mount": executable file not found in $PATH
> > >
> > > I found the "mount" binary is not found in $PATH. However, I confirm=
ed the $PATH and mount binary on my qemuarm64 image:
> > >
> > > root@qemuarm64:~# echo $PATH
> > > /usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
> > > root@qemuarm64:~# which mount
> > > /bin/mount
> > >
> > > When I type mount command, it worked fine:
> > >
> > > /dev/root on / type ext4 (rw,relatime)
> > > devtmpfs on /dev type devtmpfs (rw,relatime,size=3D2016212k,nr_inode=
s=3D504053,mode=3D755)
> > > proc on /proc type proc (rw,relatime)
> > > sysfs on /sys type sysfs (rw,relatime)
> > > debugfs on /sys/kernel/debug type debugfs (rw,relatime)
> > > tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=3D755)
> > > ...
> > > ... (skipped the verbose output)
> > >
> > > I would like to know whether you have met this "mount" issue ever?
> > >
> > > Best Regards,
> > > Lance
> > >
> > > > -----Original Message-----
> > > > From: meta-virtualization@lists.yoctoproject.org <meta-virtualizat=
ion@lists.yoctoproject.org>
> > > > On Behalf Of Bruce Ashfield via lists.yoctoproject.org
> > > > Sent: Monday, October 26, 2020 11:46 PM
> > > > To: Joakim Roubert <joakim.roubert@axis.com>
> > > > Cc: meta-virtualization@yoctoproject.org
> > > > Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
> > > >
> > > > On Wed, Oct 21, 2020 at 2:00 AM Joakim Roubert <joakim.roubert@axi=
s.com> wrote:
> > > > >
> > > > > On 2020-10-21 05:10, Bruce Ashfield wrote:
> > > > > > Ha!!!!
> > > > > >
> > > > > > This applies.
> > > > >
> > > > > Wonderful, thank you! I guess this is what is called "five times=
 lucky"...
> > > > >
> > > > > > I'm now testing and completing some of my networking factoring=
, as
> > > > > > well as importing / forking some recipes to avoid extra layer
> > > > > > depends.
> > > > >
> > > > > Excellent!
> > > >
> > > > I've pushed some of my WIP to:
> > > > https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/log=
/?h=3Dk3s-wip
> > > >
> > > > That includes the split of the networking, the import of some of t=
he dependencies and some
> > > > small tweaks I'm working on.
> > > >
> > > > I did have a couple of questions on the k3s packaging itself, I wa=
s getting the following
> > > > error:
> > > >
> > > > ERROR: k3s-v1.18.9+k3s1-dirty-r0 do_package: QA Issue: k3s:
> > > > Files/directories were installed but not shipped in any package:
> > > >   /usr/local/bin/k3s-clean
> > > >   /usr/local/bin/crictl
> > > >   /usr/local/bin/kubectl
> > > >   /usr/local/bin/k3s
> > > >
> > > > So I added them to the FILES of the k3s package itself (so both k3=
s-server and k3s-agent will get
> > > > them), is that the split you were looking for ?
> > > >
> > > > Bruce
> > > >
> > > > >
> > > > > BR,
> > > > >
> > > > > /Joakim
> > > > > --
> > > > > Joakim Roubert
> > > > > Senior Engineer
> > > > >
> > > > > Axis Communications AB
> > > > > Emdalav=C3=A4gen 14, SE-223 69 Lund, Sweden
> > > > > Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
> > > > > Fax: +46 46 13 61 30, www.axis.com
> > > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > IMPORTANT NOTICE: The contents of this email and any attachments are=
 confidential and may also be privileged. If you are not the intended recip=
ient, please notify the sender immediately and do not disclose the contents=
 to any other person, use it for any purpose, or store or copy the informat=
ion in any medium. Thank you.
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
