Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B008BC5AC78
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.28989.1649682340370175867
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 06:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j613T1Wb;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id z99so9702755ede.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 06:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QWODqQ9nUjMMY4X/1c36GlwRJuiQ5t+HV9PVN3x9q74=;
        b=j613T1WbG6MmvkP1kjsQ5E9nN+tNI8Ige3/zvhDl5qT2iXkNCEHd3wzkab0Xmw1RaM
         pLnqtDo+7yOLxDOZqrbu9A7ZaMztMH6skbKrUn6BC2rKwwi01Kz42DdOX66xYK1bqhsB
         xfNro8EHhDzqFb1xpBK5PyTLE7nmfSJm23GTWQkQKVKu1J1cTDeLW+pEkZVX7nRGHhLQ
         X0Z9WFMbfR//2m3uONlPctLIqvRx2e5+wTLLM6cxk4l6HRlsmfEQpYoILmVjKlvz0auA
         /6ngTYpd4PC8Sx6wg+4iCIqhquSfsj7okGTA/5P0fkx1AZgjaei19suuN1fK7HMBl8sM
         axxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QWODqQ9nUjMMY4X/1c36GlwRJuiQ5t+HV9PVN3x9q74=;
        b=5sGZN9Dp7BlX7xp2OwES1fuNxLPVsk5b56O9blVv+5DEMkfH6xmFLxmndqoQWmyQAO
         ++/WHaaxzV6buFGcf3vjz7EFI1V+Nnn3jaJ22Q88UzQ3vv4Fi5YviWjGWDXYdr+OX75u
         D0diSyWWXp+CMuwDr42SzcS4UoUIfowwWH5by/AO+K1JehBh9rD+bBR/q6dhPy2MjST/
         GNi4zCZ0L9sD35Vr1XJPDGqCiZIwzjVSaMVRDV7nNgdhbbybhT+mltrBG4I/tdlB8WZl
         NzPf2AYXSYNvCHq/yxzGYLHvnhLpA+DjJTWgLu9m9Q7D0Rj97oaEJIquwmK8dvT0mIJL
         RznA==
X-Gm-Message-State: AOAM530xWgiX1CffhYL42yXu3COn2myNpJrcmFRUaVR/61vuCyPLOOvM
	Q4fCBP/nbmvgKwtnYmanDPyVbC+q3c7LEVV8Bk0=
X-Google-Smtp-Source: 
 ABdhPJwhOiZVUCO+Yl1qtp06VRAMVRkg8FSM80P1Ho28bmkosCz4e6e5j4QpayDQJk2n7ipK7S82gLBzQzBPwAJbwM4=
X-Received: by 2002:a05:6402:d4c:b0:410:a415:fd95 with SMTP id
 ec12-20020a0564020d4c00b00410a415fd95mr33313366edb.288.1649682338834; Mon, 11
 Apr 2022 06:05:38 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CADkTA4MBM_yP+DyR4=mS0K06JzACmJZP5v0E_hG0c+9e=ypikw@mail.gmail.com>
 <4446.1649648962103104390@lists.yoctoproject.org>
 <CADkTA4Nh0273C0r2g1ieTAwN3bnYw+RbLM0CQNz1HMPOzxz9rA@mail.gmail.com>
 <CO6PR11MB5602540494F72070D6315A30EDEA9@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: 
 <CO6PR11MB5602540494F72070D6315A30EDEA9@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Apr 2022 09:05:27 -0400
Message-ID: 
 <CADkTA4MxEkKrmeCYuZLP+_OsoDP03pARDRs3dmSp=GCq50U-zQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] libvirt: fix do_package issue
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "preeti.sachan@intel.com" <preeti.sachan@intel.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000cc6ced05dc609978"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7153

--000000000000cc6ced05dc609978
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 11, 2022 at 9:01 AM Chen, Qi <Qi.Chen@windriver.com> wrote:

> Hi Bruce & Preeti,
>
>
>
> I was trying to fix the same issue when I found this thread.
>
> This issue appears when multilib is enabled.
>
>
>
> When multilib is disabled, ${libdir} is /usr/lib, thus packaging the file
> into libvirt-python.
>
> When multilib is enabled, ${libdir} is /usr/lib64, and the file is not
> packaged.
>

Aha. Right you are.

So we should tweak libvirt to use ${libdir} and not the hardcoded /user/lib
(which it never really should have been), and package anything that gets
installed into sysctl.d/

It isn't clear that this particular .conf belongs in libvirtd, but it is
just as good there, as in the libvirt-python.

I'll do some tests in the non-multiconfig configuration to ensure that
everything still packages properly.

Bruce



