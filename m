Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.26861.1605012411440392376
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 04:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GkU4Z6/2;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 70BD938C06E0
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 04:46:50 -0800 (PST)
Received: by mail-ej1-f67.google.com with SMTP id za3so17374216ejb.5
        for <meta-virtualization@yoctoproject.org>; Tue, 10 Nov 2020 04:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Fa2YvjhittHrVgbVnIVwCXtg9/pcfxWVD6xSq4l+Zh0=;
        b=GkU4Z6/2kaciAWMCQKcquNa5ucmerBOqaGIOHH5mzIOslefT3elCMukn3XoPnPGXys
         zgcUzgxvCoueVLelbiX94Ejq/af6iaY6Znt30SLlyctQzzC4FlttKDHRkSmt2FaofIgv
         XrwQiZL+xfJtUaAseDZAvb1fg+dBLN5IN8rCMaBwU5cjBOO/X6KzLRl7YpBY9lBDCkUJ
         KrEDV5zcCQ1FxyfCc5NsH4Qp3wXRm+Oik/K4P2WZ7DMnogqv+UPyj19YK2fMi1GaxiNw
         +VySc3A9vpTw13swl3gLiwjweOJt3Cl2Oh/b+JOZ0fPpBJ6K4Fu65FI4KefgZE5NQvGc
         lxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Fa2YvjhittHrVgbVnIVwCXtg9/pcfxWVD6xSq4l+Zh0=;
        b=A8nJBiuU8wmhh/WGyDPwXR5+9h84w7Ae8/wa3ti/dfXZKtng0opUX0e/oDqvqL0zkZ
         Kywc0SK3AZS6rqFoo6RwIqAYhxcC+9E+ygKxXtl5IzUcfQ9b3+Hbn8oDziVqwdN8yDG2
         C7dq6rj3CvP6VSRMtMrFgpw0h7+3wlFqlfWtlmOWRGKTyTqDno/5RPDECVxM3Q+oGtXR
         VvxqOApYRt6SM5a5icXynYlF0VUWnCyym7KOso+PIEqy3cE29g4eCQloj/YerVm44O2Q
         JHLB4jQTnvVa2nwPnszACj5eGApZJenmbcz5Sc10YL8oOY6E33qU3eWVgCNr4Bd8Fkzr
         +AaA==
X-Gm-Message-State: AOAM530bteZS+YylHZi+ZZN4vgwd0Vo2BqwUr4Bda5Xlwh5a6Nj3FFm4
	dnNEWwn65MqouAOBMP3wNYcmJNJwlDDuRr7zt8k=
X-Google-Smtp-Source: ABdhPJy32ZlENTP3YIaAaQ6Y7biip2FDhvj+rURoQiALiLLi5t2H3dkoHbj/gcZVeQjmVbP4MxKAYTg4qti01hbRbtI=
X-Received: by 2002:a17:906:c18c:: with SMTP id g12mr19659423ejz.334.1605012408709;
 Tue, 10 Nov 2020 04:46:48 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com> <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <DBBPR08MB4725E54DC414E2CBE8E84D0D91E90@DBBPR08MB4725.eurprd08.prod.outlook.com>
In-Reply-To: <DBBPR08MB4725E54DC414E2CBE8E84D0D91E90@DBBPR08MB4725.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 10 Nov 2020 07:46:37 -0500
Message-ID: <CADkTA4MS3kZfvb+V4_71c87FmoHGMyGYafHx1NNbABB+ovipWg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: Lance Yang <Lance.Yang@arm.com>
Cc: Joakim Roubert <joakim.roubert@axis.com>, 
	"meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>, Michael Zhao <Michael.Zhao@arm.com>, 
	Kaly Xin <Kaly.Xin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 1:43 AM Lance Yang <Lance.Yang@arm.com> wrote:
>
> Hi Bruce and Joakim,
>
> Thanks for sharing this branch: k3s-wip. I have tested against my yocto b=
uild.

The branch will be more functional shortly, I have quite a few changes
to factor things for
k8s and generally more usable :D

        modified:   classes/cni_networking.bbclass
        modified:   conf/layer.conf
        modified:   recipes-containers/containerd/containerd-docker_git.bb
        modified:
recipes-containers/containerd/containerd-opencontainers_git.bb
        modified:   recipes-containers/k3s/README.md
        modified:   recipes-containers/k3s/k3s_git.bb
        modified:   recipes-kernel/linux/linux-yocto/kubernetes.cfg
        modified:   recipes-networking/cni/cni_git.bb
        container-deploy.txt
        recipes-core/packagegroups/

>
> My Image: Linux qemuarm64 by yocto.
>
> The master node can be ready after I started the k3s server. However, the=
 pods in kube-system (which are essential components for k3s) cannot turn t=
o ready state on qemuarm64.
>

That's interesting, since in my configuration, the master never comes ready=
:

root@qemux86-64:~# kubectl get nodes
NAME         STATUS     ROLES    AGE   VERSION
qemux86-64   NotReady   master   15h   v1.18.9-k3s1

