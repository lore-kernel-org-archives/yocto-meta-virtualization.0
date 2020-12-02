Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.1461.1606875103155455710
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Dec 2020 18:11:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KZHVmzhb;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id pg6so8987746ejb.6
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Dec 2020 18:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H/al6bY2dlR7h1/BfzCCkjbxyKZr+wYztpfKewq2ksE=;
        b=KZHVmzhbVg3lqf5238VbzHIIH2ghhkn7vz0PSGrm4BDqWNdWIYVGEYE6AYUrMek23y
         sR82FrmxiOIM1FOGbJJ/vetySkjv/sgMq6r+BHL9EP4r2gAp0k3vQofBcLMhzoO7lHx9
         RxsG3oHzedBRrophh+mD1t1o0MM/CB3Z/cHvBlYurgDgFDWNRxkBS0iZcdBh0YGvs9TD
         NYU2+vqKBSD0rd09VlMbFCXaD8ZD3MbFZ2/HZh1A1cee/sHt9WOjbajmGXNv8ArngLHP
         CaD7DMGGPPsEtn3rOvPDdY9mnpX0zbu5u8b4JBsL7ItGkIbNf7o8No1SgXykrlBzjSY4
         eRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H/al6bY2dlR7h1/BfzCCkjbxyKZr+wYztpfKewq2ksE=;
        b=FgQLuaSJgwd23N69KId6WC/Q/vOaiMupKFApmZOrLtmpoBezaG05AFnyQfGq750amv
         6pk9es6nr+OFDQRioTfHjeFflMv3YN5PldvVDQ9D6OUpQd9Wymzv5xd/9pAtrdJ2uW7a
         l/wBbIJFYqEmt2t3zs0SQ5X6/B63yFQfpVnO9d05QXoxRFeFx1NLX1n7xqrphVWvMfl+
         tidw5m7i3ww2slW5WMWOPVK1MU9FT0JGMkdXYSNK/5Rv4ireYYqzmIsKPCKBuknkFeHw
         67gSclFyQR9/gCcKEgTRqtKsJEehCzjrS44keCECsZcAUBjLzmVElrNfbtlx1PyirSz6
         NPBg==
X-Gm-Message-State: AOAM530YWARudySgobqDm+3wREbOQmcIoGNpL3Tejdc45FUCEIwxw4nM
	KC2ZsOqei+XbdPKs6EqQMbWP0rL5q5Tzkcf7Cs0=
X-Google-Smtp-Source: ABdhPJxglcihDPlIhwSbfQyo0qAlBd4US9wBILCPvWQMY0oNapnKSy56oSx8cyZV0mDFl+7yDLy1QBkajHgsjuzd6eo=
X-Received: by 2002:a17:906:6d58:: with SMTP id a24mr249381ejt.298.1606875101276;
 Tue, 01 Dec 2020 18:11:41 -0800 (PST)
MIME-Version: 1.0
References: <80e1aaec-343b-9af4-6144-34c24746cd2a@optimcloud.com>
 <CADkTA4PVY139=rDa8vuSGwE8x+4oN80Z8np__=bK=b4w4iVYjw@mail.gmail.com>
 <164AC9578349B0A8.29370@lists.yoctoproject.org> <ca7960b9-973b-cb35-1ea3-bb1c7261636d@optimcloud.com>
 <164CAD00803DE49B.28599@lists.yoctoproject.org> <164CAD1F96CC6471.28599@lists.yoctoproject.org>
 <164CB61893C793E2.17283@lists.yoctoproject.org> <164CC30B1EDCBD64.9909@lists.yoctoproject.org>
In-Reply-To: <164CC30B1EDCBD64.9909@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 1 Dec 2020 21:11:29 -0500
Message-ID: <CADkTA4NnZmM2g=XZeRWPPHMFDhzLLoQcfj05yqpn=jz9i80F0Q@mail.gmail.com>
Subject: Re: [meta-virtualization] go broken or kubernetes ? go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, OutBack Dingo <dingo@optimcloud.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 1, 2020 at 8:47 PM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Tue, Dec 1, 2020 at 4:49 PM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Tue, Dec 1, 2020 at 2:05 PM Bruce Ashfield via
> > lists.yoctoproject.org
> > <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> > >
> > > On Tue, Dec 1, 2020 at 2:03 PM Bruce Ashfield via
> > > lists.yoctoproject.org
> > > <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> > > >
> > > > Nope.
> > > >
> > > > It built fine, and continues to build fine here.
> > > >
> > >
> > > I should say: it builds fine on qemu* which are the machines that I
> > > use for sanity and integration testing.
> > >
> > > If there's an issue on machines and configs outside of that, I rely =
on
> > > others to send appropriate fixes.
> > >
> > > I do have a k8s version bump incoming, that may indirectly deal with=
 it.
