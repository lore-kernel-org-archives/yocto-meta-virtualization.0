Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.13568.1605641965573047677
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 11:39:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l+i7u6vW;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	by mail.yoctoproject.org (Postfix) with ESMTPS id D6D2D38C0438
	for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 19:39:24 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id f20so31102909ejz.4
        for <meta-virtualization@yoctoproject.org>; Tue, 17 Nov 2020 11:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FYilXqTD+YCTI6eRr5nwx9E/y3jl//nu1KDP7Xsv6A0=;
        b=l+i7u6vWWyBXfvdRmanlLzMYyoRyTtyJYP15F2qqrKhuj3gswFoOZy7vK2MzAFMhww
         at70nJcWT6JfVCkhU92ZoTiEnWuwJcrhsB4WpxIf5myR2ixk9ufaE11xC+4SPFkUp33P
         ioxyAHYAc6iDMcncGbfBZgFMNR7QMBUY3auInDzILKn7D5LHl+mmtprnG1QRiaB1ADEC
         CJfCUrN4mmOJpkdsUTVQldELIqbuxZvXGk+/0/QAump5SbehbMtRst+PARAYGu/EawF7
         H6qNVZqa/7FqCmDazkzCtq+5KacJtc0M4WEr98Ls+DOXMwuNoI+3Ay4mNCdqik7FjTh2
         nVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FYilXqTD+YCTI6eRr5nwx9E/y3jl//nu1KDP7Xsv6A0=;
        b=AGVZ9o7IqKV8MkXaZ+/fOaPksx5afF/x/hgKgI7uPTeHS3q2FL4a4ZZOwuXQI0MQSG
         emnLvBIFI91qo1p2ZnmHZuoakV57e1VIzwMmUKRrY6Wzy6eTzSI5Ru0ce9JEarKMBik2
         FtMT8RNBa6/xXNNEmawotOTIqHSKvy6gp+/tmGgkIDN+AbdqRYKD7QzjsTD3mkYrb93n
         fMu/gGkaalmA6oo3wcdSYMsRmzf/9lxJF203g4asKR6j4MqXVVa/0P12E8xnFpT/PT2b
         nqoJI/y0dQXzdCWlmWAk/ifCY7fXuMbnD4LFIovYF6B/K8J8ix+SIQglHV8j0s+KOoqz
         lbSg==
X-Gm-Message-State: AOAM533T2EN1GENb3/z7j5GbecljVWFefxQWEEEcHhDgxcWwSafZWE3P
	QRnnOeuzuVi2o2xJlSPXr8lEQtsOhVaTdDdVeXg=
X-Google-Smtp-Source: ABdhPJyyhJKw+Gftl63ZRIbuVUzN+zaeGUXr0y3ovFPUNKErEaQMPHgVz8O99ybFRH23l6hNaPRuPhdPcRxS0ZV24jc=
X-Received: by 2002:a17:906:3644:: with SMTP id r4mr20852989ejb.517.1605641963099;
 Tue, 17 Nov 2020 11:39:23 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
 <20201117123957.12607-1-joakimr@axis.com> <CADkTA4NWRcaOhgPO14H2qhgq_HP=dX4VUVT_uBXq5matGNGwag@mail.gmail.com>
 <f7949806-b05e-b81b-75b5-4f76d8fb7049@axis.com> <CADkTA4POf_uUOEQ=P-Me-dFpJaK334nFvSJ_Uq-WW6God3DuOw@mail.gmail.com>
 <0c2289b8-4ce2-ba88-a05d-7204d88f403e@axis.com> <16485135E3A12798.28066@lists.yoctoproject.org>
 <CADkTA4N6C6HdSMhX-+W4L9QcZWOGN+6WcrH0i9f8dO37NhFSVg@mail.gmail.com>
 <6f43ed71-1a4c-f767-aa70-b83010851eb6@axis.com> <1648529A6FD37D30.5807@lists.yoctoproject.org>
