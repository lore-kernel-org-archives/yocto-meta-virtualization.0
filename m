Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.4094.1605188304199728470
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 05:38:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LTtHKUxG;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	by mail.yoctoproject.org (Postfix) with ESMTPS id C215E38C0966
	for <meta-virtualization@yoctoproject.org>; Thu, 12 Nov 2020 13:38:22 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id v22so6168720edt.9
        for <meta-virtualization@yoctoproject.org>; Thu, 12 Nov 2020 05:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IrjXFcPRXJNGZgcAk7ktEGX0Dh94gBUQxmwwBZfzyUQ=;
        b=LTtHKUxGDAPTPzcc1I7fd9ebDQ+T0ZmSIBJsl5en1m7uB/S60zEQr8+2/w1+w64scH
         iGz8MC5tYt+ouNgLCpmotKgz+b7YkckJVI6jHvf36l8HnZl+hCy9hDjV08tl9Ge+nRT5
         jv+2DiuR2ENQWPqpRiklVG8D5oF4gn54ki1fgWWj+fWS3eptr51JHdg1CdFAEb0V8pHo
         7/2+IO0DXHPoyiIp+KTs3x2r7md9FRifXnywajGadhTVuV3tEaLDmUNd3grpC5Lzd5nJ
         j2s3Mcoq7/rTJN7i/K+5GwmK7/Re+ciQi4WgeIp92MiRte0Vc3jojw3HCbNwaGUmeP5i
         7mQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IrjXFcPRXJNGZgcAk7ktEGX0Dh94gBUQxmwwBZfzyUQ=;
        b=KJhTzz9RlVZHGHp/uWZrSJRa3NvS/x7qKWus5i8yGdRnBuE0YzSWp9OVxMZxz4E5Q8
         Gu6rKttDQB//6C1I2Dq4jT+3uoCjtKQOhe4QZTqSUrYdcBPauRgnmKagezrs4Pky1O2h
         /JCUva3lLI+mRbdI4TDKACKaNqi3eRgJ3cV+4rq6lf+2lCEk1gtYFACEnKFenvW+KGZc
         j3RCXbMWTjZ3UEAhe5QKfS1uwxLhzMDtjxzOE54xK5SKC9I0BUhFlXoYDvizedoCOHC3
         xWKnBiyE6HsYdssx4+L+C6kQHp0yhuGbigWytumjzDqHmpvOhs5lFZVv4vRaTXH0Kss3
         7Kcw==
X-Gm-Message-State: AOAM533t7jcu2wnJM8aF2dTC8hyW63dfOE9ukWBRpgf+XelnLY7CtkgF
	8MSkncdJdqfIMjY8y1yi4p4C13OCFX7bI+o20Z0=
X-Google-Smtp-Source: ABdhPJwB8kfrjYyLB/URppe/X9Q6OEhUyYfUpYldQZIFYEZ4owi4eCavPg4Z1NoJwMj0RM8HW40L3oy3bBhPWyO4WZ8=
X-Received: by 2002:aa7:c886:: with SMTP id p6mr4952968eds.352.1605188300805;
 Thu, 12 Nov 2020 05:38:20 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com> <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <DBBPR08MB4725E54DC414E2CBE8E84D0D91E90@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <16462648E2B320A8.24110@lists.yoctoproject.org> <CADkTA4PtR2gjBdimC6-JDqVr4=B82YrbwWZrFfh2vzegsOhF7Q@mail.gmail.com>
 <DBBPR08MB4725815F991029BF1347F9EC91E70@DBBPR08MB4725.eurprd08.prod.outlook.com>
In-Reply-To: <DBBPR08MB4725815F991029BF1347F9EC91E70@DBBPR08MB4725.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 12 Nov 2020 08:38:09 -0500
Message-ID: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: Lance Yang <Lance.Yang@arm.com>
Cc: Joakim Roubert <joakim.roubert@axis.com>, 
	"meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>, Michael Zhao <Michael.Zhao@arm.com>, 
	Kaly Xin <Kaly.Xin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2020 at 2:30 AM Lance Yang <Lance.Yang@arm.com> wrote:
>
> Hi Bruce,
>
> I pulled your latest k3s-wip branch. In your recipes-networking, the ipse=
t:
>
> cat ipset_6.38.bb
> # Copyright (C) 2017 Aaron Brice <aaron.brice@datasoft.com>
> # Released under the MIT license (see COPYING.MIT for the terms)
>
> ...
> ... (skip verbose output)
>
> DEPENDS =3D "libtool libmnl"
> RDEPENDS_${PN} =3D "kernel-module-ip-set"
> ...
>
> I use bitbake to install k3s and ipset but I got errors below:
>
> Problem 1: conflicting requests
>   - nothing provides kernel-module-ip-set needed by ipset-6.38-r0
>
> I think RDEPENDS_${PN} is a slightly over-strict condition in some situat=
ions. For example, in the following situation:
>
> In my build/conf/local.conf, I added "kernel-modules" in IMAGE_INSTALL_ap=
pend section. kernel-modules-ip-set has already included in kernel-modules =
when I check in qemuarm64 image with "lsmod|grep ip_set". But if RDEPENDS i=
s used, bitbake won't continue to compile the package unless you add "kerne=
l-module-ip-set".
>
> So I suggested to use " RRECOMMENDS_${PN}".

