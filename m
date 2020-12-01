Received: from mx02.optimcloud.com (mx02.optimcloud.com [46.23.93.22])
 by mx.groups.io with SMTP id smtpd.web11.44.1606847156519590155
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Dec 2020 10:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@optimcloud.com header.s=obsd header.b=DwqAAKF2;
 spf=none, err=SPF record not found (domain: optimcloud.com, ip: 46.23.93.22, mailfrom: dingo@optimcloud.com)
Received: from mx02.optimcloud.com (localhost [127.0.0.1])
	by mx02.optimcloud.com (OpenSMTPD) with ESMTP id 401eb3b2;
	Tue, 1 Dec 2020 19:25:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=optimcloud.com; h=
	subject:from:to:cc:references:message-id:date:mime-version
	:in-reply-to:content-type; s=obsd; bh=2oxntdwO5GGA6vHNDGmCyqwe90
	clQXG7coul4T2lh5I=; b=DwqAAKF2xwgJDva2ZssexCvcTqC8VJ5xSRzlH+hxBz
	coCmgBiTxWSF70sRVhd464uCeEGc+yf8fDJT6xbKeDDQktjo6C+DwkWAUD0a1oPu
	ujRk3aV8SMQksHuP2D0kcG4mPimDLwI3lM6K1QdRGmvDMzeEeR1er7byb13kbUYl
	NsR6STRnC/pxEFU7SaA84vo/oXFTxLSR9lg4E2NZYCFpZmbJg2BXisfyUYSy1LcK
	vw7T8aToEQgYDaSxOCPjtgO/Jrvf/gClXU3Jxutk/qe4JbzG3rSZ6UJJdK37AWt/
	0+BiJsWyNYe5DEVK967mHngJ3GXaDffqVL+qV1NyF9kg==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=optimcloud.com; h=subject
	:from:to:cc:references:message-id:date:mime-version:in-reply-to
	:content-type; q=dns; s=obsd; b=I1eZJXy9SmO3w9F/JL6AvU/snabFMGtL
	4aPT2A3PrH7xD7R9Hvd6uzNdyt5WOPfRovseIFl+HNCZlfHWq7NDd973/YK+GykN
	1NUVBpI/q63A/X5xZqXmuv4EDvrBgc6dS+3mJxFIqBi6EbhS7SoPfSPavhGtBIvN
	ud3A5ccfOUCGlVwNqvffLys0yUhfjLN41zwzX17h8oFNBEoGWfV1VolKCPH/MIcE
	tXj83QArtsVUlaWqPk+uRox6qghrnZ4jt3g6BMNwEx+uFsx8mc/D3OCr4WCPFqX7
	Jow665dcuSREXYPAY+qIpbv/8RgmFcoKXisj1Jr2fKjsmvrKxbiNxA==
Received: 
	by mx02.optimcloud.com (OpenSMTPD) with ESMTPSA id b27d6d47 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO) auth=yes user=support@optimcloud.com;
	Tue, 1 Dec 2020 19:25:51 +0100 (CET)
Subject: Re: [meta-virtualization] go broken or kubernetes ? go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
From: "Dingo" <dingo@optimcloud.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <80e1aaec-343b-9af4-6144-34c24746cd2a@optimcloud.com>
 <CADkTA4PVY139=rDa8vuSGwE8x+4oN80Z8np__=bK=b4w4iVYjw@mail.gmail.com>
 <164AC9578349B0A8.29370@lists.yoctoproject.org>
Message-ID: <ca7960b9-973b-cb35-1ea3-bb1c7261636d@optimcloud.com>
Date: Wed, 2 Dec 2020 01:25:45 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <164AC9578349B0A8.29370@lists.yoctoproject.org>
Content-Type: multipart/alternative;
 boundary="------------F89DA7506B8D6DF128D501C0"
Content-Language: en-US