In-Reply-To: <1648529A6FD37D30.5807@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 17 Nov 2020 14:39:11 -0500
Message-ID: <CADkTA4PntU=xXDHzC6EissVgNf+hVq45qu58fuAr_x-b1Hdnsg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: Bump to v1.19.3+k3s3
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Joakim Roubert <joakim.roubert@axis.com>, 
	meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000d8dd5b05b452a63f"

--000000000000d8dd5b05b452a63f
Content-Type: text/plain; charset="UTF-8"

Here's problem #1, using qemux86-64 and the latest on my k3s-wip branch,
while the master shows itself as ready, the pods are crashing. I need to
sort that out before I can get into the single node config.

root@qemux86-64:~# uname -a

Linux qemux86-64 5.8.13-yocto-standard #1 SMP PREEMPT Tue Oct 6 12:23:29
UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

root@qemux86-64:~# k3s --version

k3s version v1.19.3+gitAUTOINC+970fbc66d3 (970fbc66)

root@qemux86-64:~# kubectl get nodes

NAME         STATUS   ROLES    AGE   VERSION

qemux86-64   Ready    master   17m   v1.19.3-k3s1

And flannel is up:

5: flannel.1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue
state UNKNOWN group default

    link/ether be:5e:55:3e:52:e6 brd ff:ff:ff:ff:ff:ff

    inet 10.42.0.0/32 scope global flannel.1

       valid_lft forever preferred_lft forever

    inet6 fe80::bc5e:55ff:fe3e:52e6/64 scope link

       valid_lft forever preferred_lft forever

6: cni0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP
group default qlen 1000

    link/ether e2:38:35:11:31:6e brd ff:ff:ff:ff:ff:ff

    inet 10.42.0.1/24 brd 10.42.0.255 scope global cni0

       valid_lft forever preferred_lft forever

    inet6 fe80::e038:35ff:fe11:316e/64 scope link

       valid_lft forever preferred_lft forever

1081: veth89c8ca0d@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc
noqueue master cni0 state UP group default

    link/ether b6:76:4f:77:e7:a6 brd ff:ff:ff:ff:ff:ff link-netns
cni-255cf837-ca3c-f08d-730f-bbb359cb6ae1

    inet6 fe80::8cf:bff:febb:85d7/64 scope link

       valid_lft forever preferred_lft forever

1082: veth001513a2@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc
noqueue master cni0 state UP group default

    link/ether 52:5c:64:41:c6:e1 brd ff:ff:ff:ff:ff:ff link-netns
cni-71490108-5f0a-a266-de1f-4bed565dcf88

    inet6 fe80::605b:23ff:fe50:c22f/64 scope link

       valid_lft forever preferred_lft forever

1083: veth4ae47008@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc
noqueue master cni0 state UP group default

    link/ether be:0e:af:76:4d:66 brd ff:ff:ff:ff:ff:ff link-netns
cni-bb1a1e05-6fa1-e9dd-3de8-b3a4be47197a

    inet6 fe80::8467:31ff:fec3:6b20/64 scope link

       valid_lft forever preferred_lft forever

1084: veth07cd05c1@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc
noqueue master cni0 state UP group default

    link/ether 5e:75:7b:bc:ee:1c brd ff:ff:ff:ff:ff:ff link-netns
cni-07e997d6-7918-0f38-b1e5-1b08e9ac0581

    inet6 fe80::28e0:ceff:fe42:364d/64 scope link tentative
       valid_lft forever preferred_lft forever

root@qemux86-64:~# kubectl get pods -n kube-system

NAME                                     READY   STATUS             RESTARTS
  AGE

local-path-provisioner-7ff9579c6-bd947   0/1     CrashLoopBackOff   8
    22m

coredns-66c464876b-76bdl                 0/1     CrashLoopBackOff   8
    22m

helm-install-traefik-mvt5k               0/1     CrashLoopBackOff   8
    22m

