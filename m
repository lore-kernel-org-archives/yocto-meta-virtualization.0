Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web11.13766.1593006262896642760
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 06:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SHGVNKSh;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: siddhuvgowda.18695@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id c4so2186840iot.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Jun 2020 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XjWQBBezrbPzyFvDFXCWQo1JQPY2RSKND1cuZsGz4KQ=;
        b=SHGVNKShpd5CLOdNJrvzXu61xx1mRo/Q4DydizWsy+/kA53XSNifGGEanUiGdMrWiO
         8Zn80mjzcsgS1H+ujWTkW6rvchXXQSU8Cr66YqyCBfMPmGrfRK/7u8oGVDvbR5SK9NiM
         gRTHGJ5DgCAg1UG4rp1DbuAAz8Xx5j5/trw9cWiD+BmWf/VOAR/LUKJZhAeYhU8iaJw2
         jBb7Ub8I+AqYCqyMr+4jXOxcs3McFDGNexyZMuli6IqQ6YcGNXx6d84FqPFJYpoizH+l
         WW8N6U/vcFwb+yFhBdaMmm34Gt0wZkY0790GCbSB01xiDtlaCBCWrv5Z5npmqvtHE7cV
         KnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XjWQBBezrbPzyFvDFXCWQo1JQPY2RSKND1cuZsGz4KQ=;
        b=sCCW8izXKaw3/l3ThyOIwqyGe+SmaAg/YtmF7yP9jWZ+FlkQzAUfVmvwN0rU3wuvqb
         ONqVuP/isfNYGqNg0xJExAQVliOV0HaYFMr2OEThDgFb8GCIqtuQSxPo89aULIpMHbBy
         joFrbwzpWpWArQPop/O5wywvGqwpPMWFW7CkQgSQwG7ssqwShMNH97c96ubqihYHlu0L
         cB1hEUBlZUMij+oc829bFUOAmIc8Zqy/cH1vffZG7lZtBy6XjjeyG4txm+q2fEqmPtPo
         xIUl7UxfeSzxz4fmIygmMtS1DB8vcpn6IUer1cO3HZPh09W1AGGVeytwerj7aHHECmT6
         6lQA==
X-Gm-Message-State: AOAM5316iAZuC2enuwdRRY9cUCc/pjRW4w3BHe0B7DgEMJ962KRe+0Cv
	8RhgFE6HIL0AiY/a4/RREaP3GK5SJoVjdfw8kSXIQ5P+E6w=
X-Google-Smtp-Source: ABdhPJyYTRSfY54K881LiV2F0XZYUWfAsMyqxfXYQmI1wHEgDuzLvhRdK5AooHKIRguHx4yUIE2FlS7PYz5TtmMrOgQ=
X-Received: by 2002:a5e:dd45:: with SMTP id u5mr31315010iop.118.1593006262104;
 Wed, 24 Jun 2020 06:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAEkELtABVciaYgQmp-dOfxPSepSo1Dk5WuLVQ=Ubt9EDACyxKA@mail.gmail.com>
 <CACMJ4GagmpBh8355d2eKqdC9h8asF+SXA8SyVeWfFTba_qFh8w@mail.gmail.com>
 <CAEkELtAUzmoPa-FiOKeJ-THTe5-Ne4wtiLpKx6GjwPT5+xdsfw@mail.gmail.com>
 <CACMJ4GamMJSN=gPb=f4uFdVHz0OWRMAovSeHh+71iFLvCH9q6A@mail.gmail.com> <161B7A64B1A64BD8.13501@lists.yoctoproject.org>
In-Reply-To: <161B7A64B1A64BD8.13501@lists.yoctoproject.org>
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
Date: Wed, 24 Jun 2020 19:14:10 +0530
Message-ID: <CAEkELtAmLmnY7iGhu5exxL2xWhmfYKeRxXkaXBTNm3FqutsaMA@mail.gmail.com>
Subject: Re: [meta-virtualization] Xen On Raspberrypi-4. Not able to build the xen image.
To: siddhartha v <Siddhuvgowda.18695@gmail.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
X-Groupsio-MsgNum: 5446
Content-Type: multipart/mixed; boundary="00000000000061145c05a8d4ac03"

--00000000000061145c05a8d4ac03
Content-Type: multipart/alternative; boundary="00000000000061145905a8d4ac01"

--00000000000061145905a8d4ac01
Content-Type: text/plain; charset="UTF-8"

Hello sir,


  I later added the meta-perl layer from the openembedded the perl issue
(which was posted earlier) resolved.The build went upto 93%. But now again
the root_fs issue is coming.

Below is the complete error:
































*ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. Command
'/home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/dnf
-v --rpmverbosity=info -y -c
/home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-image-minimal/1.0-r0/rootfs/etc/dnf/dnf.conf
--setopt=reposdir=/home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-image-minimal/1.0-r0/rootfs/etc/yum.repos.d
--installroot=/home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-image-minimal/1.0-r0/rootfs
--setopt=logdir=/home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-image-minimal/1.0-r0/temp
--repofrompath=oe-repo,/home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-image-minimal/1.0-r0/oe-rootfs-repo
--nogpgcheck install kernel-module-xen-blkback kernel-module-xen-gntalloc
kernel-module-xen-gntdev kernel-module-xen-netback kernel-module-xen-wdt
packagegroup-core-boot packagegroup-core-ssh-dropbear
packagegroup-core-ssh-openssh qemu run-postinsts xen xen-tools
locale-base-en-us locale-base-en-gb' returned 1:DNF version: 4.2.2cachedir:
/home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-image-minimal/1.0-r0/rootfs/var/cache/dnfAdded
oe-repo repo from
/home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-image-minimal/1.0-r0/oe-rootfs-reporepo:
using cache for: oe-reponot found other for: not found modules for: not
found deltainfo for: not found updateinfo for: oe-repo: using metadata from
Wed 24 Jun 2020 01:27:56 PM UTC.Last metadata expiration check: 0:00:03 ago
on Wed 24 Jun 2020 01:28:11 PM UTC.No module defaults found--> Starting
dependency resolution--> Finished dependency resolutionError:  Problem:
package dropbear-2019.78-r0.aarch64 conflicts with openssh provided by
openssh-8.1p1-r0.aarch64  - package openssh-8.1p1-r0.aarch64 conflicts with
dropbear provided by dropbear-2019.78-r0.aarch64  - package
packagegroup-core-ssh-openssh-1.0-r1.noarch requires openssh, but none of
the providers can be installed  - package
packagegroup-core-ssh-dropbear-1.0-r1.noarch requires dropbear, but none of
the providers can be installed  - conflicting requests(try to add
'--allowerasing' to command line to replace conflicting packages or
'--skip-broken' to skip uninstallable packages or '--nobest' to use not
only best candidate packages)ERROR: Logfile of failure stored in:
/home/siddhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-image-minimal/1.0-r0/temp/log.do_rootfs.24152ERROR:
Task
(/home/siddhu/Documents/yocto/zindagi/sources/meta-virtualization/recipes-extended/images/xen-image-minimal.bb:do_rootfs)
failed with exit code '1'NOTE: Tasks Summary: Attempted 4100 tasks of which
2885 didn't need to be rerun and 1 failed.Summary: 1 task failed:
/home/siddhu/Documents/yocto/zindagi/sources/meta-virtualization/recipes-extended/images/xen-image-minimal.bb:do_rootfsSummary:
There was 1 ERROR message shown, returning a non-zero exit
code.siddhu@siddhu:~/Documents/yocto/zindagi/build$ *
*\*


 This same error I faced when I was working for RPI-3. Why do this error is