>
>
> Regards,
>
> Qi
>
>
>
> *From:* meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org> *On Behalf Of *Bruce Ashfield
> *Sent:* Monday, April 11, 2022 8:44 PM
> *To:* preeti.sachan@intel.com
> *Cc:* meta-virtualization@lists.yoctoproject.org
> *Subject:* Re: [meta-virtualization] [PATCH] libvirt: fix do_package issue
>
>
>
> There's definitely something different in your configuration, so that
> needs to be understood first.
>
>
>
> That file is packaged as part of libvirt-python here, and should be the
> same for others, as I haven't had any reports of failures.
>
>
>
> You have a multiconfig in play. Anything else ? What is your init system ?
> Any bbappends in play ?
>
>
>
> Bruce
>
>
>
> On Sun, Apr 10, 2022 at 11:49 PM <preeti.sachan@intel.com> wrote:
>
> ERROR: mc:x86-2020:libvirt-8.1.0-r0 do_package: QA Issue: libvirt:
> Files/directories were installed but not shipped in any package:
>
>   /usr/lib/sysctl.d/60-qemu-postcopy-migration.conf
>
> Please set FILES such that these items are packaged. Alternatively if they
> are unneeded, avoid installing them or delete them within do_install.
>
> libvirt: 1 installed and not shipped files. [installed-vs-shipped]
>
> ERROR: mc:x86-2020:libvirt-8.1.0-r0 do_package: Fatal QA errors were
> found, failing task.
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
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000cc6ced05dc609978
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Apr 11, 2022 at 9:01 AM Chen, Qi &lt;<a hre=
f=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"gmail-m_2162310242523886326WordSection1">
<p class=3D"MsoNormal">Hi Bruce &amp; Preeti,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I was trying to fix the same issue when I found this=
 thread.<u></u><u></u></p>
<p class=3D"MsoNormal">This issue appears when multilib is enabled.<u></u><=
u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">When multilib is disabled, ${libdir} is /usr/lib, th=
us packaging the file into libvirt-python.<u></u><u></u></p>
<p class=3D"MsoNormal">When multilib is enabled, ${libdir} is /usr/lib64, a=
nd the file is not packaged.</p></div></div></blockquote><div><br></div><di=
v><div class=3D"gmail_default" style=3D"font-size:small">Aha. Right you are=
.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">So we should tweak libv=
irt to use ${libdir} and not the hardcoded /user/lib (which it never really=
 should have been), and package anything that gets installed into sysctl.d/=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">It isn&#39;t clear that =
this particular .conf belongs in libvirtd, but it is just as good there, as=
 in the libvirt-python.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I=
&#39;ll do some tests in the non-multiconfig configuration to ensure that e=
verything still packages properly.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div lang=3D"EN-US" style=3D"overflow-wrap: break-w=
ord;"><div class=3D"gmail-m_2162310242523886326WordSection1"><p class=3D"Ms=
oNormal"><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Qi<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> <a href=3D"mailto:meta-virtualization@l=
ists.yoctoproject.org" target=3D"_blank">meta-virtualization@lists.yoctopro=
ject.org</a> &lt;<a href=3D"mailto:meta-virtualization@lists.yoctoproject.o=
rg" target=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>&gt;
<b>On Behalf Of </b>Bruce Ashfield<br>
<b>Sent:</b> Monday, April 11, 2022 8:44 PM<br>
<b>To:</b> <a href=3D"mailto:preeti.sachan@intel.com" target=3D"_blank">pre=
eti.sachan@intel.com</a><br>
<b>Cc:</b> <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@lists.yoctoproject.org</a><br>
<b>Subject:</b> Re: [meta-virtualization] [PATCH] libvirt: fix do_package i=
ssue<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">There&#39;s definitel=
y something different=C2=A0in your configuration, so that needs to be under=
stood first.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt"><u></u>=C2=A0<u></u><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">That file is packaged=
 as part of libvirt-python here, and should be the same for others, as I ha=
ven&#39;t had any reports of failures.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt"><u></u>=C2=A0<u></u><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">You have a multiconfi=
g in play. Anything=C2=A0else ? What is your init system ? Any bbappends in=
 play ?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt"><u></u>=C2=A0<u></u><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">Bruce<u></u><u></u></=
span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Sun, Apr 10, 2022 at 11:49 PM &lt;<a href=3D"mail=
to:preeti.sachan@intel.com" target=3D"_blank">preeti.sachan@intel.com</a>&g=
t; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<p class=3D"MsoNormal">ERROR: mc:x86-2020:libvirt-8.1.0-r0 do_package: QA I=
ssue: libvirt: Files/directories were installed but not shipped in any pack=
age:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 /usr/lib/sysctl.d/60-qemu-postcopy-migration.=
conf<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Please set FILES such that these items are packaged.=
 Alternatively if they are unneeded, avoid installing them or delete them w=
ithin do_install.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">libvirt: 1 installed and not shipped files. [install=
ed-vs-shipped]<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">ERROR: mc:x86-2020:libvirt-8.1.0-r0 do_package: Fata=
l QA errors were found, failing task.<u></u><u></u></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><br>
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
</div>

</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000cc6ced05dc609978--