metrics-server-7b4f8b595-ck5kz           0/1     CrashLoopBackOff   8
    22m

root@qemux86-64:~#

Those failures are a bit different than I used to see before going to 1.19

For whatever reason, my logs are empty, so I'm trying to see if my k3s host
image is missing something.

Bruce

On Tue, Nov 17, 2020 at 9:41 AM Bruce Ashfield via lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:

>
>
> On Tue, Nov 17, 2020 at 9:27 AM Joakim Roubert <joakim.roubert@axis.com>
> wrote:
>
>> On 2020-11-17 15:19, Bruce Ashfield wrote:
>> >
>> >         But if you have an agent, that would be 2 nodes, right? One
>> >         master and
>> >         one worker node?
>> >
>> >     In kubernetes terms, perhaps. But physical boxes .. no. This needs
>> >     to be testable under a single instance (qemu in my case).
>>
>> I see. Well, I have never tried that, but would in that case use one
>> qemu instance for the master and a separate qemu instance for each
>> worker node. (I should try to run both master and a worker on one
>> machine and see what happens on my setup.)
>>
>
> I'm experimenting with two qemu sessions as well (I had to do this with
> meta-openstack), but then host networking becomes an issue and if that's
> also the box you are doing builds on (like I am), it can cause issues.
>
> Either way, I'm fairly close now and hopefully will have this sorted out
> soon.
>
> My build is still running, but I'll post specific logs later today.
>
> Bruce
>
>
>
>>
>> BR,
>>
>> /Joakim
>>
>>
>>
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d8dd5b05b452a63f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Here&#39;s problem #1, using qemux86-64 and the latest on my =
k3s-wip branch, while the master shows itself as ready, the pods are crashi=
ng. I need to sort that out before I can get into the single node config.</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">root@qemux86-64:~# uname -a</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">Linux qemux86-64 5.8.13-yocto-standard #1 SMP P=
REEMPT Tue Oct 6 12:23:29 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux</span></p=
>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">root@qemux86-64:~# k3s --version</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">k3s version v1.19.3+gitAUTOINC+970fbc66d3 (970f=
bc66)</span></p></div></div><div><br></div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">root@qemux86-64:~# kubectl get nodes</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">NAME <span class=3D"gmail-Apple-converted-space=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>STATUS <span class=3D"gmail-Apple-conv=
erted-space">=C2=A0 </span>ROLES<span class=3D"gmail-Apple-converted-space"=
>=C2=A0 =C2=A0 </span>AGE <span class=3D"gmail-Apple-converted-space">=C2=
=A0 </span>VERSION</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">qemux86-64 <span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>Ready<span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 </span>master <span class=3D"gmail-Apple-converted-space">=C2=
=A0 </span>17m <span class=3D"gmail-Apple-converted-space">=C2=A0 </span>v=
1.19.3-k3s1</span></p></div><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">And flannel is up:</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">5: flannel.1: &lt;BROADCAST,MULTICAST,UP,LOWER_=
UP&gt; mtu 1450 qdisc noqueue state UNKNOWN group default<span class=3D"gma=
il-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0 =C2=A0 </span>link/ether be:5e:55:3e:52:e6 brd ff:ff:ff:ff:ff:ff</span=
></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0 =C2=A0 </span>inet <a href=3D"http://10.42.0.0/32">10.42.0.0/32</a> sc=
ope global flannel.1</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0=C2=A0 =C2=A0 =C2=A0 </span>valid_lft forever preferred_lft forever</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0 =C2=A0 </span>inet6 fe80::bc5e:55ff:fe3e:52e6/64 scope link<span class=
=
=3D"gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0=C2=A0 =C2=A0 =C2=A0 </span>valid_lft forever preferred_lft forever</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">6: cni0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt=
; mtu 1450 qdisc noqueue state UP group default qlen 1000</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0 =C2=A0 </span>link/ether e2:38:35:11:31:6e brd ff:ff:ff:ff:ff:ff</span=
></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0 =C2=A0 </span>inet <a href=3D"http://10.42.0.1/24">10.42.0.1/24</a> br=
d 10.42.0.255 scope global cni0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0=C2=A0 =C2=A0 =C2=A0 </span>valid_lft forever preferred_lft forever</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0 =C2=A0 </span>inet6 fe80::e038:35ff:fe11:316e/64 scope link<span class=
=
=3D"gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0=C2=A0 =C2=A0 =C2=A0 </span>valid_lft forever preferred_lft forever</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">1081: veth89c8ca0d@if4: &lt;BROADCAST,MULTICAST=
,UP,LOWER_UP&gt; mtu 1450 qdisc noqueue master cni0 state UP group default<=
span class=3D"gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0 =C2=A0 </span>link/ether b6:76:4f:77:e7:a6 brd ff:ff:ff:ff:ff:ff link-=
netns cni-255cf837-ca3c-f08d-730f-bbb359cb6ae1</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0 =C2=A0 </span>inet6 fe80::8cf:bff:febb:85d7/64 scope link<span class=
=3D"gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0=C2=A0 =C2=A0 =C2=A0 </span>valid_lft forever preferred_lft forever</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">1082: veth001513a2@if4: &lt;BROADCAST,MULTICAST=
,UP,LOWER_UP&gt; mtu 1450 qdisc noqueue master cni0 state UP group default<=
span class=3D"gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0 =C2=A0 </span>link/ether 52:5c:64:41:c6:e1 brd ff:ff:ff:ff:ff:ff link-=
netns cni-71490108-5f0a-a266-de1f-4bed565dcf88</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0 =C2=A0 </span>inet6 fe80::605b:23ff:fe50:c22f/64 scope link<span class=
=
=3D"gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0=C2=A0 =C2=A0 =C2=A0 </span>valid_lft forever preferred_lft forever</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">1083: veth4ae47008@if4: &lt;BROADCAST,MULTICAST=
,UP,LOWER_UP&gt; mtu 1450 qdisc noqueue master cni0 state UP group default<=
span class=3D"gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0 =C2=A0 </span>link/ether be:0e:af:76:4d:66 brd ff:ff:ff:ff:ff:ff link-=
netns cni-bb1a1e05-6fa1-e9dd-3de8-b3a4be47197a</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0 =C2=A0 </span>inet6 fe80::8467:31ff:fec3:6b20/64 scope link<span class=
=
=3D"gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0=C2=A0 =C2=A0 =C2=A0 </span>valid_lft forever preferred_lft forever</sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">1084: veth07cd05c1@if4: &lt;BROADCAST,MULTICAST=
,UP,LOWER_UP&gt; mtu 1450 qdisc noqueue master cni0 state UP group default<=
span class=3D"gmail-Apple-converted-space">=C2=A0</span></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0 =C2=A0 </span>link/ether 5e:75:7b:bc:ee:1c brd ff:ff:ff:ff:ff:ff link-=
netns cni-07e997d6-7918-0f38-b1e5-1b08e9ac0581</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures"><span class=3D"gmail-Apple-converted-space">=C2=
=
=A0 =C2=A0 </span>inet6 fe80::28e0:ceff:fe42:364d/64 scope link tentative<=
span class=3D"gmail-Apple-converted-space">=C2=A0</span></span></p>
<div class=3D"gmail_default" style=3D"font-size:small"><span class=3D"gmai=
l-Apple-converted-space" style=3D"font-variant-ligatures:no-common-ligature=
s;background-color:rgba(0,0,0,0.94);color:rgb(188,188,188);font-family:&quo=
t;Andale Mono&quot;;font-size:12px">=C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span=
 style=3D"font-variant-ligatures:no-common-ligatures;background-color:rgba(=