repeating sir. May I know what wrong I have done here.

I am attaching the log for the same. "ERROR: xen-image-minimal-1.0-r0
do_rootfs: Could not invoke dnf." I am not getting why do the xen building
is terminating at this same stage every time.




--
Thanks and Regards.
Siddhartha V.



On Wed, Jun 24, 2020 at 5:54 PM Siddhartha V via lists.yoctoproject.org
<Siddhuvgowda.18695=gmail.com@lists.yoctoproject.org> wrote:

> Hello @Christopher Clark sir,
>
>
>     I tried what you have suggested. Things went well in initial stage i.e
> upto 70% the build went well. But @70% I got the below error and the entire
> building got terminated.
>
>
>
>
>
>
>
>
>
>
>
> *ERROR: Logfile of failure stored in:
> /home/siddhu/Documents/yocto/zindagi/build/tmp/work/aarch64-poky-linux/perl/5.30.1-r0/temp/log.do_package_write_rpm.1242ERROR:
> Task
> (/home/siddhu/Documents/yocto/zindagi/sources/poky/meta/recipes-devtools/perl/perl_5.30.1.bb:do_package_write_rpm)
> failed with exit code '1'NOTE: Tasks Summary: Attempted 2882 tasks of which
> 0 didn't need to be rerun and 2 failed.Summary: 2 tasks failed:
> /home/siddhu/Documents/yocto/zindagi/sources/poky/meta/recipes-core/glibc/glibc-locale_2.31.bb:do_package_write_rpm
> /home/siddhu/Documents/yocto/zindagi/sources/poky/meta/recipes-devtools/perl/perl_5.30.1.bb:do_package_write_rpmSummary:
> There were 5 WARNING messages shown.Summary: There were 2 ERROR messages
> shown, returning a non-zero exit code.*
>
>
> I have added the log for the same.
> 1. Log for do-write rpm
> 2. The entire error log from the terminal.
>
> The above errors I have faced the same issue wit the same packages. Is
> there any issue with the packages that fetched? I need some suggestion here
> what wrong I am doing here sir. Kind request,.
>
>
>
>
> --
> Thanks and Regards.
> Siddhartha V.
>
>
>
> On Fri, Jun 19, 2020 at 10:43 PM Christopher Clark <
> christopher.w.clark@gmail.com> wrote:
>
>> On Fri, Jun 19, 2020 at 9:43 AM siddhartha v
>> <siddhuvgowda.18695@gmail.com> wrote:
>> >
>> > hello sir,
>> >
>> >   As you suggested I searched for the layers with the same commit
>> version number. I am able to find meta-raspberrypi and poky. But, other two
>> I couldn't find. May I know how and where can I get the other layers
>> please. I am really Sorry to trouble you again and again sir. Sorry.
>> >
>> > Below are the sites from where I downloaded the :
>> >
>> > 1. meta-raspberrypi:=e589e0f3fda8f15f1093909328605e0bb6516d94
>> >
>> https://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/commit/?id=e589e0f3fda8f15f1093909328605e0bb6516d94
>> >
>> > 2. Poky:=18b6b2ae819cbf0ef3858944b4cd02ab74df6607
>> >
>> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=18b6b2ae819cbf0ef3858944b4cd02ab74df6607
>> >
>> > Am I on the right path sir? But, I couldn't find the other two layers
>> with the exact commit version that you have shared. I Kindly request you to
>> help me on this.
>>
>> # First get poky and check out the specific commit into a new branch:
>> git clone git://git.yoctoproject.org/poky
>> cd poky
>> git checkout 18b6b2ae819cbf0ef3858944b4cd02ab74df6607
>> git checkout -b local-rpi
>>
>> # Next get the other layers:
>> git clone git://git.openembedded.org/meta-openembedded
>> cd meta-openembedded
>> git checkout 463f9a3ef0935d772a0be0437a8c09df64ed2f07
>> git checkout -b local-rpi
>> cd ..
>>
>> git clone git://git.yoctoproject.org/meta-raspberrypi
>> cd meta-raspberrypi
>> git checkout e589e0f3fda8f15f1093909328605e0bb6516d94
>> git checkout -b local-rpi
>> cd ..
>>
>> git clone https://github.com/dozylynx/meta-virtualization
>> cd meta-virtualization
>> git checkout  0c809ead05224a61a784744240bb9c125990c481
>> git checkout -b local-rpi
>> cd ..
>>
>> > ** Out of curiosity In https://github.com/dozylynx/meta-virtualization
>> I saw the branch "Raspberry-pi4-initial-xen" will that help us any way? **
>>
>> That branch currently contains the same code as the revision that
>> you'll check out with the instructions above.
>>
>> Christopher
>>
>
> --
> Best Regards,
> Siddhartha V 
>

--00000000000061145905a8d4ac01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello sir,</div><div><br></div><div><br></div><div>=
=C2=A0 I later added the meta-perl layer from the openembedded the perl is=
sue (which was posted earlier) resolved.The build went upto 93%. But now ag=
ain the root_fs issue is coming.</div><div><br></div><div>Below is the comp=
lete error:</div><div><br></div><div><b><br>ERROR: xen-image-minimal-1.0-r0=
 do_rootfs: Could not invoke dnf. Command &#39;/home/siddhu/Documents/yocto=
/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-image-minimal/1.0-r0=
/recipe-sysroot-native/usr/bin/dnf -v --rpmverbosity=3Dinfo -y -c /home/sid=
dhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-i=
mage-minimal/1.0-r0/rootfs/etc/dnf/dnf.conf --setopt=3Dreposdir=3D/home/sid=
dhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-i=
mage-minimal/1.0-r0/rootfs/etc/yum.repos.d --installroot=3D/home/siddhu/Doc=
uments/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-image-mi=
nimal/1.0-r0/rootfs --setopt=3Dlogdir=3D/home/siddhu/Documents/yocto/zindag=
i/build/tmp/work/raspberrypi4_64-poky-linux/xen-image-minimal/1.0-r0/temp -=
-repofrompath=3Doe-repo,/home/siddhu/Documents/yocto/zindagi/build/tmp/work=
/raspberrypi4_64-poky-linux/xen-image-minimal/1.0-r0/oe-rootfs-repo --nogpg=
check install kernel-module-xen-blkback kernel-module-xen-gntalloc kernel-m=
odule-xen-gntdev kernel-module-xen-netback kernel-module-xen-wdt packagegro=
up-core-boot packagegroup-core-ssh-dropbear packagegroup-core-ssh-openssh q=
emu run-postinsts xen xen-tools locale-base-en-us locale-base-en-gb&#39; re=
turned 1:<br>DNF version: 4.2.2<br>cachedir: /home/siddhu/Documents/yocto/z=
indagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-image-minimal/1.0-r0/r=
ootfs/var/cache/dnf<br>Added oe-repo repo from /home/siddhu/Documents/yocto=
/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-image-minimal/1.0-r0=
/oe-rootfs-repo<br>repo: using cache for: oe-repo<br>not found other for: <=
br>not found modules for: <br>not found deltainfo for: <br>not found update=
info for: <br>oe-repo: using metadata from Wed 24 Jun 2020 01:27:56 PM UTC.=
<br>Last metadata expiration check: 0:00:03 ago on Wed 24 Jun 2020 01:28:11=
 PM UTC.<br>No module defaults found<br>--&gt; Starting dependency resoluti=