I've sorted out more of the dependencies, and have packagegroups to
make them easier
now.

Hopefully, I can figure out what is now missing and keeping my master
from moving into
ready today.

Bruce

> After the master node itself turned to ready state, I check the pods with=
 kubectl:
>
> kubectl get nodes
> NAME        STATUS   ROLES    AGE   VERSION
> qemuarm64   Ready    master   11m   v1.18.9-k3s1
> root@qemuarm64:~# ls
> root@qemuarm64:~# kubectl get pods -n kube-system
> NAME                                     READY   STATUS              REST=
ARTS   AGE
> local-path-provisioner-6d59f47c7-xxvbl   0/1     ContainerCreating   0   =
       12m
> coredns-7944c66d8d-tlrm9                 0/1     ContainerCreating   0   =
       12m
> metrics-server-7566d596c8-svkff          0/1     ContainerCreating   0   =
       12m
> helm-install-traefik-s8p5g               0/1     ContainerCreating   0   =
       12m
>
> Then I describe the pods with:
>
> Events:
>   Type     Reason       Age                  From               Message
>   ----     ------       ----                 ----               -------
>   Normal   Scheduled    16m                  default-scheduler  Successfu=
lly assigned kube-system/coredns-7944c66d8d-tlrm9 to qemuarm64
>   Warning  FailedMount  5m23s (x3 over 14m)  kubelet            Unable to=
 attach or mount volumes: unmounted volumes=3D[coredns-token-b7nlh], unatta=
ched volumes=3D[coredns-token-b7nlh config-volume]: timed out waiting for t=
he condition
>   Warning  FailedMount  50s (x4 over 12m)    kubelet            Unable to=
 attach or mount volumes: unmounted volumes=3D[coredns-token-b7nlh], unatta=
ched volumes=3D[config-volume coredns-token-b7nlh]: timed out waiting for t=
he condition
>   Warning  FailedMount  11s (x16 over 16m)   kubelet            MountVolu=
me.SetUp failed for volume "coredns-token-b7nlh" : mount failed: exec: "mou=
nt": executable file not found in $PATH
>
> I found the "mount" binary is not found in $PATH. However, I confirmed th=
e $PATH and mount binary on my qemuarm64 image:
>
> root@qemuarm64:~# echo $PATH
> /usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
> root@qemuarm64:~# which mount
> /bin/mount
>
> When I type mount command, it worked fine:
>
> /dev/root on / type ext4 (rw,relatime)
> devtmpfs on /dev type devtmpfs (rw,relatime,size=3D2016212k,nr_inodes=3D5=
04053,mode=3D755)
> proc on /proc type proc (rw,relatime)
> sysfs on /sys type sysfs (rw,relatime)
> debugfs on /sys/kernel/debug type debugfs (rw,relatime)
> tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=3D755)
> ...
> ... (skipped the verbose output)
>
> I would like to know whether you have met this "mount" issue ever?
>
> Best Regards,
> Lance
>
> > -----Original Message-----
> > From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@l=
ists.yoctoproject.org>
> > On Behalf Of Bruce Ashfield via lists.yoctoproject.org
> > Sent: Monday, October 26, 2020 11:46 PM
> > To: Joakim Roubert <joakim.roubert@axis.com>
> > Cc: meta-virtualization@yoctoproject.org
> > Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
> >
> > On Wed, Oct 21, 2020 at 2:00 AM Joakim Roubert <joakim.roubert@axis.com=
> wrote:
> > >
> > > On 2020-10-21 05:10, Bruce Ashfield wrote:
> > > > Ha!!!!
> > > >
> > > > This applies.
> > >
> > > Wonderful, thank you! I guess this is what is called "five times luck=
y"...
> > >
> > > > I'm now testing and completing some of my networking factoring, as
> > > > well as importing / forking some recipes to avoid extra layer
> > > > depends.
> > >
> > > Excellent!
> >
> > I've pushed some of my WIP to:
> > https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/log/?h=
=3Dk3s-wip
> >
> > That includes the split of the networking, the import of some of the de=
pendencies and some
> > small tweaks I'm working on.
> >
> > I did have a couple of questions on the k3s packaging itself, I was get=
ting the following
> > error:
> >
> > ERROR: k3s-v1.18.9+k3s1-dirty-r0 do_package: QA Issue: k3s:
> > Files/directories were installed but not shipped in any package:
> >   /usr/local/bin/k3s-clean
> >   /usr/local/bin/crictl
> >   /usr/local/bin/kubectl
> >   /usr/local/bin/k3s
> >
> > So I added them to the FILES of the k3s package itself (so both k3s-ser=
ver and k3s-agent will get
> > them), is that the split you were looking for ?
> >
> > Bruce
> >
> > >
> > > BR,
> > >
> > > /Joakim
> > > --
> > > Joakim Roubert
> > > Senior Engineer
> > >
> > > Axis Communications AB
> > > Emdalav=C3=A4gen 14, SE-223 69 Lund, Sweden
> > > Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
> > > Fax: +46 46 13 61 30, www.axis.com
> > >
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
