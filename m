Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.6876.1605102019723237877
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 05:40:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DUXetxKq;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 7512D38C04AD
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Nov 2020 13:40:19 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id cw8so2789149ejb.8
        for <meta-virtualization@yoctoproject.org>; Wed, 11 Nov 2020 05:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iAe/XdKSJqv8lPdOR2X+0TkggkgkP9lUJKraJyj2zoU=;
        b=DUXetxKqYDlTI52hEaOduvJoEicw6ipbkFjR23D+Ldupsjbe5+VTUQo+DbPN9mndsL
         m7xWMumErVC57i49Ie2XaITvlXWQabtyktE7PAyr3qrwhn2aHU98/bpXpHxQJtvEV+k9
         MqbjJZ6NKFtWyEbUQdPBHfSjx5bRuPQxCOPhLffjAK9L6Qx9YpgFE7N64JorLlqp5NTn
         6JqCwaCfR2W6bmiv59pWIKWiqx8Cqvq+HeGkpOC+/DB0W/zW/NKAwEjF50rj6jzPJ3XM
         HHFtvCVl52pZrPw8ieP5Y3k0Iq09MDYsjyQjxdNXxTCBpLlIA8e0mbjb4APjuSynLQ5b
         v9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iAe/XdKSJqv8lPdOR2X+0TkggkgkP9lUJKraJyj2zoU=;
        b=AG4Q7UpJLiaaIIixS06EVQnLfbb5YYYOR26JYLhml4pnf9wlWKz+rj3odpiYfG5J6I
         PuKVNVK5NZ6TjsZfY+QS6ExnK/Hcao/5UeoCXcxvxaSPVj67ioOVFuFjRSsUqFzwnYFH
         n8qeyFDOKIZIoRrS/A6/Hqps8O23CobarJCr4DNQ3bgyrVMUNO55Q77cI9gTVGCo4B2D
         EaY3sKC550q+vj3rz3HFY3e/nGzt6Zuj79S5LBygBfcUQBZt4EgnYaS3KcprCQ69CK2n
         wSaNeYbxp87llVj1Yr2mqH6W9J0rJLS1KRzEKjeM9234W5nmKdTWubRm21ygWPwneZGs
         uwJg==
X-Gm-Message-State: AOAM533A6KFHrU0QpHYjPVqc5PsoBang/gXL/y0TLTxUX6yshBSBrBx9
	f8ssOinQRO+2Y0crY+zRV8O4VSDVu2wCv/iwHuo=
X-Google-Smtp-Source: ABdhPJxtRyiUMKvvHNcwJorAMEVp94j2n10YuuqLayjRBB+zrKluMb5pyz/LJxj0etFoVoRXMXi044fi4YhRG8Yslq8=
X-Received: by 2002:a17:906:4742:: with SMTP id j2mr24696038ejs.247.1605102017797;
 Wed, 11 Nov 2020 05:40:17 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com> <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <DBBPR08MB4725E54DC414E2CBE8E84D0D91E90@DBBPR08MB4725.eurprd08.prod.outlook.com>
 <16462648E2B320A8.24110@lists.yoctoproject.org> <164627F27D18DB55.10479@lists.yoctoproject.org>
 <CADkTA4MKnhDuf85C3X=CxqrMkCKy1ka3fWxVNfSN9U=m2cJWaw@mail.gmail.com> <DBBPR08MB4725AF4604F11A7DF0A83E0491E80@DBBPR08MB4725.eurprd08.prod.outlook.com>
In-Reply-To: <DBBPR08MB4725AF4604F11A7DF0A83E0491E80@DBBPR08MB4725.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 11 Nov 2020 08:40:06 -0500
Message-ID: <CADkTA4PgwD1OwPa4kjAGHANjHYG7fbgmZAvGSw6nEt1x1Mvh3Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: Lance Yang <Lance.Yang@arm.com>
Cc: Joakim Roubert <joakim.roubert@axis.com>, 
	"meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>, Michael Zhao <Michael.Zhao@arm.com>, 
	Kaly Xin <Kaly.Xin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 5:07 AM Lance Yang <Lance.Yang@arm.com> wrote:
>
> Hi Bruce,
>
> Thanks for your reply. It took me a long time to address the $PATH issue.
>
> I found the cause after I cleaned my environment. it is because I set my =
own $PATH before k3s startup which did not include "/bin" and some componen=
ts in k3s will use "os.Getenv("PATH") to search the related tool.
>
> Since some OS may not have systemd and the k3s-clean script seems not  to=
 delete all interfaces created by cni and umount all mount points related t=
o k3s. I wrote a script for this situation and I will send it through a sep=
arate email based on your previous scripts.
>

Sounds good.

You'll notice that I pushed an update to the k3s-wip branch, things
are a bit closer to working there now.

I am interested to hear if flannel crashes if you (or anyone else)
install (and use) the k3s-agent on the same node as the k3s-server.

As soon as you run any k3s-agent command (with the proper token and
local host as the server), the node moves into NotReady with what
looks like a CNI error.

I fetched and ran the binaries directly from rancher, and they showed
the same behaviour as the meta-virt ones, so it isn't something
fundamental with the integration.

Bruce

> Best Regards,
> Lance
> > -----Original Message-----
> > From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@l=
ists.yoctoproject.org>
> > On Behalf Of Bruce Ashfield via lists.yoctoproject.org
> > Sent: Tuesday, November 10, 2020 9:35 PM
> > To: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Cc: Lance Yang <Lance.Yang@arm.com>; Joakim Roubert <joakim.roubert@axi=
s.com>; meta-
> > virtualization@yoctoproject.org; Michael Zhao <Michael.Zhao@arm.com>; K=
aly Xin
> > <Kaly.Xin@arm.com>
> > Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
> >
> > On Tue, Nov 10, 2020 at 8:17 AM Bruce Ashfield via lists.yoctoproject.o=
rg
> > <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> > >
> > > On Tue, Nov 10, 2020 at 7:46 AM Bruce Ashfield via
> > > lists.yoctoproject.org
> > > <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> > > >
> > > > On Tue, Nov 10, 2020 at 1:43 AM Lance Yang <Lance.Yang@arm.com> wro=
te:
> > > > >
> > > > > Hi Bruce and Joakim,
> > > > >
> > > > > Thanks for sharing this branch: k3s-wip. I have tested against my=
 yocto build.
> > > >
> > > > The branch will be more functional shortly, I have quite a few
> > > > changes to factor things for k8s and generally more usable :D
> > > >
> > > >         modified:   classes/cni_networking.bbclass
> > > >         modified:   conf/layer.conf
> > > >         modified:   recipes-containers/containerd/containerd-docker=
_git.bb
> > > >         modified:
> > > > recipes-containers/containerd/containerd-opencontainers_git.bb
> > > >         modified:   recipes-containers/k3s/README.md
> > > >         modified:   recipes-containers/k3s/k3s_git.bb
> > > >         modified:   recipes-kernel/linux/linux-yocto/kubernetes.cfg
> > > >         modified:   recipes-networking/cni/cni_git.bb
> > > >         container-deploy.txt
> > > >         recipes-core/packagegroups/
> > > >
> > > > >
> > > > > My Image: Linux qemuarm64 by yocto.
> > > > >
> > > > > The master node can be ready after I started the k3s server. Howe=
ver, the pods in kube-
> > system (which are essential components for k3s) cannot turn to ready st=
ate on qemuarm64.
> > > > >
> > > >
> > > > That's interesting, since in my configuration, the master never com=
es ready:
> > > >
> > > > root@qemux86-64:~# kubectl get nodes
> > > > NAME         STATUS     ROLES    AGE   VERSION
> > > > qemux86-64   NotReady   master   15h   v1.18.9-k3s1
> > > >
> > >
> > > Hah.
> > >
> > > I finally got the node to show up as ready:
> > >
> > > root@qemux86-64:~# kubectl get nodes
> > > NAME         STATUS   ROLES    AGE    VERSION
> > > qemux86-64   Ready    master   112s   v1.18.9-k3s1
> > >
> >
> > Lance,
> >
> > What image type were you building ? I'm pulling in dependencies to pack=
agegroups and the
> > recipes themselves.
> >
> > I'm not seeing the mount issue on my master/server node:
> >
> > root@qemux86-64:~# kubectl get pods -n kube-system
> > NAME                                     READY   STATUS      RESTARTS  =
 AGE
