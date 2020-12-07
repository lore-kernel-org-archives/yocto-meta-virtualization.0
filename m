Received: from mx02.optimcloud.com (mx02.optimcloud.com [46.23.93.22])
 by mx.groups.io with SMTP id smtpd.web11.3635.1607331955691334566
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 01:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@optimcloud.com header.s=obsd header.b=m9+CQOJ9;
 spf=none, err=SPF record not found (domain: optimcloud.com, ip: 46.23.93.22, mailfrom: dingo@optimcloud.com)
Received: from mx02.optimcloud.com (localhost [127.0.0.1])
	by mx02.optimcloud.com (OpenSMTPD) with ESMTP id 89f7033b
	for <meta-virtualization@lists.yoctoproject.org>;
	Mon, 7 Dec 2020 10:05:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=optimcloud.com; h=
	subject:to:references:from:message-id:date:mime-version
	:in-reply-to:content-type; s=obsd; bh=5sPpA/XCDUAHDBX9xruseu2MO6
	KcWY2OjzjwtbP3y+Y=; b=m9+CQOJ9NqjVtxNNfJsauDUcrKRxVfByePzYbcJqoJ
	pFgc03z39o1gp+sdtEBRKQ+Nn37NFfYSBRSAO/5c5duJ2eGPNkCBnykMWqY9dktz
	0Yo3zZAeFmEDeVXXMw5PzAASCOnA8tPQSlrucwwSSFLtlmHw3b9lx4yE46uNOCJK
	e+6akFj7IidA/BglpJmebLTeuRXfDQ/zk5Boi316814Ph6LfDNDXCpGQT8TGkIWJ
	GWhnc92RarNI7Z0QDc8iMzGSRnP3C0jAXuanGCXUHBtrZT9SHD4k1I52gC2Hf/Dd
	R0BFuq+/NFCiTzA5UWvcpZRvKwxbvwo/8fPbFTI/zwyw==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=optimcloud.com; h=subject:to
	:references:from:message-id:date:mime-version:in-reply-to
	:content-type; q=dns; s=obsd; b=jZWxvJ3VgMB3SnGlxFn1FKOpm5kyEl0l
	yNjOB5eGiBqSFkIXQ2Hv01GMDQRgJU9qPqi4lEItYkUNy2LifWnoKmAApoRHKT0q
	adFBUdApSPHfMgP8Uc1XhnegRYCigcvSSxbHF9nEZDXf8+0EFtZ6AycxeFLynvu2
	0zNENUlWhB0VvRu9B2l2PZK+7C1lQKuHC76JxJpN1zxViiNazhrNblQ49pZ/B7VK
	2ZDAsJYWnVSWQwLjJMUYYfsqPPRr5iFpxg4mn/L2h7Sqj/HlEs4imEcWhG9Os+fU
	qdSz91aZ0/IgDL/NjHaekPnq1V6y0fhKY5KtrqpcW7syeplkyRN5rw==
Received: 
	by mx02.optimcloud.com (OpenSMTPD) with ESMTPSA id 81c2273c (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO) auth=yes user=support@optimcloud.com
	for <meta-virtualization@lists.yoctoproject.org>;
	Mon, 7 Dec 2020 10:05:43 +0100 (CET)
Subject: Re: [meta-virtualization] go broken or kubernetes ? go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
To: meta-virtualization@lists.yoctoproject.org
References: <80e1aaec-343b-9af4-6144-34c24746cd2a@optimcloud.com>
 <CADkTA4PVY139=rDa8vuSGwE8x+4oN80Z8np__=bK=b4w4iVYjw@mail.gmail.com>
 <164AC9578349B0A8.29370@lists.yoctoproject.org>
 <ca7960b9-973b-cb35-1ea3-bb1c7261636d@optimcloud.com>
 <164CAD00803DE49B.28599@lists.yoctoproject.org>
 <164CAD1F96CC6471.28599@lists.yoctoproject.org>
 <164CB61893C793E2.17283@lists.yoctoproject.org>
 <164CC30B1EDCBD64.9909@lists.yoctoproject.org>
 <CADkTA4NnZmM2g=XZeRWPPHMFDhzLLoQcfj05yqpn=jz9i80F0Q@mail.gmail.com>
