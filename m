Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEFCC433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:51:27 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.146.1649439578931553717
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 10:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jSQZqbG2;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id u18so194383eda.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Apr 2022 10:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Lg2FHlEcgf/MP/YrX7yzk49SG078xn9M2xO0GZejlo=;
        b=jSQZqbG2sABvK2/Oqry8oGidOQBcgrDq2mVudPTti2aiwq6dshqlWmhkN5d2egn0Z4
         43x/YizhWiDQmvqwTgx0IzIylXXWqO8IYRoib0eVhg0MIavg+z72VW8MjgcviyrbiT6w
         VBvWEKDCuGIl/P9EBdKfHdmeaRlXhIvJIyUihnRHQ9AdGIu+6ngbx1P3+FlkNlRf6t7Z
         Tw/xkvWaOr/gVWQ8dOkytpbTC7+Q7iruf0KO9ldNrFRV5P/hn2a4un9O3DNewu4ue9Th
         9w//yJO/5I1xRUE7lpWwP1jFi7aHNw4b6IqXYyMzr4+CJF7MnkWPr31+hEceQCseRQbe
         nKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Lg2FHlEcgf/MP/YrX7yzk49SG078xn9M2xO0GZejlo=;
        b=bmqLDNX4Gjd12bArOZTIj9DfD6LqGUEd/M5/+lOkYKl+UXxKpkOWD4g9PIsBSLbOXB
         bf0rqdSuxDtG94G6tqukjR6K5hELPbSWvuNKIU5y4G1fACmP1j9CTCHkre14oFz1cQFv
         HFChQSTHRZ+wth/TOdVRU302Rw/P8+t8p7ywWOz3j/P8jPyddVTEzQOthGXAyZxESkSc
         qH8wzy8d2moHqr9P/d5FPd5LyNZ9Um58/xA3kvPzQSH+5Q0hep5fPWtwP3edHjaVi9Qo
         pdK/qGlpkcny9TW1Rj4KTM/jOluEvyG5/KWzcHIKMV7RGb+FwEzFiZMr8jB1ghK6ESlP
         9xFg==
X-Gm-Message-State: AOAM5305hqWgD8pvvKNOHff3R0EkFRZYHOKK9hjsU9j4LAti64/Zd7yk
	ECyX9/KvWodflLR9YFleqDJ8a5ZUIh2cU4jYojM=
X-Google-Smtp-Source: 
 ABdhPJzKYgd3alh9uZnXkn4vFWX3+6ZPDG0xoiF/A+fW2C1DbnFzMowx85Dn46BKrcpJlDrZemPeC0g2WyeieBTqSqY=
X-Received: by 2002:a05:6402:5186:b0:419:651e:5137 with SMTP id
 q6-20020a056402518600b00419651e5137mr20772808edd.335.1649439577319; Fri, 08
 Apr 2022 10:39:37 -0700 (PDT)
MIME-Version: 1.0
References: 
 <AM6PR08MB3461FBC64EAFE017BD3EDFBC92E99@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <16E3FAAA055371F3.26526@lists.yoctoproject.org>
In-Reply-To: <16E3FAAA055371F3.26526@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Apr 2022 13:39:26 -0400
Message-ID: 
 <CADkTA4MYVFTj6MpguzEZa5nuMvuoYzBXnTdTD8uWWoP4w3dBqg@mail.gmail.com>
Subject: Re: [meta-virtualization] Issues with k3s runtime on master
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	Richard Neill <Richard.Neill@arm.com>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="00000000000015af2405dc281488"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Apr 2022 17:51:27 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7140

--00000000000015af2405dc281488
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 8, 2022 at 1:04 PM Bruce Ashfield via lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:

>
>
> On Fri, Apr 8, 2022 at 12:54 PM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
>> Hi Bruce,
>>
>> I'm having k3s runtime issues where during the k3s.service start I'm
>> getting error messages about missing /usr/libexec/cni/flannel.
>>
>> I saw that the cni_git.bb recipe was bumped to versions where flannel
>> and its plugin are not available anymore.
>>
>>
> In this case, should we have a recipe to provide both flannel and its
>> plugin?
>>
>>
>>
> Yep. I don't use flannel, so it wasn't something that I had done. That
> being said, I wanted to avoid maintaining separate recipes per-plugin, so
> when the need arose, I was going to add it to cni_git as an entry on the
> SRC_URI.
>
> I can have a go at doing that, now that I know there is a need.
>

FYI: Here's the WIP change:
https://git.yoctoproject.org/meta-virtualization/commit/?h=master-next&id=589391db2777f844577a3805fa475515fe62c99f

Bruce



>
> Bruce
>
> --
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

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000015af2405dc281488
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Apr 8, 2022 at 1:04 PM Bruce Ashfield via <=
a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;bru=
ce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com=
@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font=
-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, Apr 8, 2022 at 12:54 PM Diego Sueiro &lt;<a =
href=3D"mailto:Diego.Sueiro@arm.com" target=3D"_blank">Diego.Sueiro@arm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi Bruce,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
I&#39;m having k3s runtime issues where during the k3s.service start I&#39;=
m getting error messages about missing
<span style=3D"font-size:12pt;font-variant-ligatures:none;text-align:left;b=
ackground-color:rgba(0,0,0,0);display:inline">
/usr/libexec/cni/flannel</span><span style=3D"color:rgb(0,0,0);font-family:=
Calibri,Arial,Helvetica,sans-serif;font-size:12pt">.</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
I saw that the <a href=3D"http://cni_git.bb" target=3D"_blank">cni_git.bb</=
a> recipe was bumped to versions where flannel and its plugin are not avail=
able anymore.</div>
<div></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)"><span style=3D"font-family:Arial,Helvetica,sans-serif;fo=
nt-size:small;color:rgb(34,34,34)">=C2=A0</span><br></div></div></blockquot=
e><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div s=
tyle=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
In this case, should we have a recipe to provide both flannel and its plugi=
n?</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
</div>

</blockquote></div><div><br></div><div><div style=3D"font-size:small">Yep. =
I don&#39;t use flannel, so it wasn&#39;t something that I had done. That b=
eing said, I wanted to avoid maintaining separate recipes per-plugin, so wh=
en the need arose, I was going to add it to cni_git as an entry on the SRC_=
URI.</div><div style=3D"font-size:small"><br></div><div style=3D"font-size:=
small">I can have a go at doing that, now that I know there is a need.</div=
></div></div></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">FYI: Here&#39;s the WIP change: <a href=3D"https:=
//git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-next&amp;id=
=3D589391db2777f844577a3805fa475515fe62c99f">https://git.yoctoproject.org/m=
eta-virtualization/commit/?h=3Dmaster-next&amp;id=3D589391db2777f844577a380=
5fa475515fe62c99f</a></div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div style=3D"font=
-size:small"><br></div><div style=3D"font-size:small">Bruce</div></div><div=
><br></div>-- <br><div dir=3D"ltr">- Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end<br>- &quot;Use the force Harr=
y&quot; - Gandalf, Star Trek II<br><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7138): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7138" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7138</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/90340033/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/90340033/1050810</a><br>
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

--00000000000015af2405dc281488--

