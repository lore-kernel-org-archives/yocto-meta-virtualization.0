Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D829E00BEC; Mon,  9 Apr 2018 07:19:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8E83E009E2
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Apr 2018 07:19:36 -0700 (PDT)
Received: by mail-lf0-f41.google.com with SMTP id q5-v6so6828139lff.12
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Apr 2018 07:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jbOyuDpTJAcDd77ZNsQWhSdkafhSiDuMpYwr0xUzyho=;
	b=gOhpYar0sOSkRmjFkc09phvRmL7EZabVcfMCV2LS8Si/BSmYfQORW/jILS64xwaOH9
	oYsN6cx00qxpTdjPsgajS4UYpE49G4J8Z1T2kI0L3bj6eXZ5IzsJ4xmaVNCD5NPZqf2V
	4sQON4U5P6LIMLydayCTmmUqVTRnBKV8asW2//a0ocEg9elhV9/uHij7xc4CgSdzu3A+
	7AMT4jwUOMf9B6gttDM+EyiqjMY7vxGHtWjHYTyvkgp4hd7GKXvQABRz5nxgUjGjXCQH
	MUerOrtDlWoIFzVlqenzGlMdkYjzJVDlJ4iHS2mL78P0CY95wdqvM3EvhZtGAKP2XjXa
	07sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jbOyuDpTJAcDd77ZNsQWhSdkafhSiDuMpYwr0xUzyho=;
	b=GTIOeeJx+FtBMzm0lkSbtu86lsUMcUGv27THtKibWZFL29iTcokUeKyH+hBpxD6gHH
	+x3D2FBIe3f+Z6MaVzUbThWscyPZu+8JZJQnJ7BqhXlfW3ExtOjhMsDhBSIwA9dLK8Fn
	dEiF/sK8AnC3zyfzRUfCO/SzexrPeWX+t1MdqWKI7TyfXAK/BPONgER0Obz5/BrQfUvd
	LDLtc8fNTyHOubtAfXvM2jzSY1DDDDGnxZT1or0xAmjVEUcwdaFzc5BTNrSStBlX16gg
	o6hrRM6ksYQJ7VjwKZwCfymFY+6S0TNgu0p6cT6yUV28lVa1anqDOHBgVNCa9b0nv0H+
	pCsA==
X-Gm-Message-State: ALQs6tAOnEfLPk5MBmkntoodoV02j0HsQDAqRohGvxIiOsTQV+hPnfeZ
	wYrprmlLGb+qXekoZHN/TdKXxu27gmA7OcqVFO8=
X-Google-Smtp-Source: AIpwx4+IJPV+FZcwqpxKQHADyW1CMM2MWGDSYKgwtC2pSBPgsBhBabZb/Aw0COSUjD0k0xqqcUmGgBROGPu0+RYN05w=
X-Received: by 10.46.128.84 with SMTP id p20mr13055542ljg.12.1523283575274;
	Mon, 09 Apr 2018 07:19:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Mon, 9 Apr 2018 07:19:34 -0700 (PDT)
