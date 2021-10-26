Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.12186.1635254567453939672
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Oct 2021 06:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=feYmh8hf;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id h7so2378760ede.8
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Oct 2021 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OTvn+IJrcTAq3Gy+xUeEMT7p+3zZdFVLG5r3X6TBGVQ=;
        b=feYmh8hfO6Rixxq55hkcJEYaT8DAxev+Nm5xKsK0jp/ECoWbkzBaoFl+aqr1t7exbA
         JR3+ER+weg6w+xgifeMyin4m2xI4KvZ3xJHCavMAREBWQO+t6kldfErTvtUgXj07dgES
         SYQQXzIW9nQ+OZEVznUJzu5SI9Qj1Oo048SVIzBx9VazAD9f1HM5sirXBzaQI7pBesIk
         nBor4pRRbf8zEa9HU3YfQpHHENIrC8/KLtHQ7lx8dAp5khvuXUmjSMnANPkAru/lmaV4
         QpsLpszmgGJyYNpHcKlh6dOnNTpMhttMrof7k4pC8gHSRYwvOLHFqhqi8enhCrnc0Boc
         oGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OTvn+IJrcTAq3Gy+xUeEMT7p+3zZdFVLG5r3X6TBGVQ=;
        b=o64m9ZIXQ4n0RTceShfpbCdIGzfIPiPHzga30p723uxzKlNSTgdx/H+uS3MlVKr3S6
         teaJ8IKBrswI7hyh1mVEGS/XV7QFn6+67ihjbp79BSBeAb2fteHLsxXVGAdWHE8LWlVD
         W68rnhPyVsa4PZDIfqDOLcArfWnj8XxvIFsTUWE8zGGXVYC69MNwUvw5WcJ+8gdNkO3J
         yU8+HHIS/pLIg+Huq+mD5hPvrTQx2mVGiBv2bvR1H0MxYK3n5qFhRvsRmD3qAk8S8L/n
         zgvINnvsitQwYo1Xf6V7u/NrGu/L83fidTmc5k3J4O3EQ7+IlVLIRh2TjsxfLXcUWCTK
         bB/g==
X-Gm-Message-State: AOAM5328+doQUPaCvt307IDM/W5m35jYa2lSEpae1wUIVeM6Gi09i/0H
	2IQ2E0U7nXau9yZVqklHi9EPV0uPEws0tetyWXM=
X-Google-Smtp-Source: ABdhPJzrK2s+PFP9vDKWS1fwsHgENLihveFS4wczGQmoWpQJ9HFlP6zVn75BpxPNfS6KzIBWSIMybGuAFkq2ZTSvNYA=
X-Received: by 2002:a05:6402:3590:: with SMTP id y16mr14290985edc.249.1635254546179;
 Tue, 26 Oct 2021 06:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR08MB4086AA6D776124ABB5125CE8F0849@AM6PR08MB4086.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB4086AA6D776124ABB5125CE8F0849@AM6PR08MB4086.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 26 Oct 2021 09:22:15 -0400
Message-ID: <CADkTA4Nu5eGqsfe5mmJ6cHQQ51BAUY+4aROaWqa-5tbNH+Kxqg@mail.gmail.com>
Subject: Re: [meta-virtualization] Error building Xen device tree for qemuarm64
To: Edward Pickup <edward.pickup@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="00000000000057a99b05cf415ef1"

--00000000000057a99b05cf415ef1
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 26, 2021 at 8:58 AM Edward Pickup <edward.pickup@arm.com> wrote:

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

There's something wrong with the input DTS to Lopper .. luckily, I maintain
Lopper, so if there's an actual bug in the processing of the input DTS .. I
can fix that.

I can fire up a build and see if it happens here.

So this is just qemuarm64, with xen + virtualization in the distro features
? Any other layers ? Anything else ?

Bruce



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

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000057a99b05cf415ef1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 8:58 AM Edward Pickup &lt;<=
a href=3D"mailto:edward.pickup@arm.com">edward.pickup@arm.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi all,<br>
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
o_write_xen_qemuboot_dtb.3679135&#39;, 2, None, None)<br>
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
d.<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">There&#39;s something wrong with the input DTS to Lopp=
er .. luckily, I maintain Lopper, so if there&#39;s an actual bug in the pr=
ocessing of the input DTS .. I can fix that.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">I can fire up a build and see if it happens here.</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">So this is just qemuarm64, wi=
th xen + virtualization in the distro features ? Any other layers ? Anythin=
g else ?</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">Bruce </div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers!<br>
<br>
<br>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000057a99b05cf415ef1--