That's already the case in the forked recipe (rdepends), and there's
significant issues with getting the right kernel configuration .. so
I'm going to leave it as a rdepends, since if you have that not as a
module, it means you aren't using the linux-yocto reference configs
(or the reference configs are broken), and that there may be other
issues in your configuration.

Bruce

>
> Best Regards,
> Lance
> > -----Original Message-----
> > From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@l=
ists.yoctoproject.org>
> > On Behalf Of Bruce Ashfield via lists.yoctoproject.org
> > Sent: Tuesday, November 10, 2020 9:17 PM
> > To: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Cc: Lance Yang <Lance.Yang@arm.com>; Joakim Roubert <joakim.roubert@axi=
s.com>; meta-
> > virtualization@yoctoproject.org; Michael Zhao <Michael.Zhao@arm.com>; K=
aly Xin
> > <Kaly.Xin@arm.com>
> > Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
> >
> > On Tue, Nov 10, 2020 at 7:46 AM Bruce Ashfield via lists.yoctoproject.o=
rg
> > <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> > >
> > > On Tue, Nov 10, 2020 at 1:43 AM Lance Yang <Lance.Yang@arm.com> wrote=
:
> > > >
> > > > Hi Bruce and Joakim,
> > > >
> > > > Thanks for sharing this branch: k3s-wip. I have tested against my y=
octo build.
> > >
> > > The branch will be more functional shortly, I have quite a few change=
s
> > > to factor things for k8s and generally more usable :D
> > >
> > >         modified:   classes/cni_networking.bbclass
> > >         modified:   conf/layer.conf
> > >         modified:   recipes-containers/containerd/containerd-docker_g=
it.bb
> > >         modified:
> > > recipes-containers/containerd/containerd-opencontainers_git.bb
> > >         modified:   recipes-containers/k3s/README.md
> > >         modified:   recipes-containers/k3s/k3s_git.bb
> > >         modified:   recipes-kernel/linux/linux-yocto/kubernetes.cfg
> > >         modified:   recipes-networking/cni/cni_git.bb
> > >         container-deploy.txt
> > >         recipes-core/packagegroups/
> > >
> > > >
> > > > My Image: Linux qemuarm64 by yocto.
> > > >
> > > > The master node can be ready after I started the k3s server. Howeve=
r, the pods in kube-
> > system (which are essential components for k3s) cannot turn to ready st=
ate on qemuarm64.
> > > >
> > >
> > > That's interesting, since in my configuration, the master never comes=
 ready:
> > >
> > > root@qemux86-64:~# kubectl get nodes
> > > NAME         STATUS     ROLES    AGE   VERSION
> > > qemux86-64   NotReady   master   15h   v1.18.9-k3s1
> > >
> >
> > Hah.
> >
> > I finally got the node to show up as ready:
> >
> > root@qemux86-64:~# kubectl get nodes
> > NAME         STATUS   ROLES    AGE    VERSION
> > qemux86-64   Ready    master   112s   v1.18.9-k3s1
> >
> > I'm attempting to build an all-in-one node, and that is likely causing =
me some issues.
> >
> > I'm revisiting those potential conflicts now.
> >
> > But if anyone else does have an all in one working and has some tips, f=
eel free to share :D
> >
> > Bruce
> >
> > > I've sorted out more of the dependencies, and have packagegroups to
> > > make them easier now.
> > >
> > > Hopefully, I can figure out what is now missing and keeping my master
> > > from moving into ready today.
> > >
> > > Bruce
> > >
> > > > After the master node itself turned to ready state, I check the pod=
s with kubectl:
> > > >
> > > > kubectl get nodes
> > > > NAME        STATUS   ROLES    AGE   VERSION
> > > > qemuarm64   Ready    master   11m   v1.18.9-k3s1
> > > > root@qemuarm64:~# ls
> > > > root@qemuarm64:~# kubectl get pods -n kube-system
> > > > NAME                                     READY   STATUS            =
  RESTARTS   AGE
> > > > local-path-provisioner-6d59f47c7-xxvbl   0/1     ContainerCreating =
  0          12m
> > > > coredns-7944c66d8d-tlrm9                 0/1     ContainerCreating =
  0          12m
> > > > metrics-server-7566d596c8-svkff          0/1     ContainerCreating =
  0          12m
> > > > helm-install-traefik-s8p5g               0/1     ContainerCreating =
  0          12m