From: "Dingo" <dingo@optimcloud.com>
Message-ID: <83d5039d-cf54-f502-b2b0-8359b40941b8@optimcloud.com>
Date: Mon, 7 Dec 2020 16:04:33 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NnZmM2g=XZeRWPPHMFDhzLLoQcfj05yqpn=jz9i80F0Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------986D2FC9EC4DB9B5A1FE389A"
Content-Language: en-US

--------------986D2FC9EC4DB9B5A1FE389A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/2/20 9:11 AM, Bruce Ashfield wrote:
> On Tue, Dec 1, 2020 at 8:47 PM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>> On Tue, Dec 1, 2020 at 4:49 PM Bruce Ashfield via
>> lists.yoctoproject.org
>> <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>>> On Tue, Dec 1, 2020 at 2:05 PM Bruce Ashfield via
>>> lists.yoctoproject.org
>>> <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>>>> On Tue, Dec 1, 2020 at 2:03 PM Bruce Ashfield via
>>>> lists.yoctoproject.org
>>>> <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>>>>> Nope.
>>>>>
>>>>> It built fine, and continues to build fine here.
>>>>>
>>>> I should say: it builds fine on qemu* which are the machines that I
>>>> use for sanity and integration testing.
>>>>
>>>> If there's an issue on machines and configs outside of that, I rely on
>>>> others to send appropriate fixes.
>>>>
>>>> I do have a k8s version bump incoming, that may indirectly deal with it.
>>> I was working on a new incremental update, and I'm seeing a similar
>>> failure. So hopefully I have a reproducer now and can dig into this!
>>>
>> The commit that triggered this is fairly obvious:
>>
>> commit 0917e35aa2813e843457302d1a370dd6c7b03ad6
>> Author: Khem Raj <raj.khem@gmail.com>
>> Date:   Sat Nov 21 00:23:16 2020 -0800
>>
>>      go: Update to 1.15.5
>>
>>      Define CXX_FOR_TARGET and CC_FOR_TARGET for target go
>>      since we are cross building it, it helps in defining the compiler
>>      for cgo on target
>>
>>      backport a patch to fix CGO_LDFLAGS regression like below
>>
>>      Fixes
>>      | Building std for target, linux/arm.
>>      | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
>>
>>      (From OE-Core rev: a71d1b58e8cf0976a614c49aa2dfe1e0605dfe95)
>>
>>      Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> It was masked here, since I was changing how generated_files was
>> built, but had to
>> restore it in my latest set of changes.
>>
>> Right now, if we use "go" (go-native) to build the generated_files
>> (they are host side
>> and part of the build), we blow up with the flags errors.  if you are
>> x86 and use $GO,
>> you can build the generated files, but it breaks on ARM64.
>>
>> I'll look into the flags and see if we can filter them out, or maybe
>> khem has another
>> idea.
> Sorry for all the email, but I didn't want khem to spend much time on
> this.
>
> The kubernetes recipe pre-dates a lot of the current go.bbclass stuff,
> so does quite a bit of flag "fiddling". So the crime is just as likely in
> the recipe as anywhere else.
>
> I've managed to get the host side stuff building by clearing the CGO_LDFLAGS
> of the problematic host options, and it does seem to be building.
>
> I'll test a few more arches and call it 'good enough for now'.
>
> Bruce


  That resolved my k98s build issue at least for now!


Thanks