--------------F89DA7506B8D6DF128D501C0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Any luck on this ?? Its failed both with the same errors as posted on 
Fedora 33 Silverblue and Debian 10

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "fedora-33"
TARGET_SYS           = "x86_64-overc-linux"
MACHINE              = "intel-corei7-64"
DISTRO               = "overc"
DISTRO_VERSION       = "1.0"
TUNE_FEATURES        = "m64 corei7"
TARGET_FPU           = ""
meta
meta-poky
meta-yocto-bsp       = "HEAD:0ac99625bf2c8a19d4ee746dc13e9c6b2e1956e2"
meta-oe
meta-python
meta-networking
meta-filesystems
meta-initramfs
meta-multimedia
meta-perl            = "HEAD:f623d8b5741a8d9060a6be025cfdcfa479dd3fb3"
meta-overc
meta-cube            = "HEAD:af81bc7ec63e96aa7816b523b75ad9f29f9dfcf0"
meta-virtualization  = "HEAD:fbfced367daaca778bda733f11c36973577c2456"
meta-security        = "HEAD:d2ceb5e438b3b9c91696c83bf32f2df415a761ab"
meta-selinux         = "HEAD:5a58e87aa998c53527f92b32c3e6bc516a03d9a3"
meta-gnome
meta-xfce            = "HEAD:f623d8b5741a8d9060a6be025cfdcfa479dd3fb3"
meta-intel           = "HEAD:7d79beb5093da8adf0f9b106a33d8e0904a50a48"
meta-cloud-services  = "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c1f15455"
meta-awnix           = "master:c616414c6ed4f6f2ab75703ce5a3e84acacd3c47"

Initialising tasks: 100% 
|######################################################################################################################| 
Time: 0:00:03
Sstate summary: Wanted 497 Found 0 Missed 497 Current 0 (0% match, 0% 
complete)
NOTE: Executing Tasks
ERROR: 
kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0 
do_compile: Execution of 
'/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097' 
failed with exit code 2:
go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
+++ [1201 18:22:47] Building go targets for linux/amd64:
     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
!!! [1201 18:22:48] Call tree:
!!! [1201 18:22:48]  1: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715 
kube::golang::build_some_binaries(...)
!!! [1201 18:22:48]  2: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859 
kube::golang::build_binaries_for_platform(...)
!!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 
kube::golang::build_binaries(...)
!!! [1201 18:22:48] Call tree:
!!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 
kube::golang::build_binaries(...)
!!! [1201 18:22:48] Call tree:
!!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 
kube::golang::build_binaries(...)
make[1]: *** [Makefile.generated_files:197: 
_output/bin/prerelease-lifecycle-gen] Error 1
make: *** [Makefile:545: generated_files] Error 2
WARNING: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097:179 
exit 2 from 'make generated_files GO="go" 
KUBE_BUILD_PLATFORMS="linux/amd64"'
WARNING: Backtrace (BB generated script):
     #1: do_compile, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, 
line 179
     #2: main, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, 
line 198

Backtrace (metadata-relative locations):
     #1: do_compile, 
/var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb, 
line 55
ERROR: Logfile of failure stored in: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/log.do_compile.1741097
Log data follows:
| DEBUG: Executing shell function do_compile
| go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
| +++ [1201 18:22:47] Building go targets for linux/amd64:
|     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
| go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
| !!! [1201 18:22:48] Call tree:
| !!! [1201 18:22:48]  1: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715 
kube::golang::build_some_binaries(...)
| !!! [1201 18:22:48]  2: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859 
kube::golang::build_binaries_for_platform(...)
| !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 
kube::golang::build_binaries(...)
| !!! [1201 18:22:48] Call tree:
| !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 
kube::golang::build_binaries(...)
| !!! [1201 18:22:48] Call tree:
| !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 
kube::golang::build_binaries(...)
| make[1]: *** [Makefile.generated_files:197: 
_output/bin/prerelease-lifecycle-gen] Error 1
| make: *** [Makefile:545: generated_files] Error 2
| WARNING: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097:179 
exit 2 from 'make generated_files GO="go" 
KUBE_BUILD_PLATFORMS="linux/amd64"'
| WARNING: Backtrace (BB generated script):
|     #1: do_compile, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, 
line 179
|     #2: main, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, 
line 198
| ERROR: Execution of 
'/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097' 
failed with exit code 2:
| go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
| +++ [1201 18:22:47] Building go targets for linux/amd64:
|     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
| go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
| !!! [1201 18:22:48] Call tree:
| !!! [1201 18:22:48]  1: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715 
kube::golang::build_some_binaries(...)
| !!! [1201 18:22:48]  2: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859 
kube::golang::build_binaries_for_platform(...)
| !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 
kube::golang::build_binaries(...)
| !!! [1201 18:22:48] Call tree:
| !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 
kube::golang::build_binaries(...)
| !!! [1201 18:22:48] Call tree:
| !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 
kube::golang::build_binaries(...)
| make[1]: *** [Makefile.generated_files:197: 
_output/bin/prerelease-lifecycle-gen] Error 1
| make: *** [Makefile:545: generated_files] Error 2
| WARNING: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097:179 
exit 2 from 'make generated_files GO="go" 
KUBE_BUILD_PLATFORMS="linux/amd64"'
| WARNING: Backtrace (BB generated script):
|     #1: do_compile, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, 
line 179
|     #2: main, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, 
line 198
|
| Backtrace (metadata-relative locations):
|     #1: do_compile, 
/var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb, 
line 55
ERROR: Task 
(/var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb:do_compile) 
failed with exit code '1'
NOTE: Tasks Summary: Attempted 1672 tasks of which 0 didn't need to be 
rerun and 1 failed.

