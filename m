Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BB22DE00BAD; Thu, 12 Apr 2018 06:10:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.41 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BAB5E00708
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Apr 2018 06:10:53 -0700 (PDT)
Received: by mail-lf0-f41.google.com with SMTP id b189-v6so7644298lfe.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Apr 2018 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2yJEeluvoOwlbJdfjLyjhCxqM68Md92GmZBqmJ8pZUs=;
	b=ASS4lsv0CF6i/exFiuV5NJHj/zQQHoKdF7pHEd2N2DTkQz9LtgUx9/ExsQ6ubGc0t5
	S7urOWUYD7uQM0nUhS691yT4h+/iepSODTZC904L+SuCNCZaJ3/BNAt4FRcZU6Syds0e
	IQA7yq7yr/Bb/nd9VkF0tM8XM8yWr6p8Vf5REoWzReLhnimGwNUgrOgN25J4Ekkh7Q+0
	OcyfsgUwTZYK+Uu3cpc/xO0CRl8iAOINk658T8qFw9K4mQOu9vc4nyGz2QLIZbH0BwDp
	PCSAEFeSdVHGQXfxgjlcgBNtGk0WJd/9BxURzATavC2lmLL96RTEb/s6zsMjIhy62Uk/
	l+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2yJEeluvoOwlbJdfjLyjhCxqM68Md92GmZBqmJ8pZUs=;
	b=rfJ1jUcgmBh3ekaFGC1MchB3Fystk/AU/b5JuFuqjL8SoSO5teZ2N2AidE7tMLi172
	2kGNqNCF45Tl8p8k4La7F7nJWQ2pYwSsDgZIHskTb7tM9vjBmBLQmHmyDu5/w/et3ahT
	eUtRW9XxwamrMMFITNTejKndKYcvLn3/ic/H6IwwAET9cJ19Cwqe1BSa4N5vT8p7Py0h
	IQP/Mzm5jQdwMu/LiCE7oSBckglbWB6uUx2bHY5QHFHFoospuM2M6+lE1MieUrHmxJMr
	E/g1Yn9ddsXGYUXjINXUZsWg7VxjmHF6KVabvrwPD+De1b+gHkCloS64NHfBafjNy2B4
	YgdA==
X-Gm-Message-State: ALQs6tAa3ykMtU4umkX1uXR3efPOSh4cOX5yqRJePk0HlnH6JeNaI9Oq
	RIPyZqipJsheZdKoFZDrfVpotcEs00V9okHNAAoovQ==
X-Google-Smtp-Source: AIpwx49Ojfpu543cBNwBZyQpip7EIWpGdUfE8ZjC5g44wYb9fQVv7/QvH6nI83KobGlLLoMoovcldYB0/pDoG9Q2ykM=
X-Received: by 2002:a19:8d0d:: with SMTP id
	p13-v6mr5855202lfd.126.1523538651720; 
	Thu, 12 Apr 2018 06:10:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Thu, 12 Apr 2018 06:10:51 -0700 (PDT)
In-Reply-To: <FCE0FB4B-E214-4F0D-8C4D-191F0D224540@cisco.com>
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
	<CADkTA4OHWEaqR2MkuXHjfL5Fn7vYNOV6AqTSCzyU_gT1_dVRzw@mail.gmail.com>
	<B1A1FD9B-B5FD-4C5D-9DD7-211429EE0D80@cisco.com>
	<7A1A63B5-AE26-437F-809E-354B9F8D2BF4@cisco.com>
	<FCE0FB4B-E214-4F0D-8C4D-191F0D224540@cisco.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Apr 2018 09:10:51 -0400
Message-ID: <CADkTA4PBFmOEdBjUFRLGUXReGGg7Ln6Po6Q1gbpC_8Czw1_afA@mail.gmail.com>
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
X-List-Received-Date: Thu, 12 Apr 2018 13:10:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2018 at 8:57 AM, Shakthi Pradeep (tpradeep)
<tpradeep@cisco.com> wrote:
> Hello Bruce,
>
> Found the problem=E2=80=A6
>
> docker-proxy was linked against /lib64/ld-linux-x86-64.so.2 while docker =
& dockerd are linked against /lib/ld-linux-x86-64.so

I just pushed fixes for docker-proxy's build, and they were link time
/ shared object fixes

What's the SRCREV of your meta-virtualization build ?

Bruce