>
>> Bruce
>>
>>
>>>> Bruce
>>>>
>>>>> So there's nothing I can do about fixing it.
>>>>>
>>>>> Bruce
>>>>>
>>>>> On Tue, Dec 1, 2020 at 1:25 PM OutBack Dingo <dingo@optimcloud.com> wrote:
>>>>>> Any luck on this ?? Its failed both with the same errors as posted on Fedora 33 Silverblue and Debian 10
>>>>>>
>>>>>> Build Configuration:
>>>>>> BB_VERSION           = "1.49.0"
>>>>>> BUILD_SYS            = "x86_64-linux"
>>>>>> NATIVELSBSTRING      = "fedora-33"
>>>>>> TARGET_SYS           = "x86_64-overc-linux"
>>>>>> MACHINE              = "intel-corei7-64"
>>>>>> DISTRO               = "overc"
>>>>>> DISTRO_VERSION       = "1.0"
>>>>>> TUNE_FEATURES        = "m64 corei7"
>>>>>> TARGET_FPU           = ""
>>>>>> meta
>>>>>> meta-poky
>>>>>> meta-yocto-bsp       = "HEAD:0ac99625bf2c8a19d4ee746dc13e9c6b2e1956e2"
>>>>>> meta-oe
>>>>>> meta-python
>>>>>> meta-networking
>>>>>> meta-filesystems
>>>>>> meta-initramfs
>>>>>> meta-multimedia
>>>>>> meta-perl            = "HEAD:f623d8b5741a8d9060a6be025cfdcfa479dd3fb3"
>>>>>> meta-overc
>>>>>> meta-cube            = "HEAD:af81bc7ec63e96aa7816b523b75ad9f29f9dfcf0"
>>>>>> meta-virtualization  = "HEAD:fbfced367daaca778bda733f11c36973577c2456"
>>>>>> meta-security        = "HEAD:d2ceb5e438b3b9c91696c83bf32f2df415a761ab"
>>>>>> meta-selinux         = "HEAD:5a58e87aa998c53527f92b32c3e6bc516a03d9a3"
>>>>>> meta-gnome
>>>>>> meta-xfce            = "HEAD:f623d8b5741a8d9060a6be025cfdcfa479dd3fb3"
>>>>>> meta-intel           = "HEAD:7d79beb5093da8adf0f9b106a33d8e0904a50a48"
>>>>>> meta-cloud-services  = "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c1f15455"
>>>>>> meta-awnix           = "master:c616414c6ed4f6f2ab75703ce5a3e84acacd3c47"
>>>>>>
>>>>>> Initialising tasks: 100% |######################################################################################################################| Time: 0:00:03
>>>>>> Sstate summary: Wanted 497 Found 0 Missed 497 Current 0 (0% match, 0% complete)
>>>>>> NOTE: Executing Tasks
>>>>>> ERROR: kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0 do_compile: Execution of '/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097' failed with exit code 2:
>>>>>> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
>>>>>> +++ [1201 18:22:47] Building go targets for linux/amd64:
>>>>>>      ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
>>>>>> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
>>>>>> !!! [1201 18:22:48] Call tree:
>>>>>> !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries(...)
>>>>>> !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_platform(...)
>>>>>> !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
>>>>>> !!! [1201 18:22:48] Call tree:
>>>>>> !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
>>>>>> !!! [1201 18:22:48] Call tree:
>>>>>> !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
>>>>>> make[1]: *** [Makefile.generated_files:197: _output/bin/prerelease-lifecycle-gen] Error 1
>>>>>> make: *** [Makefile:545: generated_files] Error 2
>>>>>> WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097:179 exit 2 from 'make generated_files GO="go" KUBE_BUILD_PLATFORMS="linux/amd64"'
>>>>>> WARNING: Backtrace (BB generated script):
>>>>>>      #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, line 179
>>>>>>      #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, line 198
>>>>>>
>>>>>> Backtrace (metadata-relative locations):
>>>>>>      #1: do_compile, /var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb, line 55
>>>>>> ERROR: Logfile of failure stored in: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/log.do_compile.1741097
>>>>>> Log data follows:
>>>>>> | DEBUG: Executing shell function do_compile
>>>>>> | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
>>>>>> | +++ [1201 18:22:47] Building go targets for linux/amd64:
>>>>>> |     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
>>>>>> | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
>>>>>> | !!! [1201 18:22:48] Call tree:
>>>>>> | !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries(...)
>>>>>> | !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_platform(...)
>>>>>> | !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
>>>>>> | !!! [1201 18:22:48] Call tree:
>>>>>> | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
>>>>>> | !!! [1201 18:22:48] Call tree:
>>>>>> | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
>>>>>> | make[1]: *** [Makefile.generated_files:197: _output/bin/prerelease-lifecycle-gen] Error 1
>>>>>> | make: *** [Makefile:545: generated_files] Error 2
>>>>>> | WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097:179 exit 2 from 'make generated_files GO="go" KUBE_BUILD_PLATFORMS="linux/amd64"'
>>>>>> | WARNING: Backtrace (BB generated script):
>>>>>> |     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, line 179
>>>>>> |     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, line 198
>>>>>> | ERROR: Execution of '/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097' failed with exit code 2:
>>>>>> | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
>>>>>> | +++ [1201 18:22:47] Building go targets for linux/amd64:
>>>>>> |     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
>>>>>> | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
>>>>>> | !!! [1201 18:22:48] Call tree:
>>>>>> | !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries(...)
>>>>>> | !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_platform(...)
>>>>>> | !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
>>>>>> | !!! [1201 18:22:48] Call tree:
>>>>>> | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
>>>>>> | !!! [1201 18:22:48] Call tree:
>>>>>> | !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
>>>>>> | make[1]: *** [Makefile.generated_files:197: _output/bin/prerelease-lifecycle-gen] Error 1
>>>>>> | make: *** [Makefile:545: generated_files] Error 2
>>>>>> | WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097:179 exit 2 from 'make generated_files GO="go" KUBE_BUILD_PLATFORMS="linux/amd64"'
>>>>>> | WARNING: Backtrace (BB generated script):
>>>>>> |     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, line 179
>>>>>> |     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, line 198
>>>>>> |
>>>>>> | Backtrace (metadata-relative locations):
>>>>>> |     #1: do_compile, /var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb, line 55
>>>>>> ERROR: Task (/var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb:do_compile) failed with exit code '1'
>>>>>> NOTE: Tasks Summary: Attempted 1672 tasks of which 0 didn't need to be rerun and 1 failed.
>>>>>>
>>>>>> Summary: 1 task failed:
>>>>>>    /var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb:do_compile
>>>>>> Summary: There were 2 WARNING messages shown.
>>>>>> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>>>>>>
>>>>>> On 11/25/20 10:19 PM, Dingo wrote:
>>>>>>
>>>>>> Building from head. on F33 Silverblue, always worked fine for k8s... now fails.
>>>>>>
>>>>>> NOTE: Resolving any missing task queue dependencies
>>>>>>
>>>>>> Build Configuration:
>>>>>> BB_VERSION           = "1.49.0"
>>>>>> BUILD_SYS            = "x86_64-linux"
>>>>>> NATIVELSBSTRING      = "fedora-33"
>>>>>> TARGET_SYS           = "x86_64-overc-linux"
>>>>>> MACHINE              = "intel-corei7-64"
>>>>>> DISTRO               = "overc"
>>>>>> DISTRO_VERSION       = "1.0"
>>>>>> TUNE_FEATURES        = "m64 corei7"
>>>>>> TARGET_FPU           = ""
>>>>>> meta
>>>>>> meta-poky
>>>>>> meta-yocto-bsp       = "HEAD:3ecf5d9692fec97b37af6a4e6c747a4e2c2ca292"
>>>>>> meta-oe
>>>>>> meta-python
>>>>>> meta-networking
>>>>>> meta-filesystems
>>>>>> meta-initramfs
>>>>>> meta-multimedia
>>>>>> meta-perl            = "HEAD:51c495772d3186ff7625675c83547eb7410db57f"
>>>>>> meta-overc
>>>>>> meta-cube            = "master:af81bc7ec63e96aa7816b523b75ad9f29f9dfcf0"
>>>>>> meta-virtualization  = "HEAD:fbfced367daaca778bda733f11c36973577c2456"
>>>>>> meta-security        = "HEAD:d2ceb5e438b3b9c91696c83bf32f2df415a761ab"
>>>>>> meta-selinux         = "HEAD:5a58e87aa998c53527f92b32c3e6bc516a03d9a3"
>>>>>> meta-intel           = "HEAD:6cf386fa948880eaaa60bbddb5245258771fac79"
>>>>>> meta-awnix           = "<unknown>:<unknown>"
>>>>>> meta-cloud-services  = "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c1f15455"
>>>>>>
>>>>>>
>>>>>> On 11/25/20 8:55 PM, Bruce Ashfield wrote:
>>>>>>
>>>>>> Builds fine here, so you'll need to be more specific about your configuration to see if I can reproduce the issue.
>>>>>>
>>>>>> Bruce
>>>>>>
>>>>>> On Wed, Nov 25, 2020 at 5:43 AM Dingo <dingo@optimcloud.com> wrote:
>>>>>>> NOTE: Executing Tasks
>>>>>>> ERROR:
>>>>>>> kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0
>>>>>>> do_compile: Execution of
>>>>>>> '/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769'
>>>>>>> failed with exit code 2:
>>>>>>> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
>>>>>>> +++ [1125 10:38:01] Building go targets for linux/amd64:
>>>>>>>       ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
>>>>>>> go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
>>>>>>> !!! [1125 10:38:02] Call tree:
>>>>>>> !!! [1125 10:38:02]  1:
>>>>>>> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715
>>>>>>> kube::golang::build_some_binaries(...)
>>>>>>> !!! [1125 10:38:02]  2:
>>>>>>> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859
>>>>>>> kube::golang::build_binaries_for_platform(...)
>>>>>>> !!! [1125 10:38:02]  3: hack/make-rules/build.sh:27
>>>>>>> kube::golang::build_binaries(...)
>>>>>>> !!! [1125 10:38:02] Call tree:
>>>>>>> !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
>>>>>>> kube::golang::build_binaries(...)
>>>>>>> !!! [1125 10:38:02] Call tree:
>>>>>>> !!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
>>>>>>> kube::golang::build_binaries(...)
>>>>>>> make[1]: *** [Makefile.generated_files:197:
>>>>>>> _output/bin/prerelease-lifecycle-gen] Error 1
>>>>>>> make: *** [Makefile:545: generated_files] Error 2
>>>>>>> WARNING:
>>>>>>> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769:179
>>>>>>> exit 2 from 'make generated_files GO="go"
>>>>>>> KUBE_BUILD_PLATFORMS="linux/amd64"'
>>>>>>> WARNING: Backtrace (BB generated script):
>>>>>>>       #1: do_compile,
>>>>>>> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769,
>>>>>>> line 179
>>>>>>>       #2: main,
>>>>>>> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769,
>>>>>>> line 198
>>>>>>>
>>>>>>> Backtrace (metadata-relative locations):
>>>>>>>       #1: do_compile,
>>>>>>> /var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb,
>>>>>>> line 55
>>>>>>> ERROR: Logfile of failure stored in:
>>>>>>> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/log.do_compile.3481769
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> --
>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>> --
>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>>>> thee at its end
>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>
>>>>>
>>>>>
>>>>
>>>> --
>>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>>> thee at its end
>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>
>>>>
>>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>>
>>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>>
>
>
> 
>

