Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D02C636F9
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.29346.1649685169763627690
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 06:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dyhZ9LOD;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id ks6so6400650ejb.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 06:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wG6+JINwpybgxYeT86ANkGLE6CCFAkDeHGw1Op4NaX4=;
        b=dyhZ9LOD9saV/WJViJjf7vwlCz4EWcsc8B4doFfVa+1bLQCG45oPphfqn6K9LuU6xg
         pKwkQny9q/l7iuITLC9uM+ZnKQlhP5BjIORTR2N5neaB8DzKqtrtUYQjM+hhG1PkrwLr
         j2Y5D3+u7TEnKIWIWxBbthyOnC7X9HJ8Twy0REWM5S+bsxS46rnvvw0xsqSetA9w4dR8
         D/5NWIAxIiHLjSC6RQR8iLULI7musRjG1B9J7sziDCT4qF/kxRjGLWvD5w8c0yWq+jk+
         3U1qciWEFpoGcwivJnu1eMfAYdHyXdQk7w8QlvJvjUU3tk5bFvqS9iYfckak4SJlh0vh
         OoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wG6+JINwpybgxYeT86ANkGLE6CCFAkDeHGw1Op4NaX4=;
        b=exutth5+jk9nhtin8baIYiWQoU8ef/pYmsW3knlaEc/mgWvD8aWRDjrPm1xllVrkoX
         MYhgowFD77uEjkiBTDMugVkmhEVhCd5iT860EcPw1Qx1vy+670xw9RaPKB9uMtyfKip5
         94RGKTvX6EEb+81HfOG+Lxkfd8kiyL4rpo2Lxxm7siVgO6fbUvMkYXbwc9g2QhpdBluE
         wqVSw0YcVIi04+m/a6dsx9y8FQC/69KFnyj68UYmAgwiolGGmyJzlQf3W1QVGXIkbDJ6
         xPeVTNXON7YbBnXRROmNtNaonNkwROyN6QZghEzOuzyxk0OW0jhZPTKNSwb3QfHqwjp0
         RD8Q==
X-Gm-Message-State: AOAM532couokarHRz7ANBrhjz6LWty8y09eR3W+UfJuwqe0IRGgSjUTL
	IvYUI1m8Ea1aX9EXHgSCFpxz07ceZ1Njg2CeDQ4=
X-Google-Smtp-Source: 
 ABdhPJyiloX0aR7JJQKo+h2CeeYwxoXu9KOxMQ/+Muc8H1tc1YDGct3YGldxQogxk5sVvj/oCzoA3DUcteVQTBlFUeg=
X-Received: by 2002:a17:907:3da5:b0:6e8:464a:4cc2 with SMTP id
 he37-20020a1709073da500b006e8464a4cc2mr16109799ejc.532.1649685168189; Mon, 11
 Apr 2022 06:52:48 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CADkTA4MBM_yP+DyR4=mS0K06JzACmJZP5v0E_hG0c+9e=ypikw@mail.gmail.com>
 <4446.1649648962103104390@lists.yoctoproject.org>
 <CADkTA4Nh0273C0r2g1ieTAwN3bnYw+RbLM0CQNz1HMPOzxz9rA@mail.gmail.com>
 <CO6PR11MB5602540494F72070D6315A30EDEA9@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CADkTA4MxEkKrmeCYuZLP+_OsoDP03pARDRs3dmSp=GCq50U-zQ@mail.gmail.com>
 <CO6PR11MB5602D4F76898F6C2F525F7E9EDEA9@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CADkTA4O=2XkLz-bm-v+YY5BXWmMhBk4c=MSQo+T8Ezahz3jy_Q@mail.gmail.com>
 <CO6PR11MB56028C0750CC6E8E734167AFEDEA9@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: 
 <CO6PR11MB56028C0750CC6E8E734167AFEDEA9@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Apr 2022 09:52:37 -0400