> > local-path-provisioner-6d59f47c7-h7lxk   1/1     Running     0         =
 3m32s
> > metrics-server-7566d596c8-mwntr          1/1     Running     0         =
 3m32s
> > helm-install-traefik-229v7               0/1     Completed   0         =
 3m32s
> > coredns-7944c66d8d-9rfj7                 1/1     Running     0         =
 3m32s
> > svclb-traefik-pb5j4                      2/2     Running     0         =
 2m29s
> > traefik-758cd5fc85-lxpr8                 1/1     Running     0         =
 2m29s
> >
> > I'm going back to all-in-one node debugging, but can look into the moun=
t issue more later.
> >
> > Bruce
> >
> > > I'm attempting to build an all-in-one node, and that is likely causin=
g
> > > me some issues.
> > >
> > > I'm revisiting those potential conflicts now.
> > >
> > > But if anyone else does have an all in one working and has some tips,
> > > feel free to share :D
> > >
> > > Bruce
> > >
> > > > I've sorted out more of the dependencies, and have packagegroups to
> > > > make them easier now.
> > > >
> > > > Hopefully, I can figure out what is now missing and keeping my
> > > > master from moving into ready today.
> > > >
> > > > Bruce
> > > >
> > > > > After the master node itself turned to ready state, I check the p=
ods with kubectl:
> > > > >
> > > > > kubectl get nodes
> > > > > NAME        STATUS   ROLES    AGE   VERSION
> > > > > qemuarm64   Ready    master   11m   v1.18.9-k3s1
> > > > > root@qemuarm64:~# ls
> > > > > root@qemuarm64:~# kubectl get pods -n kube-system
> > > > > NAME                                     READY   STATUS          =
    RESTARTS   AGE