--------------986D2FC9EC4DB9B5A1FE389A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/2/20 9:11 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4NnZmM2g=XZeRWPPHMFDhzLLoQcfj05yqpn=jz9i80F0Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Dec 1, 2020 at 8:47 PM Bruce Ashfield via
lists.yoctoproject.org
<a class="moz-txt-link-rfc2396E" href="mailto:bruce.ashfield=gmail.com@lists.yoctoproject.org">&lt;bruce.ashfield=gmail.com@lists.yoctoproject.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On Tue, Dec 1, 2020 at 4:49 PM Bruce Ashfield via
lists.yoctoproject.org
<a class="moz-txt-link-rfc2396E" href="mailto:bruce.ashfield=gmail.com@lists.yoctoproject.org">&lt;bruce.ashfield=gmail.com@lists.yoctoproject.org&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
On Tue, Dec 1, 2020 at 2:05 PM Bruce Ashfield via
lists.yoctoproject.org
<a class="moz-txt-link-rfc2396E" href="mailto:bruce.ashfield=gmail.com@lists.yoctoproject.org">&lt;bruce.ashfield=gmail.com@lists.yoctoproject.org&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
On Tue, Dec 1, 2020 at 2:03 PM Bruce Ashfield via
lists.yoctoproject.org
<a class="moz-txt-link-rfc2396E" href="mailto:bruce.ashfield=gmail.com@lists.yoctoproject.org">&lt;bruce.ashfield=gmail.com@lists.yoctoproject.org&gt;</a> wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
Nope.