>
> /lib64/ld-linux-x86-64.so.2 did not exist in the Yocto build nor was ther=
e a symbolic link to /lib/ld-linux-x86-64.so
>
> After creating /lib64/ld-linux-x86-64.so.2 docker image came up fine with=
 =E2=80=93p option
>
> root@genericx86-64:/mnt# ldd /usr/bin/docker-proxy
>         linux-vdso.so.1 (0x00007ffc24bb5000)
>         libpthread.so.0 =3D> /lib/libpthread.so.0 (0x0000003ab7a00000)
>         libc.so.6 =3D> /lib/libc.so.6 (0x0000003ab7600000)
>         /lib64/ld-linux-x86-64.so.2 =3D> /lib/ld-linux-x86-64.so.2 (0x000=
07f9d7eeba000)
>
> root@genericx86-64:/mnt# ldd /usr/bin/docker
>         linux-vdso.so.1 (0x00007ffcda12f000)
>         libpthread.so.0 =3D> /lib/libpthread.so.0 (0x0000003ab7a00000)
>         libc.so.6 =3D> /lib/libc.so.6 (0x0000003ab7600000)
>         /lib/ld-linux-x86-64.so.2 (0x00007f8511ac0000)
>
> root@genericx86-64:/mnt# ldd /usr/bin/dockerd
>         linux-vdso.so.1 (0x00007ffd41130000)
>         libpthread.so.0 =3D> /lib/libpthread.so.0 (0x0000003ab7a00000)
>         libc.so.6 =3D> /lib/libc.so.6 (0x0000003ab7600000)
>         /lib/ld-linux-x86-64.so.2 (0x00007f848078d000)
> root@genericx86-64:/mnt#
>
> Regards,
> Shakthi
>
> On 11/04/18, 8:20 PM, "Shakthi Pradeep (tpradeep)" <tpradeep@cisco.com> w=
rote:
>
>     Hello Bruce,
>
>     Could you try running Docker with =E2=80=93p option. After solving th=
e iptables issue, I am hitting another issue.
>
>     Now exec of /usr/bin/docker-proxy gives =E2=80=9Cno such file or dire=
ctory=E2=80=9D error
>
>     root@genericx86-64:/mnt# docker run -itd --name svo -p 10000:8080 svo=
 supervisord -n
>     29bd8de9dd028888f5f060cb42240762e28dd07cdfa91185fa49953c3da28c36
>     docker: Error response from daemon: driver failed programming externa=
l connectivity on endpoint svo (6397cfd4d4e69099c609c8a933e35418a0bf30c1acb=
4e3b0ebad55668e099fa1): fork/exec /usr/bin/docker-proxy: no such file or di=
rectory.
>
>     root@genericx86-64:/mnt# which /usr/bin/docker-proxy
>     /usr/bin/docker-proxy
>
>     root@genericx86-64:/mnt# ldd /usr/bin/docker-proxy
>         linux-vdso.so.1 (0x00007ffd1bbf3000)
>         libpthread.so.0 =3D> /lib/libpthread.so.0 (0x0000003267a00000)
>         libc.so.6 =3D> /lib/libc.so.6 (0x0000003267600000)
>         /lib64/ld-linux-x86-64.so.2 =3D> /lib/ld-linux-x86-64.so.2 (0x000=
07f0c9e5dc000)
>     root@genericx86-64:/mnt#
>
>     Regards,
>     Shakthi
>
>     On 11/04/18, 8:15 PM, "Shakthi Pradeep (tpradeep)" <tpradeep@cisco.co=
m> wrote:
>
>         Hello Bruce,
>
>         Since I am having build issues with master branch I am back to ro=
cko branch.
>
>         With rocko branch when I use =E2=80=93p option with Docker, I was=
 getting following error =E2=80=9Ciptables: No chain/target/match by that n=
ame.=E2=80=9D
>
>         root@genericx86-64:~# docker run -itd --name svo -p 10000:8080 sv=
o supervisord -n
>         52416b288a255361de6e0e09e78055627d898e44cc6b9839430bb2e48b5c5324
>         docker: Error response from daemon: driver failed programming ext=
ernal connectivity on endpoint svo (b5a9bed9b9825027ce02fa603b5daa3d4220953=
404f8d3efbda4ab5f0ac49138):  (iptables failed: iptables --wait -t nat -A DO=
CKER -p tcp -d 0/0 --dport 10000 -j DNAT --to-destination 172.17.0.2:8080 !=
 -i docker0: iptables: No chain/target/match by that name.
>          (exit status 1)).
>
>         This was due to missing LKM, xt_nat & x_tables. With this bundled=
 in the final iso I could solve above problem. Now I am hitting another err=