0,0,0,0.94);color:rgb(188,188,188);font-family:&quot;Andale Mono&quot;;font=
-size:12px">valid_lft forever preferred_lft forever</span></div></div><div>=
<br></div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">root@qemux86-64:~# kubectl get pods -n kube-sys=
tem</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">NAME <span class=3D"gmail-Apple-converted-space=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>READY <span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 </span>STATUS <span class=3D"gma=
il-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>=
RESTARTS <span class=3D"gmail-Apple-converted-space">=C2=A0 </span>AGE</spa=
n></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">local-path-provisioner-7ff9579c6-bd947 <span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 </span>0/1 <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 </span>CrashLoopBackOff <span class=3D=
"gmail-Apple-converted-space">=C2=A0 </span>8<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>22m</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">coredns-66c464876b-76bdl <span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>0/1 <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 <=
/span>CrashLoopBackOff <span class=3D"gmail-Apple-converted-space">=C2=A0 <=
/span>8<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 </span>22m</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">helm-install-traefik-mvt5k <span class=3D"gmail=
-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </=
span>0/1 <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 </span>C=
rashLoopBackOff <span class=3D"gmail-Apple-converted-space">=C2=A0 </span>8=
<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 </span>22m</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">metrics-server-7b4f8b595-ck5kz <span class=3D"g=
mail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0/1 <=
span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 </span>CrashLoopBa=
ckOff <span class=3D"gmail-Apple-converted-space">=C2=A0 </span>8<span clas=
s=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span=
>22m</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:12px;line-height:n=
ormal;font-family:&quot;Andale Mono&quot;;color:rgb(188,188,188);background=
-color:rgba(0,0,0,0.94)"><span class=3D"gmail-s1" style=3D"font-variant-lig=
atures:no-common-ligatures">root@qemux86-64:~#<span class=3D"gmail-Apple-co=
nverted-space">=C2=A0</span></span></p></div><div><br></div><div><div class=
=
=3D"gmail_default" style=3D"font-size:small">Those failures are a bit diff=
erent than I used to see before going to 1.19=C2=A0</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">For whatever reason, my logs are empty, so I&#39=
;m trying to see if my k3s host image is missing something.</div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, Nov 17, 2020 at 9:41 AM Bruce Ashfield via <a href=3D"http://lists.yoct=
oproject.org">lists.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"ma=
ilto:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, Nov 17, 2020 at 9:27 AM Joakim Roubert &lt;<a href=3D"mailto:joakim.rou=
bert@axis.com" target=3D"_blank">joakim.roubert@axis.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On 2020-11-17 15:19=
, Bruce Ashfield wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0But if you have an agent, that would=
 be 2 nodes, right? One<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0master and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0one worker node?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In kubernetes terms, perhaps. But physical boxes .=
. no. This needs<br>
&gt;=C2=A0 =C2=A0 =C2=A0to be testable under a single instance (qemu in my=
 case).<br>
<br>
I see. Well, I have never tried that, but would in that case use one <br>
qemu instance for the master and a separate qemu instance for each <br>
worker node. (I should try to run both master and a worker on one <br>
machine and see what happens on my setup.)<br></blockquote><div><br></div>=
<div><div style=3D"font-size:small">I&#39;m experimenting with two qemu ses=
sions as well (I had to do this with meta-openstack), but then host network=
ing becomes an issue and if that&#39;s also the box you are doing builds on=
 (like I am), it can cause issues.</div><div style=3D"font-size:small"><br>=
</div><div style=3D"font-size:small">Either way, I&#39;m fairly close now a=
nd hopefully will have this sorted out soon.</div><div style=3D"font-size:s=
mall"><br></div><div style=3D"font-size:small">My build is still running, b=
ut I&#39;ll post specific logs later today.</div><div style=3D"font-size:sm=
all"><br></div><div style=3D"font-size:small">Bruce</div><br></div><div>=C2=
=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
BR,<br>
<br>
/Joakim<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
">- Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<b=
r><br></div></div>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000d8dd5b05b452a63f--