It built fine, and continues to build fine here.

</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
I should say: it builds fine on qemu* which are the machines that I
use for sanity and integration testing.

If there's an issue on machines and configs outside of that, I rely on
others to send appropriate fixes.

I do have a k8s version bump incoming, that may indirectly deal with it.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
I was working on a new incremental update, and I'm seeing a similar
failure. So hopefully I have a reproducer now and can dig into this!

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The commit that triggered this is fairly obvious:

commit 0917e35aa2813e843457302d1a370dd6c7b03ad6
Author: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
Date:   Sat Nov 21 00:23:16 2020 -0800

    go: Update to 1.15.5

    Define CXX_FOR_TARGET and CC_FOR_TARGET for target go
    since we are cross building it, it helps in defining the compiler
    for cgo on target

    backport a patch to fix CGO_LDFLAGS regression like below

    Fixes
    | Building std for target, linux/arm.
    | go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1

    (From OE-Core rev: a71d1b58e8cf0976a614c49aa2dfe1e0605dfe95)

    Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
    Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>

It was masked here, since I was changing how generated_files was
built, but had to
restore it in my latest set of changes.

Right now, if we use "go" (go-native) to build the generated_files
(they are host side
and part of the build), we blow up with the flags errors.  if you are
x86 and use $GO,
you can build the generated files, but it breaks on ARM64.