Message-ID: 
 <CADkTA4OYT4MBCR6xv8BRbfUa6eEjGCHT2xH2FqfcZu3tPr-Yhw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] libvirt: fix do_package issue
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "preeti.sachan@intel.com" <preeti.sachan@intel.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000070fa3005dc61424d"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7161

--00000000000070fa3005dc61424d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 9:45 AM Chen, Qi <Qi.Chen@windriver.com> wrote:

> The only package I found which uses /usr/lib/sysctl.d is systemd.
>
> It packages ${exec_prefix}/lib/sysctl.d.
>
> And it has its reason. It treats /usr/lib as an arch-independent vendor
> dir, and $libdir is treated as the dir to hold libs.
>
> file-hierarchy (www.freedesktop.org)
> <https://www.freedesktop.org/software/systemd/man/file-hierarchy.html#:~:=
text=3DOperating%20systems%20using%20the%20systemd%281%29%20system%20and%20=
service,XDG%20Base%20Directory%20Specification%20and%20XDG%20User%20Directo=
ries.>
>
>
>

Hmm.  Indeed. In that case, I'll go with a variant of the original patch,
with a tweaked commit log. I'll take care of that now.

Bruce



> Regards,
>
> Qi
>
>
>
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* Monday, April 11, 2022 9:35 PM
> *To:* Chen, Qi <Qi.Chen@windriver.com>
> *Cc:* preeti.sachan@intel.com; meta-virtualization@lists.yoctoproject.org
> *Subject:* Re: [meta-virtualization] [PATCH] libvirt: fix do_package issu=
e
>
>
>
>
>
>
>
> On Mon, Apr 11, 2022 at 9:32 AM Chen, Qi <Qi.Chen@windriver.com> wrote:
>
> Hi Bruce,
>
>
>
> Looking at the issue a little further, I found we need to use the
> hardcoded =E2=80=98/usr/lib=E2=80=99.
>
> This is because sysctl is hardcoding that.
>
>
>
> That's a larger issue, and it breaks other parts of the system. We
> shouldn't have anything with hard coded /usr/lib.
>
>
>
> How are other packages dealing with this ?
>
>
>
> In that case, I'll do individual scripts in the packaging, since I don't
> want a global /usr/lib/ as part of the packaging.
>
>
>
> Bruce
>
>
>
>
>
>
>
> Some codes in sysctl.c from procps:
>
> static int PreloadSystem(void)
>
> {
>
>         unsigned di, i;
>
>         const char *dirs[] =3D {
>
>                 "/etc/sysctl.d",
>
>                 "/run/sysctl.d",
>
>                 "/usr/local/lib/sysctl.d",
>
>                 "/usr/lib/sysctl.d",
>
>                 "/lib/sysctl.d",
>
>         };
>
>
>
> I=E2=80=99ve sent out a patch to fix the issue. Please help review it.
>
>
>
> Regards,
>
> Qi
>
>
>
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* Monday, April 11, 2022 9:05 PM
> *To:* Chen, Qi <Qi.Chen@windriver.com>
> *Cc:* preeti.sachan@intel.com; meta-virtualization@lists.yoctoproject.org
> *Subject:* Re: [meta-virtualization] [PATCH] libvirt: fix do_package issu=
e
>
>
>
>
>
>
>
> On Mon, Apr 11, 2022 at 9:01 AM Chen, Qi <Qi.Chen@windriver.com> wrote:
>
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
>
>
> Aha. Right you are.
>
>
>
> So we should tweak libvirt to use ${libdir} and not the hardcoded
> /user/lib (which it never really should have been), and package anything
> that gets installed into sysctl.d/
>
>
>
> It isn't clear that this particular .conf belongs in libvirtd, but it is
> just as good there, as in the libvirt-python.
>
>
>
> I'll do some tests in the non-multiconfig configuration to ensure that
> everything still packages properly.
>
>
>
> Bruce
>
>
>
>
>
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
> *Subject:* Re: [meta-virtualization] [PATCH] libvirt: fix do_package issu=
e
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
> You have a multiconfig in play. Anything else ? What is your init system =
?
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
> Please set FILES such that these items are packaged. Alternatively if the=
y
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
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
>
> --
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
>
> --
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000070fa3005dc61424d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Apr 11, 2022 at 9:45 AM Chen, Qi &lt;<a hre=
f=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"gmail-m_-4150750205284900871WordSection1">
<p class=3D"MsoNormal">The only package I found which uses /usr/lib/sysctl.=
d is systemd.<u></u><u></u></p>
<p class=3D"MsoNormal">It packages ${exec_prefix}/lib/sysctl.d.<u></u><u></=
u></p>
<p class=3D"MsoNormal">And it has its reason. It treats /usr/lib as an arch=
-independent vendor dir, and $libdir is treated as the dir to hold libs.<u>=
</u><u></u></p>
<p class=3D"MsoNormal"><a href=3D"https://www.freedesktop.org/software/syst=
emd/man/file-hierarchy.html#:~:text=3DOperating%20systems%20using%20the%20s=
ystemd%281%29%20system%20and%20service,XDG%20Base%20Directory%20Specificati=
on%20and%20XDG%20User%20Directories." target=3D"_blank">file-hierarchy
 (www.freedesktop.org)</a><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0</p></div></div></blockquote><div><br><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">Hmm.=C2=A0=
 Indeed. In that case, I&#39;ll go with a variant of the original patch, wi=
th a tweaked commit log. I&#39;ll take care of that now.</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div lang=3D"EN-US" style=3D"o=
verflow-wrap: break-word;"><div class=3D"gmail-m_-4150750205284900871WordSe=
ction1"><p class=3D"MsoNormal"><u></u></p>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Qi<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Bruce Ashfield &lt;<a href=3D"mailto:br=
uce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; =
<br>
<b>Sent:</b> Monday, April 11, 2022 9:35 PM<br>
<b>To:</b> Chen, Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"=
_blank">Qi.Chen@windriver.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:preeti.sachan@intel.com" target=3D"_blank">pre=
eti.sachan@intel.com</a>; <a href=3D"mailto:meta-virtualization@lists.yocto=
project.org" target=3D"_blank">meta-virtualization@lists.yoctoproject.org</=
a><br>
<b>Subject:</b> Re: [meta-virtualization] [PATCH] libvirt: fix do_package i=
ssue<u></u><u></u></p>
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
<p class=3D"MsoNormal">On Mon, Apr 11, 2022 at 9:32 AM Chen, Qi &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</=
a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal">Hi Bruce,<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Looking at the issue a little further, I found we ne=
ed to use the hardcoded =E2=80=98/usr/lib=E2=80=99.<u></u><u></u></p>
<p class=3D"MsoNormal">This is because sysctl is hardcoding that.<u></u><u>=
</u></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">That&#39;s a larger i=
ssue, and it breaks other parts of the system. We shouldn&#39;t have anythi=
ng with hard coded /usr/lib.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt"><u></u>=C2=A0<u></u><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">How are other package=
s dealing with this ?<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">In that case, I&#39;l=
l do individual scripts in the packaging, since I don&#39;t want a global /=
usr/lib/ as part of the packaging.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt"><u></u>=C2=A0<u></u><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">Bruce<u></u><u></u></=
span></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Some codes in sysctl.c from procps:<u></u><u></u></p=
>
<p class=3D"MsoNormal">static int PreloadSystem(void)<u></u><u></u></p>
<p class=3D"MsoNormal">{<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned =
di, i;<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const cha=
r *dirs[] =3D {<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;/etc/sysctl.d&quot;,<u></u><u=
></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;/run/sysctl.d&quot;,<u></u><u=
></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;/usr/local/lib/sysctl.d&quot;=
,<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;/usr/lib/sysctl.d&quot;,<u></=
u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;/lib/sysctl.d&quot;,<u></u><u=
></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<u></u>=
<u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">I=E2=80=99ve sent out a patch to fix the issue. Plea=
se help review it.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Qi<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Bruce Ashfield &lt;<a href=3D"mailto:br=
uce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;
<br>
<b>Sent:</b> Monday, April 11, 2022 9:05 PM<br>
<b>To:</b> Chen, Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"=
_blank">Qi.Chen@windriver.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:preeti.sachan@intel.com" target=3D"_blank">pre=
eti.sachan@intel.com</a>;
<a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" target=3D"_bl=
ank">meta-virtualization@lists.yoctoproject.org</a><br>
<b>Subject:</b> Re: [meta-virtualization] [PATCH] libvirt: fix do_package i=
ssue<u></u><u></u></p>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">=C2=A0</span><u></u><=
u></u></p>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Apr 11, 2022 at 9:01 AM Chen, Qi &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</=
a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin:5pt 0i=
n 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal">Hi Bruce &amp; Preeti,<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">I was trying to fix the same issue when I found this=
 thread.<u></u><u></u></p>
<p class=3D"MsoNormal">This issue appears when multilib is enabled.<u></u><=
u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">When multilib is disabled, ${libdir} is /usr/lib, th=
us packaging the file into libvirt-python.<u></u><u></u></p>
<p class=3D"MsoNormal">When multilib is enabled, ${libdir} is /usr/lib64, a=
nd the file is not packaged.<u></u><u></u></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">Aha. Right you are.</=
span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">=C2=A0</span><u></u><=
u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">So we should tweak li=
bvirt to use ${libdir} and not the hardcoded /user/lib (which it never real=
ly should have been), and package anything that gets
 installed into sysctl.d/</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">=C2=A0</span><u></u><=
u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">It isn&#39;t clear th=
at this particular .conf belongs in libvirtd, but it is just as good there,=
 as in the libvirt-python.</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">=C2=A0</span><u></u><=
u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">I&#39;ll do some test=
s in the non-multiconfig configuration to ensure that everything still pack=
ages properly.</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">=C2=A0</span><u></u><=
u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">Bruce</span><u></u><u=
></u></p>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin:5pt 0i=
n 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Qi<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b>
<a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" target=3D"_bl=
ank">meta-virtualization@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:m=
eta-virtualization@lists.yoctoproject.org" target=3D"_blank">meta-virtualiz=
ation@lists.yoctoproject.org</a>&gt;
<b>On Behalf Of </b>Bruce Ashfield<br>
<b>Sent:</b> Monday, April 11, 2022 8:44 PM<br>
<b>To:</b> <a href=3D"mailto:preeti.sachan@intel.com" target=3D"_blank">pre=
eti.sachan@intel.com</a><br>
<b>Cc:</b> <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">
meta-virtualization@lists.yoctoproject.org</a><br>
<b>Subject:</b> Re: [meta-virtualization] [PATCH] libvirt: fix do_package i=
ssue<u></u><u></u></p>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">There&#39;s definitel=
y something different=C2=A0in your configuration, so that needs to be under=
stood first.</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">=C2=A0</span><u></u><=
u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">That file is packaged=
 as part of libvirt-python here, and should be the same for others, as I ha=
ven&#39;t had any reports of failures.</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">=C2=A0</span><u></u><=
u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">You have a multiconfi=
g in play. Anything=C2=A0else ? What is your init system ? Any bbappends in=
 play ?</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">=C2=A0</span><u></u><=
u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt">Bruce</span><u></u><u=
></u></p>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Sun, Apr 10, 2022 at 11:49 PM &lt;<a href=3D"mail=
to:preeti.sachan@intel.com" target=3D"_blank">preeti.sachan@intel.com</a>&g=
t; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin:5pt 0i=
n 5pt 4.8pt">
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">=C2=A0<u></u><u></u></p=
>
</blockquote>
</div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<p class=3D"MsoNormal">--
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></p>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<p class=3D"MsoNormal">--
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">- Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></p>
</div>
</div>
</div>
</div>
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

--00000000000070fa3005dc61424d--

