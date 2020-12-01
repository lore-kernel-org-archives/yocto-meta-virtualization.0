Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.615.1606849517727387387
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Dec 2020 11:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P9VBtWlM;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id 7so6491562ejm.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Dec 2020 11:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ryemGoAdKjWmwEEztHH677bXzg+o1Vi+S5UrPggWJvw=;
        b=P9VBtWlM2NNmL1xAFsVOIKFQU2S4aF3+O3kMT8sNvF9/ek0E05U1p7lP9GF1LPhnld
         27UaqU8bbK3ioAAVxCYNb1zn7N0X3IZJmWdtwTYFdbHL8DjDcac1HXssedVTxYGkcrFk
         8EQF5kBRtRB+NM2KtN/BWBhHwdYzxRgnHRbyc0nllgXy4qS3chmJmvddekcQ80weQzxI
         c4xm2zcheV4iMv0+P673726ixTkVeoCvmxW/mpeBNcDs43ZKoyAG3XVlaZbn/OQeYGSn
         DBMhExlP6VNfPX8ZZXD9TwzWv9ssjiu6RaWodKTN/vWglxRlsAWBxhBuCpz/UATXCDv0
         1XIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ryemGoAdKjWmwEEztHH677bXzg+o1Vi+S5UrPggWJvw=;
        b=WT+Gg/rfLHN/SBc8C0XQmkVARZzuWhCjflfU8UOxKMqWyvmowRWetrSKrXzRvaEkng
         8vHXyCZfNAGOnnxKwGjuXWSfiQ8MPCkEpeuD+WzH2LKoekwl7xT1z+6krGGgsHkPgDk2
         F3FfQtKCBjmRU3mKoE3RecXOt3nN7g5Bug7BR2wZODFtf45WFc1brWITPKmvYOUBMnr2
         uacQRCOHgU2D8aI+YoM/ufT9PwhfPc5KDunkOWv6FM2UB+HH+pIfUBfHRsh1OlZtvsW2
         GHZviHN5tiXF89GKRE91ADE/WVWKX9bV1VulN3xj075ZrFTG8Ukao4PXM2XHhMnllXkC
         SAJA==
X-Gm-Message-State: AOAM533eDMc8AgF0Fd2i8LixSzmeD/Wc0dfd8JzKR4OtW/qGumLMOqqk
	99VXEfZxS5SfWBPnRZsZUZRhYbuYLqcpUIFbVwN39EQBhBO6Vg==
X-Google-Smtp-Source: ABdhPJyoGd0vPYA2FjiFlGjNDrFE9Un4DLxMVRtD3VlaGaVi2LBLKHLrAWA+roJUUkExF9PF/sFLJ743anBVSLpaV7k=
X-Received: by 2002:a17:907:d01:: with SMTP id gn1mr4475107ejc.357.1606849516112;
 Tue, 01 Dec 2020 11:05:16 -0800 (PST)
MIME-Version: 1.0
References: <80e1aaec-343b-9af4-6144-34c24746cd2a@optimcloud.com>
 <CADkTA4PVY139=rDa8vuSGwE8x+4oN80Z8np__=bK=b4w4iVYjw@mail.gmail.com>
 <164AC9578349B0A8.29370@lists.yoctoproject.org> <ca7960b9-973b-cb35-1ea3-bb1c7261636d@optimcloud.com>
 <164CAD00803DE49B.28599@lists.yoctoproject.org>
In-Reply-To: <164CAD00803DE49B.28599@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 1 Dec 2020 14:05:05 -0500
Message-ID: <CADkTA4MeKQEt7e=i9+d=AjC7DCsBS87yqDtAz=nbkM0Wj9g5LQ@mail.gmail.com>
Subject: Re: [meta-virtualization] go broken or kubernetes ? go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OutBack Dingo <dingo@optimcloud.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 1, 2020 at 2:03 PM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Nope.
>
> It built fine, and continues to build fine here.
>

I should say: it builds fine on qemu* which are the machines that I
use for sanity and integration testing.

If there's an issue on machines and configs outside of that, I rely on
others to send appropriate fixes.

I do have a k8s version bump incoming, that may indirectly deal with it.

