Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A1FC636CF
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.29206.1649683694540807473
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 06:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eTgs2ieI;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id lc2so10305545ejb.12
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OOg/hePL3n+Y+gdrv78ZWYRBUwW7LGSmDmIe3sl5llE=;
        b=eTgs2ieITmuURDOwt8e7XIruwkC+02fqqjgqCsZ1HUgJwJYe9pwN8zJX7BjtysFMXn
         SaZG4zv+HwFJ/uFWsBf0XyHxyhHJdhYKW6c3FDUzAg2Yfcp2v/PCK0znnoVmuTYp0bGD
         iS8eiFv5bg2UGffj4LTnek28QQ8x2cvgL1Ij8QnVVDXQoeQcRjKzhm4iQfZ/ONLX4Dr3
         Wm5tE9fKedrx5s14IHq5qy23Gmmp9KT0fsTCN0NN9+VUVmuvG/PQIqnJogTwOUGOe2a7
         g01J6/QCPHhmHQVxgUNT3qYAPcGrlls+JGE1LnNYlvqwUheGRIXDidPKK9ny0wDgN5bL
         dt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OOg/hePL3n+Y+gdrv78ZWYRBUwW7LGSmDmIe3sl5llE=;
        b=jOU5ZPnJ3cs2HW5K243qN8OWVA1qWtjREqNjf0458M+dQxs+emssvUCuAeGAt1qmlv
         vnzjHQCxsuamGP6R2wjkMdm7anu1t4eyWTbWdsAQb4NCjcFMNdKCsEPJAnJB0hMXz/QC
         dLQm3wAwDJWRvgMn6MFR/el90T6J4YbkptjSzeEX5r3hL1Vz8yAkS13t1Ry7exg1wLgx
         2qCAVVyEo9lI+1TFxJnmyQpAROJ4rmluWTq4eCkKWKR1HmjZ/JX3Lt99yguh5IrS+qZk
         EyXwYGc6SapQlzytqVKQFGfHIBpBfzce2NIHmbfV+0HNAdjOhqhjEhNzXUJJ/ysUi7oy
         0Frg==
X-Gm-Message-State: AOAM530offwYmcrkLMa5ywVhBUNiZiTpfESwGCdujhubOAipOWVnjLrF
	TgxFQD85ylyHiZzDDTY2osEE5bvG3ZAhWi65xws=
X-Google-Smtp-Source: 
 ABdhPJysxktmtabymvpIoPsiRyCy35VqY/qyW/zgmYm7hhxnjHg/Q+UOl/uHf71YV8tss3v2Tuy9SIq0tJl3SMYPW5I=
X-Received: by 2002:a17:907:d23:b0:6db:6c6:8558 with SMTP id
 gn35-20020a1709070d2300b006db06c68558mr29415776ejc.141.1649683692976; Mon, 11
 Apr 2022 06:28:12 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CADkTA4MBM_yP+DyR4=mS0K06JzACmJZP5v0E_hG0c+9e=ypikw@mail.gmail.com>
 <4446.1649648962103104390@lists.yoctoproject.org>
 <CADkTA4Nh0273C0r2g1ieTAwN3bnYw+RbLM0CQNz1HMPOzxz9rA@mail.gmail.com>
 <CO6PR11MB5602540494F72070D6315A30EDEA9@CO6PR11MB5602.namprd11.prod.outlook.com>
 <16E4D95942C915B5.9240@lists.yoctoproject.org>
In-Reply-To: <16E4D95942C915B5.9240@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Apr 2022 09:28:01 -0400
Message-ID: 
 <CADkTA4N0Ku1JqZyFCYfyiJS_CFk5ZCkHROguLKqLuOdWhKVcmw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] libvirt: fix do_package issue
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "Chen, Qi" <Qi.Chen@windriver.com>,
	"preeti.sachan@intel.com" <preeti.sachan@intel.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000082fe2a05dc60eaf3"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7154

--00000000000082fe2a05dc60eaf3
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 11, 2022 at 9:05 AM Bruce Ashfield via lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:

>
>
> On Mon, Apr 11, 2022 at 9:01 AM Chen, Qi <Qi.Chen@windriver.com> wrote:
>
>> Hi Bruce & Preeti,
>>
>>
>>
>> I was trying to fix the same issue when I found this thread.
>>
>> This issue appears when multilib is enabled.
>>
>>
>>
>> When multilib is disabled, ${libdir} is /usr/lib, thus packaging the file
>> into libvirt-python.
>>
>> When multilib is enabled, ${libdir} is /usr/lib64, and the file is not
>> packaged.
>>
>
> Aha. Right you are.
>
> So we should tweak libvirt to use ${libdir} and not the hardcoded
> /user/lib (which it never really should have been), and package anything
> that gets installed into sysctl.d/
>
> It isn't clear that this particular .conf belongs in libvirtd, but it is
> just as good there, as in the libvirt-python.
>
> I'll do some tests in the non-multiconfig configuration to ensure that
> everything still packages properly.
>

I've pushed my WIP patch here:

https://git.yoctoproject.org/meta-virtualization/commit/?h=master-next

Bruce



>
> Bruce
>
>
>
>>
>>
>> Regards,
>>
>> Qi
>>
>>
>>
>> *From:* meta-virtualization@lists.yoctoproject.org <
>> meta-virtualization@lists.yoctoproject.org> *On Behalf Of *Bruce Ashfield
>> *Sent:* Monday, April 11, 2022 8:44 PM
>> *To:* preeti.sachan@intel.com
>> *Cc:* meta-virtualization@lists.yoctoproject.org
>> *Subject:* Re: [meta-virtualization] [PATCH] libvirt: fix do_package
>> issue
>>
>>
>>
>> There's definitely something different in your configuration, so that
>> needs to be understood first.
>>
>>
>>
>> That file is packaged as part of libvirt-python here, and should be the
>> same for others, as I haven't had any reports of failures.
>>
>>
>>
>> You have a multiconfig in play. Anything else ? What is your init system
>> ? Any bbappends in play ?
>>
>>
>>
>> Bruce
>>
>>
>>
>> On Sun, Apr 10, 2022 at 11:49 PM <preeti.sachan@intel.com> wrote:
>>
>> ERROR: mc:x86-2020:libvirt-8.1.0-r0 do_package: QA Issue: libvirt:
>> Files/directories were installed but not shipped in any package:
>>
>>   /usr/lib/sysctl.d/60-qemu-postcopy-migration.conf
>>
>> Please set FILES such that these items are packaged. Alternatively if
>> they are unneeded, avoid installing them or delete them within do_install.
>>
>> libvirt: 1 installed and not shipped files. [installed-vs-shipped]
>>
>> ERROR: mc:x86-2020:libvirt-8.1.0-r0 do_package: Fatal QA errors were
>> found, failing task.
>>
>>
>>
>>
>>
>>
>> --
>>
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7153):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7153
> Mute This Topic: https://lists.yoctoproject.org/mt/90385357/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000082fe2a05dc60eaf3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Apr 11, 2022 at 9:05 AM Bruce Ashfield via =
<a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;br=
uce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.co=
m@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Apr 11, 2022 at 9:01 AM Chen, Qi &lt;<a hre=
f=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div>
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
v><div style=3D"font-size:small">Aha. Right you are.</div><div style=3D"fon=
t-size:small"><br></div><div style=3D"font-size:small">So we should tweak l=
ibvirt to use ${libdir} and not the hardcoded /user/lib (which it never rea=
lly should have been), and package anything that gets installed into sysctl=
.d/</div><div style=3D"font-size:small"><br></div><div style=3D"font-size:s=
mall">It isn&#39;t clear that this particular .conf belongs in libvirtd, bu=
t it is just as good there, as in the libvirt-python.</div><div style=3D"fo=
nt-size:small"><br></div><div style=3D"font-size:small">I&#39;ll do some te=
sts in the non-multiconfig configuration to ensure that everything still pa=
ckages properly.</div></div></div></div></blockquote><div><br></div><div><d=
iv class=3D"gmail_default" style=3D"font-size:small">I&#39;ve pushed my WIP=
 patch here:</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small"><a href=3D"h=
ttps://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-next">ht=
tps://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-next</a><=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div class=3D"gmail_quote"><div><div style=3D"font-size:small"><br></d=
iv><div style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div lang=3D"EN-US"><div><p =
class=3D"MsoNormal"><u></u><u></u></p>
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
>- Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br=
><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7153): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7153" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7153</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/90385357/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/90385357/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000082fe2a05dc60eaf3--