> > > > > local-path-provisioner-6d59f47c7-xxvbl   0/1     ContainerCreatin=
g   0          12m
> > > > > coredns-7944c66d8d-tlrm9                 0/1     ContainerCreatin=
g   0          12m
> > > > > metrics-server-7566d596c8-svkff          0/1     ContainerCreatin=
g   0          12m
> > > > > helm-install-traefik-s8p5g               0/1     ContainerCreatin=
g   0          12m
> > > > >
> > > > > Then I describe the pods with:
> > > > >
> > > > > Events:
> > > > >   Type     Reason       Age                  From               M=
essage
> > > > >   ----     ------       ----                 ----               -=
------
> > > > >   Normal   Scheduled    16m                  default-scheduler  S=
uccessfully assigned kube-
> > system/coredns-7944c66d8d-tlrm9 to qemuarm64
> > > > >   Warning  FailedMount  5m23s (x3 over 14m)  kubelet            U=
nable to attach or mount
> > volumes: unmounted volumes=3D[coredns-token-b7nlh], unattached volumes=
=3D[coredns-token-
> > b7nlh config-volume]: timed out waiting for the condition
> > > > >   Warning  FailedMount  50s (x4 over 12m)    kubelet            U=
nable to attach or mount
> > volumes: unmounted volumes=3D[coredns-token-b7nlh], unattached volumes=
=3D[config-volume
> > coredns-token-b7nlh]: timed out waiting for the condition
> > > > >   Warning  FailedMount  11s (x16 over 16m)   kubelet            M=
ountVolume.SetUp failed
> > for volume "coredns-token-b7nlh" : mount failed: exec: "mount": executa=
ble file not found in
> > $PATH
> > > > >
> > > > > I found the "mount" binary is not found in $PATH. However, I conf=
irmed the $PATH and
> > mount binary on my qemuarm64 image:
> > > > >
> > > > > root@qemuarm64:~# echo $PATH
> > > > > /usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
> > > > > root@qemuarm64:~# which mount
> > > > > /bin/mount
> > > > >
> > > > > When I type mount command, it worked fine:
> > > > >
> > > > > /dev/root on / type ext4 (rw,relatime) devtmpfs on /dev type
> > > > > devtmpfs (rw,relatime,size=3D2016212k,nr_inodes=3D504053,mode=3D7=
55)
> > > > > proc on /proc type proc (rw,relatime) sysfs on /sys type sysfs
> > > > > (rw,relatime) debugfs on /sys/kernel/debug type debugfs
> > > > > (rw,relatime) tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=3D75=
5)
> > > > > ...
> > > > > ... (skipped the verbose output)
> > > > >
> > > > > I would like to know whether you have met this "mount" issue ever=
?
> > > > >
> > > > > Best Regards,
> > > > > Lance
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: meta-virtualization@lists.yoctoproject.org
> > > > > > <meta-virtualization@lists.yoctoproject.org>
> > > > > > On Behalf Of Bruce Ashfield via lists.yoctoproject.org
> > > > > > Sent: Monday, October 26, 2020 11:46 PM
> > > > > > To: Joakim Roubert <joakim.roubert@axis.com>
> > > > > > Cc: meta-virtualization@yoctoproject.org
> > > > > > Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
> > > > > >
> > > > > > On Wed, Oct 21, 2020 at 2:00 AM Joakim Roubert <joakim.roubert@=
axis.com> wrote:
> > > > > > >
> > > > > > > On 2020-10-21 05:10, Bruce Ashfield wrote:
> > > > > > > > Ha!!!!
> > > > > > > >
> > > > > > > > This applies.
> > > > > > >
> > > > > > > Wonderful, thank you! I guess this is what is called "five ti=
mes lucky"...
> > > > > > >
> > > > > > > > I'm now testing and completing some of my networking
> > > > > > > > factoring, as well as importing / forking some recipes to
> > > > > > > > avoid extra layer depends.
> > > > > > >
> > > > > > > Excellent!
> > > > > >
> > > > > > I've pushed some of my WIP to:
> > > > > > https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/=
l
> > > > > > og/?h=3Dk3s-wip
> > > > > >
> > > > > > That includes the split of the networking, the import of some o=
f
> > > > > > the dependencies and some small tweaks I'm working on.
> > > > > >
> > > > > > I did have a couple of questions on the k3s packaging itself, I
> > > > > > was getting the following
> > > > > > error:
> > > > > >
> > > > > > ERROR: k3s-v1.18.9+k3s1-dirty-r0 do_package: QA Issue: k3s:
> > > > > > Files/directories were installed but not shipped in any package=
:
> > > > > >   /usr/local/bin/k3s-clean
> > > > > >   /usr/local/bin/crictl
> > > > > >   /usr/local/bin/kubectl
> > > > > >   /usr/local/bin/k3s
> > > > > >
> > > > > > So I added them to the FILES of the k3s package itself (so both
> > > > > > k3s-server and k3s-agent will get them), is that the split you =
were looking for ?
> > > > > >
> > > > > > Bruce
> > > > > >
> > > > > > >
> > > > > > > BR,
> > > > > > >
> > > > > > > /Joakim
> > > > > > > --
> > > > > > > Joakim Roubert
> > > > > > > Senior Engineer
> > > > > > >
> > > > > > > Axis Communications AB
> > > > > > > Emdalav=C3=A4gen 14, SE-223 69 Lund, Sweden
> > > > > > > Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
> > > > > > > Fax: +46 46 13 61 30, www.axis.com
> > > > > > >
> > > > > > --
> > > > > > - Thou shalt not follow the NULL pointer, for chaos and madness
> > > > > > await thee at its end
> > > > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > > > IMPORTANT NOTICE: The contents of this email and any attachments =
are confidential and
> > may also be privileged. If you are not the intended recipient, please n=
otify the sender
> > immediately and do not disclose the contents to any other person, use i=
t for any purpose, or
> > store or copy the information in any medium. Thank you.
> > > >
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness
> > > > await thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > >
> > > >
> > > >
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
