Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.8097.1635948497526554925
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 07:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NHSVFTdO;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id p16so5472420lfa.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Nov 2021 07:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MX0Pkir4cpbTQQNP9y+fhDNWLBK5ceJ8X52y95gmhVU=;
        b=NHSVFTdOnG9yeOQ4QqeoxIq2xb6jTT1I3JeFBeDspOg04o24/80BvcBve4i+nMa4B9
         3eFqedE/aS4K6X6cPG4XiEtGH0J6kRKH+jasNsmozVCUvrcFfnCLi0rPRNLpuHodi2G7
         M3BwRQhGgM0TrKIlhyth8gyM6wvtVF3gzLbHpkK1NpyW5gZpbQa0cYQ5DUs1GlA/a45U
         7FNHamOK7MyuoWjCvs3g2ZY02eVS0yMkQBS45xoXUXPyTnbn0OLFMw06D0zbq65Aje0W
         xJNv93PU6Eyfn6T17VeginQUcoDwRTRn/xYQpW9nv3/HIGWmurqqV40yLKrXCOlJU/Rm
         SwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MX0Pkir4cpbTQQNP9y+fhDNWLBK5ceJ8X52y95gmhVU=;
        b=YiddcQFUQF3lPPSgqCo/4lgvbsTVxWlpMVwh8stJm5yGFYSp3w3KKd33I/e8WICpKh
         OiTuv2Tq61SYGCn+f1hRmPRyw0K9nBG7PJDq+vf2zlnIqJV1xm6H3qd8KSdKc3iJgP+I
         gjHW6dQZgix6iv2h4Q9+JuMflDgTUls8mIbCy1KqQtBEJEwjwxIeWLu6aya95I5w/yxh
         KMEkPL6aRrvy6r1wqONkz/qLGWjoOe+BY15ayP4CU2+9cmJ88O8umWYVWpAdU896tj2W
         fEOYMzVL5XTojPzfSraZSRef6uSJv/SiNNE2X1u7ndtub6r93k3hkUkiMJD6XibYzKy/
         3RNQ==
X-Gm-Message-State: AOAM530X/WovlxIvi98a9bY7UopA/vF2fOE+SVM0lV0XWwbKD3D1qtEb
	gZv3c/Wu/dDIc4DK8FEPcbzf4hPNdxS4L1oLyF1B/+J2ma4=
X-Google-Smtp-Source: ABdhPJwxYkjRmRtvzkA8Ug/MN4ZVUD4FMLXjUGmlUoU1ZsLBlcJYRBY57tE/cK3PWo+vMDEuRVHZ8odipjAc/+uV4cM=
X-Received: by 2002:ac2:57d4:: with SMTP id k20mr41970991lfo.160.1635948495636;
 Wed, 03 Nov 2021 07:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR08MB4086AA6D776124ABB5125CE8F0849@AM6PR08MB4086.eurprd08.prod.outlook.com>
 <CADkTA4Nu5eGqsfe5mmJ6cHQQ51BAUY+4aROaWqa-5tbNH+Kxqg@mail.gmail.com>
 <AM6PR08MB40864FE34FC26FC9EDD37AEDF0849@AM6PR08MB4086.eurprd08.prod.outlook.com>
 <CADkTA4Oec38XsZJZP-p+LXax_vkHME9wm5AO4t3gSE32eO8WAA@mail.gmail.com> <708E6FE4-D7F6-428C-8D56-67DB594302EB@arm.com>
In-Reply-To: <708E6FE4-D7F6-428C-8D56-67DB594302EB@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 3 Nov 2021 10:08:04 -0400
Message-ID: <CADkTA4Mcj1EBKvJn-Qp-LBKYQdeto7uaFMTGVFRh_dJVi-zJEQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Error building Xen device tree for qemuarm64
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Edward Pickup <Edward.Pickup@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000f40d3005cfe2f097"

--000000000000f40d3005cfe2f097
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 3, 2021 at 8:11 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

