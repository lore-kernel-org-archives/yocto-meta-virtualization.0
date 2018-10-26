Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C0BCE00A54; Fri, 26 Oct 2018 08:17:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.50 listed in list.dnswl.org]
Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com
	[209.85.161.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06337E0097C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Oct 2018 08:17:39 -0700 (PDT)
Received: by mail-yw1-f50.google.com with SMTP id d126-v6so596511ywa.5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Oct 2018 08:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc;
	bh=m5QW7P4myhqOdsOJR71vprRreIa5sRibgAsFZ0/f9og=;
	b=qzuEN1IQYwajfxzQLRUSVu+Q+Y3Xn2J/tzTCriI0ZDhoqfK2bDwY1BXKSCHgF9MYAe
	scICzKfPvCgAjztKPFSfUYubYrlYYEacxhkRHhaEc6zL5bJu0sCAeTTDwPeVVNz1QHhD
	gdmv65tLIXTLLZv2S39cNMWAZ+roqs0ka7y9qbtir4NbmDnRC1zEvP84HNocJgkc1/iC
	5HWoT6VO3bS3CX2q05TDcopDOTK7vE6UDibYvGDt+5iWU5pz4RoLTTS/DmtctzStMiuK
	+OBTrxolQjWmJP2gqCQ1A3q0zqHCjqSAsl4Ts0wL3ogdqVLkjI8ZoHrBcjHAci4u4S8a
	jUbQ==
X-Gm-Message-State: AGRZ1gJl7CZ+M6uXfPsLPHgSB9ihjzIr8WMTgyjbggtxqa4XLqAUQ2Za
	G/h9p3UMGfRwZFoh5hMvahNTWDztlAdh731TLDY=
X-Google-Smtp-Source: AJdET5eYDOFZZLH7JJKRpabQeLoZekHCX/aIk09JIj9w0R4SN9A+/XNcrTyMweT4IewcUsp4owZl6BhKNoTerDj+okI=
X-Received: by 2002:a81:9211:: with SMTP id
	j17-v6mr3870023ywg.259.1540567058994; 
	Fri, 26 Oct 2018 08:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <CACJyUrFcBLUgCg0Hzx9vb7btuULWNqyzQ+jgJbRUhna9v_Vffw@mail.gmail.com>
	<CACJyUrGGgMF-kYr__2JcAkgJ8RDTSroF8MG-4Bega8h8akbT=A@mail.gmail.com>
In-Reply-To: <CACJyUrGGgMF-kYr__2JcAkgJ8RDTSroF8MG-4Bega8h8akbT=A@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 26 Oct 2018 11:17:27 -0400
Message-ID: <CAPuovEKQh588Yho-SkvcHnb+6dXRE4rJ=c-ovC3mgvzVqWomUw@mail.gmail.com>
To: protect-me@macula.io
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Failed to compile Xen 4.11.0 in krogoth branch
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2018 15:17:41 -0000
Content-Type: text/plain; charset="UTF-8"

ELCE was this week so folks have/are travelling. I am sure Bruce will
get this looked at and merged once he is able to give it a once over.
On Thu, Oct 25, 2018 at 1:58 PM Dan Regalado <protect-me@macula.io> wrote:
>
> Anyone here?
>
> On Tue, Oct 23, 2018 at 2:36 PM Dan Regalado <protect-me@macula.io> wrote:
>>
>> Hi list,
>>
>> First off, thanks for your help.
>> Previously I was able to compile Xen 4.10.0 using krogoth branch for Xilinx ZCU102 board and now I want to do the same but with version 4.11.0, using same branch so I added the .bb recipe based on below patch:
>>
>> https://lists.yoctoproject.org/pipermail/meta-virtualization/2018-July/003633.html
>>
>> But it is failing as follows:
>>
>> I think, the first ERROR related to LIC_FILES_CHKSUM can be easily fixed (I guess by putting the right hash in xen.inc)
>>
>> Loading cache: 100% |#######################################################################################################################################################################| ETA:  00:00:00
>> Loaded 18 entries from dependency cache.
>> Parsing recipes: 100% |#####################################################################################################################################################################| Time: 00:00:43
>> Parsing of 1895 .bb files complete (17 cached, 1878 parsed). 2451 targets, 143 skipped, 0 masked, 0 errors.
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION        = "1.30.0"
>> BUILD_SYS         = "x86_64-linux"
>> NATIVELSBSTRING   = "Ubuntu-16.04"
>> TARGET_SYS        = "aarch64-poky-linux"
>> MACHINE           = "zcu102-zynqmp"
>> DISTRO            = "poky"
>> DISTRO_VERSION    = "2.1.3"
>> TUNE_FEATURES     = "aarch64"
>> TARGET_FPU        = ""
>> meta
>> meta-poky
>> meta-yocto-bsp    = "krogoth:444dc2e99b3c3967d9f83380c34bb99077a6ffa8"
>> meta-oe
>> meta-filesystems
>> meta-python
>> meta-networking   = "krogoth:55c8a76da5dc099a7bc3838495c672140cedb78e"
>> meta-games        = "master:fd67a9749f2fbbc9c4dd3a3f0dbe3125c8e7456a"
>> meta-virtualization = "krogoth:786a54c8cca6388247277573011e96986b23f528"
>> meta-xilinx       = "krogoth:dcd1c218f943c3657b138cb05012c90c65f32a35"
>>
>> NOTE: Fetching uninative binary shim from http://downloads.yoctoproject.org/releases/uninative/1.0.1/x86_64-nativesdk-libc.tar.bz2;sha256sum=acf1e44a0ac2e855e81da6426197d36358bf7b4e88e552ef933128498c8910f8
>> NOTE: Preparing RunQueue
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> WARNING: libmpc-native-1.0.3-r0 do_fetch: Failed to fetch URL http://www.multiprecision.org/mpc/download/mpc-1.0.3.tar.gz, attempting MIRRORS if available
>> WARNING: bzip2-1.0.6-r5 do_fetch: Checksum mismatch for local file /home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz
>> Cleaning and trying again.
>> WARNING: bzip2-1.0.6-r5 do_fetch: Renaming /home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz to /home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz_bad-checksum_bb6639fad5666cfe31b46330395a3352
>> WARNING: bzip2-1.0.6-r5 do_fetch: Checksum failure encountered with download of http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz - will attempt other sources if available
>> WARNING: byacc-native-20150711-r0 do_fetch: Failed to fetch URL ftp://invisible-island.net/byacc/byacc-20150711.tgz, attempting MIRRORS if available
>> WARNING: shadow-native-4.2.1-r0 do_fetch: Failed to fetch URL http://pkg-shadow.alioth.debian.org/releases/shadow-4.2.1.tar.xz, attempting MIRRORS if available
>> WARNING: bash-completion-2.1-r0 do_fetch: Failed to fetch URL http://bash-completion.alioth.debian.org/files/bash-completion-2.1.tar.bz2, attempting MIRRORS if available
>> WARNING: libmikmod-3.3.6-r0 do_fetch: Failed to fetch URL http://downloads.sourceforge.net/project/mikmod/libmikmod/3.3.6/libmikmod-3.3.6.tar.gz, attempting MIRRORS if available
>> WARNING: python-setuptools-19.4-r0 do_fetch: Failed to fetch URL http://pypi.python.org/packages/source/s/setuptools/setuptools-19.4.tar.gz, attempting MIRRORS if available
>> WARNING: coreutils-8.25-r0 do_fetch: Failed to fetch URL http://distfiles.gentoo.org/distfiles/coreutils-8.25-man.tar.xz;name=manpages, attempting MIRRORS if available
>> ERROR: xen-4.11.0-r0 do_configure: QA Issue: xen: The LIC_FILES_CHKSUM does not match for file://COPYING;md5=a6260c12cd5de27e80d89ae18e48d20a
>> xen: The new md5 checksum is bbb4b1bdc2c3b6743da3c39d03249095
>> xen: Check if the license information has changed in /home/dux/xen/COPYING to verify that the LICENSE value "GPLv2" remains valid [license-checksum]
>> ERROR: xen-4.11.0-r0 do_configure: Fatal QA errors found, failing task.
>> ERROR: xen-4.11.0-r0 do_configure: Function failed: do_qa_configure
>> ERROR: Logfile of failure stored in: /home/dux/Xilinx/poky/build/tmp/work/aarch64-poky-linux/xen/4.11.0-r0/temp/log.do_configure.28618
>> ERROR: Task 255 (/home/dux/Xilinx/poky/meta-virtualization/recipes-extended/xen/xen_4.11.0.bb, do_configure) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 3137 tasks of which 9 didn't need to be rerun and 1 failed.
>> Waiting for 0 running tasks to finish:
>>
>> Summary: 1 task failed:
>>   /home/dux/Xilinx/poky/meta-virtualization/recipes-extended/xen/xen_4.11.0.bb, do_configure
>> Summary: There were 11 WARNING messages shown.
>> Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
>>
>> Any help would be greatly appreciated.
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