> > > >
> > > > Then I describe the pods with:
> > > >
> > > > Events:
> > > >   Type     Reason       Age                  From               Mes=
sage
> > > >   ----     ------       ----                 ----               ---=
----
> > > >   Normal   Scheduled    16m                  default-scheduler  Suc=
cessfully assigned kube-
> > system/coredns-7944c66d8d-tlrm9 to qemuarm64
> > > >   Warning  FailedMount  5m23s (x3 over 14m)  kubelet            Una=
ble to attach or mount
> > volumes: unmounted volumes=3D[coredns-token-b7nlh], unattached volumes=
=3D[coredns-token-
> > b7nlh config-volume]: timed out waiting for the condition
> > > >   Warning  FailedMount  50s (x4 over 12m)    kubelet            Una=
ble to attach or mount
> > volumes: unmounted volumes=3D[coredns-token-b7nlh], unattached volumes=
=3D[config-volume
> > coredns-token-b7nlh]: timed out waiting for the condition
> > > >   Warning  FailedMount  11s (x16 over 16m)   kubelet            Mou=
ntVolume.SetUp failed for
> > volume "coredns-token-b7nlh" : mount failed: exec: "mount": executable =
file not found in $PATH
> > > >
> > > > I found the "mount" binary is not found in $PATH. However, I confir=
med the $PATH and
> > mount binary on my qemuarm64 image:
> > > >
> > > > root@qemuarm64:~# echo $PATH
> > > > /usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
> > > > root@qemuarm64:~# which mount
> > > > /bin/mount
> > > >
> > > > When I type mount command, it worked fine:
> > > >
> > > > /dev/root on / type ext4 (rw,relatime) devtmpfs on /dev type
> > > > devtmpfs (rw,relatime,size=3D2016212k,nr_inodes=3D504053,mode=3D755=
)
> > > > proc on /proc type proc (rw,relatime) sysfs on /sys type sysfs
> > > > (rw,relatime) debugfs on /sys/kernel/debug type debugfs
> > > > (rw,relatime) tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=3D755)
> > > > ...
> > > > ... (skipped the verbose output)
> > > >
> > > > I would like to know whether you have met this "mount" issue ever?
> > > >
> > > > Best Regards,
> > > > Lance
> > > >
> > > > > -----Original Message-----
> > > > > From: meta-virtualization@lists.yoctoproject.org
> > > > > <meta-virtualization@lists.yoctoproject.org>
> > > > > On Behalf Of Bruce Ashfield via lists.yoctoproject.org
> > > > > Sent: Monday, October 26, 2020 11:46 PM
> > > > > To: Joakim Roubert <joakim.roubert@axis.com>
> > > > > Cc: meta-virtualization@yoctoproject.org
> > > > > Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
> > > > >
> > > > > On Wed, Oct 21, 2020 at 2:00 AM Joakim Roubert <joakim.roubert@ax=
is.com> wrote:
> > > > > >
> > > > > > On 2020-10-21 05:10, Bruce Ashfield wrote:
> > > > > > > Ha!!!!
> > > > > > >
> > > > > > > This applies.
> > > > > >
> > > > > > Wonderful, thank you! I guess this is what is called "five time=
s lucky"...
> > > > > >
> > > > > > > I'm now testing and completing some of my networking
> > > > > > > factoring, as well as importing / forking some recipes to
> > > > > > > avoid extra layer depends.
> > > > > >
> > > > > > Excellent!
> > > > >
> > > > > I've pushed some of my WIP to:
> > > > > https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/lo=
g
> > > > > /?h=3Dk3s-wip
> > > > >
> > > > > That includes the split of the networking, the import of some of
> > > > > the dependencies and some small tweaks I'm working on.
> > > > >
> > > > > I did have a couple of questions on the k3s packaging itself, I
> > > > > was getting the following
> > > > > error:
> > > > >
> > > > > ERROR: k3s-v1.18.9+k3s1-dirty-r0 do_package: QA Issue: k3s:
> > > > > Files/directories were installed but not shipped in any package:
> > > > >   /usr/local/bin/k3s-clean
> > > > >   /usr/local/bin/crictl
> > > > >   /usr/local/bin/kubectl
> > > > >   /usr/local/bin/k3s
> > > > >
> > > > > So I added them to the FILES of the k3s package itself (so both
> > > > > k3s-server and k3s-agent will get them), is that the split you we=
re looking for ?
> > > > >
> > > > > Bruce
> > > > >
> > > > > >
> > > > > > BR,
> > > > > >
> > > > > > /Joakim
> > > > > > --
> > > > > > Joakim Roubert
> > > > > > Senior Engineer
> > > > > >
> > > > > > Axis Communications AB
> > > > > > Emdalav=C3=A4gen 14, SE-223 69 Lund, Sweden
> > > > > > Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
> > > > > > Fax: +46 46 13 61 30, www.axis.com
> > > > > >
> > > > > --
> > > > > - Thou shalt not follow the NULL pointer, for chaos and madness
> > > > > await thee at its end
> > > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > > IMPORTANT NOTICE: The contents of this email and any attachments ar=
e confidential and
> > may also be privileged. If you are not the intended recipient, please n=
otify the sender
> > immediately and do not disclose the contents to any other person, use i=
t for any purpose, or
> > store or copy the information in any medium. Thank you.
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