I'll look into the flags and see if we can filter them out, or maybe
khem has another
idea.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Sorry for all the email, but I didn't want khem to spend much time on
this.

The kubernetes recipe pre-dates a lot of the current go.bbclass stuff,
so does quite a bit of flag "fiddling". So the crime is just as likely in
the recipe as anywhere else.

I've managed to get the host side stuff building by clearing the CGO_LDFLAGS
of the problematic host options, and it does seem to be building.

I'll test a few more arches and call it 'good enough for now'.

Bruce</pre>
    </blockquote>
    <p><br>
    </p>
    <p> That resolved my k98s build issue at least for now! <br>
    </p>
    <p><br>
    </p>
    <p>Thanks<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CADkTA4NnZmM2g=XZeRWPPHMFDhzLLoQcfj05yqpn=jz9i80F0Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Bruce


</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
Bruce

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">So there's nothing I can do about fixing it.

Bruce

On Tue, Dec 1, 2020 at 1:25 PM OutBack Dingo <a class="moz-txt-link-rfc2396E" href="mailto:dingo@optimcloud.com">&lt;dingo@optimcloud.com&gt;</a> wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">
Any luck on this ?? Its failed both with the same errors as posted on Fedora 33 Silverblue and Debian 10

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "fedora-33"
TARGET_SYS           = "x86_64-overc-linux"
MACHINE              = "intel-corei7-64"
DISTRO               = "overc"
DISTRO_VERSION       = "1.0"
TUNE_FEATURES        = "m64 corei7"
TARGET_FPU           = ""
meta
meta-poky
meta-yocto-bsp       = "HEAD:0ac99625bf2c8a19d4ee746dc13e9c6b2e1956e2"
meta-oe
meta-python
meta-networking
meta-filesystems
meta-initramfs
meta-multimedia
meta-perl            = "HEAD:f623d8b5741a8d9060a6be025cfdcfa479dd3fb3"
meta-overc
meta-cube            = "HEAD:af81bc7ec63e96aa7816b523b75ad9f29f9dfcf0"
meta-virtualization  = "HEAD:fbfced367daaca778bda733f11c36973577c2456"
meta-security        = "HEAD:d2ceb5e438b3b9c91696c83bf32f2df415a761ab"
meta-selinux         = "HEAD:5a58e87aa998c53527f92b32c3e6bc516a03d9a3"
meta-gnome
meta-xfce            = "HEAD:f623d8b5741a8d9060a6be025cfdcfa479dd3fb3"
meta-intel           = "HEAD:7d79beb5093da8adf0f9b106a33d8e0904a50a48"
meta-cloud-services  = "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c1f15455"
meta-awnix           = "master:c616414c6ed4f6f2ab75703ce5a3e84acacd3c47"

