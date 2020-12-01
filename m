Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.589.1606849384206378654
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Dec 2020 11:03:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P8Q516tb;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a16so6430695ejj.5
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Dec 2020 11:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VWAeERnJoPS1TNK/zq0cCZpbKYrVh9dzrP6j1il1wD4=;
        b=P8Q516tb6ib1/vDE5UyBWKbCg/BDHmZXDnOVtoVGHxVLyvvbDQatO701wJ6jRsDx/u
         IgggK5NUxwNe6i5NeDSCvHOJfFw4xPZnqinKo9KuuXsXDj9KZE8IvfuxcpEO2U+T91P9
         pGMURVoxJhSgyHCF+gkjPMXC7cdhRoRcEnunktZL6Dn3ARY4uqiPbDP60AR1gbCOYan1
         O9KkcQ2+Ijib40Mn5exCZaFCre7ULwPyBN5XC1opvdeihspjFEq2lg3nxMXylSu+WyfW
         HpREGMlnFRf/zK/TmgfzpNRqgLilH8fGttNOEFkqEziivxJwuOOorrQ0Su/xCU7aFCGl
         gMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VWAeERnJoPS1TNK/zq0cCZpbKYrVh9dzrP6j1il1wD4=;
        b=bAzTau9tebroLuMi4Fbtkt0WO7DACO5TCpdzBxfXj9y4WbuX1I1AO3mny3lwDpmlaz
         +UOSS08+ads68cnKHQrct3gWYHs0T2N+wENsqwPXCeivC1oMGsjQjuqCDOiKaHz+WpIr
         FadZwptUL0q3ejf+5UV2wLOew0zJQ8reWpc+9IIx5sLz3Nj6GAS+CDdxaLIRmJkVtEFW
         ZH5+FSdr4rcLUQfUNOJGslYT8n1fUOTAaKy+wmvmwE4t4EOJAavoOYCrBoQ+bxkxoVmU
         GyOSc6pbXBHfVi2YN2Tp8xZRGRQ3IcF2ZcSuGNTz3On4Q6iJaksfofnIosRUONIT294/
         eWhQ==
X-Gm-Message-State: AOAM532rknbujYZLFpK1SQYWtCvsvNQ8CZbRqSivBEkQUgt4r/Mad+QV
	5ydMUi54CVJjecDC3lGO51SgggONA22nYmKKmq0=
X-Google-Smtp-Source: ABdhPJxuY6CXq12ph/yiQX4gwsM4agSXtQEo2PU3TWihbnrGKNYZHPp2+b6kRiEutQh2AFOFbktXQJDHlJKx73UB6Ts=
X-Received: by 2002:a17:906:5e0f:: with SMTP id n15mr4412472eju.459.1606849382363;
 Tue, 01 Dec 2020 11:03:02 -0800 (PST)
MIME-Version: 1.0
References: <80e1aaec-343b-9af4-6144-34c24746cd2a@optimcloud.com>
 <CADkTA4PVY139=rDa8vuSGwE8x+4oN80Z8np__=bK=b4w4iVYjw@mail.gmail.com>
 <164AC9578349B0A8.29370@lists.yoctoproject.org> <ca7960b9-973b-cb35-1ea3-bb1c7261636d@optimcloud.com>
In-Reply-To: <ca7960b9-973b-cb35-1ea3-bb1c7261636d@optimcloud.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 1 Dec 2020 14:02:51 -0500
Message-ID: <CADkTA4MPJ7j-xO5pze5kPK=trP8vovXJZfFemK+ObUfLjQrZ4A@mail.gmail.com>
Subject: Re: [meta-virtualization] go broken or kubernetes ? go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
To: OutBack Dingo <dingo@optimcloud.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nope.

It built fine, and continues to build fine here.

So there's nothing I can do about fixing it.

Bruce

