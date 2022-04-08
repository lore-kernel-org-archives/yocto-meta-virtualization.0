Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F0DC35280
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.177.1649441272982765223
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 11:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dWzuyTcp;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id b15so10956817edn.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 11:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tyx1V5UhmeGkX0LWPgrhp7fH0fJkc01cDb5E85jdDqY=;
        b=dWzuyTcpZnjg7wsQGEyCe2bBygW38PXzlArX2YzHSeYtyCOwRwHZU32Duj8BBoDksK
         jhwzUrznfPnE+oOhzbDDopsc2VrnY7Zew1G9RAHZY82ejh2WxncVRm0xyjv4s+NojFOX
         O+sNnlQgZh5cmBm5Zngc+viJ7DoCZE5E2QUrNjHkNuct+lalqdDG6Q2lOQdAcmC5oLFc
         JE7Xc1gXKSl1rwiPJ3DFIGJ5Bhsg97/Ffnx+ewumjT7s5U3yUxSezrscxs3AJ3f6nwFV
         01pwCmSKKcEmnkffDgefD1mDTJQfWjm0wlAg+IQNIPZ4eBIyypERxP8vekOo5mQvd02M
         xQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tyx1V5UhmeGkX0LWPgrhp7fH0fJkc01cDb5E85jdDqY=;
        b=emIwUmGYBPNf5/7dfHI/0vTN1O29dQdxCHt34KdeKOhV1ZVpk3SJ9f1UcLmoQJ0Mhi
         Pr1skzJEcqMLVpIGuGnPg37mfeHwiILFB8TiVhofIGXmvOJ+Qfed5IXxuBmjWHRiGgyU
         7wJq5g5SP+xJdKFk5EYehF4TfwTvKvqIEA3ytmIwhz8OCbtsoVul/wxL2SZl2Yq64Xak
         DtSYKGzKsMjfRrJ0gQVERBnGkxpIAcQll8ne6gp+s2ZlJeMWat0X98+JZqK7AKqvMWoN
         UP64Iqb4EekY7skEI+txC+Eh5E7DZHsCb08mssC4lbemzMBsN8N0ubHgFDxrFWophLCt
         5+3w==
X-Gm-Message-State: AOAM531D9+gERPDdudU2YywRSFq8Sy0p3WY0jPgki7KdDUC7jbBWH/ua
	pp9haISiO50wWRY9n7g9baDykWVZCVtID12xPOs=
X-Google-Smtp-Source: 
 ABdhPJzm6MbPIF3Su6CXayE0LrejjVd41YyB795AZr2UVxQkgECHD0hRxocksKRaWI86FTAoQO7kKi3VYd1xRfuD364=
X-Received: by 2002:a05:6402:d4c:b0:410:a415:fd95 with SMTP id
 ec12-20020a0564020d4c00b00410a415fd95mr20865694edb.288.1649441271210; Fri, 08
 Apr 2022 11:07:51 -0700 (PDT)
MIME-Version: 1.0
References: 
 <AM6PR08MB3461FBC64EAFE017BD3EDFBC92E99@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <16E3FAAA055371F3.26526@lists.yoctoproject.org>
 <CADkTA4MYVFTj6MpguzEZa5nuMvuoYzBXnTdTD8uWWoP4w3dBqg@mail.gmail.com>
 <AM6PR08MB346164F32D5F4719D48F35D092E99@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: 
 <AM6PR08MB346164F32D5F4719D48F35D092E99@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Apr 2022 14:07:39 -0400
Message-ID: 
 <CADkTA4Ook2VgMBEUZysqqW67wvLMAxriSuttqCNqJOUz7Z0GdA@mail.gmail.com>
Subject: Re: [meta-virtualization] Issues with k3s runtime on master
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	Richard Neill <Richard.Neill@arm.com>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="0000000000000c66da05dc28791b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7143

--0000000000000c66da05dc28791b
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 8, 2022 at 2:06 PM Diego Sueiro <Diego.Sueiro@arm.com> wrote:

>
>
> *From:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Sent:* 08 April 2022 18:39
> *To:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *Cc:* Diego Sueiro <Diego.Sueiro@arm.com>;
> meta-virtualization@lists.yoctoproject.org; Richard Neill <
> Richard.Neill@arm.com>; nd <nd@arm.com>
> *Subject:* Re: [meta-virtualization] Issues with k3s runtime on master
>
>
>
>
>
>
>
> On Fri, Apr 8, 2022 at 1:04 PM Bruce Ashfield via lists.yoctoproject.org
> <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
>
>
>
>
> On Fri, Apr 8, 2022 at 12:54 PM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
> Hi Bruce,
>
>
>
> I'm having k3s runtime issues where during the k3s.service start I'm
> getting error messages about missing /usr/libexec/cni/flannel.
>
>
>
> I saw that the cni_git.bb recipe was bumped to versions where flannel and
> its plugin are not available anymore.
>
>
>
> In this case, should we have a recipe to provide both flannel and its
> plugin?
>
>
>
>
>
>
>
> Yep. I don't use flannel, so it wasn't something that I had done. That
> being said, I wanted to avoid maintaining separate recipes per-plugin, so
> when the need arose, I was going to add it to cni_git as an entry on the
> SRC_URI.
>
>
>
> I can have a go at doing that, now that I know there is a need.
>
>
>
> FYI: Here's the WIP change:
> https://git.yoctoproject.org/meta-virtualization/commit/?h=master-next&id=589391db2777f844577a3805fa475515fe62c99f
>
>
>
> I can confirm that the k3s runtime is working with this change.
>
> Should we have SRCREV_FORMAT = "cni_plugins_flannel_plugin" as well as
> adding ;protocol=https into the SRC_URI?
>

It isn't strictly required. There's so many entries in the SRC_URI for some
packages, we can't really list them all, and have the SRCREV format be
useful at all.

Bruce



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
> Bruce
>
>
>
> --
>
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7138):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7138
> Mute This Topic: https://lists.yoctoproject.org/mt/90340033/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
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

--0000000000000c66da05dc28791b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Apr 8, 2022 at 2:06 PM Diego Sueiro &lt;<a =
href=3D"mailto:Diego.Sueiro@arm.com">Diego.Sueiro@arm.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">







<div lang=3D"EN-GB" style=3D"overflow-wrap: break-word;">
<div class=3D"gmail-m_1182188973611321933WordSection1">
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt"><u></u>=C2=A0<u></u></span></font></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><font size=3D"2" face=3D"Calibri"><span lang=3D"E=
N-US" style=3D"font-size:11pt;font-weight:bold">From:</span></font></b><spa=
n lang=3D"EN-US">
 Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_=
blank">bruce.ashfield@gmail.com</a>&gt; <br>
<b><span style=3D"font-weight:bold">Sent:</span></b> 08 April 2022 18:39<br=
>
<b><span style=3D"font-weight:bold">To:</span></b> Bruce Ashfield &lt;<a hr=
ef=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gma=
il.com</a>&gt;<br>
<b><span style=3D"font-weight:bold">Cc:</span></b> Diego Sueiro &lt;<a href=
=3D"mailto:Diego.Sueiro@arm.com" target=3D"_blank">Diego.Sueiro@arm.com</a>=
&gt;; <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" target=
=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>; Richard Neill &=
lt;<a href=3D"mailto:Richard.Neill@arm.com" target=3D"_blank">Richard.Neill=
@arm.com</a>&gt;; nd &lt;<a href=3D"mailto:nd@arm.com" target=3D"_blank">nd=
@arm.com</a>&gt;<br>
<b><span style=3D"font-weight:bold">Subject:</span></b> Re: [meta-virtualiz=
ation] Issues with k3s runtime on master<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt"><u></u>=C2=A0<u></u></span></font></p>
<div>
<div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span style=3D"fon=
t-size:12pt"><u></u>=C2=A0<u></u></span></font></p>
</div>
</div>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt"><u></u>=C2=A0<u></u></span></font></p>
<div>
<div>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt">On Fri, Apr 8, 2022 at 1:04 PM Bruce Ashfield via
<a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproj=
ect.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctopro=
ject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:=
<u></u><u></u></span></font></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span style=3D"fon=
t-size:12pt"><u></u>=C2=A0<u></u></span></font></p>
</div>
</div>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt"><u></u>=C2=A0<u></u></span></font></p>
<div>
<div>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt">On Fri, Apr 8, 2022 at 12:54 PM Diego Sueiro &lt;<a href=3D"ma=
ilto:Diego.Sueiro@arm.com" target=3D"_blank">Diego.Sueiro@arm.com</a>&gt; w=
rote:<u></u><u></u></span></font></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:12pt;color:black">Hi Bruce,<u></u><u></u></span></fo=
nt></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:12pt;color:black"><u></u>=C2=A0<u></u></span></font>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:12pt;color:black">I&#39;m having k3s runtime issues =
where during the k3s.service start I&#39;m getting error messages about mis=
sing /usr/libexec/cni/flannel.<u></u><u></u></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:12pt;color:black"><u></u>=C2=A0<u></u></span></font>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:12pt;color:black">I saw that the
<a href=3D"http://cni_git.bb" target=3D"_blank">cni_git.bb</a> recipe was b=
umped to versions where flannel and its plugin are not available anymore.<u=
></u><u></u></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" color=3D"#222222" face=3D"Arial"><s=
pan style=3D"font-size:12pt;font-family:Arial,sans-serif;color:rgb(34,34,34=
)">=C2=A0</span></font><font size=3D"3" color=3D"black"><span style=3D"font=
-size:12pt;color:black"><u></u><u></u></span></font></p>
</div>
</div>
</blockquote>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:12pt;color:black">In this case, should we have a rec=
ipe to provide both flannel and its plugin?<u></u><u></u></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:12pt;color:black"><u></u>=C2=A0<u></u></span></font>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" color=3D"black" face=3D"Calibri"><s=
pan style=3D"font-size:12pt;color:black"><u></u>=C2=A0<u></u></span></font>=
</p>
</div>
</div>
</blockquote>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt"><u></u>=C2=A0<u></u></span></font></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span style=3D"fon=
t-size:12pt">Yep. I don&#39;t use flannel, so it wasn&#39;t something that =
I had done. That being said, I wanted to avoid maintaining separate recipes=
 per-plugin, so when the need arose, I was going
 to add it to cni_git as an entry on the SRC_URI.<u></u><u></u></span></fon=