Summary: 1 task failed:
/var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb:do_compile
Summary: There were 2 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

On 11/25/20 10:19 PM, Dingo wrote:
>
> Building from head. on F33 Silverblue, always worked fine for k8s... 
> now fails.
>
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "1.49.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "fedora-33"
> TARGET_SYS           = "x86_64-overc-linux"
> MACHINE              = "intel-corei7-64"
> DISTRO               = "overc"
> DISTRO_VERSION       = "1.0"
> TUNE_FEATURES        = "m64 corei7"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp       = "HEAD:3ecf5d9692fec97b37af6a4e6c747a4e2c2ca292"
> meta-oe
> meta-python
> meta-networking
> meta-filesystems
> meta-initramfs
> meta-multimedia
> meta-perl            = "HEAD:51c495772d3186ff7625675c83547eb7410db57f"
> meta-overc
> meta-cube            = "master:af81bc7ec63e96aa7816b523b75ad9f29f9dfcf0"
> meta-virtualization  = "HEAD:fbfced367daaca778bda733f11c36973577c2456"
> meta-security        = "HEAD:d2ceb5e438b3b9c91696c83bf32f2df415a761ab"
> meta-selinux         = "HEAD:5a58e87aa998c53527f92b32c3e6bc516a03d9a3"
> meta-intel           = "HEAD:6cf386fa948880eaaa60bbddb5245258771fac79"
> meta-awnix           = "<unknown>:<unknown>"
> meta-cloud-services  = "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c1f15455"
>
>
> On 11/25/20 8:55 PM, Bruce Ashfield wrote:
>> Builds fine here, so you'll need to be more specific about your 
>> configuration to see if I can reproduce the issue.
>>
>> Bruce
>>
>> On Wed, Nov 25, 2020 at 5:43 AM Dingo <dingo@optimcloud.com 
>> <mailto:dingo@optimcloud.com>> wrote:
>>
>>     NOTE: Executing Tasks
>>     ERROR:
>>     kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0
>>
>>     do_compile: Execution of
>>     '/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769'
>>
>>     failed with exit code 2:
>>     go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
>>     +++ [1125 10:38:01] Building go targets for linux/amd64:
>>          ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
>>     <http://k8s.io/code-generator/cmd/prerelease-lifecycle-gen>
>>     go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
>>     !!! [1125 10:38:02] Call tree:
>>     !!! [1125 10:38:02]  1:
>>     /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715
>>
>>     kube::golang::build_some_binaries(...)
>>     !!! [1125 10:38:02]  2:
>>     /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859
>>
>>     kube::golang::build_binaries_for_platform(...)
>>     !!! [1125 10:38:02]  3: hack/make-rules/build.sh:27
>>     kube::golang::build_binaries(...)
>>     !!! [1125 10:38:02] Call tree:
>>     !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
>>     kube::golang::build_binaries(...)
>>     !!! [1125 10:38:02] Call tree:
>>     !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
>>     kube::golang::build_binaries(...)
>>     make[1]: *** [Makefile.generated_files:197:
>>     _output/bin/prerelease-lifecycle-gen] Error 1
>>     make: *** [Makefile:545: generated_files] Error 2
>>     WARNING:
>>     /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769:179
>>
>>     exit 2 from 'make generated_files GO="go"
>>     KUBE_BUILD_PLATFORMS="linux/amd64"'
>>     WARNING: Backtrace (BB generated script):
>>          #1: do_compile,
>>     /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769,
>>
>>     line 179
>>          #2: main,
>>     /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769,
>>
>>     line 198
>>
>>     Backtrace (metadata-relative locations):
>>          #1: do_compile,
>>     /var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb
>>     <http://kubernetes_git.bb>,
>>     line 55
>>     ERROR: Logfile of failure stored in:
>>     /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/log.do_compile.3481769
>>
>>
>>
>>
>>
>>
>> -- 
>> - Thou shalt not follow the NULL pointer, for chaos and madness await 
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>
> 
>