On Tue, Dec 1, 2020 at 1:25 PM OutBack Dingo <dingo@optimcloud.com> wrote:
>
> Any luck on this ?? Its failed both with the same errors as posted on Fe=
dora 33 Silverblue and Debian 10
>
> Build Configuration:
> BB_VERSION           =3D "1.49.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "fedora-33"
> TARGET_SYS           =3D "x86_64-overc-linux"
> MACHINE              =3D "intel-corei7-64"
> DISTRO               =3D "overc"
> DISTRO_VERSION       =3D "1.0"
> TUNE_FEATURES        =3D "m64 corei7"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp       =3D "HEAD:0ac99625bf2c8a19d4ee746dc13e9c6b2e1956e2"
> meta-oe
> meta-python
> meta-networking
> meta-filesystems
> meta-initramfs
> meta-multimedia
> meta-perl            =3D "HEAD:f623d8b5741a8d9060a6be025cfdcfa479dd3fb3"
> meta-overc
> meta-cube            =3D "HEAD:af81bc7ec63e96aa7816b523b75ad9f29f9dfcf0"
> meta-virtualization  =3D "HEAD:fbfced367daaca778bda733f11c36973577c2456"
> meta-security        =3D "HEAD:d2ceb5e438b3b9c91696c83bf32f2df415a761ab"
> meta-selinux         =3D "HEAD:5a58e87aa998c53527f92b32c3e6bc516a03d9a3"
> meta-gnome
> meta-xfce            =3D "HEAD:f623d8b5741a8d9060a6be025cfdcfa479dd3fb3"
> meta-intel           =3D "HEAD:7d79beb5093da8adf0f9b106a33d8e0904a50a48"
> meta-cloud-services  =3D "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c1f15455"
> meta-awnix           =3D "master:c616414c6ed4f6f2ab75703ce5a3e84acacd3c4=
7"
>
> Initialising tasks: 100% |##############################################=
########################################################################| T=
ime: 0:00:03
> Sstate summary: Wanted 497 Found 0 Missed 497 Current 0 (0% match, 0% co=
mplete)
> NOTE: Executing Tasks
> ERROR: kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f=
4f-r0 do_compile: Execution of '/var/home/dingo/overc/build/tmp/work/corei7=
-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea43283=
2b7e4f4f-r0/temp/run.do_compile.1741097' failed with exit code 2:
> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> +++ [1201 18:22:47] Building go targets for linux/amd64:
>     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> !!! [1201 18:22:48] Call tree:
> !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/corei7-64-o=
verc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4=
f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/=
src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries(...)
> !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/corei7-64-o=
verc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4=
f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/=
src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_platform=
(...)
> !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang::build_=
binaries(...)
> !!! [1201 18:22:48] Call tree:
> !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::build_=
binaries(...)
> !!! [1201 18:22:48] Call tree:
> !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::build_=
binaries(...)
> make[1]: *** [Makefile.generated_files:197: _output/bin/prerelease-lifec=
ycle-gen] Error 1
> make: *** [Makefile:545: generated_files] Error 2
> WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kube=
rnetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run=
.do_compile.1741097:179 exit 2 from 'make generated_files GO=3D"go" KUBE_BU=
ILD_PLATFORMS=3D"linux/amd64"'
> WARNING: Backtrace (BB generated script):
>     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-64-overc=
-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-=
r0/temp/run.do_compile.1741097, line 179
>     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux=
/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/tem=
p/run.do_compile.1741097, line 198
>
> Backtrace (metadata-relative locations):
>     #1: do_compile, /var/home/dingo/overc/meta-virtualization/recipes-co=
ntainers/kubernetes/kubernetes_git.bb, line 55
> ERROR: Logfile of failure stored in: /var/home/dingo/overc/build/tmp/wor=
k/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bc=
eea432832b7e4f4f-r0/temp/log.do_compile.1741097
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> | +++ [1201 18:22:47] Building go targets for linux/amd64:
> |     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
> | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> | !!! [1201 18:22:48] Call tree:
> | !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/corei7-64=
-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7=
e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4=
f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries(...)
> | !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/corei7-64=
-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7=
e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4=
f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_platfo=
rm(...)
> | !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang::buil=
d_binaries(...)
> | !!! [1201 18:22:48] Call tree:
> | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::buil=
d_binaries(...)
> | !!! [1201 18:22:48] Call tree:
> | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::buil=
d_binaries(...)
> | make[1]: *** [Makefile.generated_files:197: _output/bin/prerelease-lif=
ecycle-gen] Error 1
> | make: *** [Makefile:545: generated_files] Error 2
> | WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/ku=
bernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/r=
un.do_compile.1741097:179 exit 2 from 'make generated_files GO=3D"go" KUBE_=
BUILD_PLATFORMS=3D"linux/amd64"'
> | WARNING: Backtrace (BB generated script):
> |     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-64-ove=
rc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4=
f-r0/temp/run.do_compile.1741097, line 179
> |     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-lin=
ux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/t=
emp/run.do_compile.1741097, line 198
> | ERROR: Execution of '/var/home/dingo/overc/build/tmp/work/corei7-64-ov=
erc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f=
4f-r0/temp/run.do_compile.1741097' failed with exit code 2:
> | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> | +++ [1201 18:22:47] Building go targets for linux/amd64:
> |     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
> | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
> | !!! [1201 18:22:48] Call tree:
> | !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/corei7-64=
-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7=
e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4=
f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries(...)
> | !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/corei7-64=
-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7=
e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4=
f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_platfo=
rm(...)
> | !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang::buil=
d_binaries(...)
> | !!! [1201 18:22:48] Call tree:
> | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::buil=
d_binaries(...)
> | !!! [1201 18:22:48] Call tree:
> | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::buil=
d_binaries(...)
> | make[1]: *** [Makefile.generated_files:197: _output/bin/prerelease-lif=
ecycle-gen] Error 1
> | make: *** [Makefile:545: generated_files] Error 2
> | WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/ku=
bernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/r=
un.do_compile.1741097:179 exit 2 from 'make generated_files GO=3D"go" KUBE_=
BUILD_PLATFORMS=3D"linux/amd64"'
> | WARNING: Backtrace (BB generated script):
> |     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-64-ove=
rc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4=
f-r0/temp/run.do_compile.1741097, line 179
> |     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-lin=
ux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/t=
emp/run.do_compile.1741097, line 198
> |
> | Backtrace (metadata-relative locations):
> |     #1: do_compile, /var/home/dingo/overc/meta-virtualization/recipes-=
containers/kubernetes/kubernetes_git.bb, line 55
> ERROR: Task (/var/home/dingo/overc/meta-virtualization/recipes-container=
s/kubernetes/kubernetes_git.bb:do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1672 tasks of which 0 didn't need to be r=
erun and 1 failed.
>
> Summary: 1 task failed:
>   /var/home/dingo/overc/meta-virtualization/recipes-containers/kubernete=
s/kubernetes_git.bb:do_compile
> Summary: There were 2 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code=
.
>
> On 11/25/20 10:19 PM, Dingo wrote:
>
> Building from head. on F33 Silverblue, always worked fine for k8s... now=
 fails.
>
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "1.49.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "fedora-33"
> TARGET_SYS           =3D "x86_64-overc-linux"
> MACHINE              =3D "intel-corei7-64"
> DISTRO               =3D "overc"
> DISTRO_VERSION       =3D "1.0"
> TUNE_FEATURES        =3D "m64 corei7"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp       =3D "HEAD:3ecf5d9692fec97b37af6a4e6c747a4e2c2ca292"
> meta-oe
> meta-python
> meta-networking
> meta-filesystems
> meta-initramfs
> meta-multimedia
> meta-perl            =3D "HEAD:51c495772d3186ff7625675c83547eb7410db57f"
> meta-overc
> meta-cube            =3D "master:af81bc7ec63e96aa7816b523b75ad9f29f9dfcf=
0"
> meta-virtualization  =3D "HEAD:fbfced367daaca778bda733f11c36973577c2456"
> meta-security        =3D "HEAD:d2ceb5e438b3b9c91696c83bf32f2df415a761ab"
> meta-selinux         =3D "HEAD:5a58e87aa998c53527f92b32c3e6bc516a03d9a3"
> meta-intel           =3D "HEAD:6cf386fa948880eaaa60bbddb5245258771fac79"
> meta-awnix           =3D "<unknown>:<unknown>"
> meta-cloud-services  =3D "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c1f15455"
>
>
> On 11/25/20 8:55 PM, Bruce Ashfield wrote:
>
> Builds fine here, so you'll need to be more specific about your configur=
ation to see if I can reproduce the issue.
>
> Bruce
>
> On Wed, Nov 25, 2020 at 5:43 AM Dingo <dingo@optimcloud.com> wrote:
>>
>> NOTE: Executing Tasks
>> ERROR:
>> kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0
>> do_compile: Execution of
>> '/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/=
v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_com=
pile.3481769'
>> failed with exit code 2:
>> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
>> +++ [1125 10:38:01] Building go targets for linux/amd64:
>>      ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
>> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
>> !!! [1125 10:38:02] Call tree:
>> !!! [1125 10:38:02]  1:
>> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v=
1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19=
.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/gol=
ang.sh:715
>> kube::golang::build_some_binaries(...)
>> !!! [1125 10:38:02]  2:
>> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v=
1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19=
.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/gol=
ang.sh:859
>> kube::golang::build_binaries_for_platform(...)
>> !!! [1125 10:38:02]  3: hack/make-rules/build.sh:27
>> kube::golang::build_binaries(...)
>> !!! [1125 10:38:02] Call tree:
>> !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
>> kube::golang::build_binaries(...)
>> !!! [1125 10:38:02] Call tree:
>> !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
>> kube::golang::build_binaries(...)
>> make[1]: *** [Makefile.generated_files:197:
>> _output/bin/prerelease-lifecycle-gen] Error 1
>> make: *** [Makefile:545: generated_files] Error 2
>> WARNING:
>> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v=
1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_comp=
ile.3481769:179
>> exit 2 from 'make generated_files GO=3D"go"
>> KUBE_BUILD_PLATFORMS=3D"linux/amd64"'
>> WARNING: Backtrace (BB generated script):
>>      #1: do_compile,
>> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v=
1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_comp=
ile.3481769,
>> line 179
>>      #2: main,
>> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v=
1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_comp=
ile.3481769,
>> line 198
>>
>> Backtrace (metadata-relative locations):
>>      #1: do_compile,
>> /var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes=
/kubernetes_git.bb,
>> line 55
>> ERROR: Logfile of failure stored in:
>> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v=
1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/log.do_comp=
ile.3481769
>>
>>
>>
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await th=
ee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
