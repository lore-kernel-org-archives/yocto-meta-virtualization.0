Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.3058.1635283660745852198
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Oct 2021 14:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gWBiPxmF;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id h7so1898408ede.8
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Oct 2021 14:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VRtNXaPz1x4w4uVUfS3h+ON8iyn0iGROy8G3xdrAASQ=;
        b=gWBiPxmFijppPfgj8XAk+eUVAqmXvmkUZ39E67OcaUYzWEqFIAOSbx4GpKyP1wqWHo
         fsjHDm+qylN1BDZsDU/mSNoQ5xs14sZoDd1fjvl2HsC/kRhnRNoYN6TAR+T6RF33nedd
         RluZomW8Td7gi78XFerZUX7+W73O4qpz12BvLLDg1JynmUxbWli0Xb8sSFl0qW2xno+a
         LiliSlPMc8ti889diTPhwosmQeet3Sz6HUVp02duaGUhzKDtPF+oGgjdmHQhLwrtMm0N
         7Lml1JphKPL0dFfhk+ymOB7hqqbdmFciJhHjo0C9e6hOqcnE+vZabdQj43JCVNxtotVK
         vpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VRtNXaPz1x4w4uVUfS3h+ON8iyn0iGROy8G3xdrAASQ=;
        b=R5XsqXJJ+HD4gSbhfA9Kag+A+YiAbhLqgbrq2dxWtLd1hGBfXW3FGzSbbxCuZlK8t4
         YTquNXRRHih+RxZDahuKbHPxf1aC/4S8T/IQ65gLuWwIJGYHo96WRKzT/drlnWHgvaqn
         MFhivsU8/JG52x+geZm6jbXT08z3Qj0gJOFo48/tz9fYeC5f31qcLg8c/kgHry6UUyHp
         8a59chJpntaXtXsPtzJ39FyATtKYg5P10pUmORySOtm+4FIos+kGPy563mHxNdiGLtwd
         S17uj4bi4hAyVm6ExSmvsdOJPIKJYkp5EVmAz4q3tTRxaQ3DpAa1FP9Hg7z1giFLVZfc
         Yh0w==
X-Gm-Message-State: AOAM530Hv0N636LlEmurmoOriQPHg0t6+4JK3LNLyDb33O1gQfds7ABO
	XJXAOjuBceDl5t9m3PZRZGq4fJBjyaiVCRFv4Ng=
X-Google-Smtp-Source: ABdhPJzLQ5d33OZmryPogAR6hM4Bjf4dbBbRLlOgsNmBk+nFmGOgWz5VU0P/QEXV//wQAT1hG4/KojdX19/OOgyesGs=
X-Received: by 2002:a17:906:9bf9:: with SMTP id de57mr17495392ejc.35.1635283659144;
 Tue, 26 Oct 2021 14:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR08MB4086AA6D776124ABB5125CE8F0849@AM6PR08MB4086.eurprd08.prod.outlook.com>
 <CADkTA4Nu5eGqsfe5mmJ6cHQQ51BAUY+4aROaWqa-5tbNH+Kxqg@mail.gmail.com> <AM6PR08MB40864FE34FC26FC9EDD37AEDF0849@AM6PR08MB4086.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB40864FE34FC26FC9EDD37AEDF0849@AM6PR08MB4086.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 26 Oct 2021 17:27:28 -0400
Message-ID: <CADkTA4Oec38XsZJZP-p+LXax_vkHME9wm5AO4t3gSE32eO8WAA@mail.gmail.com>
Subject: Re: [meta-virtualization] Error building Xen device tree for qemuarm64
To: Edward Pickup <Edward.Pickup@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="0000000000009c417f05cf48253e"

--0000000000009c417f05cf48253e
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 26, 2021 at 9:27 AM Edward Pickup <Edward.Pickup@arm.com> wrote:

> Hi Bruce,
> Sorry for the formatting issues, email client config issues
>
>
>
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* 26 October 2021 14:22
> *To:* Edward Pickup <Edward.Pickup@arm.com>
> *Cc:* meta-virtualization@lists.yoctoproject.org; Bertrand Marquis <
> Bertrand.Marquis@arm.com>; christopher.w.clark@gmail.com; nd <nd@arm.com>
> *Subject:* Re: [meta-virtualization] Error building Xen device tree for
> qemuarm64
>
>
>
>
>
>
>
> On Tue, Oct 26, 2021 at 8:58 AM Edward Pickup <edward.pickup@arm.com>
> wrote:
>
> Hi all,
>
> I have encountered an error while building the arm64 version of the xen
> 4.16 recipe in meta-virtualisation, using the master version of poky and
> meta-virtuaisation.
> I was wondering if anyone was familiar with the issue or knew how to fix
> it. The error is as follows:
>
> ERROR: xen-image-minimal-1.0-r0 do_write_xen_qemuboot_dtb:
> ExecutionError('/home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/temp/run.do_write_xen_qemuboot_dtb.3679135',
> 2, None, None)
> ERROR: Logfile of failure stored in:
> /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/temp/log.do_write_xen_qemuboot_dtb.3679135
> .
>
> I believe the relevant part of the log is as follows:
>
> | [NOTE]: '3' lopper operation files will be processed
> | [INFO]: dtb output format detected, writing
> /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/deploy-xen-image-minimal-image-complete/xen-image-minimal-qemuarm64-20211026121502.qemuboot.dtb
> | [INFO]: writing output dtb:
> /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/deploy-xen-image-minimal-image-complete/xen-image-minimal-qemuarm64-20211026121502.qemuboot.dtb
> |
> /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-image-minimal-1.0/output.dts:
> ERROR (explicit_phandles): /apb-pclk:phandle: bad length (1) phandle
> property
> |
> /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-image-minimal-1.0/output.dts:
> ERROR (explicit_phandles): /intc@8000000:phandle: bad length (1) phandle
> property
> |
> /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-image-minimal-1.0/output.dts:
> ERROR (explicit_phandles): /pl061@9030000:phandle: bad length (1) phandle
> property
> | ERROR: Input tree has errors, aborting (use -f to force output)
> | WARNING: exit code 2 from a shell command.
>
> The above error was the result from building on x86_64-linux, target
> system was aarch64-poky-linux, running on a qemuarch64 machine, itself
> running on x86_64 linux.
> As mentioned this was done on the master version of meta-virtualisation.
> The bitbake command to generate this was bitbake xen-image-mininal.
> The error is also present when building the xen 4.14 and xen 4.15 arm64
> versions, and is not present on the arm32 or x86 builds for xen.
> If anyone knows the cause of the error, the information would be
> appreciated.
>
>
>
> There's something wrong with the input DTS to Lopper .. luckily, I
> maintain Lopper, so if there's an actual bug in the processing of the input
> DTS .. I can fix that.
>
>
>
> I can fire up a build and see if it happens here.
>
>
>
> So this is just qemuarm64, with xen + virtualization in the distro
> features ? Any other layers ? Anything else ?
>
>
>
> Bruce
>
> Yes, this is just as you say, no other layers or anything else. Thank you
> for the speedy reply!
>

There's a really bad interaction between libfdt and python 3.10.

I've traced the error down to libfdt not being able to read anything from
the dtbs and hence the chained errors.

I'm building some older branches to confirm behaviours .. it will take me a
few days to sort through this, but I don't want to mask the issue, as I
need to understand exactly what is going on here.

Bruce



>
>
> Edward
>
>
>
>
> Cheers!
>
>
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
>
> 
>
>
>
>
> --
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009c417f05cf48253e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div dir=3D"ltr"><div dir=3D"ltr"><div style=
=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 9:27 AM Edward Picku=
p &lt;<a href=3D"mailto:Edward.Pickup@arm.com" target=3D"_blank">Edward.Pic=
kup@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">





<div lang=3D"EN-GB">
<div>
<p class=3D"MsoNormal"><span>Hi Bruce, <br>
Sorry for the formatting issues, email client config issues<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;
<br>
<b>Sent:</b> 26 October 2021 14:22<br>
<b>To:</b> Edward Pickup &lt;<a href=3D"mailto:Edward.Pickup@arm.com" targe=
t=3D"_blank">Edward.Pickup@arm.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>; Bertrand Ma=
rquis &lt;<a href=3D"mailto:Bertrand.Marquis@arm.com" target=3D"_blank">Ber=
trand.Marquis@arm.com</a>&gt;; <a href=3D"mailto:christopher.w.clark@gmail.=
com" target=3D"_blank">christopher.w.clark@gmail.com</a>; nd &lt;<a href=3D=
"mailto:nd@arm.com" target=3D"_blank">nd@arm.com</a>&gt;<br>
<b>Subject:</b> Re: [meta-virtualization] Error building Xen device tree fo=
r qemuarm64<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt"><u></u>=C2=A0<u></u><=
/span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:11.3pt">On Tue, Oct 26, 2021 at=
 8:58 AM Edward Pickup &lt;<a href=3D"mailto:edward.pickup@arm.com" target=
