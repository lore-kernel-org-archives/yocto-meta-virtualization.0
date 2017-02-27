Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 900ABE00970; Sun, 26 Feb 2017 16:59:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f180.google.com (mail-yb0-f180.google.com
	[209.85.213.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 586BCE00874
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 Feb 2017 16:59:19 -0800 (PST)
Received: by mail-yb0-f180.google.com with SMTP id d88so15753788ybi.0
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 Feb 2017 16:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=FMIAxlqUlxqh/Nfjc6kvnUXMR1nT8r0EFlpL+IaHcqE=;
	b=DoTIQgfdr4Ho25pve0Ngy2kOvFxsEg/1WioJnmga+5BXQCxxFLPNihcFGyIhuNZZ0Q
	AyGBCte5gxjL8Thsexvui82HteWWdb5MtV/fq7UtnxAwQK6PMavmvyotCq7AscCatvmU
	zYL8USsZHFxILXEmgq54l4LleI0NhpsyDQMNNx5r77LGlTrwvb9zhvGIhRX5tuH8a7vw
	WEtLtpeUNfqD9UpiMaauKbRMP8GSYfmBwS750nK2C12/UoxN4hkZnh1Kb3u4F5UDydXY
	98jy5jPphWeogFyTbgxBdztnHRpqCwRr845OhrinxPxhutQdn0CmldOYfy/Ojg+PY7Sr
	uBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=FMIAxlqUlxqh/Nfjc6kvnUXMR1nT8r0EFlpL+IaHcqE=;
	b=UkkcYH/cBFHCByUZ65FJ0ZPLeesU52OnoKVtDA2j2LRAMONaHWfjD5cXfXVberx0IE
	hc+jzJn/5yd+tulh/HclhlwETS4BLHQdeTr9/LpFth2Facu8eCIfPnQnqF1rIEcx86+P
	IU9gQFC/DuuXqlm0onxKkAsapZOPxby3S6Q7jQ5QQKc7USg4cYPATsE7fG7C/kx6fpG7
	n9lVu8dyY5kKxMtCiF/AxhgFod6S6r03DUTieKyHcCjKfnFxN7TQuIXdsgoRl3NGaOKV
	F/YUyp0s3mzwIfb9CGLJ3q+VKORfDJhLnzU8qF4YgCs2yVyeHRbChpqRXrbN9QVn9iNc
	TVrg==
X-Gm-Message-State: AMke39lyUOh/L2VPy5l55TR4hevSoS31lz9C4ZtfjMYSn7hjOw9HVTq3jz3xJnrR85xvcX4EcOnEXIJUM1kRPQ==
X-Received: by 10.37.44.22 with SMTP id s22mr2015469ybs.115.1488157158518;
	Sun, 26 Feb 2017 16:59:18 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.174.74 with HTTP; Sun, 26 Feb 2017 16:59:18 -0800 (PST)
In-Reply-To: <cc3dc371bff6438ea13431dfe77b2531@SVR-IES-MBX-04.mgc.mentorg.com>
References: <cc3dc371bff6438ea13431dfe77b2531@SVR-IES-MBX-04.mgc.mentorg.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Sun, 26 Feb 2017 19:59:18 -0500
X-Google-Sender-Auth: qH-CMT7KVj-vbtfTrU_4nakXgIA
Message-ID: <CAPuovELn54FBCEv12XCQ9xvxvmrWBFUwBYNJJHGcY0E8Z45pLg@mail.gmail.com>
To: "Sheheryar, Muhammad" <Muhammad_Sheheryar@mentor.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Building docker
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
X-List-Received-Date: Mon, 27 Feb 2017 00:59:22 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 22, 2017 at 2:53 AM, Sheheryar, Muhammad
<Muhammad_Sheheryar@mentor.com> wrote:
> Hi Peter,
>
> Thanks for getting back. I am receiving the following error when trying to
> build docker
>
> ERROR: Function failed: do_compile (log file is located at
> /var/mshehery/Documents/git/new_fido/poky/build/tmp/work/x86_64-poky-linux/golang-cross/1.3-r0/temp/log.do_compile.4734)
> ERROR: Logfile of failure stored in:
> /var/mshehery/Documents/git/new_fido/poky/build/tmp/work/x86_64-poky-linux/golang-cross/1.3-r0/temp/log.do_compile.4734
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | GOARCH i586
> | CC_FOR_TARGET gcc
> | + set -e
> | + [ ! -f run.bash ]
> | + uname
> | + ld --version
> | + grep gold.* 2\.20
> | + [ -d /selinux -a -f /selinux/booleans/allow_execstack -a -x
> /usr/sbin/selinuxenabled ]
> | + [ -d /sys/fs/selinux -a -f /sys/fs/selinux/booleans/allow_execstack -a
> -x /usr/sbin/selinuxenabled ]
> | + uname -s
> | + [ Linux == GNU/kFreeBSD ]
> | ./make.bash: 104: [: Linux: unexpected operator

What OS and version as you using as the build host?

Regards,
Mark

> | + rm -f ./pkg/runtime/runtime_defs.go
> | + echo # Building C bootstrap tool.
> | # Building C bootstrap tool.
> | + echo cmd/dist
> | cmd/dist
> | + cd ..
> | + pwd
> | + export
> GOROOT=/var/mshehery/Documents/git/new_fido/poky/build/tmp/work/x86_64-poky-linux/golang-cross/1.3-r0/go
> | +
> GOROOT_FINAL=/var/mshehery/Documents/git/new_fido/poky/build/tmp/sysroots/x86_64-linux/usr/lib/i586-poky-linux/go
> | +
> DEFGOROOT=-DGOROOT_FINAL="/var/mshehery/Documents/git/new_fido/poky/build/tmp/sysroots/x86_64-linux/usr/lib/i586-poky-linux/go"
> | + mflag=
> | + uname
> | + [ Linux == Darwin ]
> | ./make.bash: 124: [: Linux: unexpected operator
> | + type -t gcc
> | + type -t clang
> | + [ -z gcc  -a -z -t: not found
> | gcc is /usr/bin/gcc -a -n -t: not found
> | clang: not found ]
> | + gcc -O2 -Wall -Werror -o cmd/dist/dist -Icmd/dist
> -DGOROOT_FINAL="/var/mshehery/Documents/git/new_fido/poky/build/tmp/sysroots/x86_64-linux/usr/lib/i586-poky-linux/go"
> cmd/dist/arm.c cmd/dist/buf.c cmd/dist/build.c cmd/dist/buildgc.c
> cmd/dist/buildgo.c cmd/dist/buildruntime.c cmd/dist/goc2c.c cmd/dist/main.c
> cmd/dist/plan9.c cmd/dist/unix.c cmd/dist/windows.c
> | + ./cmd/dist/dist env -p
> | go tool dist: unknown $GOARCH i586
> | + echo FAIL=true
> | + eval FAIL=true
> | + FAIL=true
> | + [ true = true ]
> | + exit 1
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> /var/mshehery/Documents/git/new_fido/poky/build/tmp/work/x86_64-poky-linux/golang-cross/1.3-r0/temp/log.do_compile.4734)
> ERROR: Task 104
> (/var/mshehery/Documents/git/new_fido/poky/meta-virtualization/recipes-devtools/go/golang-cross_1.3.bb,
> do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1617 tasks of which 1486 didn't need to be
> rerun and 1 failed.
> Waiting for 0 running tasks to finish:
>
> Summary: 1 task failed:
>
> /var/mshehery/Documents/git/new_fido/poky/meta-virtualization/recipes-devtools/go/golang-cross_1.3.bb,
> do_compile
> Summary: There were 2 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
> Regards,
>
> Muhammad Sheheryar Qureshi
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