--------------F89DA7506B8D6DF128D501C0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Any luck on this ?? Its failed both with the same errors as
      posted on Fedora 33 Silverblue and Debian 10</p>
    <p>Build Configuration:<br>
      BB_VERSION           = "1.49.0"<br>
      BUILD_SYS            = "x86_64-linux"<br>
      NATIVELSBSTRING      = "fedora-33"<br>
      TARGET_SYS           = "x86_64-overc-linux"<br>
      MACHINE              = "intel-corei7-64"<br>
      DISTRO               = "overc"<br>
      DISTRO_VERSION       = "1.0"<br>
      TUNE_FEATURES        = "m64 corei7"<br>
      TARGET_FPU           = ""<br>
      meta                 <br>
      meta-poky            <br>
      meta-yocto-bsp       =
      "HEAD:0ac99625bf2c8a19d4ee746dc13e9c6b2e1956e2"<br>
      meta-oe              <br>
      meta-python          <br>
      meta-networking      <br>
      meta-filesystems     <br>
      meta-initramfs       <br>
      meta-multimedia      <br>
      meta-perl            =
      "HEAD:f623d8b5741a8d9060a6be025cfdcfa479dd3fb3"<br>
      meta-overc           <br>
      meta-cube            =
      "HEAD:af81bc7ec63e96aa7816b523b75ad9f29f9dfcf0"<br>
      meta-virtualization  =
      "HEAD:fbfced367daaca778bda733f11c36973577c2456"<br>
      meta-security        =
      "HEAD:d2ceb5e438b3b9c91696c83bf32f2df415a761ab"<br>
      meta-selinux         =
      "HEAD:5a58e87aa998c53527f92b32c3e6bc516a03d9a3"<br>
      meta-gnome           <br>
      meta-xfce            =
      "HEAD:f623d8b5741a8d9060a6be025cfdcfa479dd3fb3"<br>
      meta-intel           =
      "HEAD:7d79beb5093da8adf0f9b106a33d8e0904a50a48"<br>
      meta-cloud-services  =
      "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c1f15455"<br>
      meta-awnix           =
      "master:c616414c6ed4f6f2ab75703ce5a3e84acacd3c47"<br>
      <br>
      Initialising tasks: 100%
|######################################################################################################################|
      Time: 0:00:03<br>
      Sstate summary: Wanted 497 Found 0 Missed 497 Current 0 (0% match,
      0% complete)<br>
      NOTE: Executing Tasks<br>
      ERROR:
      kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0
      do_compile: Execution of
'/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097'
      failed with exit code 2:<br>
      go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1<br>
      +++ [1201 18:22:47] Building go targets for linux/amd64:<br>
          ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen<br>
      go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1<br>
      !!! [1201 18:22:48] Call tree:<br>
      !!! [1201 18:22:48]  1:
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715
      kube::golang::build_some_binaries(...)<br>
      !!! [1201 18:22:48]  2:
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859
      kube::golang::build_binaries_for_platform(...)<br>
      !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27
      kube::golang::build_binaries(...)<br>
      !!! [1201 18:22:48] Call tree:<br>
      !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27
      kube::golang::build_binaries(...)<br>
      !!! [1201 18:22:48] Call tree:<br>
      !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27
      kube::golang::build_binaries(...)<br>
      make[1]: *** [Makefile.generated_files:197:
      _output/bin/prerelease-lifecycle-gen] Error 1<br>
      make: *** [Makefile:545: generated_files] Error 2<br>
      WARNING:
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097:179
      exit 2 from 'make generated_files GO="go"
      KUBE_BUILD_PLATFORMS="linux/amd64"'<br>
      WARNING: Backtrace (BB generated script): <br>
          #1: do_compile,
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097,
      line 179<br>
          #2: main,
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097,
      line 198<br>
      <br>
      Backtrace (metadata-relative locations):<br>
          #1: do_compile,