or
>
>         Below is the complete list of modules
>
>         root@genericx86-64:/mnt# lsmod
>         Module                  Size  Used by
>         xt_tcpudp              16384  0
>         ipt_MASQUERADE         16384  1
>         nf_nat_masquerade_ipv4    16384  1 ipt_MASQUERADE
>         iptable_nat            16384  1
>         nf_conntrack_ipv4      16384  3
>         nf_defrag_ipv4         16384  1 nf_conntrack_ipv4
>         nf_nat_ipv4            16384  1 iptable_nat
>         iptable_filter         16384  1
>         ip_tables              24576  2 iptable_filter,iptable_nat
>         bridge                106496  0
>         stp                    16384  1 bridge
>         llc                    16384  2 bridge,stp
>         xt_nat                 16384  0
>         nf_nat                 24576  3 xt_nat,nf_nat_masquerade_ipv4,nf_=
nat_ipv4
>         xt_conntrack           16384  1
>         nf_conntrack           86016  7 xt_nat,nf_conntrack_ipv4,ipt_MASQ=
UERADE,nf_nat_masquerade_ipv4,xt_conntrack,nf_nat_ipv4,nf_nat
>         libcrc32c              16384  2 nf_conntrack,nf_nat
>         xt_addrtype            16384  2
>         x_tables               28672  7 xt_nat,ip_tables,iptable_filter,x=
t_tcpudp,ipt_MASQUERADE,xt_addrtype,xt_conntrack
>         root@genericx86-64:/mnt#
>
>         Regards,
>         Shakthi
>
>         On 09/04/18, 7:49 PM, "Bruce Ashfield" <bruce.ashfield@gmail.com>=
 wrote:
>
>             Sure, but none of them are docker.
>
>             Bruce
>
>             On Mon, Apr 9, 2018 at 9:46 AM, Shakthi Pradeep (tpradeep)
>             <tpradeep@cisco.com> wrote:
>             > Hello Bruce,
>             >
>             > I see pkg_postinst_${PN}() are part of below recipes=E2=80=
=A6.
>             >
>             > TPRADEEP-M-91HW:meta-virtualization tpradeep$ grep -r posti=
nst *
>             > recipes-containers/singularity/singularity_git.bb:pkg_posti=
nst_${PN}() {
>             > recipes-containers/lxc/lxc_2.0.8.bb:pkg_postinst_${PN}() {
>             > recipes-containers/lxc/lxc_2.0.8.bb:pkg_postinst_${PN}-netw=
orking() {
>             > recipes-extended/xen/xen.inc:pkg_postinst_${PN}-volatiles()=
 {
>             > recipes-extended/libvirt/libvirt_1.3.5.bb:pkg_postinst_libv=
irt() {
>             > recipes-networking/openvswitch/openvswitch.inc:# rdeps.  E.=
g. ovs-pki calls sed in the postinstall.  sed may be
>             > recipes-networking/openvswitch/openvswitch.inc:pkg_postinst=
_${PN}-pki () {
>             > recipes-networking/openvswitch/openvswitch.inc:pkg_postinst=
_${PN}-testcontroller () {
>             >
>             > Regards,
>             > Shakthi
>             >
>             > On 09/04/18, 6:47 PM, "Bruce Ashfield" <bruce.ashfield@gmai=
l.com> wrote:
>             >
>             >     On Mon, Apr 9, 2018 at 4:37 AM, Shakthi Pradeep (tprade=
ep)
>             >     <tpradeep@cisco.com> wrote:
>             >     > Hello Bruce,
>             >     >
>             >     > Moved to master branch of Yocto. When I build I am ge=
tting below error. What does this mean?
>             >
>             >     There were changes made to the way that postinstall scr=
ipts were run
>             >     in the January
>             >     timeframe,
>             >
>             >     i.e.:
>             >
>             >      commit 7bc55b29609765904af9f330600229e96cc044cf
>             >     Author: Alexander Kanavin <alexander.kanavin@linux.inte=
l.com>
>             >     Date:   Mon Jan 29 14:01:32 2018 +0200
>             >
>             >         meta/lib/oe/package_manager.py: deprecate 'exit 1' =
as a way to
>             >     defer to first boot
>             >
>             >         'exit 1' is not optimal for two reasons:
>             >
>             >         1) Code is hard to read; it is not obvious that it =
means 'defer
>             >     what follows to first boot'.
>             >         2) Worse, this hides actual errors in the scriptlet=
s; there is no
>             >     difference between scriptlet
>             >         failing because it's intended to be run on target a=
nd scriptlet
>             >     failing because there's a bug or
>             >         a regression somewhere.
>             >
>             >         The new, supported way is to place the code that ha=
s to run on
>             >     target into pkg_postinst_ontarget(),
>             >         or, if a more fine-tuned control is required, call
>             >     'postinst-intercepts defer_to_first_boot' from
>             >         pkg_postinst() to explicitly request deferral to fi=
rst boot.
>             >
>             >         (From OE-Core rev: d12cf56e9ff2a4f13dfbef9290ea5647=
b52b3f6d)
>             >
>             >         Signed-off-by: Alexander Kanavin <alexander.kanavin=
@linux.intel.com>
>             >         Signed-off-by: Richard Purdie <richard.purdie@linux=
foundation.org>
>             >
>             >     :100644 100644 2a07f0e39ad6... f7e013437c91... M
>             >     meta/lib/oe/package_manager.py
>             >
>             >     commit 6ca669105ff7f405e85142d1aa5375a8430c9606
>             >     Author: Alexander Kanavin <alexander.kanavin@linux.inte=
l.com>
>             >     Date:   Mon Jan 29 14:01:31 2018 +0200
>             >
>             >         package.bbclass: add support for pkg_postinst_ontar=
get()
>             >
>             >         This function is a convenient and more readable sho=
rtcut for situations
>             >         when the postinst code always needs to run on targe=
t. All commands that
>             >         cannot be executed during cross-install and can onl=
y be run on target
>             >         should go into this function. They will only be exe=
cuted on first boot
>             >         (if package was cross-installed) or immediately dur=
ing package installation
>             >         on target.
>             >
>             >         Plain pkg_postinst() works as before: it is run dur=
ing cross-install time,
>             >         it can contain a request to defer to first boot, an=
d it is also run
>             >         during package installation on target.
>             >
>             >         Also fix the oeqa test for this functionality to us=
e the new function
>             >         where appropriate.
>             >
>             >         (From OE-Core rev: 229f4e975fb6957f44b5c56735fd6d58=
564098d7)
>             >
>             >         Signed-off-by: Alexander Kanavin <alexander.kanavin=
@linux.intel.com>
>             >         Signed-off-by: Richard Purdie <richard.purdie@linux=
foundation.org>
>             >
>             >     :100644 100644 112aa08c80f8... d4bab6dcc228... M
>             >     meta-selftest/recipes-test/postinst/postinst_1.0.bb
>             >     :100644 100644 7dc759699f4b... 6a7f35a3e787... M
>             >     meta/classes/package.bbclass
>             >
>             >     -------
>             >
>             >     But you shouldn't be getting that warning with docker, =
since it doesn't
>             >     have a pkg_postinst_${PN}(), or related element in the =
recipe.
>             >
>             >     So something in your build is adding that postinstall a=
ction, that isn't
>             >     part of the meta-virtualization layer.
>             >
>             >     Bruce
>             >
>             >
>             >     >
>             >     > Initialising tasks: 100% |###########################=
###########################################################################=
################################################| Time: 0:00:04
>             >     > NOTE: Executing SetScene Tasks
>             >     > NOTE: Executing RunQueue Tasks
>             >     > WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: In=
tentionally failing postinstall scriptlets of ['docker'] to defer them to f=
irst boot is deprecated. Please place them into pkg_postinst_ontarget_${PN}=
 ().
>             >     > If deferring to first boot wasn't the intent, then sc=
riptlet failure may mean an issue in the recipe, or a regression elsewhere.
>             >     > Details of the failure are in /workdir/poky/build/tmp=
/work/genericx86_64-poky-linux/core-image-full-cmdline/1.0-r0/temp/log.do_r=
ootfs.
>             >     > WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: [l=
og_check] core-image-full-cmdline: found 2 warning messages in the logfile:
>             >     > [log_check] warning: %post(docker-18.03.0+git708b068d=
3095c6a6be939eb2da78c921d2e945e2-r0.core2_64) scriptlet failed, exit status=
 1
>             >     > [log_check] WARNING: Intentionally failing postinstal=
l scriptlets of ['docker'] to defer them to first boot is deprecated. Pleas=
e place them into pkg_postinst_ontarget_${PN} ().
>             >     >
>             >     > Regards,
>             >     > Shakthi
>             >     >
>             >     > On 06/04/18, 1:09 AM, "Bruce Ashfield" <bruce.ashfiel=
d@gmail.com> wrote:
>             >     >
>             >     >     On Thu, Apr 5, 2018 at 11:55 AM, Shakthi Pradeep =
(tpradeep)
>             >     >     <tpradeep@cisco.com> wrote:
>             >     >     > Hello Bruce,
>             >     >     >
>             >     >     > I pulled master branch from git://git.yoctoproj=
ect.org/poky but build fails
>             >     >     >
>             >     >     > When I run "bitbake core-image-full-cmdline" or=
 "bitbake core-image-minimal" I get following error
>             >     >     >
>             >     >     > ERROR: Task (/nobackup/tpradeep/playground/yoct=
o/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.15.7.bb:=
do_install) failed with exit code '1'
>             >     >     > ERROR: Task (/nobackup/tpradeep/playground/yoct=
o/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.b=
b:do_install) failed with exit code '1'
>             >     >     >
>             >     >     > Any idea why?
>             >     >
>             >     >     Nope. But the errors are unrelated to the changes=
 in meta-virt. If the
>             >     >     issue persists, asking on the oe-core list is a b=
etter bet.
>             >     >     I'd suggest that you rm -rf tmp, and start the bu=
ild again.
>             >     >
>             >     >     Bruce
>             >     >
>             >     >     >
>             >     >     > Regards,
>             >     >     > Shakthi
>             >     >     >
>             >     >     > -----Original Message-----
>             >     >     > From: Bruce Ashfield [mailto:bruce.ashfield@gma=
il.com]
>             >     >     > Sent: Thursday, April 05, 2018 7:44 PM
>             >     >     > To: Shakthi Pradeep (tpradeep) <tpradeep@cisco.=
com>
>             >     >     > Cc: meta-virtualization@yoctoproject.org
>             >     >     > Subject: Re: [meta-virtualization] RFT/FYI: doc=
ker/containerd/runc uprevs pushed to master
>             >     >     >
>             >     >     > On Thu, Apr 5, 2018 at 9:32 AM, Shakthi Pradeep=
 (tpradeep) <tpradeep@cisco.com> wrote:
>             >     >     >> Hello Bruce,
>             >     >     >>
>             >     >     >> I am actually working on a repo from Third Par=
ty. So here things are little outdated.
>             >     >     >>
>             >     >     >> I found some info from http://git.yoctoproject=
.org
>             >     >     >>
>             >     >     >> I am currently using Docker 1.13.0 which was c=
ommitted on 2017-01-20
>             >     >     >>
>             >     >     >> http://git.yoctoproject.org/cgit/cgit.cgi/meta=
-virtualization/commit/r
>             >     >     >> ecipes-containers/docker?id=3D0b631bf01487d3d1=
be0c91ea7749168fb3c47dcb
>             >     >     >>
>             >     >     >> I need to migrate to 18.03.0 which you committ=
ed 3 days ago
>             >     >     >>
>             >     >     >> http://git.yoctoproject.org/cgit/cgit.cgi/meta=
-virtualization/commit/r
>             >     >     >> ecipes-containers/docker?id=3Da5074cecf18faea1=
a325c8ac9220d2df41250af5
>             >     >     >>
>             >     >     >> If I take recipe from above commit and update =
my workspace, will all the dependencies migrate to latest automatically?
>             >     >     >
>             >     >     > Nope. You'd need to pull in all the updates tha=
t I recently pushed for the dependencies, or you'll end up with runtime err=
ors.
>             >     >     > Also note, that due to the different go version=
s and build infrastructure in oe-core, there's no guarantee that those new =
recipes will build properly on an older baseline.
>             >     >     >
>             >     >     > Bruce
>             >     >     >
>             >     >     >>
>             >     >     >> Regards,
>             >     >     >> Shakthi
>             >     >     >>
>             >     >     >> -----Original Message-----
>             >     >     >> From: Bruce Ashfield [mailto:bruce.ashfield@gm=
ail.com]
>             >     >     >> Sent: Thursday, April 05, 2018 6:46 PM
>             >     >     >> To: Shakthi Pradeep (tpradeep) <tpradeep@cisco=
.com>
>             >     >     >> Cc: meta-virtualization@yoctoproject.org
>             >     >     >> Subject: Re: [meta-virtualization] RFT/FYI: do=
cker/containerd/runc
>             >     >     >> uprevs pushed to master
>             >     >     >>
>             >     >     >> root@cube-server:~# docker --version
>             >     >     >> Docker version 18.03.0, build 0f1bb353423e
>             >     >     >>
>             >     >     >> If you are building meta-virt master, the upda=
te should happen automatically since the PV of the updated recipe is higher=
 than the old one. All the dependencies will follow after that.
>             >     >     >>
>             >     >     >> Bruce
>             >     >     >>
>             >     >     >> On Thu, Apr 5, 2018 at 9:02 AM, Shakthi Pradee=
p (tpradeep) <tpradeep@cisco.com> wrote:
>             >     >     >>> Hello Bruce,
>             >     >     >>>
>             >     >     >>> Which version of Docker are you running.
>             >     >     >>>
>             >     >     >>> I just noticed I am running Docker 1.13.1 whi=
ch is too old.
>             >     >     >>>
>             >     >     >>> How do I migrate to latest version of Docker =
& also corresponding dependencies.
>             >     >     >>>
>             >     >     >>> Regards,
>             >     >     >>> Shakthi
>             >     >     >>>
>             >     >     >>> -----Original Message-----
>             >     >     >>> From: Bruce Ashfield [mailto:bruce.ashfield@g=
mail.com]
>             >     >     >>> Sent: Wednesday, April 04, 2018 6:45 PM
>             >     >     >>> To: Shakthi Pradeep (tpradeep) <tpradeep@cisc=
o.com>
>             >     >     >>> Cc: meta-virtualization@yoctoproject.org
>             >     >     >>> Subject: Re: [meta-virtualization] RFT/FYI: d=
ocker/containerd/runc
>             >     >     >>> uprevs pushed to master
>             >     >     >>>
>             >     >     >>> Excellent news.
>             >     >     >>>
>             >     >     >>> Yes, everything is in master of meta-virtuali=
zation now. That way it will have time to soak a bit before the upcoming re=
lease.
>             >     >     >>>
>             >     >     >>> Cheers,
>             >     >     >>>
>             >     >     >>> Bruce
>             >     >     >>>
>             >     >     >>> On Wed, Apr 4, 2018 at 8:32 AM, Shakthi Prade=
ep (tpradeep) <tpradeep@cisco.com> wrote:
>             >     >     >>>> Hello Bruce,
>             >     >     >>>>
>             >     >     >>>> Yes I was missing the bbappend for kernel co=
nfig. Got it working after I wrote the mail to you.
>             >     >     >>>>
>             >     >     >>>> Are your changes committed to git repo? Is i=
t in the master branch of Yocto?
>             >     >     >>>>
>             >     >     >>>> Regards,
>             >     >     >>>> Shakthi
>             >     >     >>>>
>             >     >     >>>> -----Original Message-----
>             >     >     >>>> From: Bruce Ashfield [mailto:bruce.ashfield@=
gmail.com]
>             >     >     >>>> Sent: Wednesday, April 04, 2018 5:57 PM
>             >     >     >>>> To: Shakthi Pradeep (tpradeep) <tpradeep@cis=
co.com>
>             >     >     >>>> Cc: meta-virtualization@yoctoproject.org
>             >     >     >>>> Subject: Re: [meta-virtualization] RFT/FYI: =
docker/containerd/runc
>             >     >     >>>> uprevs pushed to master
>             >     >     >>>>
>             >     >     >>>> On Wed, Apr 4, 2018 at 12:57 AM, Shakthi Pra=
deep (tpradeep) <tpradeep@cisco.com> wrote:
>             >     >     >>>>> Hello Bruce,
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> Timing is Perfect !!!
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> I am currently trying to get Docker CE to w=
ork with Yocto. I could
>             >     >     >>>>> include the Docker executable in ISO but wh=
en I run it I get some errors.
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> When I boot the image looks like Docker ser=
vice start is failing
>             >     >     >>>>> due to missing kernel modules. Please refer=
 attached screenshot and
>             >     >     >>>>> below error log.
>             >     >     >>>>
>             >     >     >>>> Do you have a bbappend for your 4.8 kernel t=
hat adds the docker configuration fragments ?
>             >     >     >>>>
>             >     >     >>>> That's the most likely reason for the issues=
.
>             >     >     >>>>
>             >     >     >>>> I was able to run a whole suite of tests aga=
inst 4.12, 4.14 and 4.15 so those kernels + fragments are known to work.
>             >     >     >>>>
>             >     >     >>>> Bruce
>             >     >     >>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> * docker.service - Docker Application Conta=
iner Engine
>             >     >     >>>>>
>             >     >     >>>>>    Loaded: loaded (/lib/systemd/system/dock=
er.service; enabled;
>             >     >     >>>>> vendor
>             >     >     >>>>> preset: enabled)
>             >     >     >>>>>
>             >     >     >>>>>    Active: failed (Result: exit-code) since=
 Tue 2018-04-03 13:17:51
>             >     >     >>>>> UTC; 17min ago
>             >     >     >>>>>
>             >     >     >>>>>      Docs: https://docs.docker.com
>             >     >     >>>>>
>             >     >     >>>>>   Process: 317 ExecStart=3D/usr/bin/dockerd=
 -H fd:// (code=3Dexited,
>             >     >     >>>>> status=3D1/FAILURE)
>             >     >     >>>>>
>             >     >     >>>>> Main PID: 317 (code=3Dexited, status=3D1/FA=
ILURE)
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>             >     >     >>>>> time=3D"2018-04-03T13:17:51.035178755Z" lev=
el=3Dwarning msg=3D"Running
>             >     >     >>>>> modprobe xt_conntrack failed with message: =
`modprobe: WARNING:
>             >     >     >>>>> Module xt_conntrack not found in directory
>             >     >     >>>>> /lib/modules/4.8.24-WR9.0.0.10_standard`, e=
rror: exit status 1"
>             >     >     >>>>>
>             >     >     >>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>             >     >     >>>>> time=3D"2018-04-03T13:17:51.040727372Z" lev=
el=3Dinfo msg=3D"Firewalld running:
>             >     >     >>>>> false"
>             >     >     >>>>>
>             >     >     >>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>             >     >     >>>>> time=3D"2018-04-03T13:17:51.170575344Z" lev=
el=3Dwarning msg=3D"Could not
>             >     >     >>>>> load necessary modules for IPSEC rules: Run=
ning modprobe xfrm_user
>             >     >     >>>>> failed with
>             >     >     >>>>> message: `modprobe: WARNING: Module xfrm_us=
er not found in
>             >     >     >>>>> directory /lib/modules/4.8.24-WR9.0.0.10_st=
andard`, error: exit status 1"
>             >     >     >>>>>
>             >     >     >>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]:
>             >     >     >>>>> time=3D"2018-04-03T13:17:51.172397913Z" lev=
el=3Dinfo msg=3D"Default
>             >     >     >>>>> bridge
>             >     >     >>>>> (docker0) is assigned with an IP address 17=
2.17.0.0/16. Daemon
>             >     >     >>>>> option --bip can be used to set a preferred=
 IP address"
>             >     >     >>>>>
>             >     >     >>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]: =
Error starting daemon:
>             >     >     >>>>> Error initializing network controller: Erro=
r creating default "bridge" network:
>             >     >     >>>>> Failed to Setup IP tables: Unable to enable=
 ACCEPT INCOMING rule:
>             >     >     >>>>> (iptables
>             >     >     >>>>> failed: iptables --wait -I FORWARD -o docke=
r0 -m conntrack
>             >     >     >>>>> --ctstate RELATED,ESTABLISHED -j ACCEPT: ip=
tables: No chain/target/match by that name.
>             >     >     >>>>>
>             >     >     >>>>> Apr 03 13:17:51 intel-x86-64 dockerd[317]: =
 (exit status 1))
>             >     >     >>>>>
>             >     >     >>>>> Apr 03 13:17:51 intel-x86-64 systemd[1]: do=
cker.service: Main
>             >     >     >>>>> process exited, code=3Dexited, status=3D1/F=
AILURE
>             >     >     >>>>>
>             >     >     >>>>> Apr 03 13:17:51 intel-x86-64 systemd[1]: Fa=
iled to start Docker
>             >     >     >>>>> Application Container Engine.
>             >     >     >>>>>
>             >     >     >>>>> Apr 03 13:17:51 intel-x86-64 systemd[1]: do=
cker.service: Unit
>             >     >     >>>>> entered failed state.
>             >     >     >>>>>
>             >     >     >>>>> Apr 03 13:17:51 intel-x86-64 systemd[1]: do=
cker.service: Failed
>             >     >     >>>>> with result 'exit-code'.
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> Regards,
>             >     >     >>>>>
>             >     >     >>>>> Shakthi
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> -----Original Message-----
>             >     >     >>>>> From: meta-virtualization-bounces@yoctoproj=
ect.org
>             >     >     >>>>> [mailto:meta-virtualization-bounces@yoctopr=
oject.org] On Behalf Of
>             >     >     >>>>> Bruce Ashfield
>             >     >     >>>>> Sent: Wednesday, April 04, 2018 8:44 AM
>             >     >     >>>>> To: meta-virtualization@yoctoproject.org
>             >     >     >>>>> Subject: [meta-virtualization] RFT/FYI: doc=
ker/containerd/runc
>             >     >     >>>>> uprevs pushed to master
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> Hi all,
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> After spending a few days de-tangling the
>             >     >     >>>>> moby/docker/runc/containerd and oe-core go =
infrastructure changes,
>             >     >     >>>>> I was able to run docker/runc/containerd th=
rough a system/stress test and everything seems to be working.
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> There were a few regressions that I worked =
through, as well as
>             >     >     >>>>> build/packaging changes, but I'm no longer =
seeing any issues and
>             >     >     >>>>> all the patches/functionality have been car=
ried forward.
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> One thing of note is that the docker and op=
en containers containerd
>             >     >     >>>>> split/fork is no longer an issue, so I've m=
odified the default to
>             >     >     >>>>> be the opencontainers variant. Similarly, t=
he docker and
>             >     >     >>>>> opencontainers runc are very similar. I've =
kept both variants of
>             >     >     >>>>> both recipes for now, since I'd like to tra=
ck things for a bit
>             >     >     >>>>> longer before declaring the split unnecessa=
ry.
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> Also for those that care, I created a refer=
ence docker-ce recipe
>             >     >     >>>>> that tracks the docker-ce repo versus the c=
omponents themselves.
>             >     >     >>>>> Right now it is reference only, since it ne=
eds a bit more work, but
>             >     >     >>>>> I wanted to get it out there, in case someo=
ne really cares about
>             >     >     >>>>> docker-ce (I don't really, but someone migh=
t!).
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> Summary: I just pushed the following change=
s to master:
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>   d7d310ae4113 meta-virt: prefer containerd=
-opencontainers
>             >     >     >>>>>
>             >     >     >>>>>   935e3d969ef1 containerd: uprev to v1.0.2
>             >     >     >>>>>
>             >     >     >>>>>   f5fbfa8ac4db docker-ce: introduce referen=
ce recipe/build
>             >     >     >>>>>
>             >     >     >>>>>   a5074cecf18f docker: uprev to 18.03.0
>             >     >     >>>>>
>             >     >     >>>>>   e3d960f4fcd9 runc: uprev to 1.0.0-rc5
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> If anyone sees regressions, build or archit=
ecture issues .. report
>             >     >     >>>>> them to me (and the list) and we'll get the=
m fixed up.
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> Cheers,
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> Bruce
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>>
>             >     >     >>>>> --
>             >     >     >>>>>
>             >     >     >>>>> "Thou shalt not follow the NULL pointer, fo=
r chaos and madness
>             >     >     >>>>> await thee at its end"
>             >     >     >>>>>
>             >     >     >>>>> --
>             >     >     >>>>>
>             >     >     >>>>> ___________________________________________=
____
>             >     >     >>>>>
>             >     >     >>>>> meta-virtualization mailing list
>             >     >     >>>>>
>             >     >     >>>>> meta-virtualization@yoctoproject.org
>             >     >     >>>>>
>             >     >     >>>>> https://lists.yoctoproject.org/listinfo/met=
a-virtualization
>             >     >     >>>>
>             >     >     >>>>
>             >     >     >>>>
>             >     >     >>>> --
>             >     >     >>>> "Thou shalt not follow the NULL pointer, for=
 chaos and madness await thee at its end"
>             >     >     >>>
>             >     >     >>>
>             >     >     >>>
>             >     >     >>> --
>             >     >     >>> "Thou shalt not follow the NULL pointer, for =
chaos and madness await thee at its end"
>             >     >     >>
>             >     >     >>
>             >     >     >>
>             >     >     >> --
>             >     >     >> "Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end"
>             >     >     >
>             >     >     >
>             >     >     >
>             >     >     > --
>             >     >     > "Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end"
>             >     >
>             >     >
>             >     >
>             >     >     --
>             >     >     "Thou shalt not follow the NULL pointer, for chao=
s and madness await
>             >     >     thee at its end"
>             >     >
>             >     >
>             >
>             >
>             >
>             >     --
>             >     "Thou shalt not follow the NULL pointer, for chaos and =
madness await
>             >     thee at its end"
>             >
>             >
>
>
>
>             --
>             "Thou shalt not follow the NULL pointer, for chaos and madnes=
s await
>             thee at its end"
>
>
>
>
>
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