Bruce

> So there's nothing I can do about fixing it.
>
> Bruce
>
> On Tue, Dec 1, 2020 at 1:25 PM OutBack Dingo <dingo@optimcloud.com> wrot=
e:
> >
> > Any luck on this ?? Its failed both with the same errors as posted on =
Fedora 33 Silverblue and Debian 10
> >
> > Build Configuration:
> > BB_VERSION           =3D "1.49.0"
> > BUILD_SYS            =3D "x86_64-linux"
> > NATIVELSBSTRING      =3D "fedora-33"
> > TARGET_SYS           =3D "x86_64-overc-linux"
> > MACHINE              =3D "intel-corei7-64"
> > DISTRO               =3D "overc"
> > DISTRO_VERSION       =3D "1.0"
> > TUNE_FEATURES        =3D "m64 corei7"
> > TARGET_FPU           =3D ""
> > meta
> > meta-poky
> > meta-yocto-bsp       =3D "HEAD:0ac99625bf2c8a19d4ee746dc13e9c6b2e1956e=
2"
> > meta-oe
> > meta-python
> > meta-networking
> > meta-filesystems
> > meta-initramfs
> > meta-multimedia
> > meta-perl            =3D "HEAD:f623d8b5741a8d9060a6be025cfdcfa479dd3fb=
3"
> > meta-overc
> > meta-cube            =3D "HEAD:af81bc7ec63e96aa7816b523b75ad9f29f9dfcf=
0"
> > meta-virtualization  =3D "HEAD:fbfced367daaca778bda733f11c36973577c245=
6"
> > meta-security        =3D "HEAD:d2ceb5e438b3b9c91696c83bf32f2df415a761a=
b"
> > meta-selinux         =3D "HEAD:5a58e87aa998c53527f92b32c3e6bc516a03d9a=
3"
> > meta-gnome
> > meta-xfce            =3D "HEAD:f623d8b5741a8d9060a6be025cfdcfa479dd3fb=
3"
> > meta-intel           =3D "HEAD:7d79beb5093da8adf0f9b106a33d8e0904a50a4=
8"
> > meta-cloud-services  =3D "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c1f1545=
5"
> > meta-awnix           =3D "master:c616414c6ed4f6f2ab75703ce5a3e84acacd3=
c47"
> >
> > Initialising tasks: 100% |############################################=
##########################################################################|=
 Time: 0:00:03