=3D"_blank">edward.pickup@arm.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-left:11.3pt">Hi all,<br>
<br>
I have encountered an error while building the arm64 version of the xen 4.1=
6 recipe in meta-virtualisation, using the master version of poky and meta-=
virtuaisation.<br>
I was wondering if anyone was familiar with the issue or knew how to fix it=
. The error is as follows:<br>
<br>
ERROR: xen-image-minimal-1.0-r0 do_write_xen_qemuboot_dtb: ExecutionError(&=
#39;/home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-re=
lease.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/temp/run.d=
o_write_xen_qemuboot_dtb.3679135&#39;, 2,
 None, None)<br>
ERROR: Logfile of failure stored in: /home/edwpic01/work/master-update-xen/=
build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xe=
n-image-minimal/1.0-r0/temp/log.do_write_xen_qemuboot_dtb.3679135 .<br>
<br>
I believe the relevant part of the log is as follows:<br>
<br>
| [NOTE]: &#39;3&#39; lopper operation files will be processed<br>
| [INFO]: dtb output format detected, writing /home/edwpic01/work/master-up=
date-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky=
-linux/xen-image-minimal/1.0-r0/deploy-xen-image-minimal-image-complete/xen=
-image-minimal-qemuarm64-20211026121502.qemuboot.dtb<br>
| [INFO]: writing output dtb: /home/edwpic01/work/master-update-xen/build/m=
etavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image=
-minimal/1.0-r0/deploy-xen-image-minimal-image-complete/xen-image-minimal-q=
emuarm64-20211026121502.qemuboot.dtb<br>
| /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-rele=
ase.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-image-mi=
nimal-1.0/output.dts: ERROR (explicit_phandles): /apb-pclk:phandle: bad len=
gth (1) phandle property<br>
| /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-rele=
ase.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-image-mi=
nimal-1.0/output.dts: ERROR (explicit_phandles): /intc@8000000:phandle: bad=
 length (1) phandle property<br>
| /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-rele=
ase.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-image-mi=
nimal-1.0/output.dts: ERROR (explicit_phandles): /pl061@9030000:phandle: ba=
d length (1) phandle property<br>
| ERROR: Input tree has errors, aborting (use -f to force output)<br>
| WARNING: exit code 2 from a shell command.<br>
<br>
The above error was the result from building on x86_64-linux, target system=
 was aarch64-poky-linux, running on a qemuarch64 machine, itself running on=
 x86_64 linux.<br>
As mentioned this was done on the master version of meta-virtualisation.<br=
>
The bitbake command to generate this was bitbake xen-image-mininal.<br>
The error is also present when building the xen 4.14 and xen 4.15 arm64 ver=
sions, and is not present on the arm32 or x86 builds for xen.<br>
If anyone knows the cause of the error, the information would be appreciate=
d.<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:11.3pt"><u></u>=C2=A0<u></u></p=
>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:11.3pt"><span style=3D"font-siz=
e:12pt">There&#39;s something wrong with the input DTS to Lopper .. luckily=
, I maintain Lopper, so if there&#39;s an actual bug in the processing of t=
he input DTS .. I can fix that.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:11.3pt"><span style=3D"font-siz=
e:12pt"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:11.3pt"><span style=3D"font-siz=
e:12pt">I can fire up a build and see if it happens here.<u></u><u></u></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:11.3pt"><span style=3D"font-siz=
e:12pt"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:11.3pt"><span style=3D"font-siz=
e:12pt">So this is just qemuarm64, with xen + virtualization in the distro =
features ? Any other layers ? Anything else ?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:11.3pt"><span style=3D"font-siz=
e:12pt"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:11.3pt"><span style=3D"font-siz=
e:12pt">Bruce
<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal">Yes, this is just as you say, no other layers or any=
thing else. Thank you for the speedy reply!</p></div></div></div></div></di=
v></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">There&#39;s a really bad interaction between libfdt and pyth=
on 3.10.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ve t=
raced the error down to libfdt not being able to read anything from the dtb=
s and hence the chained errors.</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">I&#39;m building some older branches to confirm behaviours .. it wil=
l take me a few days to sort through this, but I don&#39;t want to mask the=
 issue, as I need to understand exactly what is going on here.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div lang=3D"EN-GB"><div=
><div><div><div><p class=3D"MsoNormal"><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Edward<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><br>
Cheers!<br>
<br>
<br>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.<br>
<br>
<u></u><u></u></p>
</blockquote>
</div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal">-- <u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></p>
</div>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</div>

</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
>- Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br=
><br></div></div>
</div>

--0000000000009c417f05cf48253e--
