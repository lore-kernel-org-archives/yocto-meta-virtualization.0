Return-Path: <protect-me@macula.io>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97681E00A54; Fri, 26 Oct 2018 11:58:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.222.42 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
	[209.85.222.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8878E008E3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Oct 2018 11:58:46 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id j13so750165ual.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 Oct 2018 11:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=macula-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AllXGIUPmbc3mVF4g7ANout+NkUpuxsJsAgFgLnxy3g=;
	b=qHIFQqDJeiPD4PF/DGQjRwee027PmpGE6HkwL2PXeFYhzPVrWIQcmc/EFnxDfDeDe7
	7UXiS/tAPBofClGjONTGMBpbQ4R/dMJKjiGlIcBNqUAF3o5eSrwBNn4Ek2vohbe0kp7Q
	UCKVXf0HzjR6T3oVSaA6XJBUQ0vs3PGTGD4vh+yvj49u53eYIYCQNZe5WENLFr2RbXli
	JpdBEhRniSwE7dmkoWtZU9zYMSKe3d6L8hCyG47bpgmVM2+8N6Au9KNhkyd9yllMnBUC
	QyQ9bcLygsSWFbAM47pyjKrdfFNTOznzr/uuy0TgxVh7WF+YUnhGOXKsK3IZnrdHul+n
	6gIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AllXGIUPmbc3mVF4g7ANout+NkUpuxsJsAgFgLnxy3g=;
	b=mNccIRV3ZzacmOSvL09WYvfUXvjs60GMSvUNSci9PyxMhJ1i0QyGQcfZ0g/EmHPROA
	qn1PJh/o81VjihteZ+OT4zXY1q7HXr6gS2IMmSEgVmVNTRiwqjY/uXaojanZQqKBgBfn
	g83/HfRnUVH1sVCGRVz+2xd1TQwLn2bNHIqVj6diPJlEcQrF60c7Hf4UeDfxq5PDpGcF
	goEbrTWb5SX2S/d5wlAg/1AAPy0LtrlhmuzdAUYLRTtiQYzoFpIUHkZqZc/jSCS+rmtB
	ZDaDQQmiAxFYMddkFYM41NWMs/dfJsU9STfYP2PkLeVKbFmL2PMLIyaZnL2Xw6b5Ekq4
	LepA==
X-Gm-Message-State: AGRZ1gKIle0As6zm2MPiLiJJOeaHu0ih+eq99O8pasoVOxvQyBX2iVq6
	17DNdBay7Q3yAobhywVHcM+TpTplMFcwregwviqibQ==
X-Google-Smtp-Source: AJdET5d0/u2fqcmTIXahh44gVyok83PuPvEO6c5dn347kMKUlG0YOn49qwPyRHvLN/tuvqubRq6oMK7x77k4UvbVfJ0=
X-Received: by 2002:ab0:4812:: with SMTP id b18mr2228856uad.30.1540580325895; 
	Fri, 26 Oct 2018 11:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <CACJyUrFcBLUgCg0Hzx9vb7btuULWNqyzQ+jgJbRUhna9v_Vffw@mail.gmail.com>
	<CACJyUrGGgMF-kYr__2JcAkgJ8RDTSroF8MG-4Bega8h8akbT=A@mail.gmail.com>
	<CAPuovEKQh588Yho-SkvcHnb+6dXRE4rJ=c-ovC3mgvzVqWomUw@mail.gmail.com>
In-Reply-To: <CAPuovEKQh588Yho-SkvcHnb+6dXRE4rJ=c-ovC3mgvzVqWomUw@mail.gmail.com>
From: Dan Regalado <protect-me@macula.io>
Date: Fri, 26 Oct 2018 11:58:34 -0700
Message-ID: <CACJyUrGQdwi=1d4NuqBy4R79w11BPON6C3xsZBGn-mjmQnEroQ@mail.gmail.com>
To: mark.asselstine@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Failed to compile Xen 4.11.0 in krogoth branch
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
X-List-Received-Date: Fri, 26 Oct 2018 18:58:48 -0000
Content-Type: multipart/alternative; boundary="00000000000012c4f10579264f24"

--00000000000012c4f10579264f24
Content-Type: text/plain; charset="UTF-8"

Sounds good, thanks.

On Fri, Oct 26, 2018 at 8:17 AM Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> ELCE was this week so folks have/are travelling. I am sure Bruce will
> get this looked at and merged once he is able to give it a once over.
> On Thu, Oct 25, 2018 at 1:58 PM Dan Regalado <protect-me@macula.io> wrote:
> >
> > Anyone here?
> >
> > On Tue, Oct 23, 2018 at 2:36 PM Dan Regalado <protect-me@macula.io>
> wrote:
> >>
> >> Hi list,
> >>
> >> First off, thanks for your help.
> >> Previously I was able to compile Xen 4.10.0 using krogoth branch for
> Xilinx ZCU102 board and now I want to do the same but with version 4.11.0,
> using same branch so I added the .bb recipe based on below patch:
> >>
> >>
> https://lists.yoctoproject.org/pipermail/meta-virtualization/2018-July/003633.html
> >>
> >> But it is failing as follows:
> >>
> >> I think, the first ERROR related to LIC_FILES_CHKSUM can be easily
> fixed (I guess by putting the right hash in xen.inc)
> >>
> >> Loading cache: 100%
> |#######################################################################################################################################################################|
> ETA:  00:00:00
> >> Loaded 18 entries from dependency cache.
> >> Parsing recipes: 100%
> |#####################################################################################################################################################################|
> Time: 00:00:43
> >> Parsing of 1895 .bb files complete (17 cached, 1878 parsed). 2451
> targets, 143 skipped, 0 masked, 0 errors.
> >> NOTE: Resolving any missing task queue dependencies
> >>
> >> Build Configuration:
> >> BB_VERSION        = "1.30.0"
> >> BUILD_SYS         = "x86_64-linux"
> >> NATIVELSBSTRING   = "Ubuntu-16.04"
> >> TARGET_SYS        = "aarch64-poky-linux"
> >> MACHINE           = "zcu102-zynqmp"
> >> DISTRO            = "poky"
> >> DISTRO_VERSION    = "2.1.3"
> >> TUNE_FEATURES     = "aarch64"
> >> TARGET_FPU        = ""
> >> meta
> >> meta-poky
> >> meta-yocto-bsp    = "krogoth:444dc2e99b3c3967d9f83380c34bb99077a6ffa8"
> >> meta-oe
> >> meta-filesystems
> >> meta-python
> >> meta-networking   = "krogoth:55c8a76da5dc099a7bc3838495c672140cedb78e"
> >> meta-games        = "master:fd67a9749f2fbbc9c4dd3a3f0dbe3125c8e7456a"
> >> meta-virtualization = "krogoth:786a54c8cca6388247277573011e96986b23f528"
> >> meta-xilinx       = "krogoth:dcd1c218f943c3657b138cb05012c90c65f32a35"
> >>
> >> NOTE: Fetching uninative binary shim from
> http://downloads.yoctoproject.org/releases/uninative/1.0.1/x86_64-nativesdk-libc.tar.bz2;sha256sum=acf1e44a0ac2e855e81da6426197d36358bf7b4e88e552ef933128498c8910f8
> >> NOTE: Preparing RunQueue
> >> NOTE: Executing SetScene Tasks
> >> NOTE: Executing RunQueue Tasks
> >> WARNING: libmpc-native-1.0.3-r0 do_fetch: Failed to fetch URL
> http://www.multiprecision.org/mpc/download/mpc-1.0.3.tar.gz, attempting
> MIRRORS if available
> >> WARNING: bzip2-1.0.6-r5 do_fetch: Checksum mismatch for local file
> /home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz
> >> Cleaning and trying again.
> >> WARNING: bzip2-1.0.6-r5 do_fetch: Renaming
> /home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz to
> /home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz_bad-checksum_bb6639fad5666cfe31b46330395a3352
> >> WARNING: bzip2-1.0.6-r5 do_fetch: Checksum failure encountered with
> download of http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz - will attempt
> other sources if available
> >> WARNING: byacc-native-20150711-r0 do_fetch: Failed to fetch URL
> ftp://invisible-island.net/byacc/byacc-20150711.tgz, attempting MIRRORS
> if available
> >> WARNING: shadow-native-4.2.1-r0 do_fetch: Failed to fetch URL
> http://pkg-shadow.alioth.debian.org/releases/shadow-4.2.1.tar.xz,
> attempting MIRRORS if available
> >> WARNING: bash-completion-2.1-r0 do_fetch: Failed to fetch URL
> http://bash-completion.alioth.debian.org/files/bash-completion-2.1.tar.bz2,
> attempting MIRRORS if available
> >> WARNING: libmikmod-3.3.6-r0 do_fetch: Failed to fetch URL
> http://downloads.sourceforge.net/project/mikmod/libmikmod/3.3.6/libmikmod-3.3.6.tar.gz,
> attempting MIRRORS if available
> >> WARNING: python-setuptools-19.4-r0 do_fetch: Failed to fetch URL
> http://pypi.python.org/packages/source/s/setuptools/setuptools-19.4.tar.gz,
> attempting MIRRORS if available
> >> WARNING: coreutils-8.25-r0 do_fetch: Failed to fetch URL
> http://distfiles.gentoo.org/distfiles/coreutils-8.25-man.tar.xz;name=manpages,
> attempting MIRRORS if available
> >> ERROR: xen-4.11.0-r0 do_configure: QA Issue: xen: The LIC_FILES_CHKSUM
> does not match for file://COPYING;md5=a6260c12cd5de27e80d89ae18e48d20a
> >> xen: The new md5 checksum is bbb4b1bdc2c3b6743da3c39d03249095
> >> xen: Check if the license information has changed in
> /home/dux/xen/COPYING to verify that the LICENSE value "GPLv2" remains
> valid [license-checksum]
> >> ERROR: xen-4.11.0-r0 do_configure: Fatal QA errors found, failing task.
> >> ERROR: xen-4.11.0-r0 do_configure: Function failed: do_qa_configure
> >> ERROR: Logfile of failure stored in:
> /home/dux/Xilinx/poky/build/tmp/work/aarch64-poky-linux/xen/4.11.0-r0/temp/log.do_configure.28618
> >> ERROR: Task 255
> (/home/dux/Xilinx/poky/meta-virtualization/recipes-extended/xen/
> xen_4.11.0.bb, do_configure) failed with exit code '1'
> >> NOTE: Tasks Summary: Attempted 3137 tasks of which 9 didn't need to be
> rerun and 1 failed.
> >> Waiting for 0 running tasks to finish:
> >>
> >> Summary: 1 task failed:
> >>   /home/dux/Xilinx/poky/meta-virtualization/recipes-extended/xen/
> xen_4.11.0.bb, do_configure
> >> Summary: There were 11 WARNING messages shown.
> >> Summary: There were 3 ERROR messages shown, returning a non-zero exit
> code.
> >>
> >> Any help would be greatly appreciated.
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--00000000000012c4f10579264f24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sounds good, thanks.=C2=A0<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr">On Fri, Oct 26, 2018 at 8:17 AM Mark Asselstine &=
lt;<a href=3D"mailto:mark.asselstine@windriver.com">mark.asselstine@windriv=
er.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">ELCE was this=
 week so folks have/are travelling. I am sure Bruce will<br>
get this looked at and merged once he is able to give it a once over.<br>
On Thu, Oct 25, 2018 at 1:58 PM Dan Regalado &lt;<a href=3D"mailto:protect-=
me@macula.io" target=3D"_blank">protect-me@macula.io</a>&gt; wrote:<br>
&gt;<br>
&gt; Anyone here?<br>
&gt;<br>
&gt; On Tue, Oct 23, 2018 at 2:36 PM Dan Regalado &lt;<a href=3D"mailto:pro=
tect-me@macula.io" target=3D"_blank">protect-me@macula.io</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; Hi list,<br>
&gt;&gt;<br>
&gt;&gt; First off, thanks for your help.<br>
&gt;&gt; Previously I was able to compile Xen 4.10.0 using krogoth branch f=
or Xilinx ZCU102 board and now I want to do the same but with version 4.11.=
0, using same branch so I added the .bb recipe based on below patch:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://lists.yoctoproject.org/pipermail/meta-virtualiz=
ation/2018-July/003633.html" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.yoctoproject.org/pipermail/meta-virtualization/2018-July/003633.html</=
a><br>
&gt;&gt;<br>
&gt;&gt; But it is failing as follows:<br>
&gt;&gt;<br>
&gt;&gt; I think, the first ERROR related to LIC_FILES_CHKSUM can be easily=
 fixed (I guess by putting the right hash in xen.inc)<br>
&gt;&gt;<br>
&gt;&gt; Loading cache: 100% |#############################################=
###########################################################################=
###############################################| ETA:=C2=A0 00:00:00<br>
&gt;&gt; Loaded 18 entries from dependency cache.<br>
&gt;&gt; Parsing recipes: 100% |###########################################=
###########################################################################=
###############################################| Time: 00:00:43<br>
&gt;&gt; Parsing of 1895 .bb files complete (17 cached, 1878 parsed). 2451 =
targets, 143 skipped, 0 masked, 0 errors.<br>
&gt;&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt;&gt;<br>
&gt;&gt; Build Configuration:<br>
&gt;&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.30.0&quot;<br>
&gt;&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&=
quot;<br>
&gt;&gt; NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;Ubuntu-16.04&quot;<br>
&gt;&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;aarch64-poky-linux=
&quot;<br>
&gt;&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;zcu102-z=
ynqmp&quot;<br>
&gt;&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;poky&quo=
t;<br>
&gt;&gt; DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;2.1.3&quot;<br>
&gt;&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;aarch64&quot;<br>
&gt;&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&quot;<br>
&gt;&gt; meta<br>
&gt;&gt; meta-poky<br>
&gt;&gt; meta-yocto-bsp=C2=A0 =C2=A0 =3D &quot;krogoth:444dc2e99b3c3967d9f8=
3380c34bb99077a6ffa8&quot;<br>
&gt;&gt; meta-oe<br>
&gt;&gt; meta-filesystems<br>
&gt;&gt; meta-python<br>
&gt;&gt; meta-networking=C2=A0 =C2=A0=3D &quot;krogoth:55c8a76da5dc099a7bc3=
838495c672140cedb78e&quot;<br>
&gt;&gt; meta-games=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:fd67a9749f2=
fbbc9c4dd3a3f0dbe3125c8e7456a&quot;<br>
&gt;&gt; meta-virtualization =3D &quot;krogoth:786a54c8cca6388247277573011e=
96986b23f528&quot;<br>
&gt;&gt; meta-xilinx=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;krogoth:dcd1c218f9=
43c3657b138cb05012c90c65f32a35&quot;<br>
&gt;&gt;<br>
&gt;&gt; NOTE: Fetching uninative binary shim from <a href=3D"http://downlo=
ads.yoctoproject.org/releases/uninative/1.0.1/x86_64-nativesdk-libc.tar.bz2=
;sha256sum=3Dacf1e44a0ac2e855e81da6426197d36358bf7b4e88e552ef933128498c8910=
f8" rel=3D"noreferrer" target=3D"_blank">http://downloads.yoctoproject.org/=
releases/uninative/1.0.1/x86_64-nativesdk-libc.tar.bz2;sha256sum=3Dacf1e44a=
0ac2e855e81da6426197d36358bf7b4e88e552ef933128498c8910f8</a><br>
&gt;&gt; NOTE: Preparing RunQueue<br>
&gt;&gt; NOTE: Executing SetScene Tasks<br>
&gt;&gt; NOTE: Executing RunQueue Tasks<br>
&gt;&gt; WARNING: libmpc-native-1.0.3-r0 do_fetch: Failed to fetch URL <a h=
ref=3D"http://www.multiprecision.org/mpc/download/mpc-1.0.3.tar.gz" rel=3D"=
noreferrer" target=3D"_blank">http://www.multiprecision.org/mpc/download/mp=
c-1.0.3.tar.gz</a>, attempting MIRRORS if available<br>
&gt;&gt; WARNING: bzip2-1.0.6-r5 do_fetch: Checksum mismatch for local file=
 /home/dux/Xilinx/poky/build/downloads/bzip2-1.0.6.tar.gz<br>
&gt;&gt; Cleaning and trying again.<br>
&gt;&gt; WARNING: bzip2-1.0.6-r5 do_fetch: Renaming /home/dux/Xilinx/poky/b=
uild/downloads/bzip2-1.0.6.tar.gz to /home/dux/Xilinx/poky/build/downloads/=
bzip2-1.0.6.tar.gz_bad-checksum_bb6639fad5666cfe31b46330395a3352<br>
&gt;&gt; WARNING: bzip2-1.0.6-r5 do_fetch: Checksum failure encountered wit=
h download of <a href=3D"http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz" rel=
=3D"noreferrer" target=3D"_blank">http://www.bzip.org/1.0.6/bzip2-1.0.6.tar=
.gz</a> - will attempt other sources if available<br>
&gt;&gt; WARNING: byacc-native-20150711-r0 do_fetch: Failed to fetch URL <a=
 href=3D"ftp://invisible-island.net/byacc/byacc-20150711.tgz" rel=3D"norefe=
rrer" target=3D"_blank">ftp://invisible-island.net/byacc/byacc-20150711.tgz=
</a>, attempting MIRRORS if available<br>
&gt;&gt; WARNING: shadow-native-4.2.1-r0 do_fetch: Failed to fetch URL <a h=
ref=3D"http://pkg-shadow.alioth.debian.org/releases/shadow-4.2.1.tar.xz" re=
l=3D"noreferrer" target=3D"_blank">http://pkg-shadow.alioth.debian.org/rele=
ases/shadow-4.2.1.tar.xz</a>, attempting MIRRORS if available<br>
&gt;&gt; WARNING: bash-completion-2.1-r0 do_fetch: Failed to fetch URL <a h=
ref=3D"http://bash-completion.alioth.debian.org/files/bash-completion-2.1.t=
ar.bz2" rel=3D"noreferrer" target=3D"_blank">http://bash-completion.alioth.=
debian.org/files/bash-completion-2.1.tar.bz2</a>, attempting MIRRORS if ava=
ilable<br>
&gt;&gt; WARNING: libmikmod-3.3.6-r0 do_fetch: Failed to fetch URL <a href=
=3D"http://downloads.sourceforge.net/project/mikmod/libmikmod/3.3.6/libmikm=
od-3.3.6.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://downloads.sour=
ceforge.net/project/mikmod/libmikmod/3.3.6/libmikmod-3.3.6.tar.gz</a>, atte=
mpting MIRRORS if available<br>
&gt;&gt; WARNING: python-setuptools-19.4-r0 do_fetch: Failed to fetch URL <=
a href=3D"http://pypi.python.org/packages/source/s/setuptools/setuptools-19=
.4.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://pypi.python.org/pack=
ages/source/s/setuptools/setuptools-19.4.tar.gz</a>, attempting MIRRORS if =
available<br>
&gt;&gt; WARNING: coreutils-8.25-r0 do_fetch: Failed to fetch URL <a href=
=3D"http://distfiles.gentoo.org/distfiles/coreutils-8.25-man.tar.xz;name=3D=
manpages" rel=3D"noreferrer" target=3D"_blank">http://distfiles.gentoo.org/=
distfiles/coreutils-8.25-man.tar.xz;name=3Dmanpages</a>, attempting MIRRORS=
 if available<br>
&gt;&gt; ERROR: xen-4.11.0-r0 do_configure: QA Issue: xen: The LIC_FILES_CH=
KSUM does not match for file://COPYING;md5=3Da6260c12cd5de27e80d89ae18e48d2=
0a<br>
&gt;&gt; xen: The new md5 checksum is bbb4b1bdc2c3b6743da3c39d03249095<br>
&gt;&gt; xen: Check if the license information has changed in /home/dux/xen=
/COPYING to verify that the LICENSE value &quot;GPLv2&quot; remains valid [=
license-checksum]<br>
&gt;&gt; ERROR: xen-4.11.0-r0 do_configure: Fatal QA errors found, failing =
task.<br>
&gt;&gt; ERROR: xen-4.11.0-r0 do_configure: Function failed: do_qa_configur=
e<br>
&gt;&gt; ERROR: Logfile of failure stored in: /home/dux/Xilinx/poky/build/t=
mp/work/aarch64-poky-linux/xen/4.11.0-r0/temp/log.do_configure.28618<br>
&gt;&gt; ERROR: Task 255 (/home/dux/Xilinx/poky/meta-virtualization/recipes=
-extended/xen/<a href=3D"http://xen_4.11.0.bb" rel=3D"noreferrer" target=3D=
"_blank">xen_4.11.0.bb</a>, do_configure) failed with exit code &#39;1&#39;=
<br>
&gt;&gt; NOTE: Tasks Summary: Attempted 3137 tasks of which 9 didn&#39;t ne=
ed to be rerun and 1 failed.<br>
&gt;&gt; Waiting for 0 running tasks to finish:<br>
&gt;&gt;<br>
&gt;&gt; Summary: 1 task failed:<br>
&gt;&gt;=C2=A0 =C2=A0/home/dux/Xilinx/poky/meta-virtualization/recipes-exte=
nded/xen/<a href=3D"http://xen_4.11.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">xen_4.11.0.bb</a>, do_configure<br>
&gt;&gt; Summary: There were 11 WARNING messages shown.<br>
&gt;&gt; Summary: There were 3 ERROR messages shown, returning a non-zero e=
xit code.<br>
&gt;&gt;<br>
&gt;&gt; Any help would be greatly appreciated.<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_bla=
nk">meta-virtualization@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listi=
nfo/meta-virtualization</a><br>
</blockquote></div>

--00000000000012c4f10579264f24--