> Hi Bruce,
>
> > On 26 Oct 2021, at 22:27, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> >
> >
> >
> > On Tue, Oct 26, 2021 at 9:27 AM Edward Pickup <Edward.Pickup@arm.com>
> wrote:
> > Hi Bruce,
> > Sorry for the formatting issues, email client config issues
> >
> >
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Sent: 26 October 2021 14:22
> > To: Edward Pickup <Edward.Pickup@arm.com>
> > Cc: meta-virtualization@lists.yoctoproject.org; Bertrand Marquis <
> Bertrand.Marquis@arm.com>; christopher.w.clark@gmail.com; nd <nd@arm.com>
> > Subject: Re: [meta-virtualization] Error building Xen device tree for
> qemuarm64
> >
> >
> >
> >
> >
> >
> >
> > On Tue, Oct 26, 2021 at 8:58 AM Edward Pickup <edward.pickup@arm.com>
> wrote:
> >
> > Hi all,
> >
> > I have encountered an error while building the arm64 version of the xen
> 4.16 recipe in meta-virtualisation, using the master version of poky and
> meta-virtuaisation.
> > I was wondering if anyone was familiar with the issue or knew how to fix
> it. The error is as follows:
> >
> > ERROR: xen-image-minimal-1.0-r0 do_write_xen_qemuboot_dtb:
> ExecutionError('/home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/temp/run.do_write_xen_qemuboot_dtb.3679135',
> 2, None, None)
> > ERROR: Logfile of failure stored in:
> /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/temp/log.do_write_xen_qemuboot_dtb.3679135
> .
> >
> > I believe the relevant part of the log is as follows:
> >
> > | [NOTE]: '3' lopper operation files will be processed
> > | [INFO]: dtb output format detected, writing
> /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/deploy-xen-image-minimal-image-complete/xen-image-minimal-qemuarm64-20211026121502.qemuboot.dtb
> > | [INFO]: writing output dtb:
> /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/deploy-xen-image-minimal-image-complete/xen-image-minimal-qemuarm64-20211026121502.qemuboot.dtb
> > |
> /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-image-minimal-1.0/output.dts:
> ERROR (explicit_phandles): /apb-pclk:phandle: bad length (1) phandle
> property
> > |
> /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-image-minimal-1.0/output.dts:
> ERROR (explicit_phandles): /intc@8000000:phandle: bad length (1) phandle
> property
> > |
> /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-image-minimal-1.0/output.dts:
> ERROR (explicit_phandles): /pl061@9030000:phandle: bad length (1) phandle
> property
> > | ERROR: Input tree has errors, aborting (use -f to force output)
> > | WARNING: exit code 2 from a shell command.
> >
> > The above error was the result from building on x86_64-linux, target
> system was aarch64-poky-linux, running on a qemuarch64 machine, itself
> running on x86_64 linux.
> > As mentioned this was done on the master version of meta-virtualisation.
> > The bitbake command to generate this was bitbake xen-image-mininal.
> > The error is also present when building the xen 4.14 and xen 4.15 arm64
> versions, and is not present on the arm32 or x86 builds for xen.
> > If anyone knows the cause of the error, the information would be
> appreciated.
> >
> >
> >
> > There's something wrong with the input DTS to Lopper .. luckily, I
> maintain Lopper, so if there's an actual bug in the processing of the input
> DTS .. I can fix that.
> >
> >
> >
> > I can fire up a build and see if it happens here.
>
>
> Could this be also considered for honister branch ?
>


Normally I might not bring back version bumps like these, but since most of
the heavy Xen users are asking for the change .. I've gone ahead and pulled
it back.

Note: I've left ARM64 broken on master, due to the libfdt issue, since that
still requires more effort.

Bruce