> >
> > I was working on a new incremental update, and I'm seeing a similar
> > failure. So hopefully I have a reproducer now and can dig into this!
> >
>
> The commit that triggered this is fairly obvious:
>
> commit 0917e35aa2813e843457302d1a370dd6c7b03ad6
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Sat Nov 21 00:23:16 2020 -0800
>
>     go: Update to 1.15.5
>
>     Define CXX_FOR_TARGET and CC_FOR_TARGET for target go
>     since we are cross building it, it helps in defining the compiler
>     for cgo on target
>
>     backport a patch to fix CGO_LDFLAGS regression like below
>
>     Fixes
>     | Building std for target, linux/arm.
>     | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
>
>     (From OE-Core rev: a71d1b58e8cf0976a614c49aa2dfe1e0605dfe95)
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> It was masked here, since I was changing how generated_files was
> built, but had to
> restore it in my latest set of changes.
>
> Right now, if we use "go" (go-native) to build the generated_files
> (they are host side
> and part of the build), we blow up with the flags errors.  if you are
> x86 and use $GO,
> you can build the generated files, but it breaks on ARM64.
>
> I'll look into the flags and see if we can filter them out, or maybe
> khem has another
> idea.

Sorry for all the email, but I didn't want khem to spend much time on
this.

The kubernetes recipe pre-dates a lot of the current go.bbclass stuff,
so does quite a bit of flag "fiddling". So the crime is just as likely in
the recipe as anywhere else.

I've managed to get the host side stuff building by clearing the CGO_LDFLA=
GS
of the problematic host options, and it does seem to be building.

I'll test a few more arches and call it 'good enough for now'.

Bruce