on<br>--&gt; Finished dependency resolution<br>Error: <br>=C2=A0Problem: pa=
ckage dropbear-2019.78-r0.aarch64 conflicts with openssh provided by openss=
h-8.1p1-r0.aarch64<br>=C2=A0 - package openssh-8.1p1-r0.aarch64 conflicts w=
ith dropbear provided by dropbear-2019.78-r0.aarch64<br>=C2=A0 - package pa=
ckagegroup-core-ssh-openssh-1.0-r1.noarch requires openssh, but none of the=
 providers can be installed<br>=C2=A0 - package packagegroup-core-ssh-dropb=
ear-1.0-r1.noarch requires dropbear, but none of the providers can be insta=
lled<br>=C2=A0 - conflicting requests<br>(try to add &#39;--allowerasing&#3=
9; to command line to replace conflicting packages or &#39;--skip-broken&#3=
9; to skip uninstallable packages or &#39;--nobest&#39; to use not only bes=
t candidate packages)<br><br>ERROR: Logfile of failure stored in: /home/sid=
dhu/Documents/yocto/zindagi/build/tmp/work/raspberrypi4_64-poky-linux/xen-i=
mage-minimal/1.0-r0/temp/log.do_rootfs.24152<br>ERROR: Task (/home/siddhu/D=
ocuments/yocto/zindagi/sources/meta-virtualization/recipes-extended/images/=
xen-image-minimal.bb:do_rootfs) failed with exit code &#39;1&#39;<br>NOTE: =
Tasks Summary: Attempted 4100 tasks of which 2885 didn&#39;t need to be rer=
un and 1 failed.<br><br>Summary: 1 task failed:<br>=C2=A0 /home/siddhu/Docu=
ments/yocto/zindagi/sources/meta-virtualization/recipes-extended/images/xen=
-image-minimal.bb:do_rootfs<br>Summary: There was 1 ERROR message shown, re=
turning a non-zero exit code.<br>siddhu@siddhu:~/Documents/yocto/zindagi/bu=
ild$=C2=A0<br></b></div><div><b>\</b></div><div><br></div><div><br></div><d=
iv>=C2=A0This same error I faced when I was working for RPI-3. Why do this =
error is repeating sir. May I know what wrong I have done here.</div><div><=
br></div><div>I am attaching the log for the same. &quot;ERROR: xen-image-m=
inimal-1.0-r0 do_rootfs: Could not invoke dnf.&quot; I am not getting why d=
o the xen building is terminating at this same stage every time.</div><div>=
<br></div><div><br></div><div><br></div><br clear=3D"all"><div><div dir=3D"=
ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div>--</div><div>Thanks and Regards.</div>Siddhartha V.<div>=C2=
=A0</div></div></div></div><br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 24, 2020 at 5:54 PM Siddhartha =
V via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> =
&lt;Siddhuvgowda.18695=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org=
">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hello @Christopher Clark=
 sir,<div><br></div><div><br></div><div>=C2=A0 =C2=A0 I tried what you have=
 suggested. Things went well in initial stage i.e upto 70% the build went w=
ell. But=C2=A0@70% I got the below error and the entire building got termin=
ated.</div><div><br></div><div><b><br>ERROR: Logfile of failure stored in: =
/home/siddhu/Documents/yocto/zindagi/build/tmp/work/aarch64-poky-linux/perl=
/5.30.1-r0/temp/log.do_package_write_rpm.1242<br>ERROR: Task (/home/siddhu/=
Documents/yocto/zindagi/sources/poky/meta/recipes-devtools/perl/perl_5.30.1=
.bb:do_package_write_rpm) failed with exit code &#39;1&#39;<br>NOTE: Tasks =
Summary: Attempted 2882 tasks of which 0 didn&#39;t need to be rerun and 2 =
failed.<br><br>Summary: 2 tasks failed:<br>=C2=A0 /home/siddhu/Documents/yo=
cto/zindagi/sources/poky/meta/recipes-core/glibc/glibc-locale_2.31.bb:do_pa=
ckage_write_rpm<br>=C2=A0 /home/siddhu/Documents/yocto/zindagi/sources/poky=
/meta/recipes-devtools/perl/perl_5.30.1.bb:do_package_write_rpm<br>Summary:=
 There were 5 WARNING messages shown.<br>Summary: There were 2 ERROR messag=
es shown, returning a non-zero exit code.<br></b></div><div><br></div><div>=
<br></div><div>I have added the log for the same.</div><div>1. Log for do-w=
rite rpm</div><div>2. The entire error log from the terminal.</div><div><br=
></div><div>The above errors I have faced the same issue wit the same packa=
ges. Is there any issue with the packages that fetched? I need some suggest=
ion here what wrong=C2=A0I am doing here sir. Kind request,.</div><div><br>=
</div><div><br></div><div><br></div><div><br clear=3D"all"><div><div dir=3D=
"ltr"><div dir=3D"ltr"><div>--</div><div>Thanks and Regards.</div>Siddharth=
a V.<div>=C2=A0</div></div></div></div><br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 19, 2020 at 10=
:43 PM Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@gmail.co=
m" target=3D"_blank">christopher.w.clark@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Jun 19, 2020 at 9=
:43 AM siddhartha v<br>
&lt;<a href=3D"mailto:siddhuvgowda.18695@gmail.com" target=3D"_blank">sidd=
huvgowda.18695@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; hello sir,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0As you suggested I searched for the layers with the same =
commit version number. I am able to find meta-raspberrypi and poky. But, ot=
her two I couldn&#39;t find. May I know how and where can I get the other l=
ayers please. I am really Sorry to trouble you again and again sir. Sorry.<=
br>
&gt;<br>
&gt; Below are the sites from where I downloaded the :<br>
&gt;<br>
&gt; 1. meta-raspberrypi:=3De589e0f3fda8f15f1093909328605e0bb6516d94<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/met=
a-raspberrypi/commit/?id=3De589e0f3fda8f15f1093909328605e0bb6516d94" rel=3D=
"noreferrer" target=3D"_blank">https://git.yoctoproject.org/cgit/cgit.cgi/m=
eta-raspberrypi/commit/?id=3De589e0f3fda8f15f1093909328605e0bb6516d94</a><b=
r>
&gt;<br>
&gt; 2. Poky:=3D18b6b2ae819cbf0ef3858944b4cd02ab74df6607<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/pok=
y/commit/?id=3D18b6b2ae819cbf0ef3858944b4cd02ab74df6607" rel=3D"noreferrer"=
 target=3D"_blank">https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?=
id=3D18b6b2ae819cbf0ef3858944b4cd02ab74df6607</a><br>
&gt;<br>
&gt; Am I on the right path sir? But, I couldn&#39;t find the other two la=
yers with the exact commit version that you have shared. I Kindly request y=
ou to help me on this.<br>
<br>
# First get poky and check out the specific commit into a new branch:<br>
git clone git://<a href=3D"http://git.yoctoproject.org/poky" rel=3D"norefe=
rrer" target=3D"_blank">git.yoctoproject.org/poky</a><br>
cd poky<br>
git checkout 18b6b2ae819cbf0ef3858944b4cd02ab74df6607<br>
git checkout -b local-rpi<br>
<br>
# Next get the other layers:<br>
git clone git://<a href=3D"http://git.openembedded.org/meta-openembedded" =
rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembedded=
</a><br>
cd meta-openembedded<br>
git checkout 463f9a3ef0935d772a0be0437a8c09df64ed2f07<br>
git checkout -b local-rpi<br>
cd ..<br>
<br>
git clone git://<a href=3D"http://git.yoctoproject.org/meta-raspberrypi" r=
el=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/meta-raspberrypi</=
a><br>
cd meta-raspberrypi<br>
git checkout e589e0f3fda8f15f1093909328605e0bb6516d94<br>
git checkout -b local-rpi<br>
cd ..<br>
<br>
git clone <a href=3D"https://github.com/dozylynx/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/dozylynx/meta-virtual=
ization</a><br>
cd meta-virtualization<br>
git checkout=C2=A0 0c809ead05224a61a784744240bb9c125990c481<br>
git checkout -b local-rpi<br>
cd ..<br>
<br>
&gt; ** Out of curiosity In <a href=3D"https://github.com/dozylynx/meta-vi=
rtualization" rel=3D"noreferrer" target=3D"_blank">https://github.com/dozyl=
ynx/meta-virtualization</a> I saw the branch &quot;Raspberry-pi4-initial-xe=
n&quot; will that help us any way? **<br>
<br>
That branch currently contains the same code as the revision that<br>
you&#39;ll check out with the instructions above.<br>
<br>
Christopher<br>
</blockquote></div>
<br>-- <br>Best Regards,<br>Siddhartha V
<br>
</blockquote></div>
<br>-- <br>Best Regards,<br />Siddhartha V