>
> Regards
> Bertrand
>
> >
> >
> >
> > So this is just qemuarm64, with xen + virtualization in the distro
> features ? Any other layers ? Anything else ?
> >
> >
> >
> > Bruce
> >
> > Yes, this is just as you say, no other layers or anything else. Thank
> you for the speedy reply!
> >
> >
> > There's a really bad interaction between libfdt and python 3.10.
> >
> > I've traced the error down to libfdt not being able to read anything
> from the dtbs and hence the chained errors.
> >
> > I'm building some older branches to confirm behaviours .. it will take
> me a few days to sort through this, but I don't want to mask the issue, as
> I need to understand exactly what is going on here.
> >
> > Bruce
> >
> >
> >
> >
> > Edward
> >
> >
> >
> >
> > Cheers!
> >
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
> >
> > 
> >
> >
> >
> >
> >
> > --
> >
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000f40d3005cfe2f097
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 3, 2021 at 8:11 AM Bertrand Marquis &lt=
;<a href=3D"mailto:Bertrand.Marquis@arm.com">Bertrand.Marquis@arm.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Bru=
ce,<br>
<br>
&gt; On 26 Oct 2021, at 22:27, Bruce Ashfield &lt;<a href=3D"mailto:bruce.a=
shfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote=
:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Tue, Oct 26, 2021 at 9:27 AM Edward Pickup &lt;<a href=3D"mailto:Ed=
ward.Pickup@arm.com" target=3D"_blank">Edward.Pickup@arm.com</a>&gt; wrote:=
<br>
&gt; Hi Bruce, <br>
&gt; Sorry for the formatting issues, email client config issues<br>
&gt; <br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt; <br>
&gt; Sent: 26 October 2021 14:22<br>
&gt; To: Edward Pickup &lt;<a href=3D"mailto:Edward.Pickup@arm.com" target=
=3D"_blank">Edward.Pickup@arm.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" targ=
et=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>; Bertrand Marq=
uis &lt;<a href=3D"mailto:Bertrand.Marquis@arm.com" target=3D"_blank">Bertr=
and.Marquis@arm.com</a>&gt;; <a href=3D"mailto:christopher.w.clark@gmail.co=
m" target=3D"_blank">christopher.w.clark@gmail.com</a>; nd &lt;<a href=3D"m=
ailto:nd@arm.com" target=3D"_blank">nd@arm.com</a>&gt;<br>
&gt; Subject: Re: [meta-virtualization] Error building Xen device tree for =
qemuarm64<br>
&gt; <br>
&gt;=C2=A0 <br>
&gt; <br>
&gt;=C2=A0 <br>
&gt; <br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; On Tue, Oct 26, 2021 at 8:58 AM Edward Pickup &lt;<a href=3D"mailto:ed=
ward.pickup@arm.com" target=3D"_blank">edward.pickup@arm.com</a>&gt; wrote:=
<br>
&gt; <br>
&gt; Hi all,<br>
&gt; <br>
&gt; I have encountered an error while building the arm64 version of the xe=
n 4.16 recipe in meta-virtualisation, using the master version of poky and =
meta-virtuaisation.<br>
&gt; I was wondering if anyone was familiar with the issue or knew how to f=
ix it. The error is as follows:<br>
&gt; <br>
&gt; ERROR: xen-image-minimal-1.0-r0 do_write_xen_qemuboot_dtb: ExecutionEr=
ror(&#39;/home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.=
16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/temp/=
run.do_write_xen_qemuboot_dtb.3679135&#39;, 2, None, None)<br>
&gt; ERROR: Logfile of failure stored in: /home/edwpic01/work/master-update=
-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-lin=
ux/xen-image-minimal/1.0-r0/temp/log.do_write_xen_qemuboot_dtb.3679135 .<br=
>
&gt; <br>
&gt; I believe the relevant part of the log is as follows:<br>
&gt; <br>
&gt; | [NOTE]: &#39;3&#39; lopper operation files will be processed<br>
&gt; | [INFO]: dtb output format detected, writing /home/edwpic01/work/mast=
er-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64=
-poky-linux/xen-image-minimal/1.0-r0/deploy-xen-image-minimal-image-complet=
e/xen-image-minimal-qemuarm64-20211026121502.qemuboot.dtb<br>
&gt; | [INFO]: writing output dtb: /home/edwpic01/work/master-update-xen/bu=
ild/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-=
image-minimal/1.0-r0/deploy-xen-image-minimal-image-complete/xen-image-mini=
mal-qemuarm64-20211026121502.qemuboot.dtb<br>
&gt; | /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16=
-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-ima=
ge-minimal-1.0/output.dts: ERROR (explicit_phandles): /apb-pclk:phandle: ba=
d length (1) phandle property<br>
&gt; | /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16=
-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-ima=
ge-minimal-1.0/output.dts: ERROR (explicit_phandles): /intc@8000000:phandle=
: bad length (1) phandle property<br>
&gt; | /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16=
-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-ima=
ge-minimal-1.0/output.dts: ERROR (explicit_phandles): /pl061@9030000:phandl=
e: bad length (1) phandle property<br>
&gt; | ERROR: Input tree has errors, aborting (use -f to force output)<br>
&gt; | WARNING: exit code 2 from a shell command.<br>
&gt; <br>
&gt; The above error was the result from building on x86_64-linux, target s=
ystem was aarch64-poky-linux, running on a qemuarch64 machine, itself runni=
ng on x86_64 linux.<br>
&gt; As mentioned this was done on the master version of meta-virtualisatio=
n.<br>
&gt; The bitbake command to generate this was bitbake xen-image-mininal.<br=
>
&gt; The error is also present when building the xen 4.14 and xen 4.15 arm6=
4 versions, and is not present on the arm32 or x86 builds for xen.<br>
&gt; If anyone knows the cause of the error, the information would be appre=
ciated.<br>
&gt; <br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; There&#39;s something wrong with the input DTS to Lopper .. luckily, I=
 maintain Lopper, so if there&#39;s an actual bug in the processing of the =
input DTS .. I can fix that.<br>
&gt; <br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; I can fire up a build and see if it happens here.<br>
<br>
<br>
Could this be also considered for honister branch ?<br></blockquote><div><b=
r></div><div><br></div><div><div class=3D"gmail_default" style=3D"font-size=
:small">Normally I might not bring back version bumps like these, but since=
 most of the heavy Xen users are asking for the change .. I&#39;ve gone ahe=
ad and pulled it back.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">No=
te: I&#39;ve left ARM64 broken on master, due to the libfdt issue, since th=
at still requires more effort.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
Regards<br>
Bertrand<br>
<br>
&gt; <br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; So this is just qemuarm64, with xen + virtualization in the distro fea=
tures ? Any other layers ? Anything else ?<br>
&gt; <br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt; Yes, this is just as you say, no other layers or anything else. Thank =
you for the speedy reply!<br>
&gt; <br>
&gt; <br>
&gt; There&#39;s a really bad interaction between libfdt and python 3.10. <=
br>
&gt; <br>
&gt; I&#39;ve traced the error down to libfdt not being able to read anythi=
ng from the dtbs and hence the chained errors.<br>
&gt; <br>
&gt; I&#39;m building some older branches to confirm behaviours .. it will =
take me a few days to sort through this, but I don&#39;t want to mask the i=
ssue, as I need to understand exactly what is going on here.<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; Edward<br>
&gt; <br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; <br>
&gt; Cheers!<br>
&gt; <br>
&gt; <br>
&gt; IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; -- <br>
&gt; <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; <br>
&gt; IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.<br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000f40d3005cfe2f097--