/var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb,
      line 55<br>
      ERROR: Logfile of failure stored in:
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/log.do_compile.1741097<br>
      Log data follows:<br>
      | DEBUG: Executing shell function do_compile<br>
      | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1<br>
      | +++ [1201 18:22:47] Building go targets for linux/amd64:<br>
      |     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen<br>
      | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1<br>
      | !!! [1201 18:22:48] Call tree:<br>
      | !!! [1201 18:22:48]  1:
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715
      kube::golang::build_some_binaries(...)<br>
      | !!! [1201 18:22:48]  2:
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859
      kube::golang::build_binaries_for_platform(...)<br>
      | !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27
      kube::golang::build_binaries(...)<br>
      | !!! [1201 18:22:48] Call tree:<br>
      | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27
      kube::golang::build_binaries(...)<br>
      | !!! [1201 18:22:48] Call tree:<br>
      | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27
      kube::golang::build_binaries(...)<br>
      | make[1]: *** [Makefile.generated_files:197:
      _output/bin/prerelease-lifecycle-gen] Error 1<br>
      | make: *** [Makefile:545: generated_files] Error 2<br>
      | WARNING:
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097:179
      exit 2 from 'make generated_files GO="go"
      KUBE_BUILD_PLATFORMS="linux/amd64"'<br>
      | WARNING: Backtrace (BB generated script):<br>
      |     #1: do_compile,
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097,
      line 179<br>
      |     #2: main,
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097,
      line 198<br>
      | ERROR: Execution of
'/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097'
      failed with exit code 2:<br>
      | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1<br>
      | +++ [1201 18:22:47] Building go targets for linux/amd64:<br>
      |     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen<br>
      | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1<br>
      | !!! [1201 18:22:48] Call tree:<br>
      | !!! [1201 18:22:48]  1:
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715
      kube::golang::build_some_binaries(...)<br>
      | !!! [1201 18:22:48]  2:
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859
      kube::golang::build_binaries_for_platform(...)<br>
      | !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27
      kube::golang::build_binaries(...)<br>
      | !!! [1201 18:22:48] Call tree:<br>
      | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27
      kube::golang::build_binaries(...)<br>
      | !!! [1201 18:22:48] Call tree:<br>
      | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27
      kube::golang::build_binaries(...)<br>
      | make[1]: *** [Makefile.generated_files:197:
      _output/bin/prerelease-lifecycle-gen] Error 1<br>
      | make: *** [Makefile:545: generated_files] Error 2<br>
      | WARNING:
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097:179
      exit 2 from 'make generated_files GO="go"
      KUBE_BUILD_PLATFORMS="linux/amd64"'<br>
      | WARNING: Backtrace (BB generated script):<br>
      |     #1: do_compile,
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097,
      line 179<br>
      |     #2: main,
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097,
      line 198<br>
      | <br>
      | Backtrace (metadata-relative locations):<br>
      |     #1: do_compile,
/var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb,
      line 55<br>
      ERROR: Task
(/var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb:do_compile)
      failed with exit code '1'<br>
      NOTE: Tasks Summary: Attempted 1672 tasks of which 0 didn't need
      to be rerun and 1 failed.<br>
      <br>
      Summary: 1 task failed:<br>
       
