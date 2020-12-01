Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.700.1606859383173641205
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Dec 2020 13:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ICGVnsbQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id j14so2756305edy.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Dec 2020 13:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/J9Q6UdQNWfgERt57kEskqgWhbW3UNFZYLk6tF4j/i8=;
        b=ICGVnsbQn/WUNYRkrS7aORQWB/rwncrhVIIWL8NjeMphMQKPhZ5e4Jk/I5EUVmICPv
         ysrK11L8ouB/DxnIcgx60HifSaKzL4qMZ7YpAii5jK/ruqT7U7pX8vQk2Dn0hkZBpLMF
         fd/YF2m0dxwx+9ky7YUrj2eOJxWbX8HX5apkGzy0L4O1KVhWu/NnejRMrMjI0hHZmPBi
         jXoetBU2fIIfaDqasjiRoYWUehYF9upF7qQ4HEgLxWLXFkrczA5c4/Bnde7oSWWDGwyz
         mNQ0wFrljXtif/5wqWBL0lvPcfEGOuJe58mdbqRircgFVR7nZ5Wp63arqsAPIqiMqE9+
         uIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/J9Q6UdQNWfgERt57kEskqgWhbW3UNFZYLk6tF4j/i8=;
        b=e/ph+cOo2fQZOIKAxD30VnYPtsm0ohRg5RmgoZhzS52jrMaKPJEcN0SfKcW6jAVq+m
         qGKNn+tOU8s9A8xddBkMs6Dys81OAozR7aUOrD2HLyXu+vK6dDKA0zuoadEyqzMY5SMt
         hdaqRIRxKOFDSqZxjXLVsBHEVVgrjQEeNzfEvwQDWz5kAQltL1tihuMU/IxXJ+kolLdy
         OcJJWFstDPl4yMLs0zfVUpo1FM3rqWCgfkecorzx5M7QuJgr1fUEmsa3wJ9RqTPF3gHy
         VKleHTTqXq/OmTinNAe2oYO3TciPRlUeyEMV/h3zHVane+chfdoFaUn+ssbTvJPeUyPA
         LUfQ==
X-Gm-Message-State: AOAM5312N4Zr/zUJnt6njqIp9foMNDUHVTxQzF16yyR5rHHMOsZEIFeQ
	SJJZBz4Do7us5QvPTEBkTjhJu+nYPftahJUR0XI=
X-Google-Smtp-Source: ABdhPJw1aLTfhpSelBRkQI1vGlG3r16BX0Tj75xIggDpYL3avJeJxcNGzaXrlLaHNe8TAuJwaquBYja+HsY8f8FcJhw=
X-Received: by 2002:a05:6402:44b:: with SMTP id p11mr5268578edw.164.1606859381399;
 Tue, 01 Dec 2020 13:49:41 -0800 (PST)
MIME-Version: 1.0
References: <80e1aaec-343b-9af4-6144-34c24746cd2a@optimcloud.com>
 <CADkTA4PVY139=rDa8vuSGwE8x+4oN80Z8np__=bK=b4w4iVYjw@mail.gmail.com>
 <164AC9578349B0A8.29370@lists.yoctoproject.org> <ca7960b9-973b-cb35-1ea3-bb1c7261636d@optimcloud.com>
 <164CAD00803DE49B.28599@lists.yoctoproject.org> <164CAD1F96CC6471.28599@lists.yoctoproject.org>
In-Reply-To: <164CAD1F96CC6471.28599@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 1 Dec 2020 16:49:30 -0500
Message-ID: <CADkTA4NMLcD76Wkxoaczb35CrJujRUT67F+Js+mQOeHvpJwLXg@mail.gmail.com>
Subject: Re: [meta-virtualization] go broken or kubernetes ? go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OutBack Dingo <dingo@optimcloud.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 1, 2020 at 2:05 PM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Tue, Dec 1, 2020 at 2:03 PM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > Nope.
> >
> > It built fine, and continues to build fine here.
> >
>
> I should say: it builds fine on qemu* which are the machines that I
> use for sanity and integration testing.
>
> If there's an issue on machines and configs outside of that, I rely on
> others to send appropriate fixes.
>
> I do have a k8s version bump incoming, that may indirectly deal with it.

I was working on a new incremental update, and I'm seeing a similar
failure. So hopefully I have a reproducer now and can dig into this!