>
> Bruce
>
>
> > >
> > > Bruce
> > >
> > > > So there's nothing I can do about fixing it.
> > > >
> > > > Bruce
> > > >
> > > > On Tue, Dec 1, 2020 at 1:25 PM OutBack Dingo <dingo@optimcloud.com=
> wrote:
> > > > >
> > > > > Any luck on this ?? Its failed both with the same errors as post=
ed on Fedora 33 Silverblue and Debian 10
> > > > >
> > > > > Build Configuration:
> > > > > BB_VERSION           =3D "1.49.0"
> > > > > BUILD_SYS            =3D "x86_64-linux"
> > > > > NATIVELSBSTRING      =3D "fedora-33"
> > > > > TARGET_SYS           =3D "x86_64-overc-linux"
> > > > > MACHINE              =3D "intel-corei7-64"
> > > > > DISTRO               =3D "overc"
> > > > > DISTRO_VERSION       =3D "1.0"
> > > > > TUNE_FEATURES        =3D "m64 corei7"
> > > > > TARGET_FPU           =3D ""
> > > > > meta
> > > > > meta-poky
> > > > > meta-yocto-bsp       =3D "HEAD:0ac99625bf2c8a19d4ee746dc13e9c6b2=
e1956e2"
> > > > > meta-oe
> > > > > meta-python
> > > > > meta-networking
> > > > > meta-filesystems
> > > > > meta-initramfs
> > > > > meta-multimedia
> > > > > meta-perl            =3D "HEAD:f623d8b5741a8d9060a6be025cfdcfa47=
9dd3fb3"
> > > > > meta-overc
> > > > > meta-cube            =3D "HEAD:af81bc7ec63e96aa7816b523b75ad9f29=
f9dfcf0"
> > > > > meta-virtualization  =3D "HEAD:fbfced367daaca778bda733f11c369735=
77c2456"
> > > > > meta-security        =3D "HEAD:d2ceb5e438b3b9c91696c83bf32f2df41=
5a761ab"
> > > > > meta-selinux         =3D "HEAD:5a58e87aa998c53527f92b32c3e6bc516=
a03d9a3"
> > > > > meta-gnome
> > > > > meta-xfce            =3D "HEAD:f623d8b5741a8d9060a6be025cfdcfa47=
9dd3fb3"
> > > > > meta-intel           =3D "HEAD:7d79beb5093da8adf0f9b106a33d8e090=
4a50a48"
> > > > > meta-cloud-services  =3D "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c=
1f15455"
> > > > > meta-awnix           =3D "master:c616414c6ed4f6f2ab75703ce5a3e84=
acacd3c47"
> > > > >
> > > > > Initialising tasks: 100% |######################################=
###########################################################################=
#####| Time: 0:00:03
> > > > > Sstate summary: Wanted 497 Found 0 Missed 497 Current 0 (0% matc=
h, 0% complete)
> > > > > NOTE: Executing Tasks
> > > > > ERROR: kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432=
832b7e4f4f-r0 do_compile: Execution of '/var/home/dingo/overc/build/tmp/wor=
k/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bc=
eea432832b7e4f4f-r0/temp/run.do_compile.1741097' failed with exit code 2:
> > > > > go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > > > > +++ [1201 18:22:47] Building go targets for linux/amd64:
> > > > >     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
> > > > > go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > > > > !!! [1201 18:22:48] Call tree:
> > > > > !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/cor=
ei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea43=
2832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832=
b7e4f4f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries=
(...)
> > > > > !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/cor=
ei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea43=
2832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832=
b7e4f4f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_=
platform(...)
> > > > > !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang=
::build_binaries(...)
> > > > > !!! [1201 18:22:48] Call tree:
> > > > > !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang=
::build_binaries(...)
> > > > > !!! [1201 18:22:48] Call tree:
> > > > > !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang=
::build_binaries(...)
> > > > > make[1]: *** [Makefile.generated_files:197: _output/bin/prerelea=
se-lifecycle-gen] Error 1
> > > > > make: *** [Makefile:545: generated_files] Error 2
> > > > > WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-li=
nux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/=
temp/run.do_compile.1741097:179 exit 2 from 'make generated_files GO=3D"go"=
 KUBE_BUILD_PLATFORMS=3D"linux/amd64"'