Initialising tasks: 100% |######################################################################################################################| Time: 0:00:03
Sstate summary: Wanted 497 Found 0 Missed 497 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
ERROR: kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0 do_compile: Execution of '/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097' failed with exit code 2:
go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
+++ [1201 18:22:47] Building go targets for linux/amd64:
    ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
!!! [1201 18:22:48] Call tree:
!!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries(...)
!!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_platform(...)
!!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
!!! [1201 18:22:48] Call tree:
!!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
!!! [1201 18:22:48] Call tree:
!!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
make[1]: *** [Makefile.generated_files:197: _output/bin/prerelease-lifecycle-gen] Error 1
make: *** [Makefile:545: generated_files] Error 2
WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097:179 exit 2 from 'make generated_files GO="go" KUBE_BUILD_PLATFORMS="linux/amd64"'
WARNING: Backtrace (BB generated script):
    #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, line 179
    #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, line 198

Backtrace (metadata-relative locations):
    #1: do_compile, /var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb, line 55
ERROR: Logfile of failure stored in: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/log.do_compile.1741097
Log data follows:
| DEBUG: Executing shell function do_compile
| go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
| +++ [1201 18:22:47] Building go targets for linux/amd64:
|     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
| go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
| !!! [1201 18:22:48] Call tree:
| !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries(...)
| !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_platform(...)
| !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
| !!! [1201 18:22:48] Call tree:
| !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
| !!! [1201 18:22:48] Call tree:
| !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
| make[1]: *** [Makefile.generated_files:197: _output/bin/prerelease-lifecycle-gen] Error 1
| make: *** [Makefile:545: generated_files] Error 2
| WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097:179 exit 2 from 'make generated_files GO="go" KUBE_BUILD_PLATFORMS="linux/amd64"'
| WARNING: Backtrace (BB generated script):
|     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, line 179
|     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, line 198
| ERROR: Execution of '/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097' failed with exit code 2:
| go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
| +++ [1201 18:22:47] Building go targets for linux/amd64:
|     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
| go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
| !!! [1201 18:22:48] Call tree:
| !!! [1201 18:22:48]  1: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715 kube::golang::build_some_binaries(...)
| !!! [1201 18:22:48]  2: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859 kube::golang::build_binaries_for_platform(...)
| !!! [1201 18:22:48]  3: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
| !!! [1201 18:22:48] Call tree:
| !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
| !!! [1201 18:22:48] Call tree:
| !!! [1201 18:22:48]  1: hack/make-rules/build.sh:27 kube::golang::build_binaries(...)
| make[1]: *** [Makefile.generated_files:197: _output/bin/prerelease-lifecycle-gen] Error 1
| make: *** [Makefile:545: generated_files] Error 2
| WARNING: /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097:179 exit 2 from 'make generated_files GO="go" KUBE_BUILD_PLATFORMS="linux/amd64"'
| WARNING: Backtrace (BB generated script):
|     #1: do_compile, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, line 179
|     #2: main, /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.1741097, line 198
|
| Backtrace (metadata-relative locations):
|     #1: do_compile, /var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb, line 55
ERROR: Task (/var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1672 tasks of which 0 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  /var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb:do_compile
Summary: There were 2 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

On 11/25/20 10:19 PM, Dingo wrote:

Building from head. on F33 Silverblue, always worked fine for k8s... now fails.

NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "fedora-33"
TARGET_SYS           = "x86_64-overc-linux"
MACHINE              = "intel-corei7-64"
DISTRO               = "overc"
DISTRO_VERSION       = "1.0"
TUNE_FEATURES        = "m64 corei7"
TARGET_FPU           = ""
meta
meta-poky
meta-yocto-bsp       = "HEAD:3ecf5d9692fec97b37af6a4e6c747a4e2c2ca292"
meta-oe
meta-python
meta-networking
meta-filesystems
meta-initramfs
meta-multimedia
meta-perl            = "HEAD:51c495772d3186ff7625675c83547eb7410db57f"
meta-overc
meta-cube            = "master:af81bc7ec63e96aa7816b523b75ad9f29f9dfcf0"
meta-virtualization  = "HEAD:fbfced367daaca778bda733f11c36973577c2456"
meta-security        = "HEAD:d2ceb5e438b3b9c91696c83bf32f2df415a761ab"
meta-selinux         = "HEAD:5a58e87aa998c53527f92b32c3e6bc516a03d9a3"
meta-intel           = "HEAD:6cf386fa948880eaaa60bbddb5245258771fac79"
meta-awnix           = "&lt;unknown&gt;:&lt;unknown&gt;"
meta-cloud-services  = "HEAD:5c44e6f076e5f9cfba71dc10f93325f7c1f15455"


On 11/25/20 8:55 PM, Bruce Ashfield wrote:

Builds fine here, so you'll need to be more specific about your configuration to see if I can reproduce the issue.

Bruce

On Wed, Nov 25, 2020 at 5:43 AM Dingo <a class="moz-txt-link-rfc2396E" href="mailto:dingo@optimcloud.com">&lt;dingo@optimcloud.com&gt;</a> wrote:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">
NOTE: Executing Tasks
ERROR:
kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0
do_compile: Execution of
'/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769'
failed with exit code 2:
go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
+++ [1125 10:38:01] Building go targets for linux/amd64:
     ./vendor/k8s.io/code-generator/cmd/prerelease-lifecycle-gen
go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1
!!! [1125 10:38:02] Call tree:
!!! [1125 10:38:02]  1:
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:715
kube::golang::build_some_binaries(...)
!!! [1125 10:38:02]  2:
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/kubernetes-v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f/src/import/hack/lib/golang.sh:859
kube::golang::build_binaries_for_platform(...)
!!! [1125 10:38:02]  3: hack/make-rules/build.sh:27
kube::golang::build_binaries(...)
!!! [1125 10:38:02] Call tree:
!!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
kube::golang::build_binaries(...)
!!! [1125 10:38:02] Call tree:
!!! [1125 10:38:02]  1: hack/make-rules/build.sh:27
kube::golang::build_binaries(...)
make[1]: *** [Makefile.generated_files:197:
_output/bin/prerelease-lifecycle-gen] Error 1
make: *** [Makefile:545: generated_files] Error 2
WARNING:
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769:179
exit 2 from 'make generated_files GO="go"
KUBE_BUILD_PLATFORMS="linux/amd64"'
WARNING: Backtrace (BB generated script):
     #1: do_compile,
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769,
line 179
     #2: main,
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/run.do_compile.3481769,
line 198

Backtrace (metadata-relative locations):
     #1: do_compile,
/var/home/dingo/overc/meta-virtualization/recipes-containers/kubernetes/kubernetes_git.bb,
line 55
ERROR: Logfile of failure stored in:
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/kubernetes/v1.19.0-rc.3+gitbdc575e10c35a3e65a1c02bceea432832b7e4f4f-r0/temp/log.do_compile.3481769




</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">

--
- Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
- "Use the force Harry" - Gandalf, Star Trek II




</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">

--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II



</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">

--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II



</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">

--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II



</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II



</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------986D2FC9EC4DB9B5A1FE389A--