Bruce

>
> Bruce
>
> > So there's nothing I can do about fixing it.
> >
> > Bruce
> >
> > On Tue, Dec 1, 2020 at 1:25 PM OutBack Dingo <dingo@optimcloud.com> wr=
ote:
> > >
> > > Any luck on this ?? Its failed both with the same errors as posted o=
n Fedora 33 Silverblue and Debian 10
> > >
> > > Build Configuration:
> > > BB_VERSION           =3D "1.49.0"
> > > BUILD_SYS            =3D "x86_64-linux"
> > > NATIVELSBSTRING      =3D "fedora-33"
> > > TARGET_SYS           =3D "x86_64-overc-linux"
> > > MACHINE              =3D "intel-corei7-64"
> > > DISTRO               =3D "overc"
> > > DISTRO_VERSION       =3D "1.0"
> > > TUNE_FEATURES        =3D "m64 corei7"
> > > TARGET_FPU           =3D ""
> > > meta
> > > meta-poky
> > > meta-yocto-bsp       =3D "HEAD:0ac99625bf2c8a19d4ee746dc13e9c6b2e195=
6e2"
> > > meta-oe
> > > meta-python
> > > meta-networking
> > > meta-filesystems
> > > meta-initramfs
> > > meta-multimedia
> > > meta-perl            =3D "HEAD:f623d8b5741a8d9060a6be025cfdcfa479dd3=
fb3"
> > > meta-overc
> > > meta-cube            =3D "HEAD:af81bc7ec63e96aa7816b523b75ad9f29f9df=
cf0"
> > > meta-virtualization  =3D "HEAD:fbfced367daaca778bda733f11c36973577c2=
456"
> > > meta-security        =3D "HEAD:d2ceb5e438b3b9c91696c83bf32f2df415a76=
1ab"
> > > meta-selinux         =3D "HEAD:5a58e87aa998c53527f92b32c3e6bc516a03d=
9a3"
> > > meta-gnome
> > > meta-xfce            =3D "HEAD:f623d8b5741a8d9060a6be025cfdcfa479dd3=
fb3"
> > > meta-intel           =3D "HEAD:7d79beb5093da8adf0f9b106a33d8e0904a50=
a48"
> > > meta-cloud-services  =3D "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c1f15=
455"
> > > meta-awnix           =3D "master:c616414c6ed4f6f2ab75703ce5a3e84acac=
d3c47"
> > >
> > > Initialising tasks: 100% |##########################################=
###########################################################################=
#| Time: 0:00:03
> > > Sstate summary: Wanted 497 Found 0 Missed 497 Current 0 (0% match, 0=
% complete)
> > > NOTE: Executing Tasks
> > > ERROR: kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b=
7e4f4f-r0 do_compile: Execution of '/var/home/dingo/overc/build/tmp/work/co=
rei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea4=
32832b7e4f4f-r0/temp/run.do_compile.1741097' failed with exit code 2:
> > > go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > > +++ [1201 18:22:47] Building go targets for linux/amd64:
> > >     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
> > > go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > > !!! [1201 18:22:48] Call tree:
> > > !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/corei7-=
64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832=
b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4=
f4f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries(...=
)
> > > !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/corei7-=
64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832=
b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4=
f4f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_plat=
form(...)
> > > !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang::bu=
ild_binaries(...)
> > > !!! [1201 18:22:48] Call tree:
> > > !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::bu=
ild_binaries(...)
> > > !!! [1201 18:22:48] Call tree:
> > > !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::bu=
ild_binaries(...)
> > > make[1]: *** [Makefile.generated_files:197: _output/bin/prerelease-l=
ifecycle-gen] Error 1
> > > make: *** [Makefile:545: generated_files] Error 2
> > > WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/=
kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp=
/run.do_compile.1741097:179 exit 2 from 'make generated_files GO=3D"go" KUB=
E_BUILD_PLATFORMS=3D"linux/amd64"'
> > > WARNING: Backtrace (BB generated script):
> > >     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-64-o=
verc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4=
f4f-r0/temp/run.do_compile.1741097, line 179
> > >     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-l=
inux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0=
/temp/run.do_compile.1741097, line 198
> > >
> > > Backtrace (metadata-relative locations):
> > >     #1: do_compile, /var/home/dingo/overc/meta-virtualization/recipe=
s-containers/kubernetes/kubernetes_git.bb, line 55
> > > ERROR: Logfile of failure stored in: /var/home/dingo/overc/build/tmp=
/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c=
02bceea432832b7e4f4f-r0/temp/log.do_compile.1741097
> > > Log data follows:
> > > | DEBUG: Executing shell function do_compile
> > > | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > > | +++ [1201 18:22:47] Building go targets for linux/amd64:
> > > |     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
> > > | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > > | !!! [1201 18:22:48] Call tree:
> > > | !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/corei=
7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea4328=
32b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7=
e4f4f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries(.=
..)
> > > | !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/corei=
7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea4328=
32b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7=
e4f4f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_pl=
atform(...)
> > > | !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang::=
build_binaries(...)
> > > | !!! [1201 18:22:48] Call tree:
> > > | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::=
build_binaries(...)
> > > | !!! [1201 18:22:48] Call tree:
> > > | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::=
build_binaries(...)
> > > | make[1]: *** [Makefile.generated_files:197: _output/bin/prerelease=
-lifecycle-gen] Error 1
> > > | make: *** [Makefile:545: generated_files] Error 2
> > > | WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linu=
x/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/te=
mp/run.do_compile.1741097:179 exit 2 from 'make generated_files GO=3D"go" K=
UBE_BUILD_PLATFORMS=3D"linux/amd64"'
> > > | WARNING: Backtrace (BB generated script):
> > > |     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-64=
-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7=
e4f4f-r0/temp/run.do_compile.1741097, line 179
> > > |     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-overc=
-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-=
r0/temp/run.do_compile.1741097, line 198
> > > | ERROR: Execution of '/var/home/dingo/overc/build/tmp/work/corei7-6=
4-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b=
7e4f4f-r0/temp/run.do_compile.1741097' failed with exit code 2:
> > > | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > > | +++ [1201 18:22:47] Building go targets for linux/amd64:
> > > |     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
> > > | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > > | !!! [1201 18:22:48] Call tree:
> > > | !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/corei=
7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea4328=
32b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7=
e4f4f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries(.=
..)
> > > | !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/corei=
7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea4328=
32b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7=
e4f4f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_pl=
atform(...)
> > > | !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang::=
build_binaries(...)
> > > | !!! [1201 18:22:48] Call tree:
> > > | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::=
build_binaries(...)
> > > | !!! [1201 18:22:48] Call tree:
> > > | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::=
build_binaries(...)
> > > | make[1]: *** [Makefile.generated_files:197: _output/bin/prerelease=
-lifecycle-gen] Error 1
> > > | make: *** [Makefile:545: generated_files] Error 2
> > > | WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linu=
x/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/te=
mp/run.do_compile.1741097:179 exit 2 from 'make generated_files GO=3D"go" K=
UBE_BUILD_PLATFORMS=3D"linux/amd64"'
> > > | WARNING: Backtrace (BB generated script):
> > > |     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-64=
-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7=
e4f4f-r0/temp/run.do_compile.1741097, line 179
> > > |     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-overc=
-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-=
r0/temp/run.do_compile.1741097, line 198
> > > |
> > > | Backtrace (metadata-relative locations):
> > > |     #1: do_compile, /var/home/dingo/overc/meta-virtualization/reci=
pes-containers/kubernetes/kubernetes_git.bb, line 55
> > > ERROR: Task (/var/home/dingo/overc/meta-virtualization/recipes-conta=
iners/kubernetes/kubernetes_git.bb:do_compile) failed with exit code '1'
> > > NOTE: Tasks Summary: Attempted 1672 tasks of which 0 didn't need to =
be rerun and 1 failed.
> > >
> > > Summary: 1 task failed:
> > >   /var/home/dingo/overc/meta-virtualization/recipes-containers/kuber=
netes/kubernetes_git.bb:do_compile
> > > Summary: There were 2 WARNING messages shown.
> > > Summary: There was 1 ERROR message shown, returning a non-zero exit =
code.
> > >
> > > On 11/25/20 10:19 PM, Dingo wrote:
> > >
> > > Building from head. on F33 Silverblue, always worked fine for k8s...=
 now fails.