> > Sstate summary: Wanted 497 Found 0 Missed 497 Current 0 (0% match, 0% =
complete)
> > NOTE: Executing Tasks
> > ERROR: kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e=
4f4f-r0 do_compile: Execution of '/var/home/dingo/overc/build/tmp/work/core=
i7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432=
832b7e4f4f-r0/temp/run.do_compile.1741097' failed with exit code 2:
> > go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > +++ [1201 18:22:47] Building go targets for linux/amd64:
> >     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
> > go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > !!! [1201 18:22:48] Call tree:
> > !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/corei7-64=
-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7=
e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4=
f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries(...)
> > !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/corei7-64=
-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7=
e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4=
f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_platfo=
rm(...)
> > !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang::buil=
d_binaries(...)
> > !!! [1201 18:22:48] Call tree:
> > !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::buil=
d_binaries(...)
> > !!! [1201 18:22:48] Call tree:
> > !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::buil=
d_binaries(...)
> > make[1]: *** [Makefile.generated_files:197: _output/bin/prerelease-lif=
ecycle-gen] Error 1
> > make: *** [Makefile:545: generated_files] Error 2
> > WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/ku=
bernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/r=
un.do_compile.1741097:179 exit 2 from 'make generated_files GO=3D"go" KUBE_=
BUILD_PLATFORMS=3D"linux/amd64"'
> > WARNING: Backtrace (BB generated script):
> >     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-64-ove=
rc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4=
f-r0/temp/run.do_compile.1741097, line 179
> >     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-lin=
ux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/t=
emp/run.do_compile.1741097, line 198
> >
> > Backtrace (metadata-relative locations):
> >     #1: do_compile, /var/home/dingo/overc/meta-virtualization/recipes-=
containers/kubernetes/kubernetes_git.bb, line 55
> > ERROR: Logfile of failure stored in: /var/home/dingo/overc/build/tmp/w=
ork/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02=
bceea432832b7e4f4f-r0/temp/log.do_compile.1741097
> > Log data follows:
> > | DEBUG: Executing shell function do_compile
> > | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > | +++ [1201 18:22:47] Building go targets for linux/amd64:
> > |     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
> > | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > | !!! [1201 18:22:48] Call tree:
> > | !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/corei7-=
64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832=
b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4=
f4f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries(...=
)
> > | !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/corei7-=
64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832=
b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4=
f4f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_plat=
form(...)
> > | !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang::bu=
ild_binaries(...)
> > | !!! [1201 18:22:48] Call tree:
> > | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::bu=
ild_binaries(...)
> > | !!! [1201 18:22:48] Call tree:
> > | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::bu=
ild_binaries(...)
> > | make[1]: *** [Makefile.generated_files:197: _output/bin/prerelease-l=
ifecycle-gen] Error 1
> > | make: *** [Makefile:545: generated_files] Error 2
> > | WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/=
kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp=
/run.do_compile.1741097:179 exit 2 from 'make generated_files GO=3D"go" KUB=
E_BUILD_PLATFORMS=3D"linux/amd64"'
> > | WARNING: Backtrace (BB generated script):
> > |     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-64-o=
verc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4=
f4f-r0/temp/run.do_compile.1741097, line 179
> > |     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-l=
inux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0=
/temp/run.do_compile.1741097, line 198
> > | ERROR: Execution of '/var/home/dingo/overc/build/tmp/work/corei7-64-=
overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e=
4f4f-r0/temp/run.do_compile.1741097' failed with exit code 2:
> > | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > | +++ [1201 18:22:47] Building go targets for linux/amd64:
> > |     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
> > | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > | !!! [1201 18:22:48] Call tree:
> > | !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/corei7-=
64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832=
b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4=
f4f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries(...=
)
> > | !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/corei7-=
64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832=
b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4=
f4f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_plat=
form(...)
> > | !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang::bu=
ild_binaries(...)
> > | !!! [1201 18:22:48] Call tree:
> > | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::bu=
ild_binaries(...)
> > | !!! [1201 18:22:48] Call tree:
> > | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::bu=
ild_binaries(...)
> > | make[1]: *** [Makefile.generated_files:197: _output/bin/prerelease-l=
ifecycle-gen] Error 1
> > | make: *** [Makefile:545: generated_files] Error 2
> > | WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/=
kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp=
/run.do_compile.1741097:179 exit 2 from 'make generated_files GO=3D"go" KUB=
E_BUILD_PLATFORMS=3D"linux/amd64"'
> > | WARNING: Backtrace (BB generated script):
> > |     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-64-o=
verc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4=
f4f-r0/temp/run.do_compile.1741097, line 179
> > |     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-l=
inux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0=
/temp/run.do_compile.1741097, line 198
> > |
> > | Backtrace (metadata-relative locations):
> > |     #1: do_compile, /var/home/dingo/overc/meta-virtualization/recipe=
s-containers/kubernetes/kubernetes_git.bb, line 55
> > ERROR: Task (/var/home/dingo/overc/meta-virtualization/recipes-contain=
ers/kubernetes/kubernetes_git.bb:do_compile) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 1672 tasks of which 0 didn't need to be=
 rerun and 1 failed.