t></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span style=3D"fon=
t-size:12pt"><u></u>=C2=A0<u></u></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span style=3D"fon=
t-size:12pt">I can have a go at doing that, now that I know there is a need=
.<u></u><u></u></span></font></p>
</div>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt"><u></u>=C2=A0<u></u></span></font></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span style=3D"fon=
t-size:12pt">FYI: Here&#39;s the WIP change:
<a href=3D"https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmas=
ter-next&amp;id=3D589391db2777f844577a3805fa475515fe62c99f" target=3D"_blan=
k">
https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-next&am=
p;id=3D589391db2777f844577a3805fa475515fe62c99f</a><u></u><u></u></span></f=
ont></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt"><u></u>=C2=A0<u></u></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt">I can confirm that the k3s runtime is working with this change=
.<u></u><u></u></span></font></p>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt">Should we have SRCREV_FORMAT =3D &quot;<span class=3D"gmail-m_=
1182188973611321933SpellE">cni_plugins_flannel_plugin</span>&quot;
 as well as adding ;protocol=3Dhttps into the SRC_URI?</span></font></p></d=
iv></div></div></div></div></div></div></blockquote><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">It isn&#39;t strictly r=
equired. There&#39;s so many entries in the SRC_URI for some packages, we c=
an&#39;t really list them all, and have the SRCREV format be useful at all.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div lang=
=3D"EN-GB" style=3D"overflow-wrap: break-word;"><div class=3D"gmail-m_11821=
88973611321933WordSection1"><div style=3D"border-top:none;border-right:none=
;border-bottom:none;border-left:1.5pt solid blue;padding:0cm 0cm 0cm 4pt"><=
div><div><div><div><p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"=
><span style=3D"font-size:11pt"><u></u><u></u></span></font></p>
</div>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt"><u></u>=C2=A0<u></u></span></font></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span style=3D"fon=
t-size:12pt">Bruce<u></u><u></u></span></font></p>
</div>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt"><u></u>=C2=A0<u></u></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt">=C2=A0<u></u><u></u></span></font></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span style=3D"fon=
t-size:12pt"><u></u>=C2=A0<u></u></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span style=3D"fon=
t-size:12pt">Bruce<u></u><u></u></span></font></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt"><u></u>=C2=A0<u></u></span></font></p>
</div>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt">--
<u></u><u></u></span></font></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><font size=3D"2" face=
=3D"Calibri"><span style=3D"font-size:11pt">- Thou shalt not follow the NUL=
L pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></sp=
an></font></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><font size=3D"2" face=
=3D"Calibri"><span style=3D"font-size:11pt"><br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7138): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7138" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/message/7138</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/90340033/1050=
810" target=3D"_blank">
https://lists.yoctoproject.org/mt/90340033/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">
meta-virtualization+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com=
</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></span></font></=
p>
</blockquote>
</div>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt"><br clear=3D"all">
<u></u><u></u></span></font></p>
<div>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt"><u></u>=C2=A0<u></u></span></font></p>
</div>
<p class=3D"MsoNormal"><font size=3D"2" face=3D"Calibri"><span style=3D"fon=
t-size:11pt">--
<u></u><u></u></span></font></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><font size=3D"2" face=
=3D"Calibri"><span style=3D"font-size:11pt">- Thou shalt not follow the NUL=
L pointer, for chaos and madness await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<u></u><u></u></sp=
an></font></p>
</div>
</div>
</div>
</div>
</div>

</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000000c66da05dc28791b--