> > >
> > > NOTE: Resolving any missing task queue dependencies
> > >
> > > Build Configuration:
> > > BB_VERSION           =3D "1.49.0"
> > > BUILD_SYS            =3D "x86_64-linux"
> > > NATIVELSBSTRING      =3D "fedora-33"
> > > TARGET_SYS           =3D "x86_64-overc-linux"
> > > MACHINE              =3D "intel-corei7-64"
> > > DISTRO               =3D "overc"
> > > DISTRO_VERSION       =3D "1.0"
> > > TUNE_FEATURES        =3D "m64 corei7"
> > > TARGET_FPU           =3D ""
> > > meta
> > > meta-poky
> > > meta-yocto-bsp       =3D "HEAD:3ecf5d9692fec97b37af6a4e6c747a4e2c2ca=
292"
> > > meta-oe
> > > meta-python
> > > meta-networking
> > > meta-filesystems
> > > meta-initramfs
> > > meta-multimedia
> > > meta-perl            =3D "HEAD:51c495772d3186ff7625675c83547eb7410db=
57f"
> > > meta-overc
> > > meta-cube            =3D "master:af81bc7ec63e96aa7816b523b75ad9f29f9=
dfcf0"
> > > meta-virtualization  =3D "HEAD:fbfced367daaca778bda733f11c36973577c2=
456"
> > > meta-security        =3D "HEAD:d2ceb5e438b3b9c91696c83bf32f2df415a76=
1ab"
> > > meta-selinux         =3D "HEAD:5a58e87aa998c53527f92b32c3e6bc516a03d=
9a3"
> > > meta-intel           =3D "HEAD:6cf386fa948880eaaa60bbddb5245258771fa=
c79"
> > > meta-awnix           =3D "<unknown>:<unknown>"
> > > meta-cloud-services  =3D "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c1f15=
455"
> > >
> > >
> > > On 11/25/20 8:55 PM, Bruce Ashfield wrote:
> > >
> > > Builds fine here, so you'll need to be more specific about your conf=
iguration to see if I can reproduce the issue.
> > >
> > > Bruce
> > >
> > > On Wed, Nov 25, 2020 at 5:43 AM Dingo <dingo@optimcloud.com> wrote:
> > >>
> > >> NOTE: Executing Tasks
> > >> ERROR:
> > >> kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f=
-r0
> > >> do_compile: Execution of
> > >> '/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kuberne=
tes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do=
_compile.3481769'
> > >> failed with exit code 2:
> > >> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > >> +++ [1125 10:38:01] Building go targets for linux/amd64:
> > >>      ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
> > >> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> > >> !!! [1125 10:38:02] Call tree:
> > >> !!! [1125 10:38:02]  1:
> > >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernet=
es/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v=
1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib=
/golang.sh:715
> > >> kube::golang::build_some_binaries(...)
> > >> !!! [1125 10:38:02]  2:
> > >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernet=
es/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v=
1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib=
/golang.sh:859
> > >> kube::golang::build_binaries_for_platform(...)
> > >> !!! [1125 10:38:02]  3: hack/make-rules/build.sh:27
> > >> kube::golang::build_binaries(...)
> > >> !!! [1125 10:38:02] Call tree:
> > >> !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
> > >> kube::golang::build_binaries(...)
> > >> !!! [1125 10:38:02] Call tree:
> > >> !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
> > >> kube::golang::build_binaries(...)
> > >> make[1]: *** [Makefile.generated_files:197:
> > >> _output/bin/prerelease-lifecycle-gen] Error 1
> > >> make: *** [Makefile:545: generated_files] Error 2
> > >> WARNING:
> > >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernet=
es/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_=
compile.3481769:179
> > >> exit 2 from 'make generated_files GO=3D"go"
> > >> KUBE_BUILD_PLATFORMS=3D"linux/amd64"'
> > >> WARNING: Backtrace (BB generated script):
> > >>      #1: do_compile,
> > >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernet=
es/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_=
compile.3481769,
> > >> line 179
> > >>      #2: main,
> > >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernet=
es/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_=
compile.3481769,
> > >> line 198
> > >>
> > >> Backtrace (metadata-relative locations):
> > >>      #1: do_compile,
> > >> /var/home/dingo/overc/meta-virtualization/recipes-containers/kubern=
etes/kubernetes_git.bb,
> > >> line 55
> > >> ERROR: Logfile of failure stored in:
> > >> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernet=
es/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/log.do_=
compile.3481769
> > >>
> > >>
> > >>
> > >>
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
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