In-Reply-To: <9C4CF537-DB0C-4C22-96DF-A79DA65B7091@cisco.com>
References: <CADkTA4OCesBQoAPuUOtBB=kzZ38hwH0HNVY=d68ciBe8Fsrp4A@mail.gmail.com>
	<7209206599d5475fae12e84333947025@xch-rcd-011.cisco.com>
	<CADkTA4NkaZfVjiKe64s8ZEgt2UsJ4LOZCm2m8fDPZkYVAPGg9w@mail.gmail.com>
	<e042d783b2f34993b6db371c8ff1760f@xch-rcd-011.cisco.com>
	<CADkTA4NCE2QnnkvA7+0FUYG3Wf=Y73moeU8e5rQMCzAB-_V1OQ@mail.gmail.com>
	<3fd5560f842540be9fbead290ade1792@xch-rcd-011.cisco.com>
	<CADkTA4MDXyUDJGOkQec9d1y7JpsOPuKKx5VxhWbhYQGqXMVawA@mail.gmail.com>
	<af590e1be5cf41549bd49691863a771a@xch-rcd-011.cisco.com>
	<CADkTA4OfAKVShbu-QhDrGHJ6uQq5PgeOGfgME5OBJ5ZK_ZBzBg@mail.gmail.com>
	<b321979b614d4630bd92560bf0fd9e25@xch-rcd-011.cisco.com>
	<CADkTA4McoWz0iMWooUVCn95qO0gehncohOQ6By3BH9XaaK6ExQ@mail.gmail.com>
	<CE646EA6-325A-4C20-A677-8EF24F2175AE@cisco.com>
	<CADkTA4Nh=V0kbaXpr4aP5jYjN9YNYoeaAxonh_Oko-t4c277SQ@mail.gmail.com>
	<9C4CF537-DB0C-4C22-96DF-A79DA65B7091@cisco.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Apr 2018 10:19:34 -0400
Message-ID: <CADkTA4OHWEaqR2MkuXHjfL5Fn7vYNOV6AqTSCzyU_gT1_dVRzw@mail.gmail.com>
To: "Shakthi Pradeep (tpradeep)" <tpradeep@cisco.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: RFT/FYI: docker/containerd/runc uprevs pushed to master
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
X-List-Received-Date: Mon, 09 Apr 2018 14:19:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure, but none of them are docker.

Bruce

