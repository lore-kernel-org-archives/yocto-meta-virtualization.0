Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 65526E00C61; Thu, 11 Jul 2019 18:57:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.182 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CFBB3E00951
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Jul 2019 18:57:01 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id d24so7729914ljg.8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Jul 2019 18:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oE4he7DZeIQGiXrOyMDbfgeIcuFueP9Azlp6HLPXw9c=;
	b=r3+8+MOkkQ+VaEkTJ35Due1BXc4MGVbnkxWR6HJ6plDdEH5gM4noUSuUF9AJt1aM3/
	3BaIohjiRHfYBg8dU5l07W08jO++mWntXzr86AfkkrzP/UU8bU9nVi62MizjYY+zMNEV
	wCMN7VNpQBJJUJ+B6Mjn2McP7/viDIb5BgelcQQFpwvcOPLQFjqVzUnemcV0I2zoxHHF
	xfxCXT1hY/v1n1tpDeXuKQ85fF8y9n/1idQg4pYPN+rugip+a6q52bsI5fepvRWVg5Jm
	xHm3bwOmQ16j1iiB77ChjlWSeCwdfAA2/SBDvP8QT+snNmVFpSJfyUxkzfbObGyyUe3R
	zGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oE4he7DZeIQGiXrOyMDbfgeIcuFueP9Azlp6HLPXw9c=;
	b=jaLA5/eDGsha52c3hnGnsb8lpIff035fGiyFnUsu+q25uKPTZTRnl0JgQM/hxnWSI6
	KL4k7kf4fNewAIY5ZcZbrEwnLapISjPkeEQ+C/Wfzkn5kbkxHXiiyJE3HlQ6tFMx/WnJ
	Vu+FFToUMOxhj7fzWh+L0dbj3b7X1xjnQRcgv6d2+NU0/Yvd0vlw+CbcCAvL7uF0/DN5
	xncSBJMWuaSANHuIcjIcrvCti2YIcfl/i0XSP1uQd+KclInBKrfNmdziblgrHpu4H0C8
	rYF9QVBjNT+fB8cL82aVdyke08YghddfIgYlFDQVQg+bGaxAImKWDn+SJffjtGu+cfPs
	zFoA==
X-Gm-Message-State: APjAAAUV3lvn+/s0yOOCB4SMxmfj+mJku1QVZ+x8iwkVTvDQs2NO8jo+
	M3OSOumg1GMhAnf7bHcdzGKz57iA7hsc4DaYrsU=
X-Google-Smtp-Source: APXvYqxFa3542MB+ZzIOVHQ3+RwFlQikDgxI+hw8L2Gz3w74xct2v3hZPH47qzxlKCa5Tb3+i/MAjm0pQT3O/ttyh0k=
X-Received: by 2002:a2e:9a49:: with SMTP id k9mr4281557ljj.78.1562896620625;
	Thu, 11 Jul 2019 18:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <CABPcKDN4vbbTzwjxtiV=7t6OGh9NKPbCz065BbGcUAvcUMgX1w@mail.gmail.com>
In-Reply-To: <CABPcKDN4vbbTzwjxtiV=7t6OGh9NKPbCz065BbGcUAvcUMgX1w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Jul 2019 21:56:49 -0400
Message-ID: <CADkTA4P7XCP0K8s_aYrEAdKu4_GvQs9DzCwesXAo1CXS9m3tng@mail.gmail.com>
To: =?UTF-8?B?Q2V2YXQgQm9zdGFuY8Sxb8SfbHU=?= <bostancioglucevat@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: runv compile error
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jul 2019 01:57:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2019 at 3:58 PM Cevat Bostanc=C4=B1o=C4=9Flu
<bostancioglucevat@gmail.com> wrote:
>
> Hi,
>
> meta-virtualization layer runv recipe problems as follows:
> 1. runv version is too old. since current runv recipe commit, they commit=
ed lots of features. i didn't analyzed e2e what they have done and what thi=
s commits brings us.
> 2. current runv cannot compiled for aarch64, x86 is fine.
>
> i have tried as follows:
> 1. i updated runv & hyperstart recipes commits to the latest and there is=
 a several issues occuring during compile time.
> 2. i have found why recipe is not compiling, i just have to create little=
 patch and it's ready to go.
>
> So, we can create a patch for current version of runv or i can create a p=
atch for update runv & compile-time errors for the new version.
>

runv is obsolete and is only around for reference. I'm working to
complete the work with kata containers, which is the replacement.

So while we could update it, and make it build, it really isn't of any use.

Bruce

> I didn't list the features since runv current commit. I just want to ask =
what is the strategy for this problem ?
>
> Current version aarch64 compile error:
> NOTE: Executing RunQueue Tasks
> ERROR: runv-0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677-r0 do_compi=
le: oe_runmake failed
> ERROR: runv-0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677-r0 do_compi=
le: Function failed: do_compile (log file is located at /home/cevat/Desktop=
/meta-virtualization-ci/yocto/build_arm/tmp/work/aarch64-poky-linux/runv/0.=
4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677-r0/temp/log.do_compile.1248=
3)
> ERROR: Logfile of failure stored in: /home/cevat/Desktop/meta-virtualizat=
ion-ci/yocto/build_arm/tmp/work/aarch64-poky-linux/runv/0.4.0+gitb360a686ab=
c6c6e896382990ef1b93ef07c7a677-r0/temp/log.do_compile.12483
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-64', 'arm-common', 'arm-64', '=
common-linux', 'common-glibc', 'aarch64-linux', 'common']
> | DEBUG: Executing shell function do_compile
> | fff
> | /home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/aar=
ch64-poky-linux/runv/0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677-r0/r=
unv-0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677
> | NOTE: make -j 8 build-runv
> | go build -tags "static_build  " -ldflags "-X main.gitCommit=3D`git desc=
ribe --dirty --always --tags 2> /dev/null || true` -X main.version=3D1.0.0"=
 -o runv ./cli/
> | # github.com/hyperhq/runv/hypervisor/qemu
> | src/import/vendor/src/github.com/hyperhq/runv/hypervisor/qemu/qemu.go:2=
93:22: too many arguments in call to newNetworkAddSession
> | have (*hypervisor.VmContext, *QemuContext, string, string, int, string,=
 string, int, int, chan hypervisor.VmEvent)
> | want (*hypervisor.VmContext, *QemuContext, string, int, string, string,=
 int, int, chan<- hypervisor.VmEvent)
> | Makefile:592: recipe for target 'build-runv' failed
> | make: *** [build-runv] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/cevat/=
Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/aarch64-poky-linux/=
runv/0.4.0+gitb360a686abc6c6e896382990ef1b93ef07c7a677-r0/temp/log.do_compi=
le.12483)
> ERROR: Task (/home/cevat/Desktop/meta-virtualization-ci/yocto/meta-virtua=
lization/recipes-core/runv/runv_git.bb:do_compile) failed with exit code '1=
'
> NOTE: Tasks Summary: Attempted 2404 tasks of which 2397 didn't need to be=
 rerun and 1 failed.
>
> Summary: 1 task failed:
>   /home/cevat/Desktop/meta-virtualization-ci/yocto/meta-virtualization/re=
cipes-core/runv/runv_git.bb:do_compile
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