--00000000000061145905a8d4ac01--

--00000000000061145c05a8d4ac03
Content-Type: application/octet-stream; name="log.do_rootfs.24152"
Content-Disposition: attachment; filename="log.do_rootfs.24152"
Content-Transfer-Encoding: base64
Content-ID: <f_kbteq6970>
X-Attachment-Id: f_kbteq6970

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290Ck5P
VEU6IERpcmVjdCBkZXBlbmRlbmNpZXMgYXJlIFsnL2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0
by96aW5kYWdpL3NvdXJjZXMvcG9reS9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9sZGNvbmZpZy1u
YXRpdmVfMi4xMi4xLmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnLCAndmlydHVhbDpuYXRpdmU6L2hv
bWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL3NvdXJjZXMvcG9reS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvb3BrZy9vcGtnXzAuNC4yLmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnLCAndmly
dHVhbDpuYXRpdmU6L2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL3NvdXJjZXMv
cG9reS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWFrZWRldnMvbWFrZWRldnNfMS4wLjEuYmI6ZG9f
cG9wdWxhdGVfc3lzcm9vdCcsICcvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3ppbmRhZ2kv
c291cmNlcy9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ta2xpYnMvbWtsaWJzLW5hdGl2ZV8w
LjEuNDQuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICd2aXJ0dWFsOm5hdGl2ZTovaG9tZS9zaWRk
aHUvRG9jdW1lbnRzL3lvY3RvL3ppbmRhZ2kvc291cmNlcy9wb2t5L21ldGEvcmVjaXBlcy1leHRl
bmRlZC9waWd6L3BpZ3pfMi40LmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnLCAndmlydHVhbDpuYXRp
dmU6L2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL3NvdXJjZXMvcG9reS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvb3BrZy11dGlscy9vcGtnLXV0aWxzXzAuNC4yLmJiOmRvX3BvcHVs
YXRlX3N5c3Jvb3QnLCAnL2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL3NvdXJj
ZXMvcG9reS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11d3JhcHBlci1jcm9zc18xLjAu
YmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICd2aXJ0dWFsOm5hdGl2ZTovaG9tZS9zaWRkaHUvRG9j
dW1lbnRzL3lvY3RvL3ppbmRhZ2kvc291cmNlcy9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
cG0vcnBtXzQuMTQuMi4xLmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnLCAndmlydHVhbDpuYXRpdmU6
L2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL3NvdXJjZXMvcG9reS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjIuMi5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3Zp
cnR1YWw6bmF0aXZlOi9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vemluZGFnaS9zb3VyY2Vz
L3Bva3kvbWV0YS9yZWNpcGVzLWNvcmUvdXBkYXRlLXJjLmQvdXBkYXRlLXJjLmRfMC44LmJiOmRv
X3BvcHVsYXRlX3N5c3Jvb3QnLCAndmlydHVhbDpuYXRpdmU6L2hvbWUvc2lkZGh1L0RvY3VtZW50
cy95b2N0by96aW5kYWdpL3NvdXJjZXMvcG9reS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHJlbGlu
ay9wcmVsaW5rX2dpdC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZlOi9o
b21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vemluZGFnaS9zb3VyY2VzL3Bva3kvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3BiemlwMi9wYnppcDJfMS4xLjEzLmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3Qn
LCAndmlydHVhbDpuYXRpdmU6L2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL3Nv
dXJjZXMvcG9reS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL3BzZXVkb19naXQuYmI6ZG9f
cG9wdWxhdGVfc3lzcm9vdCcsICcvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3ppbmRhZ2kv
c291cmNlcy9wb2t5L21ldGEvcmVjaXBlcy1rZXJuZWwva21vZC9kZXBtb2R3cmFwcGVyLWNyb3Nz
XzEuMC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZlOi9ob21lL3NpZGRo
dS9Eb2N1bWVudHMveW9jdG8vemluZGFnaS9zb3VyY2VzL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMC4xNS41LmJiOmRvX3BvcHVsYXRlX3N5c3Jv
b3QnLCAnL2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL3NvdXJjZXMvcG9reS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliYy9jcm9zcy1sb2NhbGVkZWYtbmF0aXZlXzIuMzEuYmI6ZG9f
cG9wdWxhdGVfc3lzcm9vdCcsICd2aXJ0dWFsOm5hdGl2ZTovaG9tZS9zaWRkaHUvRG9jdW1lbnRz
L3lvY3RvL3ppbmRhZ2kvc291cmNlcy9wb2t5L21ldGEvcmVjaXBlcy1leHRlbmRlZC94ei94el81
LjIuNC5iYjpkb19wb3B1bGF0ZV9zeXNyb290J10KTk9URTogSW5zdGFsbGVkIGludG8gc3lzcm9v
dDogWydsZGNvbmZpZy1uYXRpdmUnLCAnb3BrZy1uYXRpdmUnLCAnbWFrZWRldnMtbmF0aXZlJywg
J21rbGlicy1uYXRpdmUnLCAncGlnei1uYXRpdmUnLCAnb3BrZy11dGlscy1uYXRpdmUnLCAncnBt
LW5hdGl2ZScsICdkbmYtbmF0aXZlJywgJ3VwZGF0ZS1yYy5kLW5hdGl2ZScsICdwcmVsaW5rLW5h
dGl2ZScsICdwYnppcDItbmF0aXZlJywgJ2NyZWF0ZXJlcG8tYy1uYXRpdmUnLCAnc2hhZG93LW5h
dGl2ZScsICdzaGFyZWQtbWltZS1pbmZvLW5hdGl2ZScsICdsaWJzb2x2LW5hdGl2ZScsICdsaWJh
cmNoaXZlLW5hdGl2ZScsICdwZXJsLW5hdGl2ZScsICdmaWxlLW5hdGl2ZScsICdlbGZ1dGlscy1u
YXRpdmUnLCAnZGItbmF0aXZlJywgJ3BvcHQtbmF0aXZlJywgJ2RidXMtbmF0aXZlJywgJ2xpYmRu
Zi1uYXRpdmUnLCAnbGlicmVwby1uYXRpdmUnLCAnY21ha2UtbmF0aXZlJywgJ2xpYmNvbXBzLW5h
dGl2ZScsICdweXRob24zLWluaXBhcnNlLW5hdGl2ZScsICdkZWJpYW51dGlscy1uYXRpdmUnLCAn
YmludXRpbHMtbmF0aXZlJywgJ2xpYnhtbDItbmF0aXZlJywgJ2V4cGF0LW5hdGl2ZScsICdjdXJs
LW5hdGl2ZScsICdpdHN0b29sLW5hdGl2ZScsICdsem8tbmF0aXZlJywgJ2UyZnNwcm9ncy1uYXRp
dmUnLCAnc3dpZy1uYXRpdmUnLCAnanNvbi1jLW5hdGl2ZScsICdsaWJjaGVjay1uYXRpdmUnLCAn
bGlibW9kdWxlbWQtdjEtbmF0aXZlJywgJ2dvYmplY3QtaW50cm9zcGVjdGlvbi1uYXRpdmUnLCAn
YXR0ci1uYXRpdmUnLCAnZ3BnbWUtbmF0aXZlJywgJ3B5dGhvbjMtc2l4LW5hdGl2ZScsICdmbGV4
LW5hdGl2ZScsICdsaWJ5YW1sLW5hdGl2ZScsICdsaWJhc3N1YW4tbmF0aXZlJywgJ2xpYmdwZy1l
cnJvci1uYXRpdmUnXQpOT1RFOiBTa2lwcGluZyBhcyBhbHJlYWR5IGV4aXN0cyBpbiBzeXNyb290
OiBbJ3FlbXV3cmFwcGVyLWNyb3NzJywgJ3BzZXVkby1uYXRpdmUnLCAnZGVwbW9kd3JhcHBlci1j
cm9zcycsICdjcm9zcy1sb2NhbGVkZWYtbmF0aXZlJywgJ3h6LW5hdGl2ZScsICdnbGliLTIuMC1u
YXRpdmUnLCAncXVpbHQtbmF0aXZlJywgJ3BrZ2NvbmZpZy1uYXRpdmUnLCAnYXV0b2NvbmYtbmF0
aXZlJywgJ2F1dG9tYWtlLW5hdGl2ZScsICdsaWJ0b29sLW5hdGl2ZScsICdnbnUtY29uZmlnLW5h
dGl2ZScsICdnZXR0ZXh0LW1pbmltYWwtbmF0aXZlJywgJ3psaWItbmF0aXZlJywgJ3FlbXUtbmF0
aXZlJywgJ29wZW5zc2wtbmF0aXZlJywgJ2J6aXAyLW5hdGl2ZScsICdweXRob24zLW5hdGl2ZScs
ICduaW5qYS1uYXRpdmUnLCAna21vZC1uYXRpdmUnLCAnc3FsaXRlMy1uYXRpdmUnLCAnbGliZmZp
LW5hdGl2ZScsICdndGstZG9jLW5hdGl2ZScsICdsaWJwY3JlLW5hdGl2ZScsICdnZXR0ZXh0LW5h
dGl2ZScsICd1dGlsLWxpbnV4LW5hdGl2ZScsICdtZXNvbi1uYXRpdmUnLCAndGV4aW5mby1kdW1t
eS1uYXRpdmUnLCAnbTQtbmF0aXZlJywgJ2dkYm0tbmF0aXZlJywgJ2xpYnRpcnBjLW5hdGl2ZScs
ICduY3Vyc2VzLW5hdGl2ZScsICdsaWJuc2wyLW5hdGl2ZScsICdyZWFkbGluZS1uYXRpdmUnLCAn
cmUyYy1uYXRpdmUnLCAnbGliY2FwLW5nLW5hdGl2ZScsICdsaWJwY3JlMi1uYXRpdmUnLCAncHl0
aG9uMy1zZXR1cHRvb2xzLW5hdGl2ZScsICd1bnppcC1uYXRpdmUnXQpERUJVRzogc2VkIC1lICdz
Ol5bXi9dKi86L2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL2J1aWxkL3RtcC93
b3JrL3Jhc3BiZXJyeXBpNF82NC1wb2t5LWxpbnV4L3hlbi1pbWFnZS1taW5pbWFsLzEuMC1yMC9y
ZWNpcGUtc3lzcm9vdC1uYXRpdmUvOmcnIC9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vemlu
ZGFnaS9idWlsZC90bXAvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcnBtLW5hdGl2ZS9maXht
ZXBhdGggL2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL2J1aWxkL3RtcC9zeXNy
b290cy1jb21wb25lbnRzL3g4Nl82NC9wZXJsLW5hdGl2ZS9maXhtZXBhdGggL2hvbWUvc2lkZGh1
L0RvY3VtZW50cy95b2N0by96aW5kYWdpL2J1aWxkL3RtcC9zeXNyb290cy1jb21wb25lbnRzL3g4
Nl82NC9lbGZ1dGlscy1uYXRpdmUvZml4bWVwYXRoIC9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9j
dG8vemluZGFnaS9idWlsZC90bXAvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvZGJ1cy1uYXRp
dmUvZml4bWVwYXRoIC9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vemluZGFnaS9idWlsZC90
bXAvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvbGliZG5mLW5hdGl2ZS9maXhtZXBhdGggL2hv
bWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL2J1aWxkL3RtcC9zeXNyb290cy1jb21w
b25lbnRzL3g4Nl82NC9saWJ4bWwyLW5hdGl2ZS9maXhtZXBhdGggL2hvbWUvc2lkZGh1L0RvY3Vt
ZW50cy95b2N0by96aW5kYWdpL2J1aWxkL3RtcC9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9j
dXJsLW5hdGl2ZS9maXhtZXBhdGggL2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdp
L2J1aWxkL3RtcC9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9pdHN0b29sLW5hdGl2ZS9maXht
ZXBhdGggL2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL2J1aWxkL3RtcC9zeXNy
b290cy1jb21wb25lbnRzL3g4Nl82NC9lMmZzcHJvZ3MtbmF0aXZlL2ZpeG1lcGF0aCAvaG9tZS9z
aWRkaHUvRG9jdW1lbnRzL3lvY3RvL3ppbmRhZ2kvYnVpbGQvdG1wL3N5c3Jvb3RzLWNvbXBvbmVu
dHMveDg2XzY0L2xpYmNoZWNrLW5hdGl2ZS9maXhtZXBhdGggL2hvbWUvc2lkZGh1L0RvY3VtZW50
cy95b2N0by96aW5kYWdpL2J1aWxkL3RtcC9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9nb2Jq
ZWN0LWludHJvc3BlY3Rpb24tbmF0aXZlL2ZpeG1lcGF0aCAvaG9tZS9zaWRkaHUvRG9jdW1lbnRz
L3lvY3RvL3ppbmRhZ2kvYnVpbGQvdG1wL3N5c3Jvb3RzLWNvbXBvbmVudHMveDg2XzY0L2dwZ21l
LW5hdGl2ZS9maXhtZXBhdGggL2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL2J1
aWxkL3RtcC9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9saWJhc3N1YW4tbmF0aXZlL2ZpeG1l
cGF0aCAvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3ppbmRhZ2kvYnVpbGQvdG1wL3N5c3Jv
b3RzLWNvbXBvbmVudHMveDg2XzY0L2xpYmdwZy1lcnJvci1uYXRpdmUvZml4bWVwYXRoIHwgeGFy
Z3Mgc2VkIC1pIC1lICdzOkZJWE1FU1RBR0lOR0RJUlRBUkdFVDovaG9tZS9zaWRkaHUvRG9jdW1l
bnRzL3lvY3RvL3ppbmRhZ2kvYnVpbGQvdG1wL3dvcmsvcmFzcGJlcnJ5cGk0XzY0LXBva3ktbGlu
dXgveGVuLWltYWdlLW1pbmltYWwvMS4wLXIwL3JlY2lwZS1zeXNyb290Omc7IHM6RklYTUVTVEFH
SU5HRElSSE9TVDovaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3ppbmRhZ2kvYnVpbGQvdG1w
L3dvcmsvcmFzcGJlcnJ5cGk0XzY0LXBva3ktbGludXgveGVuLWltYWdlLW1pbmltYWwvMS4wLXIw
L3JlY2lwZS1zeXNyb290LW5hdGl2ZTpnJyAtZSAnczpGSVhNRV9QU0VVRE9fU1lTUk9PVDovaG9t
ZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3ppbmRhZ2kvYnVpbGQvdG1wL3N5c3Jvb3RzLWNvbXBv
bmVudHMveDg2XzY0L3BzZXVkby1uYXRpdmU6ZycgLWUgJ3M6RklYTUVfSE9TVFRPT0xTX0RJUjov
aG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3ppbmRhZ2kvYnVpbGQvdG1wL2hvc3R0b29sczpn
JyAtZSAnczpGSVhNRV9QS0dEQVRBX0RJUjovaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3pp
bmRhZ2kvYnVpbGQvdG1wL3BrZ2RhdGEvcmFzcGJlcnJ5cGk0LTY0OmcnIC1lICdzOkZJWE1FX1BT
RVVET19MT0NBTFNUQVRFRElSOi9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vemluZGFnaS9i
dWlsZC90bXAvd29yay9yYXNwYmVycnlwaTRfNjQtcG9reS1saW51eC94ZW4taW1hZ2UtbWluaW1h
bC8xLjAtcjAvcHNldWRvLzpnJyAtZSAnczpGSVhNRV9MT0dGSUZPOi9ob21lL3NpZGRodS9Eb2N1
bWVudHMveW9jdG8vemluZGFnaS9idWlsZC90bXAvd29yay9yYXNwYmVycnlwaTRfNjQtcG9reS1s
aW51eC94ZW4taW1hZ2UtbWluaW1hbC8xLjAtcjAvdGVtcC9maWZvLjI0MTUyOmcnCkRFQlVHOiBQ
eXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290IGZpbmlzaGVkCkRFQlVHOiBFeGVj
dXRpbmcgcHl0aG9uIGZ1bmN0aW9uIGRvX3Jvb3RmcwpOT1RFOiBJbml0aWFsaXppbmcgaW50ZXJj
ZXB0IGRpciBmb3IgL2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL2J1aWxkL3Rt
cC93b3JrL3Jhc3BiZXJyeXBpNF82NC1wb2t5LWxpbnV4L3hlbi1pbWFnZS1taW5pbWFsLzEuMC1y
MC9yb290ZnMKREVCVUc6IENvbGxlY3RlZCBpbnRlcmNlcHRzOgogIC9ob21lL3NpZGRodS9Eb2N1
bWVudHMveW9jdG8vemluZGFnaS9zb3VyY2VzL3Bva3kvc2NyaXB0cy9wb3N0aW5zdC1pbnRlcmNl
cHRzL2RlbGF5X3RvX2ZpcnN0X2Jvb3QKICAvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3pp
bmRhZ2kvc291cmNlcy9wb2t5L3NjcmlwdHMvcG9zdGluc3QtaW50ZXJjZXB0cy9wb3N0aW5zdF9p
bnRlcmNlcHQKICAvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3ppbmRhZ2kvc291cmNlcy9w
b2t5L3NjcmlwdHMvcG9zdGluc3QtaW50ZXJjZXB0cy91cGRhdGVfZGVza3RvcF9kYXRhYmFzZQog
IC9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vemluZGFnaS9zb3VyY2VzL3Bva3kvc2NyaXB0
cy9wb3N0aW5zdC1pbnRlcmNlcHRzL3VwZGF0ZV9mb250X2NhY2hlCiAgL2hvbWUvc2lkZGh1L0Rv
Y3VtZW50cy95b2N0by96aW5kYWdpL3NvdXJjZXMvcG9reS9zY3JpcHRzL3Bvc3RpbnN0LWludGVy
Y2VwdHMvdXBkYXRlX2dpb19tb2R1bGVfY2FjaGUKICAvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lv
Y3RvL3ppbmRhZ2kvc291cmNlcy9wb2t5L3NjcmlwdHMvcG9zdGluc3QtaW50ZXJjZXB0cy91cGRh
dGVfZ3RrX2ljb25fY2FjaGUKICAvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3ppbmRhZ2kv
c291cmNlcy9wb2t5L3NjcmlwdHMvcG9zdGluc3QtaW50ZXJjZXB0cy91cGRhdGVfZ3RrX2ltbW9k
dWxlc19jYWNoZQogIC9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vemluZGFnaS9zb3VyY2Vz
L3Bva3kvc2NyaXB0cy9wb3N0aW5zdC1pbnRlcmNlcHRzL3VwZGF0ZV9taW1lX2RhdGFiYXNlCiAg
L2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL3NvdXJjZXMvcG9reS9zY3JpcHRz
L3Bvc3RpbnN0LWludGVyY2VwdHMvdXBkYXRlX3BpeGJ1Zl9jYWNoZQogIC9ob21lL3NpZGRodS9E
b2N1bWVudHMveW9jdG8vemluZGFnaS9zb3VyY2VzL3Bva3kvc2NyaXB0cy9wb3N0aW5zdC1pbnRl
cmNlcHRzL3VwZGF0ZV91ZGV2X2h3ZGIKCk5PVEU6ICMjIyMjIyBHZW5lcmF0ZSByb290ZnMgIyMj
IyMjIwpOT1RFOiBFeGVjdXRpbmcgJy9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vemluZGFn
aS9idWlsZC90bXAvd29yay9yYXNwYmVycnlwaTRfNjQtcG9reS1saW51eC94ZW4taW1hZ2UtbWlu
aW1hbC8xLjAtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vY3JlYXRlcmVwb19jIC0t
dXBkYXRlIC1xIC9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vemluZGFnaS9idWlsZC90bXAv
d29yay9yYXNwYmVycnlwaTRfNjQtcG9reS1saW51eC94ZW4taW1hZ2UtbWluaW1hbC8xLjAtcjAv
b2Utcm9vdGZzLXJlcG8nIC4uLgpOT1RFOiBSdW5uaW5nIC9ob21lL3NpZGRodS9Eb2N1bWVudHMv
eW9jdG8vemluZGFnaS9idWlsZC90bXAvd29yay9yYXNwYmVycnlwaTRfNjQtcG9reS1saW51eC94
ZW4taW1hZ2UtbWluaW1hbC8xLjAtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vZG5m
IC12IC0tcnBtdmVyYm9zaXR5PWluZm8gLXkgLWMgL2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0
by96aW5kYWdpL2J1aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBpNF82NC1wb2t5LWxpbnV4L3hlbi1p
bWFnZS1taW5pbWFsLzEuMC1yMC9yb290ZnMvZXRjL2RuZi9kbmYuY29uZiAtLXNldG9wdD1yZXBv
c2Rpcj0vaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3ppbmRhZ2kvYnVpbGQvdG1wL3dvcmsv
cmFzcGJlcnJ5cGk0XzY0LXBva3ktbGludXgveGVuLWltYWdlLW1pbmltYWwvMS4wLXIwL3Jvb3Rm
cy9ldGMveXVtLnJlcG9zLmQgLS1pbnN0YWxscm9vdD0vaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lv
Y3RvL3ppbmRhZ2kvYnVpbGQvdG1wL3dvcmsvcmFzcGJlcnJ5cGk0XzY0LXBva3ktbGludXgveGVu
LWltYWdlLW1pbmltYWwvMS4wLXIwL3Jvb3RmcyAtLXNldG9wdD1sb2dkaXI9L2hvbWUvc2lkZGh1
L0RvY3VtZW50cy95b2N0by96aW5kYWdpL2J1aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBpNF82NC1w
b2t5LWxpbnV4L3hlbi1pbWFnZS1taW5pbWFsLzEuMC1yMC90ZW1wIC0tcmVwb2Zyb21wYXRoPW9l
LXJlcG8sL2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL2J1aWxkL3RtcC93b3Jr
L3Jhc3BiZXJyeXBpNF82NC1wb2t5LWxpbnV4L3hlbi1pbWFnZS1taW5pbWFsLzEuMC1yMC9vZS1y
b290ZnMtcmVwbyBtYWtlY2FjaGUgLS1yZWZyZXNoCkRFQlVHOiBETkYgdmVyc2lvbjogNC4yLjIK
Y2FjaGVkaXI6IC9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vemluZGFnaS9idWlsZC90bXAv
d29yay9yYXNwYmVycnlwaTRfNjQtcG9reS1saW51eC94ZW4taW1hZ2UtbWluaW1hbC8xLjAtcjAv
cm9vdGZzL3Zhci9jYWNoZS9kbmYKQWRkZWQgb2UtcmVwbyByZXBvIGZyb20gL2hvbWUvc2lkZGh1
L0RvY3VtZW50cy95b2N0by96aW5kYWdpL2J1aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBpNF82NC1w
b2t5LWxpbnV4L3hlbi1pbWFnZS1taW5pbWFsLzEuMC1yMC9vZS1yb290ZnMtcmVwbwpNYWtpbmcg
Y2FjaGUgZmlsZXMgZm9yIGFsbCBtZXRhZGF0YSBmaWxlcy4Kb2UtcmVwbzogaGFzIGV4cGlyZWQg
YW5kIHdpbGwgYmUgcmVmcmVzaGVkLgpyZXBvOiBkb3dubG9hZGluZyBmcm9tIHJlbW90ZTogb2Ut
cmVwbwpvZS1yZXBvICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNzcg
TUIvcyB8IDEuNyBNQiAgICAgMDA6MDAgICAgCm5vdCBmb3VuZCBvdGhlciBmb3I6IApub3QgZm91
bmQgbW9kdWxlcyBmb3I6IApub3QgZm91bmQgZGVsdGFpbmZvIGZvcjogCm5vdCBmb3VuZCB1cGRh
dGVpbmZvIGZvcjogCm9lLXJlcG86IHVzaW5nIG1ldGFkYXRhIGZyb20gV2VkIDI0IEp1biAyMDIw
IDAxOjI3OjU2IFBNIFVUQy4KTGFzdCBtZXRhZGF0YSBleHBpcmF0aW9uIGNoZWNrOiAwOjAwOjAy
IGFnbyBvbiBXZWQgMjQgSnVuIDIwMjAgMDE6Mjg6MTEgUE0gVVRDLgpObyBtb2R1bGUgZGVmYXVs
dHMgZm91bmQKTWV0YWRhdGEgY2FjaGUgY3JlYXRlZC4KL2hvbWUvc2lkZGh1L0RvY3VtZW50cy95
b2N0by96aW5kYWdpL2J1aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBpNF82NC1wb2t5LWxpbnV4L3hl
bi1pbWFnZS1taW5pbWFsLzEuMC1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYi9weXRo
b24zLjgvc2l0ZS1wYWNrYWdlcy9kbmYvY2xpL2NvbW1hbmRzL3JlcG9xdWVyeS5weTo2MTQ6IFN5
bnRheFdhcm5pbmc6ICJpcyIgd2l0aCBhIGxpdGVyYWwuIERpZCB5b3UgbWVhbiAiPT0iPwogIHVz
ZWRwa2dzID0gc2V0KCkgaWYgdXNlZHBrZ3MgaXMgTm9uZSBvciBsZXZlbCBpcyAtMSBlbHNlIHVz
ZWRwa2dzCgpOT1RFOiBSdW5uaW5nIC9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vemluZGFn
aS9idWlsZC90bXAvd29yay9yYXNwYmVycnlwaTRfNjQtcG9reS1saW51eC94ZW4taW1hZ2UtbWlu
aW1hbC8xLjAtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vZG5mIC12IC0tcnBtdmVy
Ym9zaXR5PWluZm8gLXkgLWMgL2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL2J1
aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBpNF82NC1wb2t5LWxpbnV4L3hlbi1pbWFnZS1taW5pbWFs
LzEuMC1yMC9yb290ZnMvZXRjL2RuZi9kbmYuY29uZiAtLXNldG9wdD1yZXBvc2Rpcj0vaG9tZS9z
aWRkaHUvRG9jdW1lbnRzL3lvY3RvL3ppbmRhZ2kvYnVpbGQvdG1wL3dvcmsvcmFzcGJlcnJ5cGk0
XzY0LXBva3ktbGludXgveGVuLWltYWdlLW1pbmltYWwvMS4wLXIwL3Jvb3Rmcy9ldGMveXVtLnJl
cG9zLmQgLS1pbnN0YWxscm9vdD0vaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3ppbmRhZ2kv
YnVpbGQvdG1wL3dvcmsvcmFzcGJlcnJ5cGk0XzY0LXBva3ktbGludXgveGVuLWltYWdlLW1pbmlt
YWwvMS4wLXIwL3Jvb3RmcyAtLXNldG9wdD1sb2dkaXI9L2hvbWUvc2lkZGh1L0RvY3VtZW50cy95
b2N0by96aW5kYWdpL2J1aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBpNF82NC1wb2t5LWxpbnV4L3hl
bi1pbWFnZS1taW5pbWFsLzEuMC1yMC90ZW1wIC0tcmVwb2Zyb21wYXRoPW9lLXJlcG8sL2hvbWUv
c2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL2J1aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBp
NF82NC1wb2t5LWxpbnV4L3hlbi1pbWFnZS1taW5pbWFsLzEuMC1yMC9vZS1yb290ZnMtcmVwbyAt
LW5vZ3BnY2hlY2sgaW5zdGFsbCBrZXJuZWwtbW9kdWxlLXhlbi1ibGtiYWNrIGtlcm5lbC1tb2R1
bGUteGVuLWdudGFsbG9jIGtlcm5lbC1tb2R1bGUteGVuLWdudGRldiBrZXJuZWwtbW9kdWxlLXhl
bi1uZXRiYWNrIGtlcm5lbC1tb2R1bGUteGVuLXdkdCBwYWNrYWdlZ3JvdXAtY29yZS1ib290IHBh
Y2thZ2Vncm91cC1jb3JlLXNzaC1kcm9wYmVhciBwYWNrYWdlZ3JvdXAtY29yZS1zc2gtb3BlbnNz
aCBxZW11IHJ1bi1wb3N0aW5zdHMgeGVuIHhlbi10b29scyBsb2NhbGUtYmFzZS1lbi11cyBsb2Nh
bGUtYmFzZS1lbi1nYgpFUlJPUjogQ291bGQgbm90IGludm9rZSBkbmYuIENvbW1hbmQgJy9ob21l
L3NpZGRodS9Eb2N1bWVudHMveW9jdG8vemluZGFnaS9idWlsZC90bXAvd29yay9yYXNwYmVycnlw
aTRfNjQtcG9reS1saW51eC94ZW4taW1hZ2UtbWluaW1hbC8xLjAtcjAvcmVjaXBlLXN5c3Jvb3Qt
bmF0aXZlL3Vzci9iaW4vZG5mIC12IC0tcnBtdmVyYm9zaXR5PWluZm8gLXkgLWMgL2hvbWUvc2lk
ZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL2J1aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBpNF82
NC1wb2t5LWxpbnV4L3hlbi1pbWFnZS1taW5pbWFsLzEuMC1yMC9yb290ZnMvZXRjL2RuZi9kbmYu
Y29uZiAtLXNldG9wdD1yZXBvc2Rpcj0vaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3RvL3ppbmRh
Z2kvYnVpbGQvdG1wL3dvcmsvcmFzcGJlcnJ5cGk0XzY0LXBva3ktbGludXgveGVuLWltYWdlLW1p
bmltYWwvMS4wLXIwL3Jvb3Rmcy9ldGMveXVtLnJlcG9zLmQgLS1pbnN0YWxscm9vdD0vaG9tZS9z
aWRkaHUvRG9jdW1lbnRzL3lvY3RvL3ppbmRhZ2kvYnVpbGQvdG1wL3dvcmsvcmFzcGJlcnJ5cGk0
XzY0LXBva3ktbGludXgveGVuLWltYWdlLW1pbmltYWwvMS4wLXIwL3Jvb3RmcyAtLXNldG9wdD1s
b2dkaXI9L2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5kYWdpL2J1aWxkL3RtcC93b3Jr
L3Jhc3BiZXJyeXBpNF82NC1wb2t5LWxpbnV4L3hlbi1pbWFnZS1taW5pbWFsLzEuMC1yMC90ZW1w
IC0tcmVwb2Zyb21wYXRoPW9lLXJlcG8sL2hvbWUvc2lkZGh1L0RvY3VtZW50cy95b2N0by96aW5k
YWdpL2J1aWxkL3RtcC93b3JrL3Jhc3BiZXJyeXBpNF82NC1wb2t5LWxpbnV4L3hlbi1pbWFnZS1t
aW5pbWFsLzEuMC1yMC9vZS1yb290ZnMtcmVwbyAtLW5vZ3BnY2hlY2sgaW5zdGFsbCBrZXJuZWwt
bW9kdWxlLXhlbi1ibGtiYWNrIGtlcm5lbC1tb2R1bGUteGVuLWdudGFsbG9jIGtlcm5lbC1tb2R1
bGUteGVuLWdudGRldiBrZXJuZWwtbW9kdWxlLXhlbi1uZXRiYWNrIGtlcm5lbC1tb2R1bGUteGVu
LXdkdCBwYWNrYWdlZ3JvdXAtY29yZS1ib290IHBhY2thZ2Vncm91cC1jb3JlLXNzaC1kcm9wYmVh
ciBwYWNrYWdlZ3JvdXAtY29yZS1zc2gtb3BlbnNzaCBxZW11IHJ1bi1wb3N0aW5zdHMgeGVuIHhl
bi10b29scyBsb2NhbGUtYmFzZS1lbi11cyBsb2NhbGUtYmFzZS1lbi1nYicgcmV0dXJuZWQgMToK
RE5GIHZlcnNpb246IDQuMi4yCmNhY2hlZGlyOiAvaG9tZS9zaWRkaHUvRG9jdW1lbnRzL3lvY3Rv
L3ppbmRhZ2kvYnVpbGQvdG1wL3dvcmsvcmFzcGJlcnJ5cGk0XzY0LXBva3ktbGludXgveGVuLWlt
YWdlLW1pbmltYWwvMS4wLXIwL3Jvb3Rmcy92YXIvY2FjaGUvZG5mCkFkZGVkIG9lLXJlcG8gcmVw
byBmcm9tIC9ob21lL3NpZGRodS9Eb2N1bWVudHMveW9jdG8vemluZGFnaS9idWlsZC90bXAvd29y
ay9yYXNwYmVycnlwaTRfNjQtcG9reS1saW51eC94ZW4taW1hZ2UtbWluaW1hbC8xLjAtcjAvb2Ut
cm9vdGZzLXJlcG8KcmVwbzogdXNpbmcgY2FjaGUgZm9yOiBvZS1yZXBvCm5vdCBmb3VuZCBvdGhl
ciBmb3I6IApub3QgZm91bmQgbW9kdWxlcyBmb3I6IApub3QgZm91bmQgZGVsdGFpbmZvIGZvcjog
Cm5vdCBmb3VuZCB1cGRhdGVpbmZvIGZvcjogCm9lLXJlcG86IHVzaW5nIG1ldGFkYXRhIGZyb20g
V2VkIDI0IEp1biAyMDIwIDAxOjI3OjU2IFBNIFVUQy4KTGFzdCBtZXRhZGF0YSBleHBpcmF0aW9u
IGNoZWNrOiAwOjAwOjAzIGFnbyBvbiBXZWQgMjQgSnVuIDIwMjAgMDE6Mjg6MTEgUE0gVVRDLgpO
byBtb2R1bGUgZGVmYXVsdHMgZm91bmQKLS0+IFN0YXJ0aW5nIGRlcGVuZGVuY3kgcmVzb2x1dGlv
bgotLT4gRmluaXNoZWQgZGVwZW5kZW5jeSByZXNvbHV0aW9uCkVycm9yOiAKIFByb2JsZW06IHBh
Y2thZ2UgZHJvcGJlYXItMjAxOS43OC1yMC5hYXJjaDY0IGNvbmZsaWN0cyB3aXRoIG9wZW5zc2gg
cHJvdmlkZWQgYnkgb3BlbnNzaC04LjFwMS1yMC5hYXJjaDY0CiAgLSBwYWNrYWdlIG9wZW5zc2gt
OC4xcDEtcjAuYWFyY2g2NCBjb25mbGljdHMgd2l0aCBkcm9wYmVhciBwcm92aWRlZCBieSBkcm9w
YmVhci0yMDE5Ljc4LXIwLmFhcmNoNjQKICAtIHBhY2thZ2UgcGFja2FnZWdyb3VwLWNvcmUtc3No
LW9wZW5zc2gtMS4wLXIxLm5vYXJjaCByZXF1aXJlcyBvcGVuc3NoLCBidXQgbm9uZSBvZiB0aGUg
cHJvdmlkZXJzIGNhbiBiZSBpbnN0YWxsZWQKICAtIHBhY2thZ2UgcGFja2FnZWdyb3VwLWNvcmUt
c3NoLWRyb3BiZWFyLTEuMC1yMS5ub2FyY2ggcmVxdWlyZXMgZHJvcGJlYXIsIGJ1dCBub25lIG9m
IHRoZSBwcm92aWRlcnMgY2FuIGJlIGluc3RhbGxlZAogIC0gY29uZmxpY3RpbmcgcmVxdWVzdHMK
KHRyeSB0byBhZGQgJy0tYWxsb3dlcmFzaW5nJyB0byBjb21tYW5kIGxpbmUgdG8gcmVwbGFjZSBj
b25mbGljdGluZyBwYWNrYWdlcyBvciAnLS1za2lwLWJyb2tlbicgdG8gc2tpcCB1bmluc3RhbGxh
YmxlIHBhY2thZ2VzIG9yICctLW5vYmVzdCcgdG8gdXNlIG5vdCBvbmx5IGJlc3QgY2FuZGlkYXRl
IHBhY2thZ2VzKQoKREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBkb19yb290ZnMgZmluaXNoZWQK

--00000000000061145c05a8d4ac03--