/var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb:do_compile<br>
      Summary: There were 2 WARNING messages shown.<br>
      Summary: There was 1 ERROR message shown, returning a non-zero
      exit code.<br>
      <br>
    </p>
    <div class="moz-cite-prefix">On 11/25/20 10:19 PM, Dingo wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:164AC9578349B0A8.29370@lists.yoctoproject.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>Building from head. on F33 Silverblue, always worked fine for
        k8s... now fails.<br>
      </p>
      <p>NOTE: Resolving any missing task queue dependencies<br>
        <br>
        Build Configuration:<br>
        BB_VERSION           = "1.49.0"<br>
        BUILD_SYS            = "x86_64-linux"<br>
        NATIVELSBSTRING      = "fedora-33"<br>
        TARGET_SYS           = "x86_64-overc-linux"<br>
        MACHINE              = "intel-corei7-64"<br>
        DISTRO               = "overc"<br>
        DISTRO_VERSION       = "1.0"<br>
        TUNE_FEATURES        = "m64 corei7"<br>
        TARGET_FPU           = ""<br>
        meta                 <br>
        meta-poky            <br>
        meta-yocto-bsp       =
        "HEAD:3ecf5d9692fec97b37af6a4e6c747a4e2c2ca292"<br>
        meta-oe              <br>
        meta-python          <br>
        meta-networking      <br>
        meta-filesystems     <br>
        meta-initramfs       <br>
        meta-multimedia      <br>
        meta-perl            =
        "HEAD:51c495772d3186ff7625675c83547eb7410db57f"<br>
        meta-overc           <br>
        meta-cube            =
        "master:af81bc7ec63e96aa7816b523b75ad9f29f9dfcf0"<br>
        meta-virtualization  =
        "HEAD:fbfced367daaca778bda733f11c36973577c2456"<br>
        meta-security        =
        "HEAD:d2ceb5e438b3b9c91696c83bf32f2df415a761ab"<br>
        meta-selinux         =
        "HEAD:5a58e87aa998c53527f92b32c3e6bc516a03d9a3"<br>
        meta-intel           =
        "HEAD:6cf386fa948880eaaa60bbddb5245258771fac79"<br>
        meta-awnix           = "&lt;unknown&gt;:&lt;unknown&gt;"<br>
        meta-cloud-services  =
        "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c1f15455"<br>
        <br>
        <br>
      </p>
      <div class="moz-cite-prefix">On 11/25/20 8:55 PM, Bruce Ashfield
        wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CADkTA4PVY139=rDa8vuSGwE8x+4oN80Z8np__=bK=b4w4iVYjw@mail.gmail.com">
        <meta http-equiv="content-type" content="text/html;
          charset=UTF-8">
        <div dir="ltr">
          <div dir="ltr">
            <div class="gmail_default" style="font-size:small">Builds
              fine here, so you'll need to be more specific about your
              configuration to see if I can reproduce the issue.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Bruce</div>
          </div>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Wed, Nov 25, 2020 at
              5:43 AM Dingo &lt;<a href="mailto:dingo@optimcloud.com"
                moz-do-not-send="true">dingo@optimcloud.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">NOTE: Executing Tasks<br>
              ERROR: <br>
kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0 <br>
              do_compile: Execution of <br>
'/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769'
              <br>
              failed with exit code 2:<br>
              go build runtime/cgo: invalid flag in go:cgo_ldflag:
              -Wl,-O1<br>
              +++ [1125 10:38:01] Building go targets for linux/amd64:<br>
                   ./vendor/<a
                href="http://k8s.io/code-generator/cmd/prerelease-lifecycle-gen"
                rel="noreferrer" target="_blank" moz-do-not-send="true">k8s.io/code-generator/cmd/prerelease-lifecycle-gen</a><br>
              go build runtime/cgo: invalid flag in go:cgo_ldflag:
              -Wl,-O1<br>
              !!! [1125 10:38:02] Call tree:<br>
              !!! [1125 10:38:02]  1: <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715
              <br>
              kube::golang::build_some_binaries(...)<br>
              !!! [1125 10:38:02]  2: <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859
              <br>
              kube::golang::build_binaries_for_platform(...)<br>
              !!! [1125 10:38:02]  3: hack/make-rules/build.sh:27 <br>
              kube::golang::build_binaries(...)<br>
              !!! [1125 10:38:02] Call tree:<br>
              !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27 <br>
              kube::golang::build_binaries(...)<br>
              !!! [1125 10:38:02] Call tree:<br>
              !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27 <br>
              kube::golang::build_binaries(...)<br>
              make[1]: *** [Makefile.generated_files:197: <br>
              _output/bin/prerelease-lifecycle-gen] Error 1<br>
              make: *** [Makefile:545: generated_files] Error 2<br>
              WARNING: <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769:179
              <br>
              exit 2 from 'make generated_files GO="go" <br>
              KUBE_BUILD_PLATFORMS="linux/amd64"'<br>
              WARNING: Backtrace (BB generated script):<br>
                   #1: do_compile, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769,
              <br>
              line 179<br>
                   #2: main, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769,
              <br>
              line 198<br>
              <br>
              Backtrace (metadata-relative locations):<br>
                   #1: do_compile, <br>
/var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/<a
                href="http://kubernetes_git.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">kubernetes_git.bb</a>,
              <br>
              line 55<br>
              ERROR: Logfile of failure stored in: <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/log.do_compile.3481769<br>
              <br>
              <br>
              <br>
              <br>
            </blockquote>
          </div>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div dir="ltr" class="gmail_signature">- Thou shalt not follow
            the NULL pointer, for chaos and madness await thee at its
            end<br>
            - "Use the force Harry" - Gandalf, Star Trek II<br>
            <br>
          </div>
        </div>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------F89DA7506B8D6DF128D501C0--