> > > > > WARNING: Backtrace (BB generated script):
> > > > >     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-=
64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832=
b7e4f4f-r0/temp/run.do_compile.1741097, line 179
> > > > >     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-ove=
rc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4=
f-r0/temp/run.do_compile.1741097, line 198
> > > > >
> > > > > Backtrace (metadata-relative locations):
> > > > >     #1: do_compile, /var/home/dingo/overc/meta-virtualization/re=
cipes-containers/kubernetes/kubernetes_git.bb, line 55
> > > > > ERROR: Logfile of failure stored in: /var/home/dingo/overc/build=
/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e6=
5a1c02bceea432832b7e4f4f-r0/temp/log.do_compile.1741097
> > > > > Log data follows:
> > > > > | DEBUG: Executing shell function do_compile
> > > > > | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > > > > | +++ [1201 18:22:47] Building go targets for linux/amd64:
> > > > > |     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-ge=
n
> > > > > | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > > > > | !!! [1201 18:22:48] Call tree:
> > > > > | !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/c=
orei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea=
432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea4328=
32b7e4f4f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binari=
es(...)
> > > > > | !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/c=
orei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea=
432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea4328=
32b7e4f4f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_fo=
r_platform(...)
> > > > > | !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::gola=
ng::build_binaries(...)
> > > > > | !!! [1201 18:22:48] Call tree:
> > > > > | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::gola=
ng::build_binaries(...)
> > > > > | !!! [1201 18:22:48] Call tree:
> > > > > | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::gola=
ng::build_binaries(...)
> > > > > | make[1]: *** [Makefile.generated_files:197: _output/bin/prerel=
ease-lifecycle-gen] Error 1
> > > > > | make: *** [Makefile:545: generated_files] Error 2
> > > > > | WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-=
linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r=
0/temp/run.do_compile.1741097:179 exit 2 from 'make generated_files GO=3D"g=
o" KUBE_BUILD_PLATFORMS=3D"linux/amd64"'
> > > > > | WARNING: Backtrace (BB generated script):
> > > > > |     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei=
7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea4328=
32b7e4f4f-r0/temp/run.do_compile.1741097, line 179
> > > > > |     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-o=
verc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4=
f4f-r0/temp/run.do_compile.1741097, line 198
> > > > > | ERROR: Execution of '/var/home/dingo/overc/build/tmp/work/core=
i7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432=
832b7e4f4f-r0/temp/run.do_compile.1741097' failed with exit code 2:
> > > > > | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > > > > | +++ [1201 18:22:47] Building go targets for linux/amd64:
> > > > > |     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-ge=
n
> > > > > | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > > > > | !!! [1201 18:22:48] Call tree:
> > > > > | !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/c=
orei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea=
432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea4328=
32b7e4f4f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binari=
es(...)
> > > > > | !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/c=
orei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea=
432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea4328=
32b7e4f4f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_fo=
r_platform(...)
> > > > > | !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::gola=
ng::build_binaries(...)
> > > > > | !!! [1201 18:22:48] Call tree:
> > > > > | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::gola=
ng::build_binaries(...)
> > > > > | !!! [1201 18:22:48] Call tree:
> > > > > | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::gola=
ng::build_binaries(...)
> > > > > | make[1]: *** [Makefile.generated_files:197: _output/bin/prerel=
ease-lifecycle-gen] Error 1
> > > > > | make: *** [Makefile:545: generated_files] Error 2
> > > > > | WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-=
linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r=
0/temp/run.do_compile.1741097:179 exit 2 from 'make generated_files GO=3D"g=
o" KUBE_BUILD_PLATFORMS=3D"linux/amd64"'
> > > > > | WARNING: Backtrace (BB generated script):
> > > > > |     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei=
7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea4328=
32b7e4f4f-r0/temp/run.do_compile.1741097, line 179
> > > > > |     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-o=
verc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4=
f4f-r0/temp/run.do_compile.1741097, line 198
> > > > > |
> > > > > | Backtrace (metadata-relative locations):
> > > > > |     #1: do_compile, /var/home/dingo/overc/meta-virtualization/=
recipes-containers/kubernetes/kubernetes_git.bb, line 55
> > > > > ERROR: Task (/var/home/dingo/overc/meta-virtualization/recipes-c=
ontainers/kubernetes/kubernetes_git.bb:do_compile) failed with exit code '1=
'
> > > > > NOTE: Tasks Summary: Attempted 1672 tasks of which 0 didn't need=
 to be rerun and 1 failed.