> >
> > Summary: 1 task failed:
> >   /var/home/dingo/overc/meta-virtualization/recipes-containers/kuberne=
tes/kubernetes_git.bb:do_compile
> > Summary: There were 2 WARNING messages shown.
> > Summary: There was 1 ERROR message shown, returning a non-zero exit co=
de.
> >
> > On 11/25/20 10:19 PM, Dingo wrote:
> >
> > Building from head. on F33 Silverblue, always worked fine for k8s... n=
ow fails.
> >
> > NOTE: Resolving any missing task queue dependencies
> >
> > Build Configuration:
> > BB_VERSION           =3D "1.49.0"
> > BUILD_SYS            =3D "x86_64-linux"
> > NATIVELSBSTRING      =3D "fedora-33"
> > TARGET_SYS           =3D "x86_64-overc-linux"
> > MACHINE              =3D "intel-corei7-64"
> > DISTRO               =3D "overc"
> > DISTRO_VERSION       =3D "1.0"
> > TUNE_FEATURES        =3D "m64 corei7"
> > TARGET_FPU           =3D ""
> > meta
> > meta-poky
> > meta-yocto-bsp       =3D "HEAD:3ecf5d9692fec97b37af6a4e6c747a4e2c2ca29=
2"
> > meta-oe
> > meta-python
> > meta-networking
> > meta-filesystems
> > meta-initramfs
> > meta-multimedia
> > meta-perl            =3D "HEAD:51c495772d3186ff7625675c83547eb7410db57=
f"
> > meta-overc
> > meta-cube            =3D "master:af81bc7ec63e96aa7816b523b75ad9f29f9df=
cf0"
> > meta-virtualization  =3D "HEAD:fbfced367daaca778bda733f11c36973577c245=
6"
> > meta-security        =3D "HEAD:d2ceb5e438b3b9c91696c83bf32f2df415a761a=
b"
> > meta-selinux         =3D "HEAD:5a58e87aa998c53527f92b32c3e6bc516a03d9a=
3"
> > meta-intel           =3D "HEAD:6cf386fa948880eaaa60bbddb5245258771fac7=
9"
> > meta-awnix           =3D "<unknown>:<unknown>"
> > meta-cloud-services  =3D "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c1f1545=
5"
> >
> >
> > On 11/25/20 8:55 PM, Bruce Ashfield wrote:
> >
> > Builds fine here, so you'll need to be more specific about your config=
uration to see if I can reproduce the issue.
> >
> > Bruce
> >
> > On Wed, Nov 25, 2020 at 5:43 AM Dingo <dingo@optimcloud.com> wrote:
> >>
> >> NOTE: Executing Tasks
> >> ERROR:
> >> kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r=
0
> >> do_compile: Execution of
> >> '/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernete=
s/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_c=
ompile.3481769'
> >> failed with exit code 2:
> >> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> >> +++ [1125 10:38:01] Building go targets for linux/amd64:
> >>      ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
> >> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> >> !!! [1125 10:38:02] Call tree:
> >> !!! [1125 10:38:02]  1:
> >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes=
/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.=
19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/g=
olang.sh:715
> >> kube::golang::build_some_binaries(...)
> >> !!! [1125 10:38:02]  2:
> >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes=
/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.=
19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/g=
olang.sh:859
> >> kube::golang::build_binaries_for_platform(...)
> >> !!! [1125 10:38:02]  3: hack/make-rules/build.sh:27
> >> kube::golang::build_binaries(...)
> >> !!! [1125 10:38:02] Call tree:
> >> !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
> >> kube::golang::build_binaries(...)
> >> !!! [1125 10:38:02] Call tree:
> >> !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
> >> kube::golang::build_binaries(...)
> >> make[1]: *** [Makefile.generated_files:197:
> >> _output/bin/prerelease-lifecycle-gen] Error 1
> >> make: *** [Makefile:545: generated_files] Error 2
> >> WARNING:
> >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes=
/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_co=
mpile.3481769:179
> >> exit 2 from 'make generated_files GO=3D"go"
> >> KUBE_BUILD_PLATFORMS=3D"linux/amd64"'
> >> WARNING: Backtrace (BB generated script):
> >>      #1: do_compile,
> >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes=
/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_co=
mpile.3481769,
> >> line 179
> >>      #2: main,
> >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes=
/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_co=
mpile.3481769,
> >> line 198
> >>
> >> Backtrace (metadata-relative locations):
> >>      #1: do_compile,
> >> /var/home/dingo/overc/meta-virtualization/recipes-containers/kubernet=
es/kubernetes_git.bb,
> >> line 55
> >> ERROR: Logfile of failure stored in:
> >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes=
/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/log.do_co=
mpile.3481769
> >>
> >>
> >>
> >>
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
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