On Mon, Apr 9, 2018 at 9:46 AM, Shakthi Pradeep (tpradeep)
<tpradeep@cisco.com> wrote:
> Hello Bruce,
>
> I see pkg_postinst_${PN}() are part of below recipes=E2=80=A6.
>
> TPRADEEP-M-91HW:meta-virtualization tpradeep$ grep -r postinst *
> recipes-containers/singularity/singularity_git.bb:pkg_postinst_${PN}() {
> recipes-containers/lxc/lxc_2.0.8.bb:pkg_postinst_${PN}() {
> recipes-containers/lxc/lxc_2.0.8.bb:pkg_postinst_${PN}-networking() {
> recipes-extended/xen/xen.inc:pkg_postinst_${PN}-volatiles() {
> recipes-extended/libvirt/libvirt_1.3.5.bb:pkg_postinst_libvirt() {
> recipes-networking/openvswitch/openvswitch.inc:# rdeps.  E.g. ovs-pki cal=
ls sed in the postinstall.  sed may be
> recipes-networking/openvswitch/openvswitch.inc:pkg_postinst_${PN}-pki () =
{
> recipes-networking/openvswitch/openvswitch.inc:pkg_postinst_${PN}-testcon=
troller () {
>
> Regards,
> Shakthi
>
> On 09/04/18, 6:47 PM, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>
>     On Mon, Apr 9, 2018 at 4:37 AM, Shakthi Pradeep (tpradeep)
>     <tpradeep@cisco.com> wrote:
>     > Hello Bruce,
>     >
>     > Moved to master branch of Yocto. When I build I am getting below er=
ror. What does this mean?
>
>     There were changes made to the way that postinstall scripts were run
>     in the January
>     timeframe,
>
>     i.e.:
>
>      commit 7bc55b29609765904af9f330600229e96cc044cf
>     Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>     Date:   Mon Jan 29 14:01:32 2018 +0200
>
>         meta/lib/oe/package_manager.py: deprecate 'exit 1' as a way to
>     defer to first boot
>
>         'exit 1' is not optimal for two reasons:
>
>         1) Code is hard to read; it is not obvious that it means 'defer
>     what follows to first boot'.
>         2) Worse, this hides actual errors in the scriptlets; there is no
>     difference between scriptlet
>         failing because it's intended to be run on target and scriptlet
>     failing because there's a bug or
>         a regression somewhere.
>
>         The new, supported way is to place the code that has to run on
>     target into pkg_postinst_ontarget(),
>         or, if a more fine-tuned control is required, call
>     'postinst-intercepts defer_to_first_boot' from
>         pkg_postinst() to explicitly request deferral to first boot.
>
>         (From OE-Core rev: d12cf56e9ff2a4f13dfbef9290ea5647b52b3f6d)
>
>         Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.c=
om>
>         Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org=
>
>
>     :100644 100644 2a07f0e39ad6... f7e013437c91... M
>     meta/lib/oe/package_manager.py
>
>     commit 6ca669105ff7f405e85142d1aa5375a8430c9606
>     Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>     Date:   Mon Jan 29 14:01:31 2018 +0200
>
>         package.bbclass: add support for pkg_postinst_ontarget()
>
>         This function is a convenient and more readable shortcut for situ=
ations
>         when the postinst code always needs to run on target. All command=
s that
>         cannot be executed during cross-install and can only be run on ta=
rget
>         should go into this function. They will only be executed on first=
 boot
>         (if package was cross-installed) or immediately during package in=
stallation
>         on target.
>
>         Plain pkg_postinst() works as before: it is run during cross-inst=
all time,
>         it can contain a request to defer to first boot, and it is also r=
un
>         during package installation on target.
>
>         Also fix the oeqa test for this functionality to use the new func=
tion
>         where appropriate.
>
>         (From OE-Core rev: 229f4e975fb6957f44b5c56735fd6d58564098d7)
>
>         Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.c=
om>
>         Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org=
>
>
>     :100644 100644 112aa08c80f8... d4bab6dcc228... M
>     meta-selftest/recipes-test/postinst/postinst_1.0.bb
>     :100644 100644 7dc759699f4b... 6a7f35a3e787... M
>     meta/classes/package.bbclass
>
>     -------
>
>     But you shouldn't be getting that warning with docker, since it doesn=
't
>     have a pkg_postinst_${PN}(), or related element in the recipe.
>
>     So something in your build is adding that postinstall action, that is=
n't
>     part of the meta-virtualization layer.
>
>     Bruce
>
>
>     >
>     > Initialising tasks: 100% |#########################################=
###########################################################################=
##################################| Time: 0:00:04
>     > NOTE: Executing SetScene Tasks
>     > NOTE: Executing RunQueue Tasks
>     > WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: Intentionally fa=
iling postinstall scriptlets of ['docker'] to defer them to first boot is d=
eprecated. Please place them into pkg_postinst_ontarget_${PN} ().
>     > If deferring to first boot wasn't the intent, then scriptlet failur=
e may mean an issue in the recipe, or a regression elsewhere.
>     > Details of the failure are in /workdir/poky/build/tmp/work/genericx=
86_64-poky-linux/core-image-full-cmdline/1.0-r0/temp/log.do_rootfs.
>     > WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: [log_check] core=
-image-full-cmdline: found 2 warning messages in the logfile:
>     > [log_check] warning: %post(docker-18.03.0+git708b068d3095c6a6be939e=
b2da78c921d2e945e2-r0.core2_64) scriptlet failed, exit status 1
>     > [log_check] WARNING: Intentionally failing postinstall scriptlets o=
f ['docker'] to defer them to first boot is deprecated. Please place them i=
nto pkg_postinst_ontarget_${PN} ().
>     >
>     > Regards,
>     > Shakthi
>     >
>     > On 06/04/18, 1:09 AM, "Bruce Ashfield" <bruce.ashfield@gmail.com> w=
rote:
>     >
>     >     On Thu, Apr 5, 2018 at 11:55 AM, Shakthi Pradeep (tpradeep)
>     >     <tpradeep@cisco.com> wrote:
>     >     > Hello Bruce,
>     >     >
>     >     > I pulled master branch from git://git.yoctoproject.org/poky b=
ut build fails
>     >     >
>     >     > When I run "bitbake core-image-full-cmdline" or "bitbake core=
-image-minimal" I get following error
>     >     >
>     >     > ERROR: Task (/nobackup/tpradeep/playground/yocto/poky/meta/re=
cipes-kernel/linux-libc-headers/linux-libc-headers_4.15.7.bb:do_install) fa=
iled with exit code '1'
>     >     > ERROR: Task (/nobackup/tpradeep/playground/yocto/poky/meta/re=
cipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb:do_install) =
failed with exit code '1'
>     >     >
>     >     > Any idea why?
>     >
>     >     Nope. But the errors are unrelated to the changes in meta-virt.=
 If the
>     >     issue persists, asking on the oe-core list is a better bet.
>     >     I'd suggest that you rm -rf tmp, and start the build again.
>     >
>     >     Bruce
>     >
>     >     >
>     >     > Regards,
>     >     > Shakthi
>     >     >
>     >     > -----Original Message-----
>     >     > From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>     >     > Sent: Thursday, April 05, 2018 7:44 PM
>     >     > To: Shakthi Pradeep (tpradeep) <tpradeep@cisco.com>
>     >     > Cc: meta-virtualization@yoctoproject.org
>     >     > Subject: Re: [meta-virtualization] RFT/FYI: docker/containerd=
/runc uprevs pushed to master
>     >     >
>     >     > On Thu, Apr 5, 2018 at 9:32 AM, Shakthi Pradeep (tpradeep) <t=
pradeep@cisco.com> wrote:
>     >     >> Hello Bruce,
>     >     >>
>     >     >> I am actually working on a repo from Third Party. So here th=
ings are little outdated.
>     >     >>
>     >     >> I found some info from http://git.yoctoproject.org
>     >     >>
>     >     >> I am currently using Docker 1.13.0 which was committed on 20=
17-01-20
>     >     >>
>     >     >> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualizatio=
n/commit/r
>     >     >> ecipes-containers/docker?id=3D0b631bf01487d3d1be0c91ea774916=
8fb3c47dcb
>     >     >>
>     >     >> I need to migrate to 18.03.0 which you committed 3 days ago
>     >     >>
>     >     >> http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualizatio=
n/commit/r
>     >     >> ecipes-containers/docker?id=3Da5074cecf18faea1a325c8ac9220d2=
df41250af5
>     >     >>
>     >     >> If I take recipe from above commit and update my workspace, =
will all the dependencies migrate to latest automatically?
>     >     >
>     >     > Nope. You'd need to pull in all the updates that I recently p=
ushed for the dependencies, or you'll end up with runtime errors.
>     >     > Also note, that due to the different go versions and build in=
frastructure in oe-core, there's no guarantee that those new recipes will b=
uild properly on an older baseline.
>     >     >
>     >     > Bruce
>     >     >
>     >     >>
>     >     >> Regards,
>     >     >> Shakthi
>     >     >>
>     >     >> -----Original Message-----
>     >     >> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>     >     >> Sent: Thursday, April 05, 2018 6:46 PM
>     >     >> To: Shakthi Pradeep (tpradeep) <tpradeep@cisco.com>
>     >     >> Cc: meta-virtualization@yoctoproject.org
>     >     >> Subject: Re: [meta-virtualization] RFT/FYI: docker/container=
d/runc
>     >     >> uprevs pushed to master
>     >     >>
>     >     >> root@cube-server:~# docker --version
>     >     >> Docker version 18.03.0, build 0f1bb353423e
>     >     >>
>     >     >> If you are building meta-virt master, the update should happ=
en automatically since the PV of the updated recipe is higher than the old =
one. All the dependencies will follow after that.
>     >     >>
>     >     >> Bruce
>     >     >>
>     >     >> On Thu, Apr 5, 2018 at 9:02 AM, Shakthi Pradeep (tpradeep) <=
tpradeep@cisco.com> wrote:
>     >     >>> Hello Bruce,
>     >     >>>
>     >     >>> Which version of Docker are you running.
>     >     >>>
>     >     >>> I just noticed I am running Docker 1.13.1 which is too old.
>     >     >>>
>     >     >>> How do I migrate to latest version of Docker & also corresp=
onding dependencies.
>     >     >>>
>     >     >>> Regards,
>     >     >>> Shakthi
>     >     >>>
>     >     >>> -----Original Message-----
>     >     >>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>     >     >>> Sent: Wednesday, April 04, 2018 6:45 PM
>     >     >>> To: Shakthi Pradeep (tpradeep) <tpradeep@cisco.com>
>     >     >>> Cc: meta-virtualization@yoctoproject.org
>     >     >>> Subject: Re: [meta-virtualization] RFT/FYI: docker/containe=
rd/runc
>     >     >>> uprevs pushed to master
>     >     >>>
>     >     >>> Excellent news.
>     >     >>>
>     >     >>> Yes, everything is in master of meta-virtualization now. Th=
at way it will have time to soak a bit before the upcoming release.
>     >     >>>
>     >     >>> Cheers,
>     >     >>>
>     >     >>> Bruce
>     >     >>>
>     >     >>> On Wed, Apr 4, 2018 at 8:32 AM, Shakthi Pradeep (tpradeep) =
<tpradeep@cisco.com> wrote:
>     >     >>>> Hello Bruce,
>     >     >>>>
>     >     >>>> Yes I was missing the bbappend for kernel config. Got it w=
orking after I wrote the mail to you.
>     >     >>>>
>     >     >>>> Are your changes committed to git repo? Is it in the maste=
r branch of Yocto?
>     >     >>>>
>     >     >>>> Regards,
>     >     >>>> Shakthi
>     >     >>>>
>     >     >>>> -----Original Message-----
>     >     >>>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>     >     >>>> Sent: Wednesday, April 04, 2018 5:57 PM
>     >     >>>> To: Shakthi Pradeep (tpradeep) <tpradeep@cisco.com>
>     >     >>>> Cc: meta-virtualization@yoctoproject.org
>     >     >>>> Subject: Re: [meta-virtualization] RFT/FYI: docker/contain=
erd/runc
>     >     >>>> uprevs pushed to master
>     >     >>>>
>     >     >>>> On Wed, Apr 4, 2018 at 12:57 AM, Shakthi Pradeep (tpradeep=
) <tpradeep@cisco.com> wrote:
>     >     >>>>> Hello Bruce,
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> Timing is Perfect !!!
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> I am currently trying to get Docker CE to work with Yocto=
. I could
>     >     >>>>> include the Docker executable in ISO but when I run it I =
get some errors.
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> When I boot the image looks like Docker service start is =
failing
>     >     >>>>> due to missing kernel modules. Please refer attached scre=
enshot and
>     >     >>>>> below error log.
>     >     >>>>
>     >     >>>> Do you have a bbappend for your 4.8 kernel that adds the d=
ocker configuration fragments ?
>     >     >>>>
>     >     >>>> That's the most likely reason for the issues.
>     >     >>>>
>     >     >>>> I was able to run a whole suite of tests against 4.12, 4.1=
4 and 4.15 so those kernels + fragments are known to work.
>     >     >>>>
>     >     >>>> Bruce
>     >     >>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> * docker.service - Docker Application Container Engine
>     >     >>>>>
>     >     >>>>>    Loaded: loaded (/lib/systemd/system/docker.service; en=
abled;
>     >     >>>>> vendor
>     >     >>>>> preset: enabled)
>     >     >>>>>
>     >     >>>>>    Active: failed (Result: exit-code) since Tue 2018-04-0=
3 13:17:51
>     >     >>>>> UTC; 17min ago
>     >     >>>>>
>     >     >>>>>      Docs: https://docs.docker.com
>     >     >>>>>
>     >     >>>>>   Process: 317 ExecStart=3D/usr/bin/dockerd -H fd:// (cod=
e=3Dexited,
>     >     >>>>> status=3D1/FAILURE)
>     >     >>>>>
>     >     >>>>> Main PID: 317 (code=3Dexited, status=3D1/FAILURE)
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>     >     >>>>> time=3D"2018-04-03T13:17:51.035178755Z" level=3Dwarning m=
sg=3D"Running
>     >     >>>>> modprobe xt_conntrack failed with message: `modprobe: WAR=
NING:
>     >     >>>>> Module xt_conntrack not found in directory
>     >     >>>>> /lib/modules/4.8.24-WR9.0.0.10_standard`, error: exit sta=
tus 1"
>     >     >>>>>
>     >     >>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>     >     >>>>> time=3D"2018-04-03T13:17:51.040727372Z" level=3Dinfo msg=
=3D"Firewalld running:
>     >     >>>>> false"
>     >     >>>>>
>     >     >>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>     >     >>>>> time=3D"2018-04-03T13:17:51.170575344Z" level=3Dwarning m=
sg=3D"Could not
>     >     >>>>> load necessary modules for IPSEC rules: Running modprobe =
xfrm_user
>     >     >>>>> failed with
>     >     >>>>> message: `modprobe: WARNING: Module xfrm_user not found i=
n
>     >     >>>>> directory /lib/modules/4.8.24-WR9.0.0.10_standard`, error=
: exit status 1"
>     >     >>>>>
>     >     >>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>     >     >>>>> time=3D"2018-04-03T13:17:51.172397913Z" level=3Dinfo msg=
=3D"Default
>     >     >>>>> bridge
>     >     >>>>> (docker0) is assigned with an IP address 172.17.0.0/16. D=
aemon
>     >     >>>>> option --bip can be used to set a preferred IP address"
>     >     >>>>>
>     >     >>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]: Error starting=
 daemon:
>     >     >>>>> Error initializing network controller: Error creating def=
ault "bridge" network:
>     >     >>>>> Failed to Setup IP tables: Unable to enable ACCEPT INCOMI=
NG rule:
>     >     >>>>> (iptables
>     >     >>>>> failed: iptables --wait -I FORWARD -o docker0 -m conntrac=
k
>     >     >>>>> --ctstate RELATED,ESTABLISHED -j ACCEPT: iptables: No cha=
in/target/match by that name.
>     >     >>>>>
>     >     >>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:  (exit status =
1))
>     >     >>>>>
>     >     >>>>> Apr 03 13:17:51 intel-x86-64 systemd[1]: docker.service: =
Main
>     >     >>>>> process exited, code=3Dexited, status=3D1/FAILURE
>     >     >>>>>
>     >     >>>>> Apr 03 13:17:51 intel-x86-64 systemd[1]: Failed to start =
Docker
>     >     >>>>> Application Container Engine.
>     >     >>>>>
>     >     >>>>> Apr 03 13:17:51 intel-x86-64 systemd[1]: docker.service: =
Unit
>     >     >>>>> entered failed state.
>     >     >>>>>
>     >     >>>>> Apr 03 13:17:51 intel-x86-64 systemd[1]: docker.service: =
Failed
>     >     >>>>> with result 'exit-code'.
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> Regards,
>     >     >>>>>
>     >     >>>>> Shakthi
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> -----Original Message-----
>     >     >>>>> From: meta-virtualization-bounces@yoctoproject.org
>     >     >>>>> [mailto:meta-virtualization-bounces@yoctoproject.org] On =
Behalf Of
>     >     >>>>> Bruce Ashfield
>     >     >>>>> Sent: Wednesday, April 04, 2018 8:44 AM
>     >     >>>>> To: meta-virtualization@yoctoproject.org
>     >     >>>>> Subject: [meta-virtualization] RFT/FYI: docker/containerd=
/runc
>     >     >>>>> uprevs pushed to master
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> Hi all,
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> After spending a few days de-tangling the
>     >     >>>>> moby/docker/runc/containerd and oe-core go infrastructure=
 changes,
>     >     >>>>> I was able to run docker/runc/containerd through a system=
/stress test and everything seems to be working.
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> There were a few regressions that I worked through, as we=
ll as
>     >     >>>>> build/packaging changes, but I'm no longer seeing any iss=
ues and
>     >     >>>>> all the patches/functionality have been carried forward.
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> One thing of note is that the docker and open containers =
containerd
>     >     >>>>> split/fork is no longer an issue, so I've modified the de=
fault to
>     >     >>>>> be the opencontainers variant. Similarly, the docker and
>     >     >>>>> opencontainers runc are very similar. I've kept both vari=
ants of
>     >     >>>>> both recipes for now, since I'd like to track things for =
a bit
>     >     >>>>> longer before declaring the split unnecessary.
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> Also for those that care, I created a reference docker-ce=
 recipe
>     >     >>>>> that tracks the docker-ce repo versus the components them=
selves.
>     >     >>>>> Right now it is reference only, since it needs a bit more=
 work, but
>     >     >>>>> I wanted to get it out there, in case someone really care=
s about
>     >     >>>>> docker-ce (I don't really, but someone might!).
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> Summary: I just pushed the following changes to master:
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>   d7d310ae4113 meta-virt: prefer containerd-opencontainer=
s
>     >     >>>>>
>     >     >>>>>   935e3d969ef1 containerd: uprev to v1.0.2
>     >     >>>>>
>     >     >>>>>   f5fbfa8ac4db docker-ce: introduce reference recipe/buil=
d
>     >     >>>>>
>     >     >>>>>   a5074cecf18f docker: uprev to 18.03.0
>     >     >>>>>
>     >     >>>>>   e3d960f4fcd9 runc: uprev to 1.0.0-rc5
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> If anyone sees regressions, build or architecture issues =
.. report
>     >     >>>>> them to me (and the list) and we'll get them fixed up.
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> Cheers,
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> Bruce
>     >     >>>>>
>     >     >>>>>
>     >     >>>>>
>     >     >>>>> --
>     >     >>>>>
>     >     >>>>> "Thou shalt not follow the NULL pointer, for chaos and ma=
dness
>     >     >>>>> await thee at its end"
>     >     >>>>>
>     >     >>>>> --
>     >     >>>>>
>     >     >>>>> _______________________________________________
>     >     >>>>>
>     >     >>>>> meta-virtualization mailing list
>     >     >>>>>
>     >     >>>>> meta-virtualization@yoctoproject.org
>     >     >>>>>
>     >     >>>>> https://lists.yoctoproject.org/listinfo/meta-virtualizati=
on
>     >     >>>>
>     >     >>>>
>     >     >>>>
>     >     >>>> --
>     >     >>>> "Thou shalt not follow the NULL pointer, for chaos and mad=
ness await thee at its end"
>     >     >>>
>     >     >>>
>     >     >>>
>     >     >>> --
>     >     >>> "Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end"
>     >     >>
>     >     >>
>     >     >>
>     >     >> --
>     >     >> "Thou shalt not follow the NULL pointer, for chaos and madne=
ss await thee at its end"
>     >     >
>     >     >
>     >     >
>     >     > --
>     >     > "Thou shalt not follow the NULL pointer, for chaos and madnes=
s await thee at its end"
>     >
>     >
>     >
>     >     --
>     >     "Thou shalt not follow the NULL pointer, for chaos and madness =
await
>     >     thee at its end"
>     >
>     >
>
>
>
>     --
>     "Thou shalt not follow the NULL pointer, for chaos and madness await
>     thee at its end"
>
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