> > > > >
> > > > > Summary: 1 task failed:
> > > > >   /var/home/dingo/overc/meta-virtualization/recipes-containers/k=
ubernetes/kubernetes_git.bb:do_compile
> > > > > Summary: There were 2 WARNING messages shown.
> > > > > Summary: There was 1 ERROR message shown, returning a non-zero e=
xit code.
> > > > >
> > > > > On 11/25/20 10:19 PM, Dingo wrote:
> > > > >
> > > > > Building from head. on F33 Silverblue, always worked fine for k8=
s... now fails.
> > > > >
> > > > > NOTE: Resolving any missing task queue dependencies
> > > > >
> > > > > Build Configuration:
> > > > > BB_VERSION           =3D "1.49.0"
> > > > > BUILD_SYS            =3D "x86_64-linux"
> > > > > NATIVELSBSTRING      =3D "fedora-33"
> > > > > TARGET_SYS           =3D "x86_64-overc-linux"
> > > > > MACHINE              =3D "intel-corei7-64"
> > > > > DISTRO               =3D "overc"
> > > > > DISTRO_VERSION       =3D "1.0"
> > > > > TUNE_FEATURES        =3D "m64 corei7"
> > > > > TARGET_FPU           =3D ""
> > > > > meta
> > > > > meta-poky
> > > > > meta-yocto-bsp       =3D "HEAD:3ecf5d9692fec97b37af6a4e6c747a4e2=
c2ca292"
> > > > > meta-oe
> > > > > meta-python
> > > > > meta-networking
> > > > > meta-filesystems
> > > > > meta-initramfs
> > > > > meta-multimedia
> > > > > meta-perl            =3D "HEAD:51c495772d3186ff7625675c83547eb74=
10db57f"
> > > > > meta-overc
> > > > > meta-cube            =3D "master:af81bc7ec63e96aa7816b523b75ad9f=
29f9dfcf0"
> > > > > meta-virtualization  =3D "HEAD:fbfced367daaca778bda733f11c369735=
77c2456"
> > > > > meta-security        =3D "HEAD:d2ceb5e438b3b9c91696c83bf32f2df41=
5a761ab"
> > > > > meta-selinux         =3D "HEAD:5a58e87aa998c53527f92b32c3e6bc516=
a03d9a3"
> > > > > meta-intel           =3D "HEAD:6cf386fa948880eaaa60bbddb52452587=
71fac79"
> > > > > meta-awnix           =3D "<unknown>:<unknown>"
> > > > > meta-cloud-services  =3D "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c=
1f15455"
> > > > >
> > > > >
> > > > > On 11/25/20 8:55 PM, Bruce Ashfield wrote:
> > > > >
> > > > > Builds fine here, so you'll need to be more specific about your =
configuration to see if I can reproduce the issue.
> > > > >
> > > > > Bruce
> > > > >
> > > > > On Wed, Nov 25, 2020 at 5:43 AM Dingo <dingo@optimcloud.com> wro=
te:
> > > > >>
> > > > >> NOTE: Executing Tasks
> > > > >> ERROR:
> > > > >> kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e=
4f4f-r0
> > > > >> do_compile: Execution of
> > > > >> '/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kub=
ernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/ru=
n.do_compile.3481769'
> > > > >> failed with exit code 2:
> > > > >> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > > > >> +++ [1125 10:38:01] Building go targets for linux/amd64:
> > > > >>      ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-ge=
n
> > > > >> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > > > >> !!! [1125 10:38:02] Call tree:
> > > > >> !!! [1125 10:38:02]  1:
> > > > >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kube=
rnetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernet=
es-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack=
/lib/golang.sh:715
> > > > >> kube::golang::build_some_binaries(...)
> > > > >> !!! [1125 10:38:02]  2:
> > > > >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kube=
rnetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernet=
es-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack=
/lib/golang.sh:859
> > > > >> kube::golang::build_binaries_for_platform(...)
> > > > >> !!! [1125 10:38:02]  3: hack/make-rules/build.sh:27
> > > > >> kube::golang::build_binaries(...)
> > > > >> !!! [1125 10:38:02] Call tree:
> > > > >> !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
> > > > >> kube::golang::build_binaries(...)
> > > > >> !!! [1125 10:38:02] Call tree:
> > > > >> !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
> > > > >> kube::golang::build_binaries(...)
> > > > >> make[1]: *** [Makefile.generated_files:197:
> > > > >> _output/bin/prerelease-lifecycle-gen] Error 1
> > > > >> make: *** [Makefile:545: generated_files] Error 2
> > > > >> WARNING:
> > > > >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kube=
rnetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run=
.do_compile.3481769:179
> > > > >> exit 2 from 'make generated_files GO=3D"go"
> > > > >> KUBE_BUILD_PLATFORMS=3D"linux/amd64"'
> > > > >> WARNING: Backtrace (BB generated script):
> > > > >>      #1: do_compile,
> > > > >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kube=
rnetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run=
.do_compile.3481769,
> > > > >> line 179
> > > > >>      #2: main,
> > > > >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kube=
rnetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run=
.do_compile.3481769,
> > > > >> line 198
> > > > >>
> > > > >> Backtrace (metadata-relative locations):
> > > > >>      #1: do_compile,
> > > > >> /var/home/dingo/overc/meta-virtualization/recipes-containers/ku=
bernetes/kubernetes_git.bb,
> > > > >> line 55
> > > > >> ERROR: Logfile of failure stored in:
> > > > >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kube=
rnetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/log=
.do_compile.3481769
> > > > >>
> > > > >>
> > > > >>
> > > > >>
> > > > >
> > > > >
> > > > > --
> > > > > - Thou shalt not follow the NULL pointer, for chaos and madness =
await thee at its end
> > > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > > >
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >
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
